import os
import Parse_function as pf


CompleteList = pf.triage("new_new_analysis_nf")
nb_graph = 0


for y in CompleteList:
    
    
    if nb_graph < 7 : ## a enlever plus tard juste pour les test
        
        print(y)  

        res =  pf.new_new_Parsing(y)
        id_sommet = res[0]
        
        partenaire = res[1]

        pf.Affichage(id_sommet, partenaire, nb_graph)
        nb_graph += 1
            
        