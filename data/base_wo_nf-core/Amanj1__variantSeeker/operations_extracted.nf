OPERATION_1 string : fastq_files = Channel.fromFilePairs("${params.fastq_dir}/**/*_{1,2,unpaired}.fq.gz",size:3)
OPERATION_1 origin : [['"${params.fastq_dir}/**/*_{1,2,unpaired}.fq.gz",size:3', 'A']]
OPERATION_1 gives  : [['fastq_files', 'P']]


OPERATION_2 string : html_files = Channel.fromFilePairs("${params.html_dir}/html_{start,end}.txt",size:2)
OPERATION_2 origin : [['"${params.html_dir}/html_{start,end}.txt",size:2', 'A']]
OPERATION_2 gives  : [['html_files', 'P']]


OPERATION_3 string : fastq_files.into{reformat_PE_in;
reformat_S_in;
extraction_in}
OPERATION_3 origin : [['fastq_files', 'P']]
OPERATION_3 gives  : [['reformat_PE_in', 'P'], ['reformat_S_in', 'P'], ['extraction_in', 'P']]


OPERATION_4 string : html_files.into{html_each;
html_all}
OPERATION_4 origin : [['html_files', 'P']]
OPERATION_4 gives  : [['html_each', 'P'], ['html_all', 'P']]


OPERATION_5 string : tmp = blastn_phase1_PE.combine(blastn_phase1_S, by: 0)
OPERATION_5 origin : [['blastn_phase1_PE', 'P']]
OPERATION_5 gives  : [['tmp', 'P']]


OPERATION_6 string : blastn_phase1_with_fq = tmp.combine(extraction_in, by: 0)
OPERATION_6 origin : [['tmp', 'P']]
OPERATION_6 gives  : [['blastn_phase1_with_fq', 'P']]


OPERATION_7 string : phase1_fq_reads.into{asm_spades_in;
asm_megahit_in;
reads_for_mapping}
OPERATION_7 origin : [['phase1_fq_reads', 'P']]
OPERATION_7 gives  : [['asm_spades_in', 'P'], ['asm_megahit_in', 'P'], ['reads_for_mapping', 'P']]


OPERATION_8 string : asm_megahit_mod_out.into{asm_megahit_mod;
asm_megahit_comb}
OPERATION_8 origin : [['asm_megahit_mod_out', 'P']]
OPERATION_8 gives  : [['asm_megahit_mod', 'P'], ['asm_megahit_comb', 'P']]


OPERATION_9 string : asm_spades_out.into{asm_spades;
asm_spades_comb}
OPERATION_9 origin : [['asm_spades_out', 'P']]
OPERATION_9 gives  : [['asm_spades', 'P'], ['asm_spades_comb', 'P']]


OPERATION_10 string : asm_for_mapping = asm_spades_comb.combine(asm_megahit_comb, by: 0)
OPERATION_10 origin : [['asm_spades_comb', 'P']]
OPERATION_10 gives  : [['asm_for_mapping', 'P']]


OPERATION_11 string : map_reads_to_contigs = asm_for_mapping.combine(reads_for_mapping, by: 0)
OPERATION_11 origin : [['asm_for_mapping', 'P']]
OPERATION_11 gives  : [['map_reads_to_contigs', 'P']]


OPERATION_12 string : map_reads_to_contigs_out.into{asm_mapping_stats_in;
asm_per_ctg_coverage_in;
parse_sam_mapping}
OPERATION_12 origin : [['map_reads_to_contigs_out', 'P']]
OPERATION_12 gives  : [['asm_mapping_stats_in', 'P'], ['asm_per_ctg_coverage_in', 'P'], ['parse_sam_mapping', 'P']]


OPERATION_13 string : blastn_phase2_results = blastn_phase2_spades.combine(blastn_phase2_megahit, by: 0)
OPERATION_13 origin : [['blastn_phase2_spades', 'P']]
OPERATION_13 gives  : [['blastn_phase2_results', 'P']]


OPERATION_14 string : phase2_processed_results.into{fetch_names_local_DB;
fetch_names_esearch;
initial_table}
OPERATION_14 origin : [['phase2_processed_results', 'P']]
OPERATION_14 gives  : [['fetch_names_local_DB', 'P'], ['fetch_names_esearch', 'P'], ['initial_table', 'P']]


OPERATION_15 string : classification_data = esearch_taxonomy_fetched.combine(initial_table, by: 0)
OPERATION_15 origin : [['esearch_taxonomy_fetched', 'P']]
OPERATION_15 gives  : [['classification_data', 'P']]


OPERATION_16 string : classified_asm.into{tsv_into_html_each;
combine_viral_tsv;
combine_all_tsv}
OPERATION_16 origin : [['classified_asm', 'P']]
OPERATION_16 gives  : [['tsv_into_html_each', 'P'], ['combine_viral_tsv', 'P'], ['combine_all_tsv', 'P']]


OPERATION_17 string : html_data_each = tsv_into_html_each.combine(html_each)
OPERATION_17 origin : [['tsv_into_html_each', 'P'], ['html_each', 'P']]
OPERATION_17 gives  : [['html_data_each', 'P']]


OPERATION_18 string : tsv_collection_into_html = all_tsv_collected.combine(viral_tsv_collected).combine(html_all)
OPERATION_18 origin : [['all_tsv_collected', 'P'], ['viral_tsv_collected', 'P'], ['html_all', 'P']]
OPERATION_18 gives  : [['tsv_collection_into_html', 'P']]


