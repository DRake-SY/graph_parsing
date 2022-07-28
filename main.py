import os
import sys
import json
import Parse_function_graph as pfg
import argparse as ar



p = ar.ArgumentParser(description="Command to Parse a folder of workflow to the sub graph analyser format")
p.add_argument('f', help = " path to the folder you want to be parsed and analysed", metavar="data")
p.add_argument('a', help = "choice between the forma type gspan or graphmdl+",choices=['gspan', 'graphmdl+'], metavar='Analyser')
p.add_argument('-t',default = None, help = "pathway to the similarity table in case you choose the gspan format", metavar = "simi_table")
p.add_argument('-g',default = "structure_worklow", help="name of file that will be read during the parsing", metavar="graph file name")
p.add_argument('-l', default = 1 , help='permet de définir le nombre de label que vous voulez attribuer au sommet, 1 = seulement les outils / 2 = on rajoute le numéro du wf d origine, par défaut 1')
p.add_argument('s', help = "output file name", metavar='output_name')

args = p.parse_args()
#data = input("Dossier : ")
#/home/maxime/Bureau/new_analysisNB_v2



 
if os.path.exists(args.f) == False :
    print("Votre dossier d'entrée n'existe pas :(")

else : 

    if args.a == 'gspan' :

        CompleteList = pfg.filtrage(args.f)
        nb_graph = 0

        for y in CompleteList:

            print(nb_graph, y)  

            res =  pfg.Parsing_v_gspan(y, args.t, args.g)

            id_sommet = res[0]  
            partenaire = res[1]

            pfg.Affichage(id_sommet, partenaire, nb_graph, args.s, args.a, args.l)
            nb_graph += 1
                
    else :

        CompleteList = pfg.filtrage(args.f)
        nb_graph = 0

        for y in CompleteList:
     
            print(nb_graph, y)  

            res =  pfg.Parsing_v_graphmdl(y, args.g)
            id_sommet = res[0]
                
            partenaire = res[1]

            pfg.Affichage(id_sommet, partenaire, nb_graph, args.s, args.a, args.l)
            nb_graph += 1
