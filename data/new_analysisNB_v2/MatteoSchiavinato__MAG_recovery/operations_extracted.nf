OPERATION_1 string : Metabat2_out.into{Bins_for_filtering; Bins_for_lineage_wf}
OPERATION_1 origin : [['Metabat2_out', 'P']]
OPERATION_1 gives  : [['Bins_for_filtering', 'P'], ['Bins_for_lineage_wf', 'P']]


OPERATION_2 string : Filtered_bins.into{ Bins_filt_merge;
                    Bins_filt_unique;
                    Bins_filt_refinem_stats;
                    Bins_filt_filter_bins; }
OPERATION_2 origin : [['Filtered_bins', 'P']]
OPERATION_2 gives  : [['Bins_filt_merge', 'P'], ['Bins_filt_unique', 'P'], ['Bins_filt_refinem_stats', 'P'], ['Bins_filt_filter_bins', 'P'], ['', 'P']]


OPERATION_3 string : Refinem_scaffold_stats_out.into{Scafstats_for_outliers;
                                Scafstats_for_taxa}
OPERATION_3 origin : [['Refinem_scaffold_stats_out', 'P']]
OPERATION_3 gives  : [['Scafstats_for_outliers', 'P'], ['Scafstats_for_taxa', 'P']]


