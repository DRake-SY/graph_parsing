
def Affichage(id_sommet, partenaire, nb_graph) : ## a changer et mettre dans un fichier directement
    
    with open('workflow_parsing_no_tools_same_id____test.txt','a') as file :
        file.write("t"+" #" + str(nb_graph)+"\n")
        #nb_sommet = 0
        #nb_arrete = 0


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
                 
                file.write("e " + str(id_first) +" "+ str(id_second) + " " +"0" +"\n") #str(nb_arrete) + "\n")
                
        file.write("\n")
       
    file.close()