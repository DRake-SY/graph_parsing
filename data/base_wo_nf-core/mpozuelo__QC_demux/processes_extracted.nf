Name : get_software_versions
Inputs : []
Outputs : [[0, 'software_versions_yaml']]
Emits : []


Name : modify_samplesheet
Inputs : [[0, 'ch_input']]
Outputs : [[0, 'ch_samplesheet']]
Emits : []


Name : subset_10pc
Inputs : [[0, 'ch_subset']]
Outputs : [[0, 'ch_trimming']]
Emits : []


Name : trimming
Inputs : [[0, 'ch_trimming']]
Outputs : [[0, 'ch_star'], [1, 'trimgalore_trim_mqc'], [2, 'trimgalore_fastqc_mqc']]
Emits : []


Name : star
Inputs : [[0, 'ch_star']]
Outputs : [[0, 'ch_bam_samtools'], [0, 'ch_bam_stats'], [1, 'ch_markduplicates'], [2, 'sample'], [3, 'star_logs'], [4, 'ch_tab'], [5, 'concatenate_mapped']]
Emits : []


Name : samtools
Inputs : [[0, 'ch_bam_samtools']]
Outputs : [[0, 'bam_stats']]
Emits : []


Name : rseqc
Inputs : [[0, 'ch_bam_stats']]
Outputs : [[0, 'rseqc_bam'], [1, 'rseqc_dup']]
Emits : []


Name : picard
Inputs : [[0, 'ch_markduplicates']]
Outputs : [[0, 'picard_mrkd_results'], [1, 'picard_distribution_results']]
Emits : []


Name : fastqc
Inputs : [[0, 'ch_fastq']]
Outputs : [[0, 'fastqc_results'], [1, 'total_reads_merge']]
Emits : []


Name : merge_files
Inputs : [[0, 'total_reads_merge'], [1, 'concatenate_mapped']]
Outputs : []
Emits : []


Name : multiqc
Inputs : [[0, 'ch_multiqc_config'], [1, 'software_versions_yaml'], [2, 'summary'], [3, 'fastqc_results'], [4, 'trimgalore_trim_mqc'], [5, 'trimgalore_fastqc_mqc'], [6, 'star_logs'], [7, 'bam_stats'], [8, 'picard_mrkd_results'], [9, 'picard_distribution_results'], [10, 'rseqc_bam'], [11, 'rseqc_dup'], [12, 'ch_image_docs']]
Outputs : []
Emits : []


