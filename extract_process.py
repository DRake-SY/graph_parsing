'''
##################################################################################
Ce script prend en entrée un dosssier de workflows et donne en sortie un JSON 
contenant tous les process ainsi que des infos sur leur wf d'origine.

On parcours tous les json de tous les fichiers afin d'extraire les différents
process présent
##################################################################################
'''
import argparse as ar
import os
import json

p = ar.ArgumentParser(description="Cette commande permet d'extraire tous les process d'un dossier de workflow'")
p.add_argument('i', help = " chemin vers le dossier à analyser", metavar="input_file")
p.add_argument('o', help = "chemin vers le chemin du fichier de sortie (format JSON)", metavar='output_file')

args = p.parse_args()

list_nf = []

for dirpath, dirnames, filenames in os.walk(args.i):

    for name in filenames :
        if name == "processes_info.json" :
            with open(os.path.join(dirpath, name), "r") as fileObject :
                jsonContent = fileObject.read()
                obj_python = json.loads(jsonContent)
            
            owner = dirpath
            owner = owner.split("/")
            owner = owner[2] # cela depend d'ou est le fichier ici data/new.../nom_du_wf donc [2]
            owner = owner.split("__")
            
            wf_orig = owner[1]
            owner = owner[0]
            
            for obj in obj_python :
                obj_python[obj]["owner"] = owner
                obj_python[obj]["wf_orig"] = wf_orig
                
                if len(obj_python[obj]["tools"]) != 0 :
                    
                    list_nf.append(obj_python[obj])


###  on sort un fichier json avec tous les process dedans
with open(args.o,"w") as all_proc :
    json.dump(list_nf, all_proc, indent = 4)
#----------------------------------------------------------