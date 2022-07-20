Name : pre_trim_fastqc
Inputs : [[0, 'fq_file_2']]
Outputs : [[0, 'prefastqc_ch']]
Emits : []


Name : summary_multi_qc_pre
Inputs : [[0, 'prefastqc_ch']]
Outputs : []
Emits : []


Name : fastp_Trim
Inputs : [[0, 'fq_file_1']]
Outputs : [[0, 'fq_file_trim1'], [0, 'fq_file_trim2']]
Emits : []


Name : generate_specific_trancriptome
Inputs : [[0, 'Strains']]
Outputs : [[0, 'sample_transcriptome']]
Emits : []


Name : kal_index
Inputs : [[0, 'sample_transcriptome']]
Outputs : [[0, 'transcriptome_index']]
Emits : []


Name : kal_mapping
Inputs : [[0, 'mapping_data_set']]
Outputs : [[0, 'kallisto_out_dirs'], [1, 'kallisto_log']]
Emits : []


Name : post_trim_fastqc
Inputs : [[0, 'fq_file_trim2']]
Outputs : [[1, 'fastqc_ch']]
Emits : []


Name : summary_multi_qc
Inputs : [[0, 'qc_data']]
Outputs : []
Emits : []


