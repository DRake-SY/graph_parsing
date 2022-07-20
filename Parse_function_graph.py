'''
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
------------------------- PARSE FUNCTION GRAPH ---------------------------------
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------

Le script Parse_function_graph contient l'ensemble des fonctions utilisées pour parser
les fichiers de workflows et transcrire les données dans un fichier texte qui
sera lu par les logiciels gSpan et GraphMDL+. Ce script est séparé en trois parties 
nécessaire au Parsing de nos fichiers : 

            - FILTRAGE
            - PARSING
            - DISPLAY

'''



'''
--------------------------------------------------------------------------------
------------------------------- FILTRAGE ---------------------------------------
--------------------------------------------------------------------------------

On va trier la base de donnée de telle manière à ne prendre que les graphs pouvant
être lu par gSpan et GraphMDL(+). A partir de la, on ne garde que les graph DSL1 
car on a pu extraire un graph de ces workflows ==> dossiers contenant 6 fichiers.
De ces fichiers, on retire ceux avec un process_info.json vide, ainsi que les
graphs "hello World".
De plus, on retire tous les graphs qui ont des arrêtes parallèles, ainsi que les 
graph avec des sommets ayants des arrêtes poitant sur eux même. Et pour finir,
on retire les graphs formant des cycles.

'''

def ProcessOrNotProcess(Json_file) :
    """
    
    This fonction is able to say if there is tools in the different processes in the Json file thank to
    a boolean who compare the number of processe with the number of process who doesn't use any tools.
    If the number is the same that will mean that there is only processe without tool. In this case, we
    return a false, else we return a True.

    Parameters
    ----------
    Json_file : TYPE
        DESCRIPTION.

    Returns
    -------
    Boolean
    
    """
    import json

    helloworld=0
    nb_process =0
    tools = True
    
    #Json file opening
    with open(Json_file, 'r') as file :
        data = json.load(file)
        
    #we search the number of tools and compare it with the number of process
    for process in data :
        nb_process += 1
        if data[process]["tools"] == []:
            
            helloworld += 1

    if helloworld == nb_process :

        #same number of process and process without tool
        tools = False
    
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
    import os
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
                        vide = ProcessOrNotProcess(os.path.join(dirpath, name))
                        #condition pour ne prendre que les fichiers avec au
                        #moins un outil ==> 634
                        if vide == True :
                            for other_name in filenames :
                                condition = True
                                if other_name == "structure_worklow":
                                    workflow = ParseStructure(os.path.join(dirpath, other_name))
                                    for clé in workflow :
                                        for sommet in workflow[clé] :
                                            for partenaire in workflow[clé][sommet] :
                                                if sommet == partenaire :
                                                    condition = False
                                                    #verifie si un sommet pointe sur lui même
                                    if condition == True :
                                        # on regarde s'il y a des cycles et on les enlève
                                        cyc = Cycle(workflow)
                                        for cycle in cyc :
                                            for res in cyc[cycle] :
                                                if len(cyc[cycle][res]) == 0:
                                                    CompleteList.append(dirpath)
                                                    #total final ==> 556
    return CompleteList

'''
--------------------------------------------------------------------------------
------------------------------- PARSING ----------------------------------------
--------------------------------------------------------------------------------

Le parsing consiste à transformer des données sur les workflows en des données
lisibles pas les logiciels gSpan et GraphMDL(+).
L'ensemble des worklfows sera analysée 1 à 1. On va attribuer un id pour chaque
process et operation présent dans le fichier "structure_worklow". Cette id sera
unique au sein du workflow mais peut être identique entre deux workflows.
Ensuite, on attribue le label en fonction de certain paramètre :

    (i)Pour les process avec au moins un outil, on regarde dans la table de similarité d'outils 
    ou se situe notre process et le label correspondra au numéro du groupe.

    (ii) Pour les process no_tools, le label sera identique pour tous (100000).

    (iii) Les operations vont être labélisé en fonction du type d'operation (merge,
    filter, ...). Un dico est fait en début de code pour attribuer un label à chaque type d'opération.

    (iv) les arrêtes sont labélisé de la même manière (0) de façon arbitraire pour gSpan,
    mais dans le cas de graphMDL(+) nous n'attribuerons aucun label ==> Fonctionnalité de GraphMDL+
    par rapport à gSpan et à sa version ultérieur GraphMDL.

'''
def dico_label_type_operation(dossier) :
    import json
    import os
    '''
    Cette fonction prend en entré contenant un ensemble de dossier de workflow ainsi que les données associées et renvoie un dico avec un label
    pour chauqe type d'operation existante
    '''
    id_type_operation ={}
    label_type = 10000

    
    dossier_trie = triage(dossier)
    ##test sur un fichier

    for y in dossier_trie:
        

        for path, subdirs, filenames in os.walk(y) :
            
            for name in filenames :

                if name == "operations_extracted.json" :
                    with open(os.path.join(path, name), "r") as data_process :
                        data = json.load(data_process)
                        
                    for operation in data :
                        already_here = False

                        action = data[operation]["string"]
                        action = action.split(" ")
                        propre = action[0].split(".")
                        plus_que_propre = propre[0]
                        plus_que_propre= plus_que_propre.strip('\n')

                        #print(operation,"=", plus_que_propre)
                        for i in range(10000, 10000+len(id_type_operation),1):

                            if id_type_operation[i] == plus_que_propre :
                                already_here = True

                        if already_here == False :
                            id_type_operation[label_type] = plus_que_propre
                            label_type += 1

    return id_type_operation

