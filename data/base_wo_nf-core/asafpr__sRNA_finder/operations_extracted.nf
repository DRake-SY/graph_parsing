OPERATION_1 string : Channel.value(params.apikey).set{apikey}
OPERATION_1 origin : [['params.apikey', 'V']]
OPERATION_1 gives  : [['apikey', 'P']]


OPERATION_2 string : Channel.fromPath(params.genomes).set{genomes_lst}
OPERATION_2 origin : [['params.genomes', 'A']]
OPERATION_2 gives  : [['genomes_lst', 'P']]


OPERATION_3 string : Channel.fromPath(params.genomes).splitCsv(header:false, sep:"\t").map{row -> [row[0], row[1]]}.set{genomes}
OPERATION_3 origin : [['params.genomes', 'A']]
OPERATION_3 gives  : [['genomes', 'P']]


OPERATION_4 string : Channel.value(file(params.sequences)).set{seqs}
OPERATION_4 origin : []
OPERATION_4 gives  : [['seqs', 'P']]


OPERATION_5 string : Channel.fromPath(params.tree).set{tree_ch}
OPERATION_5 origin : [['params.tree', 'A']]
OPERATION_5 gives  : [['tree_ch', 'P']]


