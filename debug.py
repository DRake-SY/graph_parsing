import os
import parsing as p
import triage as t
import display as d


CompleteList = t.triage("new_analysis_nf")
nb_graph = 0

#print(CompleteList)
for y in CompleteList:
    
    
    if nb_graph < 597 : ## a enlever plus tard juste pour les test
        for path, subdirs, files in os.walk(y):
            
            #print(nb_graph, path)
            for name in files:
                if name == "structure_worklow" :             
                    workflow = os.path.join(path, name)

                elif name == "processes_info.json" :
                    json = os.path.join(path, name)
            #print(nb_graph, path) ## pb avec le fichier 75 ....
            
            id_sommet = p.Traitement_Structure(workflow)[0]
            partenaire = p.Traitement_Structure(workflow)[1]

            #print(partenaire)
            d.Affichage(id_sommet, partenaire, nb_graph)
            nb_graph += 1
            
        