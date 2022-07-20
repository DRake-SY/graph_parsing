Name : CHECK_SAMPLESHEET
Inputs : [[0, 'ch_input']]
Outputs : [[0, 'ch_samplesheet_reformat']]
Emits : []


Name : BWA_INDEX
Inputs : [[0, 'ch_fasta']]
Outputs : [[0, 'ch_bwa_index']]
Emits : []


Name : MINIMAP2_INDEX
Inputs : [[0, 'ch_fasta']]
Outputs : [[0, 'ch_minimap2_index']]
Emits : []


Name : FASTQC
Inputs : [[0, 'ch_reads_fastqc']]
Outputs : [[0, 'ch_fastqc_reports_mqc']]
Emits : []


Name : NANOPLOT
Inputs : [[0, 'ch_reads_nanoplot']]
Outputs : []
Emits : []


Name : FASTP
Inputs : [[0, 'ch_reads_bwa']]
Outputs : [[0, 'ch_reads_trimmed']]
Emits : []


Name : BWA_MEM
Inputs : [[0, 'ch_reads_trimmed'], [1, 'ch_bwa_index']]
Outputs : [[0, 'ch_bwa_bam']]
Emits : []


Name : MIMIMAP2_ALIGN
Inputs : [[0, 'ch_reads_minimap2'], [1, 'ch_minimap2_index']]
Outputs : [[0, 'ch_minimap2_bam']]
Emits : []


Name : SORT_BAM
Inputs : [[0, 'ch_bwa_bam'], [0, 'ch_minimap2_bam']]
Outputs : [[0, 'ch_sort_bam'], [1, 'ch_sort_bam_flagstat_mqc']]
Emits : []


Name : get_software_versions
Inputs : []
Outputs : [[0, 'ch_software_versions_yaml']]
Emits : []


Name : MULTIQC
Inputs : [[0, 'ch_multiqc_config'], [1, 'ch_multiqc_custom_config'], [2, 'ch_fastqc_reports_mqc'], [3, 'ch_sort_bam_flagstat_mqc'], [4, 'ch_software_versions_yaml'], [5, 'ch_workflow_summary']]
Outputs : [[0, 'ch_multiqc_report']]
Emits : []


Name : output_documentation
Inputs : [[0, 'ch_output_docs']]
Outputs : []
Emits : []


