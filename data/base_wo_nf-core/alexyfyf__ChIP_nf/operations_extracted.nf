OPERATION_1 string : Channel
        .fromPath( params.fasta )
        .into{ ch_fasta; ch_fasta_index; ch_bam_filter }
OPERATION_1 origin : [['params.fasta', 'A']]
OPERATION_1 gives  : [['ch_fasta', 'P'], ['ch_fasta_index', 'P'], ['ch_bam_filter', 'P']]


OPERATION_2 string : species = Channel.from(params.species)
OPERATION_2 origin : [['params.species', 'V']]
OPERATION_2 gives  : [['species', 'P']]


OPERATION_3 string : Channel
        .fromFilePairs( params.reads, size: params.single_end ? 1 : 2 )
        .ifEmpty { exit 1, "Cannot find any reads matching: ${params.reads}\nNB: Path needs to be enclosed in quotes!\nIf this is single-end data, please specify --single_end on the command line." }
        .into { ch_raw_reads_fastqc; ch_raw_reads_align }
OPERATION_3 origin : [['params.reads, size: params.single_end ? 1 : 2', 'A']]
OPERATION_3 gives  : [['ch_raw_reads_fastqc', 'P'], ['ch_raw_reads_align', 'P']]


OPERATION_4 string : _fastqc.{zip,html}' into ch_fastqc_results_for_multiqc
OPERATION_4 origin : [['_fastqc', 'P']]
OPERATION_4 gives  : []


OPERATION_5 string : ch_raw_reads_align.combine(ch_bwa_index)
OPERATION_5 origin : [['ch_raw_reads_align', 'P'], ['ch_bwa_index', 'P']]
OPERATION_5 gives  : []


OPERATION_6 string : ch_bwa_bam.combine(ch_bam_filter)
OPERATION_6 origin : [['ch_bwa_bam', 'P'], ['ch_bam_filter', 'P']]
OPERATION_6 gives  : []


OPERATION_7 string : ch_fastqc_results_for_multiqc.collect().ifEmpty([])
OPERATION_7 origin : [['ch_fastqc_results_for_multiqc', 'P']]
OPERATION_7 gives  : []


OPERATION_8 string : ch_bamqc_for_multiqc.collect().ifEmpty([])
OPERATION_8 origin : [['ch_bamqc_for_multiqc', 'P']]
OPERATION_8 gives  : []


OPERATION_9 string : ch_insert_multiqc.collect().ifEmpty([])
OPERATION_9 origin : [['ch_insert_multiqc', 'P']]
OPERATION_9 gives  : []


