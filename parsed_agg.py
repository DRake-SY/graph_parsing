'''
La fonction parsed_agg.py a pour but de parser un fichier aggregate pour en extraire un fichier
qui va séparer les sommets en fonction du workflows dans lequel ils sont.
Il prend en entrée un fichier txt et donne en sortie un fichier JSON.
A savoir que cela ne marche que si les sommets ont deux labels dont un est l'outil (ou autre) et
le deuxième le numéro de wf.
'''


import json
import argparse as ar



p = ar.ArgumentParser(description="Commande permettant d'obtenir les sommets de debut et de fin de chaque wf pour une observation plus minimaliste des resultats sur le visualizer")
p.add_argument('f', help = "Fichier d'entrée", metavar="input_file")
p.add_argument('s', help = "Fichier de sortie (json format)", metavar='output_file')

args = p.parse_args()

#On établit des arguments pour définir l'input et l'output afin de rendre la fonction utilisable par tous
#sans modification nécessaire

with open(args.f, "r") as data_agg :
    data = data_agg.readlines()

#on va lire toutes les lignes du fichier

data_line = {}
for i in data:
    all_label = []
    if i[0] == 'v': #on ne prend en compre que celle qui commence par un "v" c'est à dire les sommets
        
        line = i.strip('\n').replace("urn:GraphMDL:VertexLabel:","").split(" ") #on enleve les informations inutiles des labels
                                                                                #et on split le tout

        all_label.append(line[2])
        all_label.append(line[3])

        #le label qui nous interresse est celui contenant le numéro de wf mais ce dernier peut se trouver en position deux ou trois

        if all_label[0][0] == '[' :
            temp = all_label[0]
            del all_label[0]
            all_label.append(temp)
        
        #Pour remettre tout dans l'ordre et avoir les numéro de wf au meme endroit partout, on va interchanger les labels si
        #le premier lu est celui qui concenne les outils

        data_line[int(line[1])] = all_label


#on extrait un dico qui contient le numéro du sommet comme indice et son wf d'origine comme valeur



#Maintenant on va pour déterminer quel sommet font partie de quel wf

co_wf = []
start = 0 #on start à 0, c'est le premier wf et c'est décrit comme cela dans la documentation

#afin de déterminer où commence le wf et où il se termine, on va devoir regarder si le sommet n et le sommet n+1 on le
#même numéro de wf

for i in range(0,len(data_line),1):
    begin_end = []
    
    if i+1 != len(data_line) : 
        #dans le cas où on arrive au dernier sommet, on sait que le suivant n'existe pas vu qu'on se fit à la longueur
        # de la liste (elle commence pas à 0 mais 1) donc on s'arrête
        
        if data_line[i][0] != data_line[i+1][0] :
            
            fin = i  #si le sommet n+1 n'a pas le même numéro de wf, on sait que c'est le dernier
            begin_end.append(start) 
            begin_end.append(fin)
            #on concatenne le sommet de début et le sommet de fin


            start = i+1 #le nouveau start devient la valeur i+1

            co_wf.append(begin_end) #on concatene le couple de valeur
    else :

        #on arrive au dernier sommet donc cela marque la fin du dernier wf
        fin = i 
        begin_end.append(start)
        begin_end.append(fin)
        co_wf.append(begin_end)

# On obtient une liste contenant le sommet de debut et fin de chaque wf, il ne reste plus qu'à
# sortir un fichier sous le bon format


nb_graph = 0
all_wf = []

for el in co_wf :

    wf = {}

    wf["name"] = nb_graph
    wf["description"] = ""
    wf["from"]= el[0]
    wf["to"] = el[1]

    all_wf.append(wf)
    nb_graph +=1

with open(args.s, "w") as j:
    json.dump(all_wf,j, indent = 4)

#on obtient donc le JSON avec les wf délémités par leur sommet.


   
        
        
        
            
        
        