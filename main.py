import os
import Parse_function as pf

data = input("Dossier :")
#/home/maxime/Bureau/base_only_nf-core

CompleteList = pf.triage(data)
nb_graph = 0


for y in CompleteList:
      
    res =  pf.new_new_Parsing(y)

    id_sommet = res[0] 
    partenaire = res[1]

    print(nb_graph,y) 
    pf.Affichage(id_sommet, partenaire, nb_graph)
    nb_graph += 1
            