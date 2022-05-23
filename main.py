import os
import parsing as p
import triage as t



def Affichage(id_sommet, partenaire, nb_graph) : ## a changer et mettre dans un fichier directement
    
    with open('Structure_parser.txt','a') as file :
        file.write("t"+" #" + str(nb_graph)+"\n")
        nb_sommet = 0
        nb_arrete = 0
        for key in id_sommet :
            file.write("v " + str(nb_sommet) + " " + str(key[0]) + "\n")
            nb_sommet += 1

        for part in range(0, len(partenaire), 2) :
            for keys in id_sommet :
                if partenaire[part] == keys[1] :
                    id_first = keys[0]
            
                elif partenaire[part+1] == keys[1] :
                    #print(partenaire)
                    id_second = keys[0]
            file.write("e " + str(id_first) +" "+ str(id_second) + " " +"0" +"\n")
            nb_arrete +=1
        file.write("\n")
       

CompleteList = t.triage("new_analysis_nf")
nb_graph = 0

for y in CompleteList:
    
    for path, subdirs, files in os.walk(y):
        for name in files:
            if name == "structure_worklow" :             
                workflow = os.path.join(path, name)

            elif name == "processes_info.json" :
                json = os.path.join(path, name)
        #print(nb_graph, path)
        id_sommet  = p.Traitement_Structure(workflow,json)[0]
        partenaire = p.Traitement_Structure(workflow,json)[1]
        Affichage(id_sommet, partenaire, nb_graph)
        nb_graph += 1
        