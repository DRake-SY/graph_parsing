Name : copy_pfms
Inputs : []
Outputs : [[0, 'pfms']]
Emits : []


Name : jaspar_to_homer
Inputs : [[0, 'pfms_jaspar']]
Outputs : [[0, 'pfms']]
Emits : []


Name : extract_regions
Inputs : [[0, 'peak_file_extraction'], [1, 'fasta']]
Outputs : [[0, 'extended_peaks']]
Emits : []


Name : make_background
Inputs : [[0, 'background'], [1, 'fasta']]
Outputs : [[0, 'background_seq']]
Emits : []


Name : make_shuffled_background
Inputs : [[0, 'ext_peaks_background']]
Outputs : [[0, 'background_seq']]
Emits : []


Name : enrichment
Inputs : [[0, 'ext_peaks_enrichment'], [1, 'background_seq'], [2, 'pfms']]
Outputs : [[0, 'enrichment_result']]
Emits : []


Name : region_bed
Inputs : [[0, 'ext_peaks_bed']]
Outputs : [[0, 'region_bed'], [1, 'merged_region_bed'], [2, 'sorted_peaks_bed']]
Emits : []


Name : encode_intersect
Inputs : [[0, 'merged_region_bed']]
Outputs : [[0, 'encode_intersection']]
Emits : []


Name : find_motifs
Inputs : [[0, 'ext_peaks_targets'], [1, 'pfms']]
Outputs : [[0, 'motif_instances']]
Emits : []


Name : annotate
Inputs : [[0, 'peak_file_annotation'], [1, 'gtf']]
Outputs : [[0, 'annotated_peaks']]
Emits : []


Name : tf_targets
Inputs : [[0, 'motif_instances'], [1, 'enrichment_result'], [2, 'annotated_peaks']]
Outputs : [[0, 'tf_target_results']]
Emits : []


