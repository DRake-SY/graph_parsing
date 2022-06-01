import os
import parsing as p
import triage as t
import display as d


CompleteList = t.triage("new_new_analysis_nf")
nb_graph = 0


for y in CompleteList:
      
    res =  p.new_new_Parsing(y)

    id_sommet = res[0] 
    partenaire = res[1]
        
    d.Affichage(id_sommet, partenaire, nb_graph)
    nb_graph += 1
            