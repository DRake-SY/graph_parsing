Name : buildIndex
Inputs : [[0, 'fasta']]
Outputs : [[0, 'bismark_index']]
Emits : []


Name : fastqc
Inputs : [[0, 'read_files_fastqc']]
Outputs : [[0, 'fastqc_results']]
Emits : []


Name : trimming_1
Inputs : [[0, 'read_files_trimming']]
Outputs : [[0, 'trimmed_reads'], [1, 'trimgalore_results'], [2, 'trimgalore_fastqc_reports']]
Emits : []


Name : trimming
Inputs : [[0, 'read_files_trimming']]
Outputs : [[0, 'trimmed_reads'], [1, 'trimgalore_results']]
Emits : []


Name : mapping
Inputs : [[0, 'bismark_index'], [1, 'trimmed_reads']]
Outputs : [[0, 'bam_aln'], [1, 'bismark_align_log']]
Emits : []


Name : sorting
Inputs : [[0, 'bam_aln']]
Outputs : [[0, 'bam_sort'], [1, 'flagstat_results']]
Emits : []


Name : deduplicate
Inputs : [[0, 'bam_sort']]
Outputs : [[0, 'bam_dedup'], [0, 'flag_dedup'], [1, 'bam_dedup_sort']]
Emits : []


Name : cleaning
Inputs : [[0, 'bam_dedup_sort']]
Outputs : [[0, 'bam_dedup_sort_del'], [1, 'bam_dedup_cleaned'], [1, 'flag_dedup_cleaned'], [1, 'bam_extract'], [1, 'bam_bedgraph']]
Emits : []


Name : flagstat
Inputs : [[0, 'bam_dedup_cleaned']]
Outputs : [[0, 'flagstat_clean']]
Emits : []


Name : methylation_extraction
Inputs : [[0, 'bam_extract']]
Outputs : [[0, 'meth_extract']]
Emits : []


Name : software_version
Inputs : []
Outputs : [[0, 'software_version']]
Emits : []


