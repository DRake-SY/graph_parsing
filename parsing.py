##------------------------------------------PARSER----------------------------------------------------------------
import json
import triage as t
import openpyxl as op
import os



#-----------------------------------------------------------------------------------------------------------------
#---------------------Lecture fichier Json + création dico id pour les sommets------------------------------------
#-----------------------------------------------------------------------------------------------------------------

#### preque obsolete

def Json_parsing(Json_file) :

    rep = []
    no_tools = 1
    d_id_tools = {}
    d_process_tools = {}
    id = 0
    col = " "

    #ouverture du fichier Json 
    with open(Json_file) as file :
        data = json.load(file)

    #on met dans rep les process et l'outils associé l'un a coté de l'autre
    for process in data :
        rep.append([process])## me donne le nom des process
        rep.append(data[process]['tools'])## me donne les outils

    #on remplace les cases [] signifiant qu'il n'y a pas d'outils par "no_tools" et le numéro d'apparition
    for i in range(1, len(rep),1) :
        if len(rep[i]) == 0 :
            
            rep[i] = ["no_tools_" + str(no_tools)]
            no_tools += 1

    #on forme les deux dico :
    #le premier avec les process et l'outil associé
    #le deuxième avec l'id des outils en fonction de leur ordre d'apparition dans le fichier
    for i in range(0,len(rep),2) :

        exist = False
        
        #ici le process i va prendre l'outils i+1 en valeur
        #o rappelle que dans rep le process et l'outil associé se suivent dans la liste

        d_process_tools[col.join(rep[i])] = col.join(rep[i+1])
    
        #ici on verifie que nous n'avons pas deux fois le même outils dans le dico
        #si c'est le cas le booléen devient vrais
        #si c'est faux, une id est attribué à l'outil
        for val in d_id_tools.values() :

            if val == col.join(rep[i+1]) :
                exist = True

        if exist == False :
            d_id_tools[id] = col.join(rep[i+1])
            id += 1

    #on retourne deux dicos
    return d_id_tools, d_process_tools


#-----------------------------------------------------------------------------------------------------------------
#------------Traitement de la structure : on sépare sommets + identification et arrêtes + def partenaire----------
#-----------------------------------------------------------------------------------------------------------------
def Traitement_Structure(structure_workflow) :
    #on prend en entré le fichier structure workflow afin de traiter les sommets et les arrêtes
    #le fichier Json nous servira pour obtenir les dico id_tools et process_tools

    with open(structure_workflow, "r") as graph : 
        lines = graph.readlines()
    

    rep_process = repertoire_process("new_analysis_nf")
    

    y = len(lines)

    id_sommet = []
    arrete = []
    id = 0

    #---------------------- Traitement des lignes du fichier
    for line in lines[3:y-1] :
        line = line.rstrip("\n")
        line = line.strip("\t")
        
        z = len(line)
        id = 0
        i = True
        compteur = 0
        
        # on détermine quelle ligne est un sommet et 
        # quelle ligne est une arrête
        while compteur != z :
            for char in line[0:z] :
                compteur += 1
                if char == ">" :
                    i = False
        
        # Si True c'est un sommet, on le met donc dans un dico et
        # son identifiant correspondra à l'outils qu'il utilise
        if i == True :
            
            crochet = 0
            for char in line[0:z] : #ici on va épurer les lignes de sommet pour seulement garder le nom avant les crochets
                crochet += 1

                if char == "[" : 

                    for val in rep_process : 
                        #on va comparer les process obtenus dans le
                        #json avec les différentes lignes du fichier struture workflow
                        
                        if line[0:crochet-2] == val :
                            id_sommet.append([id,line[0:crochet-2]])
                        id+=1
        
        # Si False c'est une arrête, on le met dans une liste que l'on
        # traitera par la suite
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
                #print(partenaire)
                taille += 1
                    # boucle pour déterminer la fin du premier partenaire
                    # on s'arrête au 1er "-" qu'on croise (pour les fichiers de ce type)
                    # à partir de là on sait que la fin réel tu premiers partenaire de l'arrête
                    # est à 2 charactère du "-" et qu'il commence à 0.
                if char == ">" : 
                        #print("fin du premier")
                    fin1 = taille-3

                    partenaire.append(elle[0:fin1])

                    # Même raisonnement que pour le premier partenaire, on détermine la fin en fonction
                    # du char "[" et on sait que la fin réelle est -2 charatère et le début à +2 de la fin
                    # estimé du premier
                elif char == "[" : ## boucle 
                        #print("fin du deuxième")
                    fin2 = taille-2
                    partenaire.append(elle[fin1+4:fin2])
            taille = 0

    #on récupère une liste de liste avec les id des sommets et le sommet
    #et on récupère un fichier avec les duo des arrêtes (elles se suivent deux à
    #deux)
    
    
    return id_sommet, partenaire


#-----------------------------------------------------------------------------------------------------------------
#------------Table de correspondance process ==> ID --------------------------------------------------------------
#-----------------------------------------------------------------------------------------------------------------

#Pour chaque process dans le dossier analysé, un identifiant lui sera assigné
#Si cela est une operation alors elle portera le même identifiant
def repertoire_process (dossier) :
    wb = op.Workbook()
    wb['Sheet'].title = 'id_process'

    ws1 = wb['id_process']
    ws1['A1'] = "ID"
    ws1['B1'] = 'name_process'

    row_start = 1
    col_start = 1
    id = 0
    id_process = list()
    dossier = t.triage("new_analysis_nf")
    ##test sur un fichier

    for y in dossier:
        
        for path, subdirs, files in os.walk(y):
            for name in files:
                if name == "structure_worklow" : 
                    with open(os.path.join(path, name), "r") as data:
                        lines = data.readlines()           
                    y= len(lines)

                    for line in lines[3:y-1] :
                            line = line.rstrip("\n")
                            line = line.strip("\t")

                            z = len(line)
                                    
                            process = True
                            present = False
                            compteur = 0

                            while compteur != z :
                                for char in line[0:z] :
                                    compteur += 1
                                    if char == ">" :
                                        process = False
                                if process == True :
                                    crochet = 0
                                    for char in line[0:z] : 
                                            #ici on va épurer les lignes de sommet pour 
                                            #seulement garder le nom avant les crochets
                                        crochet += 1

                                        if char == "[" : 

                                            for i in id_process :
                                                if i == line[0:crochet-2] :
                                                    
                                                    present = True
                                            
                                            if present == False :
                                                
                                                id_process.append(line[0:crochet-2])
                                                ws1.cell(row_start+ id, col_start+1).value = line[0:crochet-2]
                                                ws1.cell(row_start+id, col_start).value = id
                                            
                                                
                                                
                                                id +=1

    wb.save('id_process.xlsx')
    return id_process


