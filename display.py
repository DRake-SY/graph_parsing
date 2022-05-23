
def Affichage(id_sommet, partenaire, nb_graph) : ## a changer et mettre dans un fichier directement
    
    with open('debug.txt','a') as file :
        file.write("t"+" #" + str(nb_graph)+"\n")
        nb_sommet = 0
        nb_arrete = 0
        for key in id_sommet :
            file.write("v " + str(key[0]) + " " + str(nb_sommet) + "\n")
            nb_sommet += 1

        for part in range(0, len(partenaire), 2) :

            for keys in id_sommet :
                     
                if partenaire[part] == keys[1] :
                    
                    id_first = keys[0]
            
                elif partenaire[part+1] == keys[1] :
                                        
                    id_second = keys[0]
            #print("e " + str(id_first) +" "+ str(id_second) + " " +"0" +"\n")
            file.write("e " + str(id_first) +" "+ str(id_second) + " " +"0" +"\n") #str(nb_arrete) + "\n")
            nb_arrete +=1
        file.write("\n")
       
    file.close()