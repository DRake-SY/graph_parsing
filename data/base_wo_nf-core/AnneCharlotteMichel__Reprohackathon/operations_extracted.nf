OPERATION_1 string : SRAID = Channel.of("SRR628582","SRR628583", "SRR628584", "SRR628585", "SRR628586", "SRR628587", "SRR628588", "SRR628589")
OPERATION_1 origin : [['"SRR628582","SRR628583", "SRR628584", "SRR628585", "SRR628586", "SRR628587", "SRR628588", "SRR628589"', 'V']]
OPERATION_1 gives  : [['SRAID', 'P']]


OPERATION_2 string : liste_chromosomes = Channel.of("1", "2", "3", "4", "5", "6", "7", "8", "9", "10", "11", "12", "13", "14", "15", "16" , "17", "18", "19", "20", "21", "22", "MT", "X", "Y")
OPERATION_2 origin : [['"1", "2", "3", "4", "5", "6", "7", "8", "9", "10", "11", "12", "13", "14", "15", "16" , "17", "18", "19", "20", "21", "22", "MT", "X", "Y"', 'V']]
OPERATION_2 gives  : [['liste_chromosomes', 'P']]


OPERATION_3 string : SRAID2 = Channel.of('c("SRR628582.bam","SRR628584.bam", "SRR628586.bam", "SRR628588.bam", "SRR628589.bam", "SRR628583.bam", "SRR628585.bam", "SRR628587.bam")')
OPERATION_3 origin : []
OPERATION_3 gives  : [['SRAID2', 'P']]


OPERATION_4 string : fichier_mutant = Channel.of(params.design_file)
OPERATION_4 origin : [['params.design_file', 'V']]
OPERATION_4 gives  : [['fichier_mutant', 'P']]


