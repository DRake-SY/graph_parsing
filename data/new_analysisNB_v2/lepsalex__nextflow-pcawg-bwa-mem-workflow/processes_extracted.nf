Name : fetchFiles
Inputs : []
Outputs : [[0, 'bams_rh'], [0, 'bams_cr']]
Emits : []


Name : readHeader
Inputs : [[0, 'bams_rh']]
Outputs : [[0, 'headers']]
Emits : []


Name : countReads
Inputs : [[0, 'bams_cr']]
Outputs : [[0, 'counts']]
Emits : []


Name : align
Inputs : [[0, 'reference_gz_ch'], [1, 'reference_gz_fai_ch'], [2, 'reference_gz_amb_ch'], [3, 'reference_gz_ann_ch'], [4, 'reference_gz_bwt_ch'], [5, 'reference_gz_pac_ch'], [6, 'reference_gz_sa_ch'], [7, 'headers'], [7, 'counts']]
Outputs : [[0, 'aligned_bams']]
Emits : []


Name : bam_stats_qc
Inputs : [[0, 'aligned_bams']]
Outputs : [[0, 'bam_stats'], [1, 'verified_bams']]
Emits : []


Name : merge_aligned
Inputs : [[0, 'verified_bams']]
Outputs : [[0, 'mb_for_extract_ur'], [0, 'mb_for_extract_bru'], [0, 'mappedReadsOutput'], [1, 'merged_bam_metrics'], [1, 'mappedReadsMetricsOutput']]
Emits : []


Name : extract_unaligned_reads
Inputs : [[0, 'reference_gz_ch'], [1, 'reference_gz_fai_ch'], [2, 'mb_for_extract_ur'], [3, 'extract_flags']]
Outputs : [[0, 'extract_ur_unmapped']]
Emits : []


Name : extract_both_reads_unaligned
Inputs : [[0, 'mb_for_extract_bru']]
Outputs : [[0, 'extract_bru_unmapped']]
Emits : []


Name : merge_unmappedReads
Inputs : [[0, 'extract_ur_unmapped'], [0, 'extract_bru_unmapped']]
Outputs : [[0, 'unmappedReadsOutput'], [1, 'unmappedReadsMetricsOutput']]
Emits : []


Name : outputMappedResults
Inputs : [[0, 'mappedReadsOutput']]
Outputs : []
Emits : []


Name : outputMappedMetricsResults
Inputs : [[0, 'mappedReadsMetricsOutput']]
Outputs : []
Emits : []


Name : outputUnmappedResults
Inputs : [[0, 'unmappedReadsOutput']]
Outputs : []
Emits : []


Name : outputUnmappedMetricsResults
Inputs : [[0, 'unmappedReadsMetricsOutput']]
Outputs : []
Emits : []