def Tool_Or_Not(processes_info_json, process) :

    import json
    '''
    Cette fonction ne sera pas globale mais sera uniquement présente en interne de la lecture pour savoir si les process on un outils ou non
    '''
    

    ToolsOrNot = ""

    with open(processes_info_json) as info :
        data = json.load(info)

    
    if len(data[process]["tools"]) == 0:
            
        ToolsOrNot = False
    else :
            
        ToolsOrNot = data[process]["tools"]

    info.close()        
    
    return ToolsOrNot

def dico_no_tools(dossier) :

    import json
    import os 

    dico_label_no_tools = {}

    label_no_tools= 100000

    dossier_trie = triage(dossier)
   
    for y in dossier_trie:
        

        for path, subdirs, filenames in os.walk(y) :
            
            for name in filenames :

                if name == "processes_info.json" :
                    with open(os.path.join(path, name), "r") as data_process :
                        data = json.load(data_process)
                        
                    for process in data :
                        already_here = False
                        process_lie = os.path.join(path, process)
                        process_lie=process_lie.split("__")
                        process_lie_un = process_lie[1].replace("/", ":")
                            

                        no_tools = data[process]["tools"]
                        if no_tools == 0 :
                            

                            for i in range(100000, 100000+len(dico_label_no_tools),1):

                                if dico_label_no_tools[i] == process_lie_un:
                                    already_here = True

                        if already_here == False :
                            dico_label_no_tools[label_no_tools] = process_lie_un
                            label_no_tools += 1

    return dico_label_no_tools

def Parsing_v_graphmdl(dossier, graph_file) :

    import os
    import pandas as pd
    import json
    import pygraphviz as pg

    for path, subdirs, filenames in os.walk(dossier) :
        #on cherche le nom des fichiers dans chaque dossier de workflow
        #liste de sortie : 
        id_sommet = [] # les sommets + id + label
        partenaire = [] # couple d'arrêtes

        for name in filenames :  
            if name == graph_file :
                g = pg.AGraph(os.path.join(path, name)) #on extrait la structure graviz du workflow
                nb_sommet = 0

                for n in g.nodes() : #on énumére chaque sommet
                    
                    if n[0:9] != "OPERATION" and n[0:9] != '"OPERATIO' and n!= "in" and n!= "out": #on différencie operation et process
                        
                        #on entre dans la boucle si c'est un process
                        val = Tool_Or_Not(os.path.join(path, "processes_info.json"),n) 
                        # False si c'est un no_tools 
                        #['.....'] si c'est un process avec des outils
                        val = str(val).replace(" ","")
                         
                        if val != "False" :
                            #print(val)
                            #process avec des outils  
                            id_sommet.append([n, nb_sommet, val])
                            nb_sommet +=1
                                    
                        else :
                            #process sans outil
                            id_sommet.append([n,nb_sommet, "['no_tools']"])
                            nb_sommet +=1

                    else :
                            
                            if n == "in" :

                                id_sommet.append([n, nb_sommet, "['Begin']"])
                                nb_sommet += 1
                            
                            elif n == "out" :
                                
                                id_sommet.append([n, nb_sommet, "['End']"])
                                nb_sommet += 1

                            else :

                                #le sommet est une opération
                                with open(os.path.join(path, "operations_extracted.json")) as data_operation :
                                    file = json.load(data_operation)

                                #on extrait le type de l'opération                                        
                                action = file[n]["string"]
                                action = action.split(" ")
                                propre = action[0].split(".")

                                plus_que_propre = list() #on veut garder la nomenclature ['...']

                                plus_que_propre.append(propre[0].strip('\t').strip('\n'))
                                                                
                                id_sommet.append([n, nb_sommet, plus_que_propre])
                                nb_sommet += 1

                for e in g.edges(): #on enumère les arrêtes 

                    partenaire.append(e) #on stocke les couples 
    
    return id_sommet, partenaire

