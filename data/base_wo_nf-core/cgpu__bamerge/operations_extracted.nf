OPERATION_1 string : input_files_channel_ = Channel.fromPath(params.input_files_list)
                              .ifEmpty { exit 1, "Input BAM files .csv list file not found: ${params.input_files_list}" }
                              .splitCsv(sep: ',', skip: 1)
                              .map{ shared_sample_id, filepath -> [shared_sample_id,  file(filepath)] }
                              .groupTuple()
                              .into { input_files_channel_samtools_; input_files_channel_sambamba_}
OPERATION_1 origin : [['params.input_files_list', 'A']]
OPERATION_1 gives  : [['input_files_channel_', 'P'], ['input_files_channel_samtools_', 'P'], ['input_files_channel_sambamba_', 'P']]


