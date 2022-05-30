
def Affichage(id_sommet, partenaire, nb_graph) : ## a changer et mettre dans un fichier directement
    
    with open('debug.txt','a') as file :
        file.write("t"+" #" + str(nb_graph)+"\n")
        #nb_sommet = 0
        #nb_arrete = 0


        for key in id_sommet :
            file.write("v " + str(key[1]) + " " + str(key[2]) + "\n")
            #nb_sommet += 1

        
        for part in range(0, len(partenaire), 2) :
            one =  False
            two = False
            #print(partenaire[part])

            for keys in id_sommet :
                        
                if partenaire[part] == keys[0] :
                        
                    id_first = keys[1]
                    #print("1 :", id_first)
                    one = True

                elif partenaire[part+1] == keys[0] :

                    id_second = keys[1]
                    #print("2 :" ,id_second)
                    two = True
            #print("e " + str(id_first) +" "+ str(id_second) + " " +"0" +"\n")
            if one == True and two == True :
                #print("e " + str(id_first) +" "+ str(id_second) + " " +"0" +"\n")    
                file.write("e " + str(id_first) +" "+ str(id_second) + " " +"0" +"\n") #str(nb_arrete) + "\n")
                #nb_arrete +=1
        file.write("\n")
       
    file.close()