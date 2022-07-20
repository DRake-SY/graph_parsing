OPERATION_1 string : contig_files = Channel.fromFilePairs("${params.input}/*.fasta",size:1) 
OPERATION_1 origin : [['"${params.input}/*.fasta",size:1', 'A']]
OPERATION_1 gives  : [['contig_files', 'P']]


OPERATION_2 string : filter_contigs_out.into{
misMatch0_in;
misMatch1_in;
misMatch2_in;
filt_contig_size_count_in;
}
OPERATION_2 origin : [['filter_contigs_out', 'P']]
OPERATION_2 gives  : [['misMatch0_in', 'P'], ['misMatch1_in', 'P'], ['misMatch2_in', 'P'], ['filt_contig_size_count_in', 'P'], ['', 'P']]


OPERATION_3 string : collected_nrOfSeq_out.into{
total_nrOfSeq_M0_in;
total_nrOfSeq_M1_in;
total_nrOfSeq_M2_in;
toatl_nrOfSeq_all_in
}
OPERATION_3 origin : [['collected_nrOfSeq_out', 'P']]
OPERATION_3 gives  : [['total_nrOfSeq_M0_in', 'P'], ['total_nrOfSeq_M1_in', 'P'], ['total_nrOfSeq_M2_in', 'P'], ['toatl_nrOfSeq_all_in', 'P']]


OPERATION_4 string : misMatch0_table_out.into{
misMatch0_table_res_plot_in;
misMatch0_combine_all_in;
misMatch0_mix_misMatches_in;
}
OPERATION_4 origin : [['misMatch0_table_out', 'P']]
OPERATION_4 gives  : [['misMatch0_table_res_plot_in', 'P'], ['misMatch0_combine_all_in', 'P'], ['misMatch0_mix_misMatches_in', 'P'], ['', 'P']]


OPERATION_5 string : misMatch1_table_out.into{
misMatch1_table_res_plot_in;
misMatch1_combine_all_in;
misMatch1_mix_misMatches_in;
}
OPERATION_5 origin : [['misMatch1_table_out', 'P']]
OPERATION_5 gives  : [['misMatch1_table_res_plot_in', 'P'], ['misMatch1_combine_all_in', 'P'], ['misMatch1_mix_misMatches_in', 'P'], ['', 'P']]


OPERATION_6 string : misMatch2_table_out.into{
misMatch2_table_res_plot_in;
misMatch2_combine_all_in;
misMatch2_mix_misMatches_in;
}
OPERATION_6 origin : [['misMatch2_table_out', 'P']]
OPERATION_6 gives  : [['misMatch2_table_res_plot_in', 'P'], ['misMatch2_combine_all_in', 'P'], ['misMatch2_mix_misMatches_in', 'P'], ['', 'P']]


OPERATION_7 string : tmp = misMatch0_mix_misMatches_in.combine(misMatch1_mix_misMatches_in, by: 0)
OPERATION_7 origin : [['misMatch0_mix_misMatches_in', 'P']]
OPERATION_7 gives  : [['tmp', 'P']]


OPERATION_8 string : all_misMatches_in = tmp.combine(misMatch2_mix_misMatches_in, by: 0)
OPERATION_8 origin : [['tmp', 'P']]
OPERATION_8 gives  : [['all_misMatches_in', 'P']]


OPERATION_9 string : nr_of_matched_seq.into{
nr_of_matched_seq_M0;
nr_of_matched_seq_M1;
nr_of_matched_seq_M2
}
OPERATION_9 origin : [['nr_of_matched_seq', 'P']]
OPERATION_9 gives  : [['nr_of_matched_seq_M0', 'P'], ['nr_of_matched_seq_M1', 'P'], ['nr_of_matched_seq_M2', 'P']]


OPERATION_10 string : collected_lists_and_nr_of_matched0.into{
collected_lists_and_nr_of_matched0_comb;
collected_lists_and_nr_of_matched0_plot
}
OPERATION_10 origin : [['collected_lists_and_nr_of_matched0', 'P']]
OPERATION_10 gives  : [['collected_lists_and_nr_of_matched0_comb', 'P'], ['collected_lists_and_nr_of_matched0_plot', 'P']]


OPERATION_11 string : collected_lists_and_nr_of_matched1.into{
collected_lists_and_nr_of_matched1_comb;
collected_lists_and_nr_of_matched1_plot
}
OPERATION_11 origin : [['collected_lists_and_nr_of_matched1', 'P']]
OPERATION_11 gives  : [['collected_lists_and_nr_of_matched1_comb', 'P'], ['collected_lists_and_nr_of_matched1_plot', 'P']]


OPERATION_12 string : collected_lists_and_nr_of_matched2.into{
collected_lists_and_nr_of_matched2_comb;
collected_lists_and_nr_of_matched2_plot
}
OPERATION_12 origin : [['collected_lists_and_nr_of_matched2', 'P']]
OPERATION_12 gives  : [['collected_lists_and_nr_of_matched2_comb', 'P'], ['collected_lists_and_nr_of_matched2_plot', 'P']]


OPERATION_13 string : collected_lists_and_nr_of_matched_comb = collected_lists_and_nr_of_matched0_comb.combine(collected_lists_and_nr_of_matched1_comb).combine(collected_lists_and_nr_of_matched2_comb)
OPERATION_13 origin : [['collected_lists_and_nr_of_matched0_comb', 'P'], ['collected_lists_and_nr_of_matched1_comb', 'P'], ['collected_lists_and_nr_of_matched2_comb', 'P']]
OPERATION_13 gives  : [['collected_lists_and_nr_of_matched_comb', 'P']]


OPERATION_14 string : plot_M0_in = collected_misMatch_table_M0.combine(total_nrOfSeq_M0_in).combine(collected_lists_and_nr_of_matched0_plot)
OPERATION_14 origin : [['collected_misMatch_table_M0', 'P'], ['total_nrOfSeq_M0_in', 'P'], ['collected_lists_and_nr_of_matched0_plot', 'P']]
OPERATION_14 gives  : [['plot_M0_in', 'P']]


OPERATION_15 string : plot_M1_in = collected_misMatch_table_M1.combine(total_nrOfSeq_M1_in).combine(collected_lists_and_nr_of_matched1_plot)
OPERATION_15 origin : [['collected_misMatch_table_M1', 'P'], ['total_nrOfSeq_M1_in', 'P'], ['collected_lists_and_nr_of_matched1_plot', 'P']]
OPERATION_15 gives  : [['plot_M1_in', 'P']]


OPERATION_16 string : plot_M2_in = collected_misMatch_table_M2.combine(total_nrOfSeq_M2_in).combine(collected_lists_and_nr_of_matched2_plot)
OPERATION_16 origin : [['collected_misMatch_table_M2', 'P'], ['total_nrOfSeq_M2_in', 'P'], ['collected_lists_and_nr_of_matched2_plot', 'P']]
OPERATION_16 gives  : [['plot_M2_in', 'P']]


OPERATION_17 string : plot_comb_in = collected_misMatch_table_comb.combine(toatl_nrOfSeq_all_in).combine(collected_lists_and_nr_of_matched_comb)
OPERATION_17 origin : [['collected_misMatch_table_comb', 'P'], ['toatl_nrOfSeq_all_in', 'P'], ['collected_lists_and_nr_of_matched_comb', 'P']]
OPERATION_17 gives  : [['plot_comb_in', 'P']]


