OPERATION_1 string : contig_files = Channel.fromFilePairs("${params.contigs}/*.fasta",size:1)
OPERATION_1 origin : [['"${params.contigs}/*.fasta",size:1', 'A']]
OPERATION_1 gives  : [['contig_files', 'P']]


OPERATION_2 string : outgroup_file = Channel.fromFilePairs("${params.req}/*.fasta",size:1)
OPERATION_2 origin : [['"${params.req}/*.fasta",size:1', 'A']]
OPERATION_2 gives  : [['outgroup_file', 'P']]


OPERATION_3 string : combine_filt_contigs_outgroup = filt_contigs.filter({ it[1].contains("true") }).combine(outgroup_file)
OPERATION_3 origin : [['filt_contigs', 'P'], ['outgroup_file', 'P']]
OPERATION_3 gives  : [['combine_filt_contigs_outgroup', 'P']]


