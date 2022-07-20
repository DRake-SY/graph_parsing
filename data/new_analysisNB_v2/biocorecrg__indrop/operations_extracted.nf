OPERATION_1 string : Channel
    .fromPath( params.pairs )                                             
    .ifEmpty { error "Cannot find any reads matching: ${params.reads}" }
    .set { reads_for_fastqc}
OPERATION_1 origin : [['params.pairs', 'A']]
OPERATION_1 gives  : [['reads_for_fastqc', 'P']]


OPERATION_2 string : reads = Channel.empty()
OPERATION_2 origin : []
OPERATION_2 gives  : [['reads', 'P']]


OPERATION_3 string : fastq_file_for_size_est = Channel.empty()
OPERATION_3 origin : []
OPERATION_3 gives  : [['fastq_file_for_size_est', 'P']]


OPERATION_4 string : read_pairs.map{
		[it[0], [it[1][1], it[1][3], it[1][0], it[1][2] ]]
	}.set{ reads}
OPERATION_4 origin : [['read_pairs', 'P']]
OPERATION_4 gives  : [['reads', 'P']]


OPERATION_5 string : fastq_files_for_size_est.map{
		[it[0], [it[1][0]]]
	}.set{ fastq_file_for_size_est}
OPERATION_5 origin : [['fastq_files_for_size_est', 'P']]
OPERATION_5 gives  : [['fastq_file_for_size_est', 'P']]


OPERATION_6 string : read_pairs.map{
		[it[0], [it[1][1], it[1][2], it[1][0] ]]
	}.set{ reads}
OPERATION_6 origin : [['read_pairs', 'P']]
OPERATION_6 gives  : [['reads', 'P']]


OPERATION_7 string : fastq_files_for_size_est.map{
		[it[0], [it[1][0]]]
	}.set{ fastq_file_for_size_est}
OPERATION_7 origin : [['fastq_files_for_size_est', 'P']]
OPERATION_7 gives  : [['fastq_file_for_size_est', 'P']]


OPERATION_8 string : read_pairs.set{reads}
OPERATION_8 origin : [['read_pairs', 'P']]
OPERATION_8 gives  : [['reads', 'P']]


OPERATION_9 string : fastq_files_for_size_est.first().map{
		[it[0], [it[1][1]]]
	}.set{ fastq_file_for_size_est}
OPERATION_9 origin : [['fastq_files_for_size_est', 'P']]
OPERATION_9 gives  : [['fastq_file_for_size_est', 'P']]


OPERATION_10 string : STARmappedTags_for_est = STARmappedTags_for_filter
OPERATION_10 origin : [['STARmappedTags_for_filter', 'P']]
OPERATION_10 gives  : [['STARmappedTags_for_est', 'P']]


