Name : extract_ancestor_bed
Inputs : [[0, 'smallvcf_ancestor']]
Outputs : [[0, 'anncestor_bed']]
Emits : []


Name : annotate_small_vcf
Inputs : [[0, 'smallvcf_annotations'], [1, 'anncestor_bed']]
Outputs : [[0, 'annotated_vcf']]
Emits : []


Name : vcf_to_ped
Inputs : [[0, 'vcf_admix_plink']]
Outputs : [[0, 'plink_output'], [1, 'pruned_marker_set']]
Emits : []


Name : run_admixture
Inputs : [[0, 'admixture_genome']]
Outputs : [[0, 'admixture_output'], [1, 'admix_results']]
Emits : []


Name : concat_replicate_logs
Inputs : [[0, 'grouped_admix']]
Outputs : [[0, 'concatenated_logs']]
Emits : []


Name : concat_pop_logs
Inputs : [[0, 'concatenated_logs']]
Outputs : [[0, 'cv_summary'], [1, 'bestk']]
Emits : []


Name : run_admixture_besk_k
Inputs : [[0, 'rerun_admixture']]
Outputs : [[0, 'admixture_bestk'], [1, 'admixture_bestk_to_popgenome']]
Emits : []


Name : ibdseq_haplotype
Inputs : [[0, 'smallvcf_haplotype']]
Outputs : [[0, 'haplotype_analysis']]
Emits : []


Name : analyze_ibdseq
Inputs : [[0, 'haplotype_analysis']]
Outputs : [[1, 'plot_df']]
Emits : []


Name : plot_ibdseq
Inputs : [[0, 'plot_df']]
Outputs : []
Emits : []


Name : popgenome_whole_pop
Inputs : [[0, 'smallvcf_classic_popgen_window'], [1, 'contigs_popgenome_window']]
Outputs : [[0, 'popgenome_wholepop_statistics']]
Emits : []


Name : plot_popgenome_whole_pop
Inputs : [[0, 'popgenome_wholepop_statistics']]
Outputs : [[0, 'whole_genome_popgenome'], [1, 'whole_genome_popgenome_plots']]
Emits : []


Name : popgenome_gene_complete
Inputs : [[0, 'smallvcf_classic_popgen_gene'], [1, 'contigs_popgenome_gene']]
Outputs : [[0, 'fst_complete_gene_output']]
Emits : []


Name : popgenome_gene_kpop
Inputs : [[0, 'smallvcf_classic_popgen_gene_admix_pops'], [1, 'admixture_bestk_to_popgenome'], [2, 'contigs_popgenome_gene_subpops']]
Outputs : [[0, 'fst_pops_gene_output']]
Emits : []


Name : vcf_to_h21
Inputs : [[0, 'smallvcf_h21'], [1, 'contigs_h21']]
Outputs : [[0, 'h21_input']]
Emits : []


Name : vcf_to_eigstrat_files
Inputs : [[0, 'annotated_vcf_eigenstrat']]
Outputs : [[0, 'eigenstrat_input']]
Emits : []


Name : run_eigenstrat_no_outlier_removal
Inputs : [[0, 'eigenstrat_no_outlier'], [1, 'eigenstrat_noremoval']]
Outputs : [[0, 'eigenstrat_outlier_removal_output']]
Emits : []


Name : run_eigenstrat_with_outlier_removal
Inputs : [[0, 'eigenstrat_outlier_removal'], [1, 'eigenstrat_removal']]
Outputs : [[0, 'eigenstrat_no_outlier_removal_output']]
Emits : []


Name : prep_files_for_DAPC
Inputs : [[0, 'smallvcf_dapc']]
Outputs : [[0, 'dapc_input']]
Emits : []


