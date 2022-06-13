'''
Le script Parse_function contient l'ensemble des fonctions utilisées pour parser
les fichiers de workflows et transcrire les données dans un fichier texte qui
sera lu par les logiciels gSpan et GraphMDL(+)

--------------------------------------------------------------------------------
------------------------- TRIAGE DU DOSSIER ------------------------------------
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

def Hello(Json_file) :
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
                        vide = Hello(os.path.join(dirpath, name))
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
Chaque worflows séléctionné est analysé 1 à 1. On va attribuer un id pour chaque
process et operation présent dans le fichier "structure_worklows", ensuite, on
attribue le label en fonction de certain paramètre. Pour les process avec au moins
un outil, on regarde dans la table de similarité d'outils ou se situe notre process
(certain process ont le même nom c'est pour cela qu'on ajoute a cela le nom du fichier
dans lequel le workflow se situe) et le label correspondra au numéro du groupe.
Ensuite, pour les process sans outil, le label sera identique pour tous (100000). 
Pour finir, les operations vont être labélisé en fonction du type d'operation (merge,
filter, ...). Une table de correspondance est faite au préalable evidemment.
Et enfin, les arrêtes sont labélisé de la même manière (0) de façon arbitraire.

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

def Tool_Or_Not(processes_info_json) :

    import json
    '''
    Cette fonction ne sera pas globale mais sera uniquement présente en interne de la lecture pour savoir si les process on un outils ou non
    '''
    

    ToolsOrNot = list()

    with open(processes_info_json) as info :
        data = json.load(info)

    for process in data :
        if len(data[process]["tools"]) == 0:
            
            ToolsOrNot.append(False)
        else :
            
            ToolsOrNot.append(True)

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

def new_new_Parsing(dossier) :

    import os
    import pandas as pd
    import json

    no_tools = dico_no_tools("new_new_analysis_nf") 
    # on extrait un dico contenant tous les process ne contenant pas d'outil

    label_ope = dico_label_type_operation("new_new_analysis_nf")
    # on extrait un dico contenant le label de tous les types d'operation présent dans la base

    for path, subdirs, filenames in os.walk(dossier) :
        for name in filenames :
        
        # on va extraire les données à partir de certain fichier contenus dans le dossier de chaque workflow

            
            
        
            if name == "processes_info.json" :
                Tools = Tool_Or_Not(os.path.join(path, name))
                
                # on extrait du fichier processes_info.json une liste de booléen ranger par ordre d'apparition de chaque sommet
                # True : le process a un au moins un outil / False : le process n'a pas d'outil
                
                
            if name == "structure_worklow" :

                nb_sommet = 0 #indicatif de l'id de chaque sommet

                with open(os.path.join(path, name) ,"r") as data_workflow :
                    lines = data_workflow.readlines()
            
                # le fichier sctructure_worklow contient les principales informations du workflow : ses sommets et ses arrêtes

                id_sommet = [] 
                #liste qui contiendra le nom du process, sa postion dans le workflow (ID) et son label (il correspond au groupe
                # de similarité d'outil dans lequel il est)

                arrete = []
                #liste qui contiendra les arrêtes (non traité dans cette première partie du code)

                l_lines = len(lines)
                
                

                for line in lines[3:l_lines-1] :
                    line = line.rstrip("\n")
                    line = line.strip("\t")

                    

                    l_line = len(line)
                    vertex_or_edge = True
                    character = 0
                    
                # Parmis toutes les lignes du fichier on va uniquement lire à partir de la ligne n=3 jusqu'à la ligne n-1 (avec n étant le nombre
                # total de ligne dans le fichier) + on nettoie les lignes pour enlever la tabulation et les retours à ligne présent dans les chaines
                # de caractère

                    while character != l_line :
                        for char in line[0:l_line] :
                            character += 1
                            if char == ">" :
                                vertex_or_edge = False
                    
                    # Ici on va différencier les sommets des arrêtes en cherchant dans chaque ligne le caractère ">" :
                    # si i = True ==> c'est un sommet
                    #si i = False ==> c'est une arrêtes

                    if vertex_or_edge == True :
                        line = line.split(" ")
                        sommet = line[0]
                        
                    # on continue de nettoyer la ligne afin de garder seulement le nom du sommet 

                        # ici on cherche à ne prendre que les process et non les OPERATIONs (le and est necessaire car il existe
                        # dans les données des OPERATIONs négatives et leur écriture n'est pas la même)

                        if sommet[0:9] != "OPERATION" and sommet[0:9] != '"OPERATIO' :

                            #on rentre dans la boucle ==> on a un process
                           
                            val = Tools[nb_sommet]
                            
                            

                            #on regarde si ce process a un outil


                            if val == True :

                                # val = TRUE , le process a au moins un outil, on va donc regarder dans quel groupe de similarité il se trouve
                                #dans la table de similarité.
                                #Pour ce faire, on a besoin du nom du process ainsi que le workflow dans lequel il se trouve d'ou l'intéret des
                                #lignes qui vont suivre.

                                sommet_lie = os.path.join(path, sommet)
                                sommet_lie=sommet_lie.split("__")
                                sommet_lie_un = sommet_lie[1].replace("/", ":")


                                
                                # On va parcourir la table de similarité afin de trouver ou se trouve process et ainsi lui attribuer un label
                                data = pd.read_csv('simi_table.csv')
                                egale = False 
                                for i in range(0,len(data),1) :
                                
                                # i correspond au i-ième groupe de process == label

                                    rows = data.at[i, 'groups']
                                    rows = rows.split(",")
                                
                                    for process in rows  :
                                        
                                        pro = process.split("'")
                                        
                                        for proc in range(1,len(pro),2) : 


                                            if sommet_lie_un == pro[proc] and egale ==False :


                                                # si le sommet coorespond à un process de la table on va lui attribuer
                                                # le label du groupe
                                                # l'id est attribué par ordre d'arrivé

                                                id_sommet.append([sommet,nb_sommet,i])
                                                egale = True

                                nb_sommet +=1
                                
                            else :

                                '''
                                # Si val = False alors on a un process qui n'utilise pas d'outil
                                # Dans ce cas la soit on attribue un label different à chaque process soit on leur
                                # attribue le même
                                
                                
                                ## Part for no _tools with different labels ###

                                sommet_lie = os.path.join(path, sommet)
                                sommet_lie=sommet_lie.split("__")
                                sommet_lie_un = sommet_lie[1].replace("/", ":")

                                for label_no_tools in range(100000,100000+len(no_tools),1):
                                    if no_tools[label_no_tools] == sommet_lie_un :
                                        
                                        
                                        id_sommet.append([sommet,nb_sommet, label_no_tools])
                                    
                                ## -------------------------------------------------
                                '''

                                ## Part for no_tools with same labels ###

                                id_sommet.append([sommet,nb_sommet, 100000])
                                
                                
                                ## -------------------------------------------

                                nb_sommet +=1
                                
                        
                        else :
                            name = "operations_extracted.json"
                            with open(os.path.join(path, name)) as data_operation :
                                file = json.load(data_operation)
                            
                                
                            action = file[sommet]["string"]
                            action = action.split(" ")
                            propre = action[0].split(".")
                            plus_que_propre = propre[0]
                            plus_que_propre = plus_que_propre.strip('\n')
                            

                            for lab_ope in range(10000, 10000+len(label_ope),1) :
                                if label_ope[lab_ope] == plus_que_propre :
                                    
                                    id_sommet.append([sommet, nb_sommet, lab_ope])
                                    

                            nb_sommet += 1
    ## a ce niveau on a tous les sommets avec un id et un label en fonction de leur catégories
                            
                    else :            
                        arrete.append(line)
        
    taille = 0
    partenaire = []

    for arr in range(0,len(arrete)) :

        if arrete[arr] != arrete[arr-1] :
            fin1 = 0
            fin2 = 0
            elle = arrete[arr]
            
            
            for char in elle :
                
                taille += 1
                        # boucle pour déterminer la fin du premier partenaire
                        # on s'arrête au 1er "-" qu'on croise (pour les fichiers de ce type)
                        # à partir de là on sait que la fin réel tu premiers partenaire de l'arrête
                        # est à 2 charactère du "-" et qu'il commence à 0.
                if char == ">" : 
                            
                    fin1 = taille-3

                    partenaire.append(elle[0:fin1])

                        # Même raisonnement que pour le premier partenaire, on détermine la fin en fonction
                        # du char "[" et on sait que la fin réelle est -2 charatère et le début à +2 de la fin
                        # estimé du premier
                elif char == "[" : ## boucle 
                            
                    fin2 = taille-2
                    partenaire.append(elle[fin1+4:fin2])
            taille = 0

    
    
    return id_sommet, partenaire

'''
---------------------------------------------------------------------------------
------------------------------ DISPLAY ------------------------------------------
---------------------------------------------------------------------------------

Le display consite juste en la lecture des précédentes données parser et la 
retranscription dans un fichier test.

'''
def Affichage(id_sommet, partenaire, nb_graph) : ## a changer et mettre dans un fichier directement
    
    with open('all_data_parsed.txt','a') as file :
        file.write("t"+" #" + str(nb_graph)+"\n")
        

        for key in id_sommet :
            file.write("v " + str(key[1]) + " " + str(key[2]) + "\n")
            

        
        for part in range(0, len(partenaire), 2) :
            one =  False
            two = False
            

            for keys in id_sommet :
                        
                if partenaire[part] == keys[0] :
                        
                    id_first = keys[1]
                    
                    one = True

                elif partenaire[part+1] == keys[0] :

                    id_second = keys[1]
                    
                    two = True
            
            if one == True and two == True :
                 
                file.write("e " + str(id_first) +" "+ str(id_second) + " " +"0" +"\n") 
                
        file.write("\n")
       
    file.close()