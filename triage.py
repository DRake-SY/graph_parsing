
import os


#--------------------------------------------------------------------------------
#------------------------- TRIAGE DU DOSSIER ------------------------------------
#--------------------------------------------------------------------------------



#--------------------------------------------------------------------------------
#La base de donnée de telle manière a ne prendre que les graphs pouvant être lu 
#par gSpan et GraphMDL(+). A partir de la, on ne garde que les graph dsl1 car on
#a pu extraire un graph de ces données ==> dossiers contenant 6 fichiers.
#De ces fichiers, on retire ceux avec un process_info.json vide, ainsi que les
#graphs "hello World".
#De plus, on retire tous les graphs qui ont des arrêtes parallèles, ainsi que les 
#graph avec des sommets ayants des arrêtes poitant sur eux même.
#--------------------------------------------------------------------------------

def Hello(Json_file) :
    """
    Cette fonction sort les fichiers qui ne possedent pas d'outils dans leur process et sont donc estimés comme peu pertinents

    new version

    This fonction is able to say if there is tools in the different processe in the Json file thank to
    a boolean who compare the number of processe with the number of process who doesn't use any tools.
    If the number is the same that will mean that there is only processe without tool.

    Parameters
    ----------
    Json_file : TYPE
        DESCRIPTION.

    Returns
    -------
    None.
    
    Ex
    --   
    Json_parsing("/home/noemie/Desktop/LISN/new_analysis_nf/arvesolland_nextflow-test/processes_info.json")
    Json_parsing("/home/noemie/Desktop/LISN/new_analysis_nf/Ackia_Nextflow_testing/processes_info.json")
    """
    import json
    helloworld=0
    nb_process =0
    tools = True
    
    
    #ouverture du fichier Json 
    with open(Json_file, 'r') as file :
        data = json.load(file)
        

    #on met dans rep les process et l'outils associé l'un a coté de l'autre
    #print(file)
    for process in data :
        nb_process += 1
        if data[process]["tools"] == []:
            
            helloworld += 1

    if helloworld == nb_process :

        tools = False
    #print(helloworld, nb_process)
    return tools

def ParseStructure(chemin):
    """
    Parameters
    ----------
    chemin : string
        Chemin vers un fichier de type structure_worflow écrit sous le format GraphViz

    Returns
    -------
    StructWorkflow : dict
        Dictionnaire ayant pour clé l'adresse du fichier et un sous dico comprenant:
            - la liste des aretes : en indice pair : le sommet du début, en fin: le sommet d'arrivee
            - la liste des sommets non connectés aux autres

    """
    
    StructWorkflow= {}
    
    
    
    
    StructWorkflow[chemin]={}
    
    
    with open(chemin, "r") as graph : 
        lines = graph.readlines()

    y = len(lines)
    sommets = [] #va recenser tous les sommets non connectés aux autres

        
    #---------------------- Traitement des lignes du fichier

    for line in lines[3:y-1] : #première boucle pour prendre toutes les aretes
        line = line.rstrip("\n") #retire le \n
        line = line.strip("\t") #retire la tabulation

        z = len(line)
        compteur = 0

        # on détermine quelle ligne symbolise une arrete
        while compteur != z: 
            for char in line[0:z] :
                compteur += 1
                if char == ">" :
                    sep = line.split(' ')
                    if sep[0] not in sommets:
                        sommets.append(sep[0])
                        StructWorkflow[chemin].setdefault(sep[0],[])
                        StructWorkflow[chemin][sep[0]].append(sep[2])
                    else:
                        StructWorkflow[chemin][sep[0]].append(sep[2])

         
            
    
    for line in lines[3:y-1] : #deuxieme boucle pour prendre tous les sommets seuls
        line = line.rstrip("\n") #retire le \n
        line = line.strip("\t") #retire la tabulation

        z = len(line)
        compteur = 0
        
        # on détermine quelle ligne symbolise un noeud et on vérifie qu'il existe dans la liste
        while compteur != z: 
            for char in line[0:z] :
                compteur += 1
                if char == "2" or char =="3" or char=="4" :
                    sep = line.split(' ')
                    sommet = sep[0]
                    if sommet not in sommets:
                        StructWorkflow[chemin][sep[0]]=[]
        
    return StructWorkflow

def Cycle(dicoListe):
    """
    Cette fonction sort les métriques courantes des graphes donnés sous forme de liste. Les listes sont converties en graphe Non Orientés!

    Parameters
    ----------
    dicoListe : dict
        Dictionnaire des listes des sommets vers aretes

    Returns
    -------
        dictionnaire contenant toutes les informations pour chaque répertoire, en [0] pour les Convexes, en [1] pour les Non Convexes
    
    Ex
    --
    results= parserNetworkX.AnalyseNO(Workflow_dict)
    analyse_dictC=results[0]

    """
    import networkx as nx

    analyse_dictC={} #creation d'un dictionnaire qui va contenir toutes les stats pour G connexes
    #analyse_dictNC={}#Pareil mais pour Non Connexe

    for cle in dicoListe:
        if len(dicoListe[cle]) != 0 : #On vérifie que les graphs ne sont pas vides
            G = nx.DiGraph(dicoListe[cle]) #Attention ici non orienté!! 
            
            if nx.is_weakly_connected(G) == True :
                analyse_dictC[cle]={}
                analyse_dictC[cle]["Cycles"]=list(nx.simple_cycles(G))

                
             
            else:
                analyse_dictC[cle]={}
                analyse_dictC[cle]["Cycles"]=list(nx.simple_cycles(G))
        
                
    return analyse_dictC

def triage(dossier) :
    #Creation d'une liste de tous les répertoires vides
    CompleteList = list()
    
    
    
    #on rentre dans les différents dossiers contenant les informations
    for dirpath, dirnames, filenames in os.walk(dossier):
        
        
        if len(filenames) >= 7:#Condition pour les DSL1 ==> 844
            
            for name in filenames :
                if name == "processes_info.json" :
                    with open(os.path.join(dirpath, name), "r") as data :
                        text = data.readlines()

                    if len(text)> 1 :#condition pour ne prendre que graph avec des process
                    # ==> 812
                        
                        data.close()
                        vide = Hello(os.path.join(dirpath, name))
                        #condition pour ne prendre que les fichiers avec au
                        #moins un outil ==> 634

                        if vide == True :
                            
                            for other_name in filenames :
                                
                                condition = True
                                if other_name == "structure_worklow":
                                    workflow = ParseStructure(os.path.join(dirpath, other_name))
                                    #print(workflow.keys())
                                    for clé in workflow :
                                        for sommet in workflow[clé] :
                                            #print("sommet " + sommet)
                                            for partenaire in workflow[clé][sommet] :
                                                #print("partenaire " +partenaire)
                                                if sommet == partenaire :
                                                    condition = False
                                                    #verifie si un sommet pointe sur lui même
                                                    #print(condition)
                                
                                    if condition == True :
                                        # on regarde s'il y a des cycles et on les enlève
                                        
                                        cyc = Cycle(workflow)
                                        
                                        
                                            
                                        for cycle in cyc :
                                            for res in cyc[cycle] :
                                                    
                                                if len(cyc[cycle][res]) == 0:

                                                    
                                                    CompleteList.append(dirpath)
                                                    #total final ==> 556
                                        
                                                    
                                                
                                                
    
    return CompleteList



