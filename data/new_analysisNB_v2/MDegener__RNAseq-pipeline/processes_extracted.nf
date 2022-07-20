Name : fastqc
Inputs : [[0, 'read_files_1']]
Outputs : [[0, 'fastqc_html'], [1, 'fastqc_zip']]
Emits : []


Name : star
Inputs : [[0, 'star_index'], [1, 'read_files_2']]
Outputs : [[0, 'bam_files'], [1, 'final_log']]
Emits : []


Name : sorting
Inputs : [[0, 'bam_files']]
Outputs : [[0, 'bam_sorted']]
Emits : []


Name : index
Inputs : [[0, 'bam_sorted']]
Outputs : [[0, 'bam_indexed']]
Emits : []


Name : miso
Inputs : [[0, 'bam_miso']]
Outputs : [[0, 'miso_output']]
Emits : []


Name : summarize_miso
Inputs : [[0, 'miso_output']]
Outputs : []
Emits : []


Name : rnaseqc
Inputs : [[0, 'bam_rnaseqc'], [1, 'gtf']]
Outputs : [[0, '']]
Emits : []


Name : multiqc
Inputs : [[0, 'fastqc_zip'], [1, 'final_log'], [2, 'multiqc_file']]
Outputs : []
Emits : []