def Parsing_v_gspan(dossier,table_simi, graph_file) :

    import os
    import pandas as pd
    import json
    import pygraphviz as pg

    no_tools = dico_no_tools(dossier)
    #on créé un dico pour les no_tools, nécéssaire lorsque l'on veut donner un label différents aux process no_tools 

    label_ope = dico_label_type_operation(dossier)
    #dico pour labeliser les opérations en fonction de leur type


    for path, subdirs, filenames in os.walk(dossier) :

        id_sommet = [] 
        
        for name in filenames :  
             
            if name == graph_file :

                g = pg.AGraph(os.path.join(path, name))
                nb_sommet = 0

                
                for n in g.nodes() :
                    
                    if n[0:9] != "OPERATION" and n[0:9] != '"OPERATIO' and n!= "in" and n!= "out":

                        val = Tool_Or_Not(os.path.join(path, "processes_info.json"),n)
                        #print(val)
                            
                        if val != False :
                            #print(n)
                            #la différence avec le code de Parse_v_graphMDL est que pour gSpan
                            #on doit labéliser par des chiffres et de ce fait on doit passer par
                            #une table de similarité

                            sommet_lie = os.path.join(path, n)
                            sommet_lie=sommet_lie.split("__")
                            sommet_lie_un = sommet_lie[1].replace("/", ":")
                            #print(sommet_lie_un)

                            data = pd.read_csv(table_simi)
                            egale = False #dans le cas ou il y aurait des doublons au sein du groupe

                            for i in range(0, len(data),1) :
                                rows = data.at[i, 'groups']
                                rows =  rows.split(",")
                                

                                for process in rows :
                                    pro = process.split("'")
                                    
                                    for proc in range(1, len(pro), 2) :
                                        #print(pro[proc])
                                        if sommet_lie_un == pro[proc] and egale == False :
                                            #print(n, nb_sommet, i)
                                            id_sommet.append([n, nb_sommet, i])
                                            nb_sommet +=1
                                            egale = True
                                    
                        else :
                            id_sommet.append([n,nb_sommet, 100000])
                            nb_sommet +=1

                    else :
                            if n == "in" :

                                id_sommet.append([n, nb_sommet, "-1"])
                                nb_sommet += 1
                            
                            elif n == "out" :
                                
                                id_sommet.append([n, nb_sommet, "-2"])
                                nb_sommet += 1

                            else :
                            
                                with open(os.path.join(path, "operations_extracted.json")) as data_operation :
                                    file = json.load(data_operation)
                                    
                                        
                                action = file[n]["string"]
                                action = action.split(" ")
                                propre = action[0].split(".")

                                plus_que_propre = propre[0].strip('\n')

                                #on parcours le dico label_ope pour attribuer un label en focntion
                                #du type d'opération
                                for lab_ope in range(10000, 10000+len(label_ope),1) :
                                    if label_ope[lab_ope] == plus_que_propre :
                                        
                                        id_sommet.append([n, nb_sommet, lab_ope])
                                
                                nb_sommet += 1

                    
                partenaire = []
                for e in g.edges():

                    partenaire.append(e)
    
    return id_sommet, partenaire


'''
---------------------------------------------------------------------------------
------------------------------ DISPLAY ------------------------------------------
---------------------------------------------------------------------------------

Cette partie display permet l'affichage, dans un fichier text, des informations précedemment
récoltés vis à vis de nos workflows.

'''
def Affichage(id_sommet, partenaire, nb_graph, output_name, form) : ## a changer et mettre dans un fichier directement
    
    with open(output_name,'a') as file :
        file.write("t"+" #" + str(nb_graph)+"\n")
        

        for key in id_sommet :
            file.write("v " + str(key[1]) + " " + str(key[2]) + "\n")
            

        for part in partenaire :
            one = False
            two = False

            for keys in id_sommet :
                if part[0] == keys[0] :
                    id_first = keys[1]
                    one = True
                elif part[1] == keys[0] :
                    id_second = keys[1]
                    two = True

            if one == True and two == True and form == 'graphmdl+':
                file.write("e " + str(id_first) +" "+ str(id_second)+ " 0" +"\n")

            if  one == True and two == True and form == 'gspan' :
                file.write("e " + str(id_first) +" "+ str(id_second)+" 0" +"\n")

        file.write("\n")
       
    file.close()