import os
import Parse_function_wo as pf


CompleteList = pf.triage("/home/maxime/Bureau/new_analysisNB")
nb_graph = 0


for y in CompleteList:
    
    
    if nb_graph < 557 : ## a enlever plus tard juste pour les tests
        
        print(nb_graph, y)  

        res =  pf.new_new_Parsing(y)
        id_sommet = res[0]
        
        partenaire = res[1]

        pf.Affichage(id_sommet, partenaire, nb_graph)
        nb_graph += 1
            
        