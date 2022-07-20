Name : fasqc
Inputs : [[0, 'reads_qc_ch']]
Outputs : [[0, 'fastqc_results'], [1, 'fastqc_version']]
Emits : []


Name : fastp
Inputs : [[0, 'reads_ch']]
Outputs : [[0, 'fastp_results'], [1, 'fastp_stats_ch'], [2, 'reads_rna_ch'], [3, 'save_filter_reads'], [4, 'fastp_version']]
Emits : []


Name : fastp_stats
Inputs : [[0, 'fastp_stats_ch']]
Outputs : [[0, 'fastp_csv']]
Emits : []


Name : save_filter_reads
Inputs : [[0, 'save_filter_reads']]
Outputs : [[0, 'save_filter_reads_out']]
Emits : []


Name : remove_rrna
Inputs : [[0, 'reads_rna_ch']]
Outputs : [[0, 'reads_rna_ass'], [1, 'save_rrna_reads'], [2, 'remove_rrna_sum'], [3, 'sortmerna_version']]
Emits : []


Name : save_rrna_reads
Inputs : [[0, 'save_rrna_reads']]
Outputs : [[0, 'save_rrna_reads_out']]
Emits : []


Name : skip_rrna_removal
Inputs : [[0, 'skip_rna_ch']]
Outputs : [[0, 'remove_rrna_sum']]
Emits : []


Name : normalize_reads
Inputs : [[0, 'reads_rna_ass']]
Outputs : [[0, ''], [1, ''], [2, 'save_norm_reads'], [3, 'norm_report']]
Emits : []


Name : save_norm_reads
Inputs : [[0, 'save_norm_reads']]
Outputs : [[0, 'save_norm_reads_out']]
Emits : []


Name : prepare_reads
Inputs : [[0, 'reads_rna_ass']]
Outputs : [[0, ''], [1, '']]
Emits : []


Name : skip_filter
Inputs : [[0, 'skip_filter_ch']]
Outputs : [[0, 'fastp_csv']]
Emits : []


Name : skip_normalization
Inputs : [[0, 'skip_norm_ch']]
Outputs : [[0, 'norm_report']]
Emits : []


Name : skip_normalization_only
Inputs : [[0, 'reads_rna_ass']]
Outputs : [[0, 'norm_report'], [1, 'norm_reads_soap'], [1, 'norm_reads_velvet'], [1, 'norm_reads_trinity'], [1, 'norm_reads_spades'], [1, 'norm_reads_transabyss'], [1, 'reads_rna_quast'], [1, 'mapping_reads_trinity'], [1, 'mapping_reads_evi'], [1, 'mapping_symbiont']]
Emits : []


Name : skip_filter_only
Inputs : [[0, 'skip_filter_only_ch']]
Outputs : [[0, 'fastp_csv']]
Emits : []


Name : trinity_assembly
Inputs : [[0, 'norm_reads_trinity']]
Outputs : [[0, ''], [1, 'trinity_version']]
Emits : []


Name : soap_assembly
Inputs : [[0, '"${params'], [1, 'norm_reads_soap']]
Outputs : [[0, 'assemblies_ch_soap'], [1, 'assemblies_ch_soap_busco4'], [2, 'soap_version']]
Emits : []


Name : velvet_oases_assembly
Inputs : [[0, '"${params'], [1, 'norm_reads_velvet']]
Outputs : [[0, 'assemblies_ch_velvet'], [1, 'assemblies_ch_velvet_busco4'], [2, 'velvet_version']]
Emits : []


Name : rna_spades_assembly
Inputs : [[0, '"${params'], [1, 'norm_reads_spades']]
Outputs : [[0, 'assemblies_ch_spades'], [1, 'assemblies_ch_spades_busco4'], [2, 'rnaspades_version']]
Emits : []


Name : transabyss_assembly
Inputs : [[0, '"${params'], [1, 'norm_reads_transabyss']]
Outputs : [[0, 'assemblies_ch_transabyss'], [1, 'assemblies_ch_transabyss_busco4'], [2, 'transabyss_version']]
Emits : []


