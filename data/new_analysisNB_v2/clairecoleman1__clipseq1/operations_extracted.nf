OPERATION_1 string : ch_smrna_fasta = Channel.value(params.smrna_path)
OPERATION_1 origin : [['params.smrna_path', 'V']]
OPERATION_1 gives  : [['ch_smrna_fasta', 'P']]


OPERATION_2 string : ch_ref_fai = Channel.value(params.refgenome_path)
OPERATION_2 origin : [['params.refgenome_path', 'V']]
OPERATION_2 gives  : [['ch_ref_fai', 'P']]


OPERATION_3 string : ch_ref = Channel.value(params.refgenome_path)
OPERATION_3 origin : [['params.refgenome_path', 'V']]
OPERATION_3 gives  : [['ch_ref', 'P']]


OPERATION_4 string : ch_gtf_star = Channel.value(params.gtf_path)
OPERATION_4 origin : [['params.gtf_path', 'V']]
OPERATION_4 gives  : [['ch_gtf_star', 'P']]


OPERATION_5 string : ch_fastq_fastqc_pretrim = Channel.value(params.fastq_path)
OPERATION_5 origin : [['params.fastq_path', 'V']]
OPERATION_5 gives  : [['ch_fastq_fastqc_pretrim', 'P']]


OPERATION_6 string : ch_fasta = Channel.value(params.refgenome_path)
OPERATION_6 origin : [['params.refgenome_path', 'V']]
OPERATION_6 gives  : [['ch_fasta', 'P']]


OPERATION_7 string : ch_fastq_umi = Channel.value(params.fastq_path)
OPERATION_7 origin : [['params.fastq_path', 'V']]
OPERATION_7 gives  : [['ch_fastq_umi', 'P']]


OPERATION_8 string : ch_fasta_pureclip = Channel.value(params.refgenome_path)
OPERATION_8 origin : [['params.refgenome_path', 'V']]
OPERATION_8 gives  : [['ch_fasta_pureclip', 'P']]


OPERATION_9 string : ch_multiqc_config = Channel.value(params.multiqc_config)
OPERATION_9 origin : [['params.multiqc_config', 'V']]
OPERATION_9 gives  : [['ch_multiqc_config', 'P']]


OPERATION_10 string : ch_output_docs = Channel.value(params.output_docs)
OPERATION_10 origin : [['params.output_docs', 'V']]
OPERATION_10 gives  : [['ch_output_docs', 'P']]


OPERATION_11 string : ch_multiqc_custom_config = Channel.fromPath(params.multiqc_config, checkIfExists: true)
OPERATION_11 origin : [['params.multiqc_config, checkIfExists: true', 'A']]
OPERATION_11 gives  : [['ch_multiqc_custom_config', 'P']]


OPERATION_12 string : ch_multiqc_custom_config = Channel.empty()
OPERATION_12 origin : []
OPERATION_12 gives  : [['ch_multiqc_custom_config', 'P']]


OPERATION_13 string : ch_fasta_star = Channel.value(params.refgenome_path)
OPERATION_13 origin : [['params.refgenome_path', 'V']]
OPERATION_13 gives  : [['ch_fasta_star', 'P']]


OPERATION_14 string : ch_fasta_dreme_piranha = Channel.value(params.refgenome_path)
OPERATION_14 origin : [['params.refgenome_path', 'V']]
OPERATION_14 gives  : [['ch_fasta_dreme_piranha', 'P']]


OPERATION_15 string : Channel.fromFilePairs(params.reads)
       .into{ fastqc_reads; trimming_reads; raw_reads }
OPERATION_15 origin : [['params.reads', 'A']]
OPERATION_15 gives  : [['fastqc_reads', 'P'], ['trimming_reads', 'P'], ['raw_reads', 'P']]


OPERATION_16 string : mapping_reads = raw_reads
OPERATION_16 origin : [['raw_reads', 'P']]
OPERATION_16 gives  : [['mapping_reads', 'P']]


