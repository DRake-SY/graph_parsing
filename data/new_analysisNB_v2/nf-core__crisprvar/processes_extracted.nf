Name : clean_samplesheet
Inputs : [[0, 'original_samplesheet_ch']]
Outputs : [[0, 'samplesheet_cleaned'], [0, 'samplesheet_cleaned_to_print']]
Emits : []


Name : get_software_versions
Inputs : []
Outputs : [[0, 'software_versions_yaml']]
Emits : []


Name : fastqc
Inputs : [[0, 'raw_reads_fastqc']]
Outputs : [[0, 'fastqc_results']]
Emits : []


Name : trim_galore
Inputs : [[0, 'raw_reads_trimgalore'], [1, 'ch_where_trim_galore']]
Outputs : [[0, 'trimmed_reads_crispresso'], [0, 'trimmed_reads_print'], [1, 'trimgalore_results'], [2, 'trimgalore_fastqc_reports']]
Emits : []


Name : crispresso
Inputs : [[0, 'trimmed_reads_crispresso']]
Outputs : [[1, 'crispresso_logs']]
Emits : []


Name : multiqc
Inputs : [[0, 'multiqc_config'], [1, 'fastqc_results'], [2, 'trimgalore_results'], [3, 'crispresso_logs'], [4, 'software_versions_yaml'], [5, 'summary']]
Outputs : [[0, 'multiqc_report']]
Emits : []


