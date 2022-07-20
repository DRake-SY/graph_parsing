Name : filter_contig_size
Inputs : [[0, 'contig_files']]
Outputs : [[0, 'filter_contigs_out']]
Emits : []


Name : number_of_sequences
Inputs : [[0, 'filt_contig_size_count_in']]
Outputs : [[0, 'nr_of_seq_out']]
Emits : []


Name : collect_nr_of_seq
Inputs : [[0, 'nr_of_seq_out']]
Outputs : [[0, 'collected_nrOfSeq_out']]
Emits : []


Name : grep_misMatch0
Inputs : [[0, 'misMatch0_in']]
Outputs : [[0, 'misMatch0_out']]
Emits : []


Name : grep_misMatch1
Inputs : [[0, 'misMatch1_in']]
Outputs : [[0, 'misMatch1_out']]
Emits : []


Name : grep_misMatch2
Inputs : [[0, 'misMatch2_in']]
Outputs : [[0, 'misMatch2_out']]
Emits : []


Name : create_table_misMatch0
Inputs : [[0, 'misMatch0_out']]
Outputs : [[0, 'misMatch0_table_out']]
Emits : []


Name : create_table_misMatch1
Inputs : [[0, 'misMatch1_out']]
Outputs : [[0, 'misMatch1_table_out']]
Emits : []


Name : create_table_misMatch2
Inputs : [[0, 'misMatch2_out']]
Outputs : [[0, 'misMatch2_table_out']]
Emits : []


Name : create_table_all_misMatches
Inputs : [[0, 'all_misMatches_in']]
Outputs : [[0, 'all_misMatches_table'], [1, 'nr_of_matched_seq']]
Emits : []


Name : collect_misMatch_tables_M0
Inputs : [[0, 'misMatch0_combine_all_in']]
Outputs : [[0, 'collected_misMatch_table_M0']]
Emits : []


Name : collect_misMatch_tables_M1
Inputs : [[0, 'misMatch1_combine_all_in']]
Outputs : [[0, 'collected_misMatch_table_M1']]
Emits : []


Name : collect_misMatch_tables_M2
Inputs : [[0, 'misMatch2_combine_all_in']]
Outputs : [[0, 'collected_misMatch_table_M2']]
Emits : []


Name : collect_misMatch_tables_comb
Inputs : [[0, 'all_misMatches_table']]
Outputs : [[0, 'collected_misMatch_table_comb']]
Emits : []


Name : collect_nr_matched_seq_M0
Inputs : [[0, 'nr_of_matched_seq_M0']]
Outputs : [[0, 'collected_lists_and_nr_of_matched0']]
Emits : []


Name : collect_nr_matched_seq_M1
Inputs : [[0, 'nr_of_matched_seq_M1']]
Outputs : [[0, 'collected_lists_and_nr_of_matched1']]
Emits : []


Name : collect_nr_matched_seq_M2
Inputs : [[0, 'nr_of_matched_seq_M2']]
Outputs : [[0, 'collected_lists_and_nr_of_matched2']]
Emits : []


Name : plot_comb
Inputs : [[0, 'plot_comb_in']]
Outputs : [[0, 'plot_comb_out']]
Emits : []


Name : plot_M0
Inputs : [[0, 'plot_M0_in']]
Outputs : [[0, 'plot_M0_out']]
Emits : []


Name : plot_M1
Inputs : [[0, 'plot_M1_in']]
Outputs : [[0, 'plot_M1_out']]
Emits : []


Name : plot_M2
Inputs : [[0, 'plot_M2_in']]
Outputs : [[0, 'plot_M2_out']]
Emits : []


