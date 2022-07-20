OPERATION_1 string : Channel.of( sampleID, fqR1p, fqR2p )
       .toList()
       .set { sample_fastqs_ch }
OPERATION_1 origin : [['sampleID, fqR1p, fqR2p', 'V']]
OPERATION_1 gives  : [['sample_fastqs_ch', 'P']]


OPERATION_2 string : sort_rm_dup_chrm_multi_filter_shifted_mm10_chain
.mix( sort_rm_dup_chrm_multi_filter_shifted_mm10_non_chain )
.into{
    processed_bams_ch_peak_calling;
    processed_bams_ch_bigwig;
    processed_bams_ch_frip_reads;
    processed_bams_ch_final_calc_frip;
    processed_bams_ch_feature_counts;
    }
OPERATION_2 origin : [['sort_rm_dup_chrm_multi_filter_shifted_mm10_chain', 'P'], ['sort_rm_dup_chrm_multi_filter_shifted_mm10_non_chain', 'P']]
OPERATION_2 gives  : [['processed_bams_ch_peak_calling', 'P'], ['processed_bams_ch_bigwig', 'P'], ['processed_bams_ch_frip_reads', 'P'], ['processed_bams_ch_final_calc_frip', 'P'], ['processed_bams_ch_feature_counts', 'P'], ['', 'P']]


