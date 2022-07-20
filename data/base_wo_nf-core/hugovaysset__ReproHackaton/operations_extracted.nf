OPERATION_1 string : Channel.fromPath('resources/metadata.csv').into {samples_metadata_1; samples_metadata_2}
OPERATION_1 origin : [["'resources/metadata.csv'", 'A']]
OPERATION_1 gives  : [['samples_metadata_1', 'P'], ['samples_metadata_2', 'P']]


OPERATION_2 string : SRA = Channel.of("SRR628582","SRR628583","SRR628584","SRR628585","SRR628586","SRR628587","SRR628588","SRR628589") 
OPERATION_2 origin : [['"SRR628582","SRR628583","SRR628584","SRR628585","SRR628586","SRR628587","SRR628588","SRR628589"', 'V']]
OPERATION_2 gives  : [['SRA', 'P']]


OPERATION_3 string : chr_list = Channel.of(1..22,'MT','X','Y') 
OPERATION_3 origin : [["1..22,'MT','X','Y'", 'V']]
OPERATION_3 gives  : [['chr_list', 'P']]


