Name : get_software_versions
Inputs : []
Outputs : [[0, 'software_versions_yaml']]
Emits : []


Name : bcl2fastq
Inputs : [[0, 'samplesheet'], [1, 'runfolder']]
Outputs : [[0, 'bcl2fastq_reports'], [1, 'bcl2fastq_stats'], [2, 'fastq_output']]
Emits : []


Name : fastqc
Inputs : [[0, 'read_files_fastqc']]
Outputs : [[0, 'fastqc_results']]
Emits : []


Name : multiqc
Inputs : [[0, 'multiqc_config'], [1, 'bcl2fastq_stats'], [2, 'bcl2fastq_reports'], [3, 'fastqc_results'], [4, 'software_versions_yaml'], [5, 'summary']]
Outputs : [[0, 'multiqc_report']]
Emits : []


