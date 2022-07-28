'''
La fonction modif_json_mdl.py nous permet de nettoyer le fichier JSON obtenus par Graphmdl+ et qui sera lu par le
Vizualiser. En effet, cela va permettre une meilleur lisibilité des résultats. Pour ce faire, on doit rentrer dans le JSON
et récupérer toutes les informations plus celle qui ont été modifier afin de créer une copie modifié du JSON d'entrée.
La fonction prend en entrée le fichier JSON à modifier et retourne le fichier JSON modifié.

'''

import json
import argparse as ar

p = ar.ArgumentParser(description="Cette commande permet de modifier un JSON (graphmdl+) afin de rendre les labels plus lisible")
p.add_argument('i', help = " chemin vers le fichier à modifier", metavar="input_file")
p.add_argument('o', help = "chemin vers le chemin du fichier de sortie (format JSON)", metavar='output_file')

args = p.parse_args()


with open(args.i, "r") as f: 
    data = json.load(f)

new_data = {}

#Pour rendre lisible les labels on doit retirer "urn:GraphMDL:EdgeLabel:" et "urn:GraphMDL:VertexLabel:" de chaque ligne où
#les labels sont écrit

#les labels sont présent a 6 endroits :
# - edge_stadard_table (ici)
# - vertex_standard_table (ici)
# - patterns :
#       - structure :
#           - vertices (ici)
#           - edges (ici)
#           - canonical_certificate:
#                   - element   (ici, à la fois vertex et edge)

#La difficulté est qu'on doit rentrer dans des listes de dictionnaire qui contiennent eux même des dictionnaires.
for i in data :
    

    if i == "edge_standard_table" : 

        data_edges = {}
        temp = data[i]
        for el in temp :
            
            y = el.replace("urn:GraphMDL:EdgeLabel:","")
            
            data_edges[y] = temp[el]
        new_data[i] = data_edges
    
    elif i == "vertex_standard_table" :

        

        data_vertex = {}
        temp = data[i]
        
        for el in temp :
            y = el.replace("urn:GraphMDL:VertexLabel:","")
            data_vertex[y] = temp[el]
        

        new_data[i] = data_vertex
    

    elif i == "patterns" :
        
        data_in_patterns = {}
        inter = list()
        temp =  data[i]
        a = 0
        for el in temp :
            for key in el : 
                if key == "structure" :
                    data_in_structure = {}
                    
                    for para in el[key] :
                        if para == "vertices" :

                            tempo_vertex = []
                            for label in el[key][para] :
                                inter_6 = []
                                for y in label :
                                    vertex = y.replace("urn:GraphMDL:VertexLabel:","")
                                    inter_6.append(vertex)
                                tempo_vertex.append(inter_6)
                            data_in_structure[para] = tempo_vertex

                        elif para == "edges" :
                            data_in_edges = {}
                            tempo_edges = []                  
                            for label in el[key][para] :
                                for o_key in label :
                                    inter_7 = []
                                    if o_key == 'label' :
                                        y = label[o_key].replace("urn:GraphMDL:EdgeLabel:","")
                                        inter_7.append(y)
                                        data_in_edges[o_key] = inter_7
                                    else :
                                        data_in_edges[o_key] = label[o_key]
                            
                                tempo_edges.append(data_in_edges)
                                data_in_edges = {} 
                            
                            data_in_structure[para] = tempo_edges

                        elif para == "canonical_certificate" :
                            data_in_cano = {}
                            cano = {}
                            tempo_el = []
                            for label in el[key][para] :
                                if label == "elements" :
                                    for o_el in el[key][para][label] :
                                        
                                        for o_key in o_el :
                                            
                                            if o_key == "label" :

                                                y = o_el[o_key].replace("urn:GraphMDL:EdgeLabel:","").replace("urn:GraphMDL:VertexLabel:","")
                                                
                                                
                                                data_in_cano[o_key] = y
                                                
                                            else :
                                                
                                                data_in_cano[o_key] = o_el[o_key]
                                        
                                        tempo_el.append(data_in_cano)
                                        data_in_cano= {} 
                                    cano[label] = tempo_el
                                else :
                                    cano[label] = el[key][para][label]
                            
                                
                            data_in_structure[para] = cano
                            
                        else :
                            data_in_structure[para] = el["structure"][para]
                    
                    data_in_patterns[key] = data_in_structure                  
                
                else :  
                    data_in_patterns[key] = el[key]
            
            inter.append(data_in_patterns)
            data_in_patterns = {}
        
        new_data[i] = inter
                      
    else :
        new_data[i] = data[i]


#Après avoir récupérer les nouvelles données dans le dico new_data, on retourne un fichier JSON.

with open(args.o, "w") as j:
  json.dump(new_data,j, indent = 4)

