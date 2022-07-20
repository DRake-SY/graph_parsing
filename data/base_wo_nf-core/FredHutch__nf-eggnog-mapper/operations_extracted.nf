OPERATION_1 string : fasta_ch = Channel
    .fromPath( [
        "${params.input_folder}/*faa.gz", 
        "${params.input_folder}/*faa", 
        "${params.input_folder}/*fasta.gz", 
        "${params.input_folder}/*fasta"
    ] )
    .map{it -> file(it)}
OPERATION_1 origin : []
OPERATION_1 gives  : [['fasta_ch', 'P']]


