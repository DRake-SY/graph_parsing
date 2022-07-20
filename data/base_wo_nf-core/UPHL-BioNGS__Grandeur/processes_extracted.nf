Name : seqyclean
Inputs : [[0, 'reads_seqyclean']]
Outputs : [[0, 'clean_reads_mash'], [0, 'clean_reads_cg'], [0, 'clean_reads_seqsero2'], [0, 'clean_reads_bwa'], [0, 'clean_reads_shigatyper'], [0, 'clean_reads_kraken2'], [0, 'clean_reads_spades'], [2, 'seqyclean_files'], [2, 'seqyclean_files_combine'], [5, 'seqyclean_perc_kept_results'], [6, 'seqyclean_pairskept_results']]
Emits : []


Name : spades
Inputs : [[0, 'clean_reads_spades']]
Outputs : [[1, 'contigs_prokka'], [1, 'contigs_quast'], [1, 'contigs_blastn'], [1, 'contigs_mlst'], [1, 'contigs_bwa'], [1, 'contigs_create'], [1, 'contigs_kleborate'], [1, 'contigs_amrfinder'], [1, 'contigs_serotypefinder']]
Emits : []


Name : fastqc
Inputs : [[0, 'reads_fastqc']]
Outputs : [[1, 'fastqc_files'], [2, 'fastqc_1_results'], [3, 'fastqc_2_results']]
Emits : []


Name : mash_sketch
Inputs : [[0, 'clean_reads_mash']]
Outputs : [[0, 'mash_sketch_files'], [2, 'mash_genome_size_results'], [2, 'mash_genome_size_gc'], [3, 'mash_coverage_results']]
Emits : []


Name : mash_dist
Inputs : [[0, 'mash_sketch_files'], [0, 'fastas_mash']]
Outputs : [[0, 'sample'], [1, 'mash_genus_results'], [1, 'mash_genus_prokka'], [1, 'mash_genus_gc'], [1, 'mash_genus_amrfinder'], [2, 'mash_species_results'], [2, 'mash_species_prokka'], [2, 'mash_species_gc'], [2, 'mash_species_amrfinder'], [3, 'mash_full_results'], [4, 'mash_pvalue_results'], [5, 'mash_distance_results'], [6, 'salmonella_flag'], [7, 'ecoli_flag'], [7, 'shigella_flag'], [8, 'klebsiella_flag']]
Emits : []


Name : prokka
Inputs : [[0, 'contigs_prokka'], [0, 'fastas_prokka']]
Outputs : [[1, 'prokka_files'], [2, 'gffs']]
Emits : []


Name : quast
Inputs : [[0, 'contigs_quast'], [0, 'fastas_quast']]
Outputs : [[1, 'quast_files'], [2, 'quast_files_combine'], [3, 'quast_gc_results'], [4, 'quast_contigs_results'], [5, 'quast_N50_contigs_results'], [6, 'quast_length_results']]
Emits : []


Name : shuffle
Inputs : [[0, 'clean_reads_cg']]
Outputs : [[0, 'shuffled_files']]
Emits : []


Name : cg_pipeline
Inputs : [[0, 'for_gc']]
Outputs : [[0, 'cg_pipeline_files'], [1, 'cg_avrl_results'], [2, 'cg_quality_results'], [3, 'cg_cov_results'], [4, 'ref_genome_length']]
Emits : []


Name : seqsero2
Inputs : [[0, 'clean_reads_seqsero2'], [0, 'fastas_seqsero2']]
Outputs : [[0, 'seqsero2_profile_results'], [1, 'seqsero2_serotype_results'], [2, 'seqsero2_contamination_results'], [4, 'seqsero2_files']]
Emits : []


Name : shigatyper
Inputs : [[0, 'clean_reads_shigatyper']]
Outputs : [[1, 'shigatyper_predictions'], [2, 'shigatyper_cadA']]
Emits : []


Name : kleborate
Inputs : [[0, 'contigs_kleborate'], [0, 'fastas_kleborate']]
Outputs : [[0, 'kleborate_score'], [1, 'kleborate_mlst'], [2, 'kleborate_files']]
Emits : []


Name : serotypefinder
Inputs : [[0, 'contigs_serotypefinder'], [0, 'fastas_serotypefinder']]
Outputs : [[1, 'serotypefinder_results_o'], [2, 'serotypefinder_results_h']]
Emits : []


Name : amrfinderplus
Inputs : [[0, 'contigs_amrfinder'], [0, 'fastas_amrfinder']]
Outputs : [[0, 'amrfinder_files'], [1, 'amr_genes'], [2, 'virulence_genes']]
Emits : []


Name : kraken2
Inputs : [[0, 'clean_reads_kraken2'], [0, 'local_kraken2'], [0, 'fastas_kraken2']]
Outputs : [[0, 'kraken2_files'], [2, 'kraken2_top_hit'], [3, 'kraken2_top_perc'], [4, 'kraken2_top_reads']]
Emits : []


Name : blastn
Inputs : [[0, 'contigs_blastn'], [0, 'local_blastdb']]
Outputs : [[0, 'blastn_files']]
Emits : []


Name : bwa
Inputs : [[0, 'clean_reads_bwa']]
Outputs : [[0, 'sam_files']]
Emits : []


Name : sort
Inputs : [[0, 'sam_files']]
Outputs : [[0, 'bam_files']]
Emits : []


Name : create
Inputs : [[0, 'contigs_create']]
Outputs : [[0, 'create_files_view'], [0, 'create_files_plot']]
Emits : []


Name : view
Inputs : [[0, 'create_files_view']]
Outputs : [[0, 'view_files']]
Emits : []


Name : blobtools
Inputs : [[0, 'create_files_plot']]
Outputs : [[1, 'blobtools_species_results'], [2, 'blobtools_perc_results']]
Emits : []


Name : mlst
Inputs : [[0, 'contigs_mlst'], [0, 'fastas_mlst']]
Outputs : [[0, 'mlst_files'], [1, 'mlst_results']]
Emits : []


Name : summary
Inputs : [[0, 'results']]
Outputs : [[0, 'summary_files_txt'], [1, 'summary_files_tsv']]
Emits : []


Name : multiqc
Inputs : [[0, 'fastqc_files'], [1, 'quast_files'], [2, 'seqyclean_files'], [3, 'kraken2_files'], [4, 'prokka_files']]
Outputs : []
Emits : []


Name : roary
Inputs : [[0, 'gffs'], [0, 'local_gffs']]
Outputs : [[2, 'roary_core_genome_iqtree'], [2, 'roary_core_genome_snp_dists']]
Emits : []


Name : iqtree2
Inputs : [[0, 'roary_core_genome_iqtree']]
Outputs : [[1, 'treefile']]
Emits : []


Name : snp_dists
Inputs : [[0, 'roary_core_genome_snp_dists']]
Outputs : []
Emits : []


