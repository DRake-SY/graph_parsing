Name : get_software_versions
Inputs : []
Outputs : [[0, 'software_versions_yaml']]
Emits : []


Name : makeSTARindex
Inputs : [[0, 'ch_fasta_for_star_index'], [1, 'gtf_makeSTARindex']]
Outputs : [[0, 'star_index']]
Emits : []


Name : makeRRNAindex
Inputs : [[0, 'tx_rrna_ch']]
Outputs : [[0, 'rrna_index_ch']]
Emits : []


Name : fastqc
Inputs : [[0, 'raw_reads_fastqc']]
Outputs : [[0, 'fastqc_results']]
Emits : []


Name : trim
Inputs : [[0, 'raw_reads_trim']]
Outputs : [[0, 'trimmed_reads'], [1, 'trimmed_logs']]
Emits : []


Name : rrna
Inputs : [[0, 'rrna_index_ch'], [1, 'trimmed_reads']]
Outputs : [[0, 'clean_ch']]
Emits : []


Name : star
Inputs : [[0, 'clean_ch'], [1, 'star_index'], [2, 'gtf_star']]
Outputs : [[0, 'bam_log'], [1, 'bam_ch'], [2, 'alignment_logs'], [4, 'star_log'], [5, 'circtools_ch']]
Emits : []


Name : circtools
Inputs : [[0, 'circtools_ch'], [1, 'bam_ch'], [2, 'gtf_circtools'], [3, 'repeat_ch'], [4, 'ch_fasta_for_circtools']]
Outputs : [[0, 'circtools_out'], [1, 'circtools_mapped_out'], [2, 'rnacount'], [3, 'coordinates']]
Emits : []


Name : multiqc
Inputs : [[0, 'ch_multiqc_config'], [1, 'fastqc_results'], [2, 'trimmed_logs'], [3, 'alignment_logs'], [4, 'software_versions_yaml'], [5, 'summary']]
Outputs : [[0, 'multiqc_report']]
Emits : []


Name : output_documentation
Inputs : [[0, 'ch_output_docs']]
Outputs : []
Emits : []


