Name : reformat_fastq_reads_PE
Inputs : [[0, 'reformat_PE_in']]
Outputs : [[0, 'reformation_PE']]
Emits : []


Name : reformat_fastq_reads_S
Inputs : [[0, 'reformat_S_in']]
Outputs : [[0, 'reformation_S']]
Emits : []


Name : blastn_phase1_PE
Inputs : [[0, 'reformation_PE']]
Outputs : [[0, 'blastn_phase1_PE']]
Emits : []


Name : blastn_phase1_S
Inputs : [[0, 'reformation_S']]
Outputs : [[0, 'blastn_phase1_S']]
Emits : []


Name : extract_fastq_reads_for_phase1
Inputs : [[0, 'blastn_phase1_with_fq']]
Outputs : [[0, 'phase1_fq_reads']]
Emits : []


Name : asm_metaviralspades
Inputs : [[0, 'asm_spades_in']]
Outputs : [[0, 'asm_spades_out'], [1, 'asm_spades_dir']]
Emits : []


Name : asm_megahit
Inputs : [[0, 'asm_megahit_in']]
Outputs : [[0, 'asm_megahit'], [1, 'asm_megahit_dir']]
Emits : []


Name : modify_asm_megahit
Inputs : [[0, 'asm_megahit']]
Outputs : [[0, 'asm_megahit_mod_out']]
Emits : []


Name : map_reads_to_contigs
Inputs : [[0, 'map_reads_to_contigs']]
Outputs : [[0, 'map_reads_to_contigs_out']]
Emits : []


Name : asm_mapping_stats
Inputs : [[0, 'asm_mapping_stats_in']]
Outputs : [[0, 'asm_mapping_stats_out']]
Emits : []


Name : asm_per_ctg_coverage
Inputs : [[0, 'asm_per_ctg_coverage_in']]
Outputs : [[0, 'asm_per_ctg_coverage_out']]
Emits : []


Name : asm_bedtools_parse_reads_mapped_to_contigs
Inputs : [[0, 'parse_sam_mapping']]
Outputs : [[0, 'parse_sam_mapping_out']]
Emits : []


Name : blastn_phase2_metaviralspades
Inputs : [[0, 'asm_spades']]
Outputs : [[0, 'blastn_phase2_spades']]
Emits : []


Name : blastn_phase2_megahit
Inputs : [[0, 'asm_megahit_mod']]
Outputs : [[0, 'blastn_phase2_megahit']]
Emits : []


Name : process_phase2_results
Inputs : [[0, 'blastn_phase2_results']]
Outputs : [[0, 'phase2_processed_results']]
Emits : []


Name : fetch_fasta_headers_local_DB
Inputs : [[0, 'fetch_names_local_DB']]
Outputs : [[0, 'local_DB_organism_name_fetched']]
Emits : []


Name : fetch_taxonomy_esearch
Inputs : [[0, 'fetch_names_esearch']]
Outputs : [[0, 'esearch_taxonomy_fetched']]
Emits : []


Name : preprocess_classification_data
Inputs : [[0, 'classification_data']]
Outputs : [[0, 'preprocessed_classification']]
Emits : []


Name : classified_asm_results
Inputs : [[0, 'preprocessed_classification']]
Outputs : [[0, 'classified_asm']]
Emits : []


Name : TSV_to_HTML_each_sample
Inputs : [[0, 'html_data_each']]
Outputs : [[0, 'html_each_out']]
Emits : []


Name : collect_all_tsv_tables
Inputs : [[0, 'combine_all_tsv']]
Outputs : [[0, 'all_tsv_collected']]
Emits : []


Name : collect_viral_tsv_tables
Inputs : [[0, 'combine_viral_tsv']]
Outputs : [[0, 'viral_tsv_collected']]
Emits : []


Name : TSV_to_HTML_all_collected
Inputs : [[0, 'tsv_collection_into_html']]
Outputs : [[0, 'html_all_out']]
Emits : []


