OPERATION_1 string : ch_totalRNA_reads = Channel.fromPath(params.samplesheet)
   .splitCsv( header:true, sep:'\t')
   .map { get_circRNA_paths(it) }
OPERATION_1 origin : [['params.samplesheet', 'A']]
OPERATION_1 gives  : [['ch_totalRNA_reads', 'P']]


OPERATION_2 string : ch_fasta = Channel.value(file(params.fasta))
OPERATION_2 origin : []
OPERATION_2 gives  : [['ch_fasta', 'P']]


OPERATION_3 string : ch_gtf = Channel.value(file(params.gtf))
OPERATION_3 origin : []
OPERATION_3 gives  : [['ch_gtf', 'P']]


OPERATION_4 string : ch_star_index = Channel.value(file(params.STAR_index))
OPERATION_4 origin : []
OPERATION_4 gives  : [['ch_star_index', 'P']]


OPERATION_5 string : ch_miRNA_counts_raw = Channel.fromPath(params.miRNA_raw_counts) 
OPERATION_5 origin : [['params.miRNA_raw_counts', 'A']]
OPERATION_5 gives  : [['ch_miRNA_counts_raw', 'P']]


OPERATION_6 string : ch_smallRNA_reads = Channel.fromPath(params.samplesheet)
   .splitCsv( header:true, sep:'\t')
   .map { get_miRNA_paths(it) }
OPERATION_6 origin : [['params.samplesheet', 'A']]
OPERATION_6 gives  : [['ch_smallRNA_reads', 'P']]


OPERATION_7 string : ch_bowtie_index = Channel.value(file(params.bowtie_index))
OPERATION_7 origin : []
OPERATION_7 gives  : [['ch_bowtie_index', 'P']]


OPERATION_8 string : ch_star_index  = generated_star_index
OPERATION_8 origin : [['generated_star_index', 'P']]
OPERATION_8 gives  : [['ch_star_index', 'P']]


OPERATION_9 string : ch_bowtie_index  = ch_generated_bowtie_index
OPERATION_9 origin : [['ch_generated_bowtie_index', 'P']]
OPERATION_9 gives  : [['ch_bowtie_index', 'P']]


