Name : fastqc
Inputs : [[0, 'read_files_fastqc']]
Outputs : [[0, 'fastqc_results']]
Emits : []


Name : trim_galore
Inputs : [[0, 'read_files_trimming']]
Outputs : [[0, 'trimmed_reads'], [1, 'trimgalore_results'], [2, 'trimgalore_fastqc_reports']]
Emits : []


Name : bwa
Inputs : [[0, 'trimmed_reads'], [1, 'bwa_index']]
Outputs : [[0, 'bwa_bam']]
Emits : []


Name : samtools
Inputs : [[0, 'bwa_bam']]
Outputs : [[0, 'bam_picard'], [0, 'bam_for_mapped'], [1, 'bwa_bai'], [1, 'bai_for_mapped'], [2, 'samtools_stats']]
Emits : []


Name : bwa_mapped
Inputs : [[0, 'bam_for_mapped'], [1, 'bai_for_mapped']]
Outputs : [[0, 'bwa_mapped']]
Emits : []


Name : picard
Inputs : [[0, 'bam_picard']]
Outputs : [[0, 'bam_dedup_spp'], [0, 'bam_dedup_ngsplot'], [0, 'bam_dedup_deepTools'], [0, 'bam_dedup_macs'], [0, 'bam_dedup_saturation'], [0, 'bam_dedup_bigwigs'], [1, 'bai_dedup_deepTools'], [1, 'bai_dedup_ngsplot'], [1, 'bai_dedup_macs'], [1, 'bai_dedup_saturation'], [1, 'bai_dedup_bigwigs'], [2, 'bed_dedup'], [3, 'picard_reports']]
Emits : []


Name : bigwigs
Inputs : [[0, 'bam_dedup_bigwigs'], [1, 'bai_dedup_bigwigs']]
Outputs : []
Emits : []


Name : get_software_versions
Inputs : []
Outputs : [[0, 'software_versions_yaml']]
Emits : []


Name : multiqc
Inputs : [[0, 'multiqc_config'], [1, 'fastqc_results'], [2, 'trimgalore_results'], [3, 'samtools_stats'], [4, 'picard_reports'], [5, 'software_versions_yaml'], [6, 'summary']]
Outputs : [[0, 'multiqc_report']]
Emits : []


Name : output_documentation
Inputs : [[0, 'output_docs']]
Outputs : []
Emits : []


