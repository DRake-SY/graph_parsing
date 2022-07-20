Name : get_software_versions
Inputs : []
Outputs : [[0, 'software_versions_yaml']]
Emits : []


Name : modify_samplesheet
Inputs : [[0, 'ch_input']]
Outputs : [[0, 'ch_samplesheet'], [0, 'ch_samplesheet_percentage']]
Emits : []


Name : count_total
Inputs : [[0, 'ch_bam_count']]
Outputs : [[0, 'ch_total_reads']]
Emits : []


Name : percentages
Inputs : [[0, 'ch_samplesheet_percentage'], [1, 'ch_total_reads']]
Outputs : [[0, 'ch_samplesheet_count']]
Emits : []


Name : samtools
Inputs : [[0, 'ch_samtools']]
Outputs : [[0, 'ch_mosdepth'], [1, 'ch_picard_hsmetrics'], [1, 'ch_picard_alignmentmetrics']]
Emits : []


Name : mosdepth
Inputs : [[0, 'ch_mosdepth']]
Outputs : [[0, 'ch_ontarget_coverage']]
Emits : []


Name : picard_hsmetrics
Inputs : [[0, 'ch_picard_hsmetrics'], [1, 'ch_genome'], [2, 'ch_genome_index']]
Outputs : [[0, 'ch_merge_original_HSmetrics'], [1, 'ch_merge_subset_HSmetrics']]
Emits : []


Name : picard_alignmentmetrics
Inputs : [[0, 'ch_picard_alignmentmetrics'], [1, 'ch_genome'], [2, 'ch_genome_index']]
Outputs : [[0, 'ch_merge_original_Alignmentmetrics'], [1, 'ch_merge_subset_Alignmentmetrics']]
Emits : []


Name : merge_metrics
Inputs : [[0, 'ch_merge_original_HSmetrics'], [1, 'ch_merge_subset_HSmetrics'], [2, 'ch_merge_original_Alignmentmetrics'], [3, 'ch_merge_subset_Alignmentmetrics']]
Outputs : []
Emits : []


Name : ontarget_coverage
Inputs : [[0, 'ch_ontarget_coverage']]
Outputs : [[0, 'ch_collect_tables']]
Emits : []


Name : cat_summary
Inputs : [[0, 'ch_collect_tables']]
Outputs : []
Emits : []


