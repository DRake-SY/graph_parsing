OPERATION_1 string : fasta_ch = Channel.fromPath("$params.genomedir/*.fa")
OPERATION_1 origin : [['"$params.genomedir/*.fa"', 'A']]
OPERATION_1 gives  : [['fasta_ch', 'P']]


OPERATION_2 string : barcodes_ch = Channel.fromPath("$params.barcodes")
OPERATION_2 origin : [['"$params.barcodes"', 'A']]
OPERATION_2 gives  : [['barcodes_ch', 'P']]


OPERATION_3 string : Channel
    .fromFilePairs("$params.fasta/*R{1,2}*")
    .into {R2_ch ; R1_ch}
OPERATION_3 origin : [['"$params.fasta/*R{1,2}*"', 'A']]
OPERATION_3 gives  : [['R2_ch', 'P'], ['R1_ch', 'P']]


OPERATION_4 string : Channel
    .fromPath("$params.genomedir/*.gtf")
    .into {gtf_ch; gtf_ch2}
OPERATION_4 origin : [['"$params.genomedir/*.gtf"', 'A']]
OPERATION_4 gives  : [['gtf_ch', 'P'], ['gtf_ch2', 'P']]