Name : evigene
Inputs : [[0, 'evigene_ch']]
Outputs : [[0, ''], [1, 'evigene_summary'], [2, 'evigene_version']]
Emits : []


Name : rna_quast
Inputs : [[0, 'rna_quast']]
Outputs : [[0, 'rna_quast_sum'], [1, 'rna_quast_report'], [2, 'rnaquast_version']]
Emits : []


Name : mapping_evigene
Inputs : [[0, 'mapping_evi_in']]
Outputs : [[0, 'mapping_evi_results'], [1, 'mapping_evi_results_bam']]
Emits : []


Name : busco4
Inputs : [[0, 'evigene_ch_busco4']]
Outputs : [[0, 'busco4_ch'], [1, ''], [2, 'busco4_transpi_tsv'], [3, 'busco4_version']]
Emits : []


Name : mapping_trinity
Inputs : [[0, 'mapping_trinity_in']]
Outputs : [[0, 'mapping_trinity_results'], [1, 'bowtie_version']]
Emits : []


Name : summary_evigene_individual
Inputs : [[0, 'evigene_summary']]
Outputs : [[0, 'final_sum_1'], [1, 'summary_evi_csv']]
Emits : []


Name : busco4_all
Inputs : [[0, 'busco4_all']]
Outputs : [[0, 'busco4_all_ch'], [1, ''], [2, 'busco4_all_sum_ch'], [3, 'busco4_all_tsv']]
Emits : []


Name : busco4_tri
Inputs : [[0, 'busco4_ch_trinity']]
Outputs : [[0, ''], [2, 'busco4_trinity_rescue']]
Emits : []


Name : busco4_dist
Inputs : [[0, 'busco4_dist_ch']]
Outputs : [[0, 'busco4_dist_sum'], [1, 'busco4_heatmap']]
Emits : []


Name : skip_busco_dist
Inputs : [[0, 'skip_busco_dist']]
Outputs : [[0, 'busco4_heatmap']]
Emits : []


Name : summary_busco4_individual
Inputs : [[0, 'busco4_sum']]
Outputs : [[0, 'final_sum_2v4']]
Emits : []


Name : get_busco4_comparison
Inputs : [[0, 'busco4_comp']]
Outputs : [[0, 'busco4_fig'], [1, 'busco4_csv']]
Emits : []


Name : transdecoder_short
Inputs : [[0, 'annotation_ch_transdecoder']]
Outputs : [[0, ''], [1, ''], [2, 'transdecoder_summary'], [3, 'transdecoder_csv'], [4, 'transdecoder_files'], [5, 'transdecoder_version']]
Emits : []


Name : transdecoder_longorf
Inputs : [[0, 'annotation_ch_transdecoder']]
Outputs : [[0, 'transdecoder_diamond'], [0, 'transdecoder_hmmer'], [1, 'transdecoder_version']]
Emits : []


Name : transdecoder_diamond
Inputs : [[0, 'transdecoder_diamond']]
Outputs : [[0, 'transdecoder_predict_diamond']]
Emits : []


Name : transdecoder_hmmer
Inputs : [[0, 'transdecoder_hmmer']]
Outputs : [[0, 'transdecoder_predict_hmmer']]
Emits : []


Name : transdecoder_predict
Inputs : [[0, 'transdecoder_predict_ch']]
Outputs : [[0, ''], [1, ''], [2, 'transdecoder_summary'], [3, 'transdecoder_csv'], [4, 'transdecoder_files']]
Emits : []


Name : swiss_diamond_trinotate
Inputs : [[0, 'transdecoder_ch_diamond']]
Outputs : [[0, 'trinotate_ch_diamondX'], [1, 'trinotate_ch_diamondP'], [2, 'diamond_version']]
Emits : []


Name : custom_diamond_trinotate
Inputs : [[0, 'transdecoder_ch_diamond_custom']]
Outputs : [[0, 'trinotate_ch_diamondX_custom'], [1, 'trinotate_ch_diamondP_custom']]
Emits : []


