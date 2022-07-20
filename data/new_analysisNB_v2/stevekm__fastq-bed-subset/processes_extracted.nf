Name : fastq_merge_bam_index
Inputs : [[0, 'samples_R1_R2']]
Outputs : [[0, 'samples_fastq_merged']]
Emits : []


Name : get_qnames
Inputs : [[0, 'samples_fastq_merged_targets']]
Outputs : [[0, 'samples_qnames']]
Emits : []


Name : subset_fastq
Inputs : [[0, 'samples_qnames_per_fastq']]
Outputs : [[0, 'subset_fastqs']]
Emits : []


Name : merge_subsetted_fastq
Inputs : [[0, 'grouped_fastqs']]
Outputs : [[0, 'merged_subset_fastqs']]
Emits : []


