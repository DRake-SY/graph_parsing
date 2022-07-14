import os
import Parse_function_wo as pf
import argparse as ar

p = ar.ArgumentParser(description="Command to Parse a folder of workflow to the sub graph analyser format")
p.add_argument('f', help = " path to the folder you want to be parsed and analysed", metavar="data")

args = p.parse_args()
#data = input("Dossier : ")
#/home/maxime/Bureau/new_analysisNB_v2
#print(args.f)

CompleteList = pf.triage(args.f)
nb_graph = 0


for y in CompleteList:
    
    
    if nb_graph < 5 : ## a enlever plus tard juste pour les tests
        
        print(nb_graph, y)  

        res =  pf.new_new_Parsing(y)
        id_sommet = res[0]
        
        partenaire = res[1]

        pf.Affichage(id_sommet, partenaire, nb_graph)
        nb_graph += 1
            
       