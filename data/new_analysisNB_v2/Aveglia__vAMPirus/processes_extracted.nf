Name : Database_Check
Inputs : []
Outputs : []
Emits : []


Name : QualityCheck_1
Inputs : [[0, 'reads_qc_ch']]
Outputs : [[0, 'fastqc_results']]
Emits : []


Name : Adapter_Removal
Inputs : [[0, 'reads_ch']]
Outputs : [[0, 'fastp_results'], [1, 'reads_fastp_ch'], [2, '']]
Emits : []


Name : Primer_Removal
Inputs : [[0, 'reads_fastp_ch']]
Outputs : [[0, '']]
Emits : []


Name : QualityCheck_2
Inputs : [[0, 'readsforqc2']]
Outputs : [[0, 'fastqc2_results']]
Emits : []


Name : Read_Merging
Inputs : [[0, 'reads_bbduk_ch']]
Outputs : [[0, 'reads_vsearch1_ch'], [1, 'names'], [2, 'notmerged']]
Emits : []


Name : Filtering_Prep1
Inputs : [[0, 'reads_vsearch1_ch']]
Outputs : [[0, 'collect_samples_ch']]
Emits : []


Name : Filtering_Prep2
Inputs : [[0, 'names']]
Outputs : [[0, '']]
Emits : []


Name : Length_Filtering
Inputs : [[0, 'collect_samples_ch']]
Outputs : [[0, ''], [1, ''], [2, 'reads_vsearch2_ch'], [3, 'prefilt_basefreq'], [4, 'prefilt_qualityscore'], [5, 'prefilt_gccontent'], [6, 'prefilt_averagequality'], [7, 'prefilt_length'], [8, 'postFilt_basefreq'], [9, 'postFilt_qualityscore'], [10, 'postFilt_gccontent'], [11, 'postFilt_averagequality'], [12, 'postFilt_length'], [13, 'reads_per_sample_preFilt'], [14, 'reads_per_sample_postFilt']]
Emits : []


Name : Extracting_Uniques
Inputs : [[0, 'reads_vsearch2_ch']]
Outputs : [[0, 'reads_vsearch3_ch']]
Emits : []


Name : Identify_ASVs
Inputs : [[0, 'reads_vsearch3_ch']]
Outputs : [[0, 'reads_vsearch4_ch']]
Emits : []


Name : Chimera_Check
Inputs : [[0, 'reads_vsearch4_ch']]
Outputs : [[0, 'asvforfilt']]
Emits : []


Name : ASV_Filtering
Inputs : [[0, 'asvforfilt']]
Outputs : [[0, ''], [1, ''], [2, '']]
Emits : []


Name : NucleotideBased_ASV_clustering_DC
Inputs : [[0, 'reads_vsearch5_ch']]
Outputs : [[0, 'number_per_percent_nucl_plot'], [1, 'asvpdm']]
Emits : []


Name : Translation_For_ProteinBased_Clustering_DC
Inputs : [[0, 'nucl2aa']]
Outputs : [[0, 'clustering_aa'], [1, 'reportaa_VR'], [2, 'asvfastaforaaclust']]
Emits : []


Name : Protein_clustering_DC
Inputs : [[0, 'clustering_aa'], [1, 'asvfastaforaaclust']]
Outputs : [[0, 'number_per_percent_prot_plot'], [1, 'amino_med'], [2, 'aminopdm']]
Emits : []


Name : ASV_Shannon_Entropy_Analysis
Inputs : [[0, 'asv_med']]
Outputs : [[0, 'asv_entro_csv'], [1, 'asv_entropy'], [2, 'entrop']]
Emits : []


Name : AminoType_Shannon_Entropy_Analysis
Inputs : [[0, 'amino_med']]
Outputs : [[0, 'amino_entro_csv'], [1, 'amino_entropy'], [2, 'aminos']]
Emits : []


Name : combine_csv_DC
Inputs : [[0, 'fastp_csv_in1']]
Outputs : [[0, 'fastp_csv_dc']]
Emits : []


Name : skip_combine_csv_DC
Inputs : []
Outputs : [[0, 'fastp_csv_dc']]
Emits : []


Name : Report_DataCheck
Inputs : [[0, 'report_dc_in']]
Outputs : [[0, 'datacheckreport']]
Emits : []


Name : NucleotideBased_ASV_clustering
Inputs : [[0, '1'], [1, 'asv_file_for_ncasvs']]
Outputs : [[0, '']]
Emits : []


Name : ncASV_Taxonomy_Inference_NCBI
Inputs : [[0, 'nuclFastas_forDiamond_ncasv_ch']]
Outputs : [[0, 'tax_labeled_fasta_ncasv'], [1, 'summary_diamond_ncasv'], [2, 'taxplot_ncasv'], [3, 'tax_table_ncasv'], [4, 'tax_nodCol_ncasv']]
Emits : []


Name : ncASV_Taxonomy_Inference_RVDB
Inputs : [[0, 'nuclFastas_forDiamond_ncasv_ch']]
Outputs : [[0, 'tax_labeled_fasta_ncasv'], [1, 'summary_diamond_ncasv'], [2, 'taxplot_ncasv'], [3, 'tax_table_ncasv'], [4, 'tax_nodCol_ncasv']]
Emits : []


Name : skipncASVtaxonomy
Inputs : [[0, 'nuclFastas_forDiamond_ncasv_ch']]
Outputs : [[0, ''], [1, ''], [2, '']]
Emits : []


Name : Generate_ncASV_Counts_Table
Inputs : [[0, 'nuclFastas_forCounts_ncasv_ch'], [1, 'nuclCounts_mergedreads_ncasv_ch']]
Outputs : [[0, 'counts_vsearch_ncasv'], [1, 'notu_counts_plots']]
Emits : []


Name : Generate_ncASV_Matrices
Inputs : [[0, 'nuclFastas_forMatrix_ncasv_ch']]
Outputs : [[0, 'clustmatrices_ncasv'], [1, 'notu_heatmap']]
Emits : []


Name : ncASV_Phylogeny
Inputs : [[0, 'nuclFastas_forphylogeny_ncasv']]
Outputs : [[0, 'align_results_ncasv'], [1, 'nucl_phyl_plot_ncasv']]
Emits : []


Name : skipncASVphylogeny
Inputs : [[0, 'nuclFastas_forphylogeny_ncasv']]
Outputs : [[0, 'nucl_phyl_plot_ncasv']]
Emits : []


Name : ASV_Taxonomy_Inference_NCBI
Inputs : [[0, 'nuclFastas_forDiamond_asv_ch']]
Outputs : [[0, 'tax_labeled_fasta_asv'], [1, 'summary_diamond_asv'], [2, 'taxplot_asv'], [3, 'tax_table_asv'], [4, 'tax_nodCol_asv']]
Emits : []


Name : ASV_Taxonomy_Inference_RVDB
Inputs : [[0, 'nuclFastas_forDiamond_asv_ch']]
Outputs : [[0, 'tax_labeled_fasta_asv'], [1, 'summary_diamond_asv'], [2, 'taxplot_asv'], [3, 'tax_table_asv'], [4, 'tax_nodCol_asv']]
Emits : []


Name : Generate_ASV_Counts_Tables
Inputs : [[0, 'nuclFastas_forCounts_asv_ch'], [1, 'nuclCounts_mergedreads_asv_ch']]
Outputs : [[0, 'counts_vsearch_asv'], [1, '']]
Emits : []


Name : Generate_ASV_Matrices
Inputs : [[0, 'nuclFastas_forMatrix_asv_ch']]
Outputs : [[0, 'clustmatrices_asv'], [1, 'asv_heatmap']]
Emits : []


Name : ASV_Phylogeny
Inputs : [[0, 'nuclFastas_forphylogeny_asv']]
Outputs : [[0, 'align_results_asv'], [1, '']]
Emits : []


Name : ASV_PhyloClustering
Inputs : [[0, 'asv_treeclust'], [1, 'asvcount_phylogr']]
Outputs : [[0, 'asvtreeclustering_res'], [1, 'asv_phylogroupcsv'], [2, 'asv_phylogroupingcsv']]
Emits : []


Name : ASV_Minimum_Entropy_Decomposition
Inputs : [[0, 'asv_for_med']]
Outputs : [[0, 'asvgroupscsv'], [1, 'groupreps']]
Emits : []


Name : ASV_MED_Reps_phylogeny
Inputs : [[0, 'groupreps']]
Outputs : [[0, 'align_results_asvmed'], [1, 'asv_group_rep_tree']]
Emits : []


Name : Adding_ASV_MED_Info
Inputs : [[0, 'asvcount_med'], [1, 'asvgroupscsv']]
Outputs : [[0, 'asvgroupcounts']]
Emits : []


Name : Translate_For_AminoTyping
Inputs : [[0, 'asvsforAminotyping']]
Outputs : [[0, 'amintypegen'], [1, 'proteinstage_vap_report']]
Emits : []


Name : Generate_AminoTypes
Inputs : [[0, 'amintypegen'], [1, 'asvaminocheck']]
Outputs : [[0, ''], [1, ''], [2, 'aminomapmed']]
Emits : []


Name : Generate_AminoType_Matrices
Inputs : [[0, 'aminotypesClustal']]
Outputs : [[0, 'proclustmatrices'], [1, 'aminotype_heatmap']]
Emits : []


Name : AminoType_EMBOSS_Analyses
Inputs : [[0, 'aminotypesEmboss']]
Outputs : [[0, 'amino_emboss']]
Emits : []


Name : AminoType_Taxonomy_Inference_NCBI
Inputs : [[0, 'aminotypesBlast']]
Outputs : [[0, 'summary_AA_diamond'], [1, 'taxplot2'], [2, 'tax_labeled_fasta2'], [3, 'tax_table_amino'], [4, 'tax_nodCol_amino']]
Emits : []


Name : AminoType_Taxonomy_Inference_RVDB
Inputs : [[0, 'aminotypesBlast']]
Outputs : [[0, 'summary_AA_diamond'], [1, 'taxplot2'], [2, 'tax_labeled_fasta2'], [3, 'tax_table_amino'], [4, 'tax_nodCol_amino']]
Emits : []


Name : AminoType_Phylogeny
Inputs : [[0, 'aminotypesMafft']]
Outputs : [[0, 'alignprot_results'], [1, '']]
Emits : []


Name : Generate_AminoTypes_Counts_Table
Inputs : [[0, 'aminotypesCounts'], [1, 'mergeforprotcounts'], [2, 'samplelist']]
Outputs : [[0, 'counts_summary'], [1, '']]
Emits : []


Name : AminoType_PhyloClustering
Inputs : [[0, 'amino_treeclust'], [1, 'amino_countphylo']]
Outputs : [[0, 'aminotreeclustering_res'], [1, 'amino_phylogroupcsv'], [2, 'amino_phylogroupingcsv']]
Emits : []


Name : AminoType_Minimum_Entropy_Decomposition
Inputs : [[0, 'aminos_for_med']]
Outputs : [[0, 'atygroupscsv'], [1, 'atygroupreps']]
Emits : []


Name : AminoType_MED_Reps_phylogeny
Inputs : [[0, 'atygroupreps']]
Outputs : [[0, 'align_results_aminmed'], [1, 'amino_group_rep_tree']]
Emits : []


Name : Adding_AminoType_MED_Info
Inputs : [[0, 'aminocountmed'], [1, 'amino_repphy'], [2, 'atygroupscsv']]
Outputs : [[0, 'amino_groupcounts']]
Emits : []


Name : Translation_For_pcASV_Generation
Inputs : [[0, 'nucl2aa']]
Outputs : [[0, 'clustering_aa'], [1, 'reportaa_VR'], [2, 'asvfastaforaaclust']]
Emits : []


Name : Generate_pcASVs
Inputs : [[0, '1'], [1, 'clustering_aa'], [2, 'asvfastaforaaclust']]
Outputs : [[0, ''], [1, ''], [2, '']]
Emits : []


Name : pcASV_Nucleotide_Taxonomy_Inference_NCBI
Inputs : [[0, 'pcASV_ntDiamond_ch']]
Outputs : [[0, ''], [1, 'summary_AAdiamond'], [2, 'taxplot3'], [3, 'tax_table_pcasvnt'], [4, 'tax_nodCol_pcasvnt']]
Emits : []


