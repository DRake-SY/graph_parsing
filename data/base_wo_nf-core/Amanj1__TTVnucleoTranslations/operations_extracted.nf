OPERATION_1 string : contig_files = Channel.fromFilePairs("${params.contigs}/*.fasta",size:1)
OPERATION_1 origin : [['"${params.contigs}/*.fasta",size:1', 'A']]
OPERATION_1 gives  : [['contig_files', 'P']]


