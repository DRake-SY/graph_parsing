Name : metabat2
Inputs : []
Outputs : [[0, 'Metabat2_out']]
Emits : []


Name : checkm_lineage_wf
Inputs : [[0, 'Bins_for_lineage_wf']]
Outputs : [[0, 'Checkm_lineage_out'], [1, 'lineage_file'], [2, 'marker_file']]
Emits : []


Name : filter_bins
Inputs : [[0, 'lineage_file'], [1, 'Bins_for_filtering']]
Outputs : [[3, 'Filtered_bins']]
Emits : []


Name : checkm_unique
Inputs : [[0, 'Bins_filt_unique']]
Outputs : []
Emits : []


Name : ccs_mapping
Inputs : []
Outputs : [[0, 'ccs_bam']]
Emits : []


Name : ccs_map_filter_sort
Inputs : [[0, 'ccs_bam']]
Outputs : [[0, 'ccs_filt_bam'], [1, 'ccs_filt_sort_bam'], [2, 'ccs_filt_sort_bam_stats']]
Emits : []


Name : index_bam
Inputs : [[0, 'ccs_filt_sort_bam']]
Outputs : [[0, 'ccs_filt_sort_bam_index']]
Emits : []


Name : recover_unmapped_reads
Inputs : [[0, 'ccs_filt_bam']]
Outputs : [[0, 'unmapped_reads_fasta']]
Emits : []


Name : refinem_scaffold_stats
Inputs : [[0, 'Bins_filt_refinem_stats'], [1, 'ccs_filt_sort_bam'], [2, 'ccs_filt_sort_bam_index']]
Outputs : [[0, 'Refinem_scaffold_stats_out']]
Emits : []


Name : refinem_outliers
Inputs : [[0, 'Scafstats_for_outliers']]
Outputs : [[0, 'Refinem_outliers_out']]
Emits : []


Name : refinem_filter_outlier_bins
Inputs : [[0, 'Bins_filt_filter_bins'], [1, 'Refinem_outliers_out']]
Outputs : [[0, 'bin_sizes'], [1, 'Refinem_no_outliers']]
Emits : []


Name : run_gtdb_tk
Inputs : [[0, 'Refinem_no_outliers']]
Outputs : [[0, 'Gtdb_out']]
Emits : []


Name : taxonomy_table
Inputs : [[0, 'bin_sizes'], [1, 'Gtdb_out']]
Outputs : []
Emits : []


