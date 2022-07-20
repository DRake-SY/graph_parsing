OPERATION_1 string : chr_ch = Channel
    .of(1..21, 'X', 'Y')
OPERATION_1 origin : [["1..21, 'X', 'Y'", 'V']]
OPERATION_1 gives  : [['chr_ch', 'P']]


OPERATION_2 string : bam_ch = Channel.fromFilePairs(params.bam_path)
OPERATION_2 origin : [['params.bam_path', 'A']]
OPERATION_2 gives  : [['bam_ch', 'P']]


