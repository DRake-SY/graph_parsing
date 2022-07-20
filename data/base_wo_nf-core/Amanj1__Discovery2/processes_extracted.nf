Name : asm_megahit
Inputs : [[0, 'asm_megahit_in']]
Outputs : [[0, 'asm_megahit_out'], [1, 'asm_megahit_dir_out']]
Emits : []


Name : asm_metaspades
Inputs : []
Outputs : [[0, 'asm_metaspades_out'], [1, 'asm_metaspades_dir_out']]
Emits : []


Name : asm_filter_contigs
Inputs : [[0, 'all_assemblies']]
Outputs : [[0, 'asm_filter_contigs_out']]
Emits : []


Name : asm_map_reads_to_contigs
Inputs : [[0, 'asm_map_reads_to_contigs_in']]
Outputs : [[0, 'asm_map_reads_to_contigs_out']]
Emits : []


Name : asm_mapping_stats
Inputs : [[0, 'asm_mapping_stats_in']]
Outputs : [[0, 'asm_mapping_stats_out']]
Emits : []


Name : asm_per_ctg_coverage
Inputs : [[0, 'asm_per_ctg_coverage_in']]
Outputs : [[0, 'asm_per_ctg_coverage_out']]
Emits : []


Name : tax_reads_metaphlan2
Inputs : [[0, 'tax_reads_metaphlan2_in']]
Outputs : [[0, 'tax_reads_metaphlan2_out']]
Emits : []


Name : tax_reads_kraken2
Inputs : [[0, 'tax_reads_kraken2_in']]
Outputs : [[0, 'tax_reads_kraken2_out'], [1, 'tax_reads_unmapped_kraken2']]
Emits : []


Name : tax_reads_FastViromeExplorer
Inputs : [[0, 'tax_reads_FastViromeExplorer_in']]
Outputs : [[0, 'fve_out_1'], [1, 'fve_out_2']]
Emits : []


Name : tax_contigs_kraken2
Inputs : [[0, 'tax_contigs_kraken2_in']]
Outputs : [[0, 'tax_contigs_kraken2_out'], [1, 'tax_contigs_unmapped_kraken2'], [2, 'tax_contigs_kraken2_unmapped']]
Emits : []


Name : tax_contigs_diamond
Inputs : [[0, 'tax_contigs_diamond_in']]
Outputs : [[0, 'tax_contigs_diamond_out'], [1, 'tax_contigs_unmapped_diamond'], [2, 'diamond_unmapped_out'], [3, 'tax_diamond_blast_cols']]
Emits : []


Name : tax_contigs_diamond_view
Inputs : []
Outputs : [[0, 'tax_contigs_diamond_view_out']]
Emits : []


Name : tax_contigs_virfinder
Inputs : [[0, 'tax_contigs_virfinder_in']]
Outputs : [[0, 'tax_contigs_virfinder_out']]
Emits : []


Name : tax_contigs_FragGeneScan
Inputs : [[0, 'tax_contigs_fgs_in']]
Outputs : [[0, 'tax_contigs_fgs_out']]
Emits : []


Name : tax_contigs_unmapped_merged
Inputs : [[0, 'unmapped_contigs']]
Outputs : [[0, 'tax_contigs_merged_unmapped'], [1, 'tax_contigs_merged_unmapped_out']]
Emits : []


Name : tax_contigs_classifier
Inputs : [[0, 'tax_contigs_diamond_out']]
Outputs : [[0, 'tax_contigs_taxonomy_out']]
Emits : []


Name : TSV_to_HTML_each_sample
Inputs : [[0, 'html_data_each']]
Outputs : [[0, 'html_each_out']]
Emits : []


Name : collect_all_tsv_tables
Inputs : [[0, 'collect_all_tsv']]
Outputs : [[0, 'all_tsv_collected']]
Emits : []


Name : collect_virus_tsv_tables
Inputs : [[0, 'collect_virus_tsv']]
Outputs : [[0, 'virus_tsv_collected']]
Emits : []


Name : collect_bacteria_tsv_tables
Inputs : [[0, 'collect_bact_tsv']]
Outputs : [[0, 'bact_tsv_collected']]
Emits : []


Name : collect_eukaryotic_tsv_tables
Inputs : [[0, 'collect_eukar_tsv']]
Outputs : [[0, 'eukar_tsv_collected']]
Emits : []


Name : collect_otherSeq_tsv_tables
Inputs : [[0, 'collect_other_tsv']]
Outputs : [[0, 'other_tsv_collected']]
Emits : []


Name : tsv_to_simplified_tsv
Inputs : [[0, 'collected_tsv_to_simplified']]
Outputs : [[0, 'tsv_simplifed_out']]
Emits : []


Name : simplified_tsv_to_html
Inputs : [[0, 'html_simplifed_in']]
Outputs : [[0, 'html_simplifed_out']]
Emits : []


Name : collected_tsv_to_html
Inputs : [[0, 'html_collection_tsv_in']]
Outputs : [[0, 'html_collection_tsv_out']]
Emits : []


