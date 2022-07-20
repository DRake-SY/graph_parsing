OPERATION_1 string : LIB_RUN_LOCAL_FASTQS = Channel.from(
  action.call(params, 'input', 'raw_fastq_dir', 'map').collect {k, v -> [k,v]})
OPERATION_1 origin : []
OPERATION_1 gives  : [['LIB_RUN_LOCAL_FASTQS', 'P']]


OPERATION_2 string : TRANS_FA = Channel.fromPath(action.call(params, 'fasta', 'transcript_file', 'file'))
	.ifEmpty { exit 1, "Index not found: " + action.call(params, 'fasta', 'transcript_file', 'file')}
OPERATION_2 origin : [["action.call(params, 'fasta', 'transcript_file', 'file'", 'A']]
OPERATION_2 gives  : [['TRANS_FA', 'P']]


OPERATION_3 string : GENOME_FA = Channel.fromPath(action.call(params, 'fasta', 'genome_file', 'file'))
	.ifEmpty { exit 1, "Index not found: " + action.call(params, 'fasta', 'genome_file', 'file')}
OPERATION_3 origin : [["action.call(params, 'fasta', 'genome_file', 'file'", 'A']]
OPERATION_3 gives  : [['GENOME_FA', 'P']]


OPERATION_4 string : GTF = Channel.fromPath(action.call(params, 'annotation', 'gtf_file', 'file'))
	.ifEmpty { exit 1, "Index not found: " + action.call(params, 'annotation', 'gtf_file', 'file')}
OPERATION_4 origin : [["action.call(params, 'annotation', 'gtf_file', 'file'", 'A']]
OPERATION_4 gives  : [['GTF', 'P']]


OPERATION_5 string : bamIndex_tool = Channel.from(action.call(params, 'tools', 'samtools_sambamba_string', 'string'))
OPERATION_5 origin : []
OPERATION_5 gives  : [['bamIndex_tool', 'P']]


OPERATION_6 string : STAR_INDEX = Channel.fromPath("${idx_filename}")
			.ifEmpty { exit 1, "Index not found: ${idx_filename}" }
OPERATION_6 origin : [['"${idx_filename}"', 'A']]
OPERATION_6 gives  : [['STAR_INDEX', 'P']]


OPERATION_7 string : BOWTIE2_INDEX = Channel.fromPath("${idx_filename}/*")
			.ifEmpty { exit 1, "Index not found: ${idx_filename}" }
			.collect()
OPERATION_7 origin : [['"${idx_filename}/*"', 'A']]
OPERATION_7 gives  : [['BOWTIE2_INDEX', 'P']]


OPERATION_8 string : SALMON_INDEX = Channel.fromPath("${idx_filename}")
			.ifEmpty { exit 1, "Index not found: ${idx_filename}" }
OPERATION_8 origin : [['"${idx_filename}"', 'A']]
OPERATION_8 gives  : [['SALMON_INDEX', 'P']]


OPERATION_9 string : LIB_RUN_LOCAL_FASTQS
  .map { v -> [v[0], v[1].collect{file(it)}] }
  .into {FASTQC_FQ; SALMON_FQ; STAR_FQ; TOPHAT_FQ; TEST_FQ}
OPERATION_9 origin : [['LIB_RUN_LOCAL_FASTQS', 'P']]
OPERATION_9 gives  : [['FASTQC_FQ', 'P'], ['SALMON_FQ', 'P'], ['STAR_FQ', 'P'], ['TOPHAT_FQ', 'P'], ['TEST_FQ', 'P']]


OPERATION_10 string : TRANS_FA.into(1)
OPERATION_10 origin : [['TRANS_FA', 'P']]
OPERATION_10 gives  : []


OPERATION_11 string : STAR_GENOME_FA, BOWTIE2_GENOME_FA,
	TOPHAT_GENOME_FA, PICARD_ALIGN_GENOME_FA,
	PICARD_SEQ_GENOME_FA, CHRSIZE_FA = GENOME_FA.into(6)
OPERATION_11 origin : [['GENOME_FA', 'P']]
OPERATION_11 gives  : [['STAR_GENOME_FA', 'P'], ['BOWTIE2_GENOME_FA', 'P'], ['TOPHAT_GENOME_FA', 'P'], ['PICARD_ALIGN_GENOME_FA', 'P'], ['PICARD_SEQ_GENOME_FA', 'P'], ['CHRSIZE_FA', 'P']]


OPERATION_12 string : STAR_GTF, TOPHAT_GTF, REFFLAT_GTF, RRNA_GTF, CNT_GTF = GTF.into(5)
OPERATION_12 origin : [['GTF', 'P']]
OPERATION_12 gives  : [['STAR_GTF', 'P'], ['TOPHAT_GTF', 'P'], ['REFFLAT_GTF', 'P'], ['RRNA_GTF', 'P'], ['CNT_GTF', 'P']]


OPERATION_13 string : STAR_BAM_INDEX_TOOL, TOPHAT_BAM_INDEX_TOOL = bamIndex_tool.into(2)
OPERATION_13 origin : [['bamIndex_tool', 'P']]
OPERATION_13 gives  : [['STAR_BAM_INDEX_TOOL', 'P'], ['TOPHAT_BAM_INDEX_TOOL', 'P']]


OPERATION_14 string : STAR_BAM
	.mix(TOPHAT_BAM)
	.into {BAM_2CNT; BAM_2ALIGN_STATS; BAM_2SEQ_STATS; BAM_TEST}
OPERATION_14 origin : [['STAR_BAM', 'P'], ['TOPHAT_BAM', 'P']]
OPERATION_14 gives  : [['BAM_2CNT', 'P'], ['BAM_2ALIGN_STATS', 'P'], ['BAM_2SEQ_STATS', 'P'], ['BAM_TEST', 'P']]


