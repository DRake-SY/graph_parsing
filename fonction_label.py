def dico_label_type_operation(dossier) :
    import json
    import os
    import triage as t
    '''
    Cette fonction prend en entré contenant un ensemble de dossier de workflow ainsi que les données associées et renvoie un dico avec un label
    pour chauqe type d'operation existante
    '''
    id_type_operation ={}
    label_type = 10000

    #print(len(id_type_operation))
    dossier_trie = t.triage(dossier)
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
    import triage as t
    import os 

    dico_label_no_tools = {}



    label_no_tools= 100000

    #print(len(id_type_operation))
    dossier_trie = t.triage(dossier)
    ##test sur un fichier

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
                            
                            
                        #print(operation,"=", plus_que_propre)
                            for i in range(100000, 100000+len(dico_label_no_tools),1):

                                if dico_label_no_tools[i] == process_lie_un:
                                    already_here = True

                        if already_here == False :
                            dico_label_no_tools[label_no_tools] = process_lie_un
                            label_no_tools += 1

    #print(dico_label_no_tools)
    return dico_label_no_tools

