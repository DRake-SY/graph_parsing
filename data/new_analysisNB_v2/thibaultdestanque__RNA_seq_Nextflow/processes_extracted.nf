Name : Trim
Inputs : [[0, 'read_pairs'], [1, 'adapter_file']]
Outputs : [[0, 'paired_read_trimed'], [1, 'unpaired_read_trimed']]
Emits : []


Name : Index_Genome
Inputs : [[0, 'genome_fa_file']]
Outputs : [[0, 'genome']]
Emits : []


Name : Alignment
Inputs : [[0, 'genome'], [1, 'paired_read_trimed']]
Outputs : [[0, 'all_file_alignment'], [1, 'concordant_uniq_files']]
Emits : []


Name : Format_Data
Inputs : [[0, 'concordant_uniq_files']]
Outputs : [[0, 'all_format_data'], [1, 'read_mapped_sort_bam']]
Emits : []


Name : Htseq_count
Inputs : [[0, 'read_mapped_sort_bam'], [1, 'annotation_file']]
Outputs : [[0, 'htseq_count']]
Emits : []


Name : Format_data_for_R_1
Inputs : [[0, 'htseq_count']]
Outputs : [[0, 'format_data_for_R_1']]
Emits : []


Name : Format_data_for_R_2
Inputs : [[0, 'format_data_for_R_1']]
Outputs : [[0, 'join_devlarve']]
Emits : []


