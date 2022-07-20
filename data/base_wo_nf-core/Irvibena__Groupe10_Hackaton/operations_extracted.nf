OPERATION_1 string : samples = Channel.from("SRR628582","SRR628583","SRR628584","SRR628585","SRR628586","SRR628587","SRR628588","SRR628589")
OPERATION_1 origin : [['"SRR628582","SRR628583","SRR628584","SRR628585","SRR628586","SRR628587","SRR628588","SRR628589"', 'V']]
OPERATION_1 gives  : [['samples', 'P']]


OPERATION_2 string : liste_chromosomes = Channel.from("1", "2", "3", "4", "5", "6", "7", "8", "9", "10", "11", "12", "13", "14", "15", "16" , "17", "18", "19", "20", "21", "22", "MT", "X", "Y")
OPERATION_2 origin : [['"1", "2", "3", "4", "5", "6", "7", "8", "9", "10", "11", "12", "13", "14", "15", "16" , "17", "18", "19", "20", "21", "22", "MT", "X", "Y"', 'V']]
OPERATION_2 gives  : [['liste_chromosomes', 'P']]


OPERATION_3 string : fichier_meta = Channel.of(params.design_file)
OPERATION_3 origin : [['params.design_file', 'V']]
OPERATION_3 gives  : [['fichier_meta', 'P']]