Name : hmmer_trinotate
Inputs : [[0, 'transdecoder_ch_hmmer']]
Outputs : [[0, 'trinotate_ch_hmmer'], [1, 'hmmer_version']]
Emits : []


Name : signalP_trinotate
Inputs : [[0, 'transdecoder_ch_signalp']]
Outputs : [[0, 'trinotate_ch_signalp']]
Emits : []


Name : skip_signalP
Inputs : [[0, 'transdecoder_ch_signalp']]
Outputs : [[0, 'trinotate_ch_signalp']]
Emits : []


Name : tmhmm_trinotate
Inputs : [[0, 'transdecoder_ch_tmhmm']]
Outputs : [[0, 'trinotate_ch_tmhmm']]
Emits : []


Name : skip_tmhmm
Inputs : [[0, 'transdecoder_ch_tmhmm']]
Outputs : [[0, 'trinotate_ch_tmhmm']]
Emits : []


Name : rnammer_trinotate
Inputs : [[0, 'evigene_ch_rnammer']]
Outputs : [[0, 'trinotate_ch_rnammer']]
Emits : []


Name : skip_rnammer
Inputs : [[0, 'evigene_ch_rnammer']]
Outputs : [[0, 'trinotate_ch_rnammer']]
Emits : []


Name : trinotate
Inputs : [[0, 'trinotate_ch']]
Outputs : [[0, 'trinotate_summary'], [1, ''], [2, 'other_files'], [3, 'kegg_paths'], [4, 'trinotate_version'], [5, 'perl_version']]
Emits : []


Name : get_GO_comparison
Inputs : [[0, 'trinotate_out_ch']]
Outputs : [[0, 'go_fig'], [1, 'go_csv'], [2, 'r_version']]
Emits : []


Name : summary_custom_uniprot
Inputs : [[0, 'custom_uniprot_ch']]
Outputs : [[0, 'custom_uniprot_sum'], [1, 'custom_uniprot_fig'], [2, 'uniprot_csv']]
Emits : []


Name : get_kegg
Inputs : [[0, 'kegg_paths']]
Outputs : [[0, 'kegg_report']]
Emits : []


Name : skip_kegg
Inputs : [[0, 'kegg_paths']]
Outputs : [[0, 'kegg_report']]
Emits : []


Name : get_transcript_dist
Inputs : [[0, 'evi_dist']]
Outputs : [[0, 'size_dist'], [1, 'python_version']]
Emits : []


Name : summary_transdecoder_individual
Inputs : [[0, 'transdecoder_summary']]
Outputs : [[0, 'final_sum_3']]
Emits : []


Name : summary_trinotate_individual
Inputs : [[0, 'trinotate_summary']]
Outputs : [[0, 'final_sum_4']]
Emits : []


Name : update_host_ids
Inputs : [[0, 'host_sequences']]
Outputs : [[0, 'updated_host']]
Emits : []


Name : update_symbio_ids
Inputs : [[0, 'symbiont_sequences']]
Outputs : [[0, 'updated_symbiont']]
Emits : []


Name : concatenate_sets
Inputs : [[0, 'updated_host'], [1, 'updated_symbiont']]
Outputs : [[0, 'file_for_database']]
Emits : []


Name : create_diamond_db
Inputs : [[0, 'file_for_database']]
Outputs : [[0, 'diamond_db']]
Emits : []


Name : diamond_run
Inputs : [[0, 'transcriptome_sequences1'], [1, 'diamond_db']]
Outputs : [[0, 'diamond_output']]
Emits : []


Name : psytrans_run
Inputs : [[0, 'transcriptome_sequences2'], [1, 'updated_host'], [2, 'updated_symbiont'], [3, 'diamond_output']]
Outputs : [[0, 'psytrans'], [1, 'psytrans_version']]
Emits : []


Name : add_annotation_info
Inputs : [[0, 'assembly'], [0, 'annotation']]
Outputs : []
Emits : []


Name : get_report
Inputs : [[0, 'report_ch']]
Outputs : [[0, 'final_report']]
Emits : []


Name : get_run_info
Inputs : []
Outputs : [[0, 'run_info']]
Emits : []