Name : pcASV_Nucleotide_Taxonomy_Inference_RVDB
Inputs : [[0, 'pcASV_ntDiamond_ch']]
Outputs : [[0, ''], [1, 'summary_AAdiamond'], [2, 'taxplot3'], [3, 'tax_table_pcasvnt'], [4, 'tax_nodCol_pcasvnt']]
Emits : []


Name : skippcASVnuctaxonomy
Inputs : [[0, 'pcASV_ntDiamond_ch']]
Outputs : [[0, ''], [1, ''], [2, '']]
Emits : []


Name : Generate_Nucleotide_pcASV_Counts
Inputs : [[0, 'pcASV_nt_counts_ch'], [1, 'pcASV_mergedreads_ch']]
Outputs : [[0, 'pcASVcounts_vsearch'], [1, 'potu_Ncounts_for_report']]
Emits : []


Name : Generate_pcASV_Nucleotide_Matrix
Inputs : [[0, 'pcASV_ntmatrix_ch']]
Outputs : [[0, 'pcASVclustmatrices'], [1, 'potu_nucl_heatmap']]
Emits : []


Name : pcASV_Nucleotide_Phylogeny
Inputs : [[0, 'pcASV_ntmuscle_ch']]
Outputs : [[0, 'pcASV_nucleotide_phylogeny_results'], [1, 'potu_Ntree_plot']]
Emits : []


Name : skippcASVnucphylogeny
Inputs : [[0, 'pcASV_ntmuscle_ch']]
Outputs : [[0, '']]
Emits : []


Name : pcASV_AminoAcid_Matrix
Inputs : [[0, 'pcASV_aaMatrix_ch']]
Outputs : [[0, 'pcASVaaMatrix'], [1, 'potu_aa_heatmap']]
Emits : []


Name : pcASV_EMBOSS_Analyses
Inputs : [[0, 'pcASVEMBOSS']]
Outputs : [[0, 'pcASV_emboss']]
Emits : []


Name : pcASV_AminoAcid_Taxonomy_Inference_NCBI
Inputs : [[0, 'pcASV_aaDiamond_ch']]
Outputs : [[0, ''], [1, 'summary_potuaadiamond'], [2, 'taxplot4'], [3, 'tax_table_pcasvaa'], [4, 'tax_nodCol_pcasvaa']]
Emits : []


Name : pcASV_AminoAcid_Taxonomy_Inference_RVDB
Inputs : [[0, 'pcASV_aaDiamond_ch']]
Outputs : [[0, ''], [1, 'summary_potuaadiamond'], [2, 'taxplot4'], [3, 'tax_table_pcasvaa'], [4, 'tax_nodCol_pcasvaa']]
Emits : []


Name : skippcASVprotTaxonomy
Inputs : [[0, 'pcASV_aaDiamond_ch']]
Outputs : [[0, 'taxplot4'], [1, 'tax_table_pcasvaa'], [2, 'tax_nodCol_pcasvaa']]
Emits : []


Name : pcASV_Protein_Phylogeny
Inputs : [[0, 'pcASV_aaMafft_ch']]
Outputs : [[0, 'pcASV_protein_phylogeny_results'], [1, 'potu_Atree_plot']]
Emits : []


Name : skippcASVprotPhylogeny
Inputs : [[0, 'pcASV_aaMafft_ch']]
Outputs : [[0, '']]
Emits : []


Name : Generate_pcASV_Protein_Counts
Inputs : [[0, 'pcASV_aaCounts_ch'], [1, 'mergeforpcASVaacounts'], [2, 'samplistpotu']]
Outputs : [[0, 'potuaacounts_summary'], [1, 'potu_Acounts']]
Emits : []


Name : combine_csv
Inputs : [[0, 'fastp_csv_in2']]
Outputs : [[0, 'fastp_csv_in']]
Emits : []


Name : skip_combine_csv
Inputs : []
Outputs : [[0, 'fastp_csv_in']]
Emits : []


Name : Report
Inputs : [[0, 'fastp_csv_in'], [1, 'report_all_ch']]
Outputs : [[0, 'report_all_out']]
Emits : []


