OPERATION_1 string : fastq_pair_ch = Channel.fromFilePairs(params.input_folder + '/*_R{1,2}.fq', flat:true)
OPERATION_1 origin : [["params.input_folder + '/*_R{1,2}.fq', flat:true", 'A']]
OPERATION_1 gives  : [['fastq_pair_ch', 'P']]


