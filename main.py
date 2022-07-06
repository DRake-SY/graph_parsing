import os
import sys
import Parse_function_graph as pfg
import argparse as ar

"""
Initialisation des paramètres permettant de faire tourner le parser et les logiciels gSpan et grapgMDL+ (en cours de dev)
"""
p = ar.ArgumentParser(description="Command to Parse a folder of workflow to the sub graph analyser format")
p.add_argument('f', help = " path to the folder you want to be parsed and analysed", metavar="Data_pathway")
p.add_argument('a', help = "choice between the forma type gspan or graphmdl+",choices=['gspan', 'graphmdl+'], metavar='Analyser')
p.add_argument('s', help = "output file name", metavar='Output_name')


#subgS = p.add_subparsers(help = "command for gSpan")
#subgS.add_argument()

#subgM = p.add_subparsers(help = "command for GraphMDL+")
args = p.parse_args()

#/home/maxime/Bureau/new_analysisNB_v2



if args.a == 'gspan' :

    '''
    Si l'utilisateur choisit le format gSpan, les données seront parser et afficher selon le standard
    gSpan. Un id et un label en chiffre.
    '''

    CompleteList = pfg.triage(args.f) #on lance le module de Filtrage
    nb_graph = 0 #Nécessaire pour l'annotation des graphs

    for y in CompleteList:
        
        print(nb_graph, y)  

        res =  pfg.Parsing_v_gspan(y) #on lance le module de parsing pour gSpan

        id_sommet = res[0]
        partenaire = res[1]

        pfg.Affichage(id_sommet, partenaire, nb_graph, args.s) #on lance le module d'affichage
        nb_graph += 1
            
else :

    '''
    Si l'utilisateur choisit le format GraphMDL+, les données seront parer et afficher selon le standard
    GraphMDL+. Un id numérique, la présence ou non de label, label en lettre ou en chiffre.
    '''

    CompleteList = pfg.triage(args.f) #filtrage
    nb_graph = 0

    for y in CompleteList:
            
        print(nb_graph, y)  

        res =  pfg.Parsing_v_graphmdl(y) #lancement du module de parsing pour graphMDL+
        id_sommet = res[0]
            
        partenaire = res[1]

        pfg.Affichage(id_sommet, partenaire, nb_graph, args.s)#affichage
        nb_graph += 1