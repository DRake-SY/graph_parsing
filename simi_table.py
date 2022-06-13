import os
import json
import csv

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

##################################################################################
#On parcours tous les json de tous les fichiers afin d'extraire les différents
#process présent
##################################################################################

list_nf = []

for dirpath, dirnames, filenames in os.walk("new_new_analysis_nf"):

    for name in filenames :
        if name == "processes_info.json" :
            with open(os.path.join(dirpath, name), "r") as fileObject :
                jsonContent = fileObject.read()
                obj_python = json.loads(jsonContent)
            
            owner = dirpath
            owner = owner.split("/")
            owner = owner[1]
            owner = owner.split("__")
            
            wf_orig = owner[1]
            owner = owner[0]
            
            for obj in obj_python :
                obj_python[obj]["owner"] = owner
                obj_python[obj]["wf_orig"] = wf_orig
                
                if len(obj_python[obj]["tools"]) != 0 :
                    
                    list_nf.append(obj_python[obj])


###  on sort un fichier json avec tous les process dedans
with open("all_wf_procc_1531.json","w") as all_proc :
    json.dump(list_nf, all_proc)
#----------------------------------------------------------

#################################################################################

proc_nf = importing_json_files('/home/maxime/Bureau/graph_parsing/all_wf_procc_1531.json')
# on récupère le fichier avec les process et on les trie par groupe de similarité
# d'outils

sim_nf = sim_proc(proc_nf)[0] #liste de liste des groupes
sim_tools = sim_proc(proc_nf)[1] #liste des différents outils



### on sort un fichier json des process trié et groupé
with open("sim_nf.json","w") as sim :
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
    
    
    with open('simi_table.csv', 'a') as f:

        write = csv.writer(f)
        if n == 0:

            write.writerow(["","tools","groups"])
            n =1 
        
        write.writerow([i,str(sim_tools[i]),str(liste_simi_tools)])
    
    
    
