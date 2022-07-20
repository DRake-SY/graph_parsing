OPERATION_1 string : Channel
.fromFilePairs( params.reads, size: single ? 1 : 2 )
.ifEmpty { exit 1, "Cannot find any reads matching: ${params.reads}, make sure it's enclosed in quotes"}
.into{raw_fastqc; raw_trimgalore}
OPERATION_1 origin : [['params.reads, size: single ? 1 : 2', 'A']]
OPERATION_1 gives  : [['raw_fastqc', 'P'], ['raw_trimgalore', 'P']]


OPERATION_2 string : Channel.fromPath(params.gtf).ifEmpty{exit 1, "GTF file not found in ${params.gtf}"}
    .into{gen_gtf; idx_gtf, trans_gtf}
OPERATION_2 origin : [['params.gtf', 'A']]
OPERATION_2 gives  : []


OPERATION_3 string : Channel.fromPath(params.fasta).ifEmpty{exit 1, "GTF file not found in ${params.fasta}"}
    .into{idx_fasta; platypus_fasta; raw_fasta; alt_fasta}
OPERATION_3 origin : [['params.fasta', 'A']]
OPERATION_3 gives  : [['idx_fasta', 'P'], ['platypus_fasta', 'P'], ['raw_fasta', 'P'], ['alt_fasta', 'P']]


OPERATION_4 string : star_index = Channel.fromPath(params.star_index).ifEmpty{exit 1, "STAR Index not found in ${params.star_index}. \
    Please select the correct path or leave blank and let the tool create an index using your genome."} 
OPERATION_4 origin : [['params.star_index', 'A']]
OPERATION_4 gives  : [['star_index', 'P']]


