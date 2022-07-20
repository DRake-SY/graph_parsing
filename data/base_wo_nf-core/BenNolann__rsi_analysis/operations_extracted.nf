OPERATION_1 string : ch_input = Channel
	        .fromFilePairs(params.input, checkIfExists: true)
		.ifEmpty{ exit 1, "[error]: Cannot find input files at: ${params.input}" }
		.into{ fastqc_reads; BBDUK_reads; raw_reads }
OPERATION_1 origin : [['params.input, checkIfExists: true', 'A']]
OPERATION_1 gives  : [['ch_input', 'P'], ['fastqc_reads', 'P'], ['BBDUK_reads', 'P'], ['raw_reads', 'P']]


OPERATION_2 string : input_bams_ch = Channel
		     .fromPath(params.bams)
		     .map { file -> tuple(file.baseName, file) }
		     .set{ qc_bams } 
OPERATION_2 origin : [['params.bams', 'A']]
OPERATION_2 gives  : [['input_bams_ch', 'P'], ['qc_bams', 'P']]


OPERATION_3 string : ch_fasta = Channel.value(file(params.fasta))
OPERATION_3 origin : []
OPERATION_3 gives  : [['ch_fasta', 'P']]


OPERATION_4 string : ch_index = Channel.value(file(params.index))
OPERATION_4 origin : []
OPERATION_4 gives  : [['ch_index', 'P']]


OPERATION_5 string : rseqc_bams = qc_bams.into{ hisat_bams1; hisat_bams2; hisat_bams3 }
OPERATION_5 origin : [['qc_bams', 'P']]
OPERATION_5 gives  : [['rseqc_bams', 'P'], ['hisat_bams1', 'P'], ['hisat_bams2', 'P'], ['hisat_bams3', 'P']]


OPERATION_6 string : rseqc_bams = bam_sorted2.into{ hisat_bams1; hisat_bams2; hisat_bams3 }
OPERATION_6 origin : [['bam_sorted2', 'P']]
OPERATION_6 gives  : [['rseqc_bams', 'P'], ['hisat_bams1', 'P'], ['hisat_bams2', 'P'], ['hisat_bams3', 'P']]


OPERATION_7 string : ch_fasta  = fasta_downloaded
OPERATION_7 origin : [['fasta_downloaded', 'P']]
OPERATION_7 gives  : [['ch_fasta', 'P']]


OPERATION_8 string : ch_index  = index_created
OPERATION_8 origin : [['index_created', 'P']]
OPERATION_8 gives  : [['ch_index', 'P']]


OPERATION_9 string : aligner_reads = trimmed_reads_ch_2
OPERATION_9 origin : [['trimmed_reads_ch_2', 'P']]
OPERATION_9 gives  : [['aligner_reads', 'P']]


OPERATION_10 string : aligner_reads = raw_reads
OPERATION_10 origin : [['raw_reads', 'P']]
OPERATION_10 gives  : [['aligner_reads', 'P']]


