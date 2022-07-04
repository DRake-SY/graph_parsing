import os
import Parse_function_wo as pf


data = input("Dossier : ")
#/home/maxime/Bureau/new_analysisNB_v2

CompleteList = pf.triage(data)
nb_graph = 0


for y in CompleteList:
    
    
    if nb_graph < 5 : ## a enlever plus tard juste pour les tests
        
        print(nb_graph, y)  

        res =  pf.new_new_Parsing(y)
        id_sommet = res[0]
        
        partenaire = res[1]

        pf.Affichage(id_sommet, partenaire, nb_graph)
        nb_graph += 1
            
        