Name : fastqc
Inputs : [[0, 'raw_reads_fastqc']]
Outputs : [[0, 'fastqc_results']]
Emits : []


Name : trim_galore
Inputs : [[0, 'raw_reads_trimgalore'], [1, 'wherearemyfiles']]
Outputs : [[0, 'trimmed_reads'], [0, 'trimmed_reads_kallisto'], [1, 'trimgalore_results'], [2, 'trimgalore_fastqc_reports']]
Emits : []


Name : star
Inputs : [[0, 'trimmed_reads'], [1, 'wherearemyfiles']]
Outputs : [[0, 'star_aligned'], [1, 'alignment_logs']]
Emits : []


Name : markDuplicates
Inputs : [[0, 'bam_markduplicates'], [1, 'wherearemyfiles']]
Outputs : [[0, 'bam_md'], [1, 'picard_resuls']]
Emits : []


Name : addRG
Inputs : [[0, 'bam_md']]
Outputs : [[0, 'bam_md_rg']]
Emits : []


Name : splitandtrim
Inputs : [[0, 'bam_md_rg']]
Outputs : [[0, 'bam_split']]
Emits : []


Name : recalibrate
Inputs : [[0, 'bam_split']]
Outputs : [[0, 'bam_vcall'], [1, 'gatk_base_recalibration_results']]
Emits : []


Name : variantCall
Inputs : [[0, 'bam_vcall']]
Outputs : [[0, 'raw_variants_gvcf']]
Emits : []


Name : genotypegvcfs
Inputs : [[0, 'raw_variants_gvcf']]
Outputs : [[0, 'raw_gvcfs']]
Emits : []


Name : filterVariants
Inputs : [[0, 'raw_gvcfs']]
Outputs : [[0, 'filtered_variants']]
Emits : []


Name : annotateVariants
Inputs : [[0, 'filtered_variants']]
Outputs : [[0, 'annotated_variants']]
Emits : []


Name : get_software_versions
Inputs : []
Outputs : [[0, 'software_versions_yaml']]
Emits : []


Name : workflow_summary_mqc
Inputs : []
Outputs : [[0, 'workflow_summary_yaml']]
Emits : []


Name : multiqc
Inputs : [[0, 'multiqc_config'], [1, 'fastqc_results'], [2, 'trimgalore_results'], [3, 'alignment_logs'], [4, 'gatk_base_recalibration_results'], [5, 'software_versions_yaml'], [6, 'workflow_summary_yaml']]
Outputs : [[0, 'multiqc_report']]
Emits : []


Name : output_documentation
Inputs : [[0, 'output_docs']]
Outputs : []
Emits : []


