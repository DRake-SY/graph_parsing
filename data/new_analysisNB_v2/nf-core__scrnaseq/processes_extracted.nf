Name : get_software_versions
Inputs : []
Outputs : [[0, 'ch_software_versions_yaml']]
Emits : []


Name : unzip_10x_barcodes
Inputs : [[0, 'barcode_whitelist_gzipped']]
Outputs : [[0, '']]
Emits : []


Name : extract_transcriptome
Inputs : [[0, 'genome_fasta_extract_transcriptome'], [1, 'gtf_extract_transcriptome']]
Outputs : [[0, '']]
Emits : []


Name : build_salmon_index
Inputs : [[0, 'transcriptome_fasta_alevin'], [0, 'transcriptome_fasta_alevin_extracted']]
Outputs : [[0, 'salmon_index_alevin']]
Emits : []


Name : makeSTARindex
Inputs : [[0, 'genome_fasta_makeSTARindex'], [1, 'gtf_makeSTARindex']]
Outputs : [[0, 'star_index']]
Emits : []


Name : build_kallisto_index
Inputs : [[0, 'transcriptome_fasta_kallisto'], [0, 'transcriptome_fasta_kallisto_extracted']]
Outputs : [[0, 'kallisto_index']]
Emits : []


Name : build_gene_map
Inputs : [[0, 'gtf_gene_map']]
Outputs : [[0, 'kallisto_gene_map']]
Emits : []


Name : build_txp2gene
Inputs : [[0, 'gtf_alevin']]
Outputs : [[0, 'txp2gene']]
Emits : []


Name : alevin
Inputs : [[0, 'read_files_alevin'], [1, 'salmon_index_alevin'], [2, 'txp2gene']]
Outputs : [[0, 'alevin_results'], [0, 'alevin_logs']]
Emits : []


Name : alevin_qc
Inputs : [[0, 'alevin_results'], [1, 'barcode_whitelist_alevinqc'], [1, 'barcode_whitelist_alevinqc_unzip']]
Outputs : [[0, 'alevinqc_results']]
Emits : []


Name : star
Inputs : [[0, 'read_files_star'], [1, 'star_index'], [2, 'gtf_star'], [3, 'barcode_whitelist_star'], [3, 'barcode_whitelist_star_unzip']]
Outputs : [[0, 'star_aligned'], [1, 'alignment_logs'], [3, 'star_log'], [4, 'bam_index_rseqc'], [4, 'bam_index_genebody when']]
Emits : []


Name : kallisto
Inputs : [[0, 'read_files_kallisto'], [1, 'kallisto_index']]
Outputs : [[0, 'kallisto_bus_to_sort'], [1, 'kallisto_log_for_multiqc']]
Emits : []


Name : bustools_correct_sort
Inputs : [[0, 'kallisto_bus_to_sort'], [1, 'barcode_whitelist_kallisto'], [1, 'barcode_whitelist_kallisto_unzip']]
Outputs : [[0, '']]
Emits : []


Name : bustools_count
Inputs : [[0, 'kallisto_corrected_sort_to_count'], [1, 'kallisto_gene_map']]
Outputs : []
Emits : []


Name : bustools_inspect
Inputs : [[0, 'kallisto_corrected_sort_to_metrics']]
Outputs : []
Emits : []


Name : multiqc
Inputs : [[0, 'ch_multiqc_config'], [1, 'ch_software_versions_yaml'], [2, 'ch_workflow_summary'], [3, 'star_log'], [4, 'alevin_logs'], [5, 'kallisto_log_for_multiqc']]
Outputs : [[0, 'ch_multiqc_report']]
Emits : []


Name : output_documentation
Inputs : [[0, 'ch_output_docs'], [1, 'ch_output_docs_images']]
Outputs : []
Emits : []


