import os
import sys
import Parse_function_mdl as mdl
import Parse_function as gsp
import Parse_function_graph as pfg
import argparse as ar

p = ar.ArgumentParser(description="Command to Parse a folder of workflow to the sub graph analyser format")
p.add_argument('f', help = " path to the folder you want to be parsed and analysed", metavar="data")
p.add_argument('a', help = "choice between the forma type gspan or graphmdl+",choices=['gspan', 'graphmdl+'], metavar='Analyser')
p.add_argument('s', help = "output file name", metavar='output name')

args = p.parse_args()
#data = input("Dossier : ")
#/home/maxime/Bureau/new_analysisNB_v2



if args.a == 'gspan' :

    CompleteList = gsp.triage(args.f)
    nb_graph = 0

    for y in CompleteList:
        
        
        if nb_graph < 556 : ## a enlever plus tard juste pour les tests
            
            print(nb_graph, y)  

            res =  gsp.Parsing_v_gspan(y)
            id_sommet = res[0]
            
            partenaire = res[1]

            gsp.Affichage(id_sommet, partenaire, nb_graph, args.s)
            nb_graph += 1
            
else :

    CompleteList = pfg.triage(args.f)
    nb_graph = 0

    for y in CompleteList:
        
        
        if nb_graph < 556 : ## a enlever plus tard juste pour les tests
            
            print(nb_graph, y)  

            res =  pfg.Parsing_v_graphmdl(y)
            id_sommet = res[0]
            
            partenaire = res[1]

            pfg.Affichage(id_sommet, partenaire, nb_graph, args.s)
            nb_graph += 1