'''
Ici on prend un fichier JSON contenant un ensemble de process obtenus grâce à extract_process.py
et on créé un csv qui regroupe chaque process en fonction de l'outils dans lequel ils sont.
'''


import os
import json
import csv
import argparse as ar

def importing_json_files(file_wf):
    import json
    f_wf = open(file_wf) #informations for nf
    # returns JSON object as
    # a dictionary
    wf = json.load(f_wf)
    f_wf.close
    return wf

def sim_proc(liste) :
    #compares the code of the snakemake processes - if the tools are exactly the same, they are identical, doesn't count the several occurences of a tool
    liste_proc = liste.copy()
    liste_miroir = liste.copy()
    liste_simil = []
    tools = []

    while (len(liste_proc)!=0):
        simil2 = liste_proc

        for j in liste_proc :
            
            verif = []
            for i in liste_miroir :
                if j['tools'] == i['tools'] :
                    
                    if i not in verif :
                        verif.append(i)
                    liste_proc.remove(i)
                    liste_miroir.remove(i)
            #ajouter un set pour éviter les doublons dans les listes
            
            tools.append(j['tools'])
            #som = som + len(verif)
            liste_simil.append(verif)
        
        #liste_proc.remove(j)
   
    return liste_simil, tools

#----------------------------------------------------------------------------------

p = ar.ArgumentParser(description="Cette commande permet d'extraire tous les process d'un dossier de workflow")
p.add_argument('i', help = " chemin vers le fichier à traiter (jSON format)", metavar="input_file")
p.add_argument('o', help = "chemin vers le chemin du fichier de sortie (format CSV)", metavar='output_file')
p.add_argument('u', help = 'version JSON du fichier csv', metavar = 'JSON file')

args = p.parse_args()

#################################################################################

proc_nf = importing_json_files(args.i)
# on récupère le fichier avec les process et on les trie par groupe de similarité
# d'outils

sim_nf = sim_proc(proc_nf)[0] #liste de liste des groupes
sim_tools = sim_proc(proc_nf)[1] #liste des différents outils



### on sort un fichier json des process trié et groupé
with open(args.u,"w") as sim :
    json.dump(sim_nf, sim)


# on réalise le fichier CSV

liste_simi_tools = []
n=0

for i in range(0,len(sim_nf),1):
    liste_modif = []
    
    for y in range(0,len(sim_nf[i]),1) :
        
        
        origine = sim_nf[i][y]['wf_orig']
        name = sim_nf[i][y]['name_process']
        
        assemb = origine +":" + name

        liste_modif.append(assemb)

    liste_simi_tools = set(liste_modif)
    
    
    with open(args.o, 'a') as f:

        write = csv.writer(f)
        if n == 0:

            write.writerow(["","tools","groups"])
            n =1 
        if sim_tools[i]==sim_tools[i-1] :
            write.writerow([i-1,str(sim_tools[i]),str(liste_simi_tools)])
        else :    
            write.writerow([i,str(sim_tools[i]),str(liste_simi_tools)])
    
    
    
