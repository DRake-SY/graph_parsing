OPERATION_1 string : K = Channel.from(2..params.admix_k)
OPERATION_1 origin : [['2..params.admix_k', 'V']]
OPERATION_1 gives  : [['K', 'P']]


OPERATION_2 string : ld_range = Channel.from(params.admix_ld)
OPERATION_2 origin : [['params.admix_ld', 'V']]
OPERATION_2 gives  : [['ld_range', 'P']]


OPERATION_3 string : Channel.from(CONTIG_LIST)
       .into{contigs_popgenome_window;
             contigs_popgenome_gene;
             contigs_h21;
             contigs_raisd;
             contigs_popgenome_gene_subpops;
             contigs_other1;
             contigs_other2}
OPERATION_3 origin : [['CONTIG_LIST', 'V']]
OPERATION_3 gives  : [['contigs_popgenome_window', 'P'], ['contigs_popgenome_gene', 'P'], ['contigs_h21', 'P'], ['contigs_raisd', 'P'], ['contigs_popgenome_gene_subpops', 'P'], ['contigs_other1', 'P'], ['contigs_other2', 'P']]


OPERATION_4 string : pop_strains = Channel.from(pop_file.collect { it.tokenize( ' ' ) })
             .map { POP, MAF, SM -> [POP, MAF, SM] }
OPERATION_4 origin : []
OPERATION_4 gives  : [['pop_strains', 'P']]


OPERATION_5 string : small_vcf = Channel.fromPath(params.snv_vcf)
OPERATION_5 origin : [['params.snv_vcf', 'A']]
OPERATION_5 gives  : [['small_vcf', 'P']]


OPERATION_6 string : small_index = Channel.fromPath("${params.snv_vcf}" + ".tbi")
OPERATION_6 origin : [['"${params.snv_vcf}" + ".tbi"', 'A']]
OPERATION_6 gives  : [['small_index', 'P']]


OPERATION_7 string : eigenstrat_noremoval = Channel.fromPath(params.eigen_par_no_removal)
OPERATION_7 origin : [['params.eigen_par_no_removal', 'A']]
OPERATION_7 gives  : [['eigenstrat_noremoval', 'P']]


OPERATION_8 string : eigenstrat_removal = Channel.fromPath(params.eigen_par_outlier_removal)
OPERATION_8 origin : [['params.eigen_par_outlier_removal', 'A']]
OPERATION_8 gives  : [['eigenstrat_removal', 'P']]


OPERATION_9 string : Channel.from( 1000..2000 )
       .randomSample( 10, 234 )
       .into{ rseed_find_best_k;
              rseed_run_best_k}
OPERATION_9 origin : [['1000..2000', 'V']]
OPERATION_9 gives  : [['rseed_find_best_k', 'P'], ['rseed_run_best_k', 'P']]


OPERATION_10 string : Channel.from( 3,4,5,6,7,8 )
       .spread(dapc_input)
       .into{dapc_pop_input}
OPERATION_10 origin : [['dapc_input', 'V'], ['3,4,5,6,7,8', 'V']]
OPERATION_10 gives  : [['dapc_pop_input', 'P']]


OPERATION_11 string : pop_strains
  .combine(ld_range)
  .into{subset_vcf_input;
        plink_input; 
        print_plink_input }
OPERATION_11 origin : [['pop_strains', 'P'], ['ld_range', 'P']]
OPERATION_11 gives  : [['subset_vcf_input', 'P'], ['plink_input', 'P'], ['print_plink_input', 'P']]


OPERATION_12 string : small_vcf
  .spread(small_index)
  .into { smallvcf_ancestor;;
          smallvcf_annotations;
          }
OPERATION_12 origin : [['small_vcf', 'P'], ['small_index', 'V']]
OPERATION_12 gives  : []


OPERATION_13 string : annotated_vcf
  .into { annotated_vcf_haplotype;
          annotated_vcf_popgen;
          annotated_vcf_eigenstrat;
          smallvcf_admixture;
          smallvcf_phylo;
          smallvcf_haplotype;
          smallvcf_recombination;
          smallvcf_classic_popgen_window;
          smallvcf_classic_popgen_gene;
          smallvcf_classic_popgen_gene_admix_pops;
          smallvcf_haplotype_popgen;
          smallvcf_popstructure;
          smallvcf_eigenstrat;
          smallvcf_dapc;
          smallvcf_h21;
          smallvcf_raisd;
          smallvcf_other}
OPERATION_13 origin : [['annotated_vcf', 'P']]
OPERATION_13 gives  : [['annotated_vcf_haplotype', 'P'], ['annotated_vcf_popgen', 'P'], ['annotated_vcf_eigenstrat', 'P'], ['smallvcf_admixture', 'P'], ['smallvcf_phylo', 'P'], ['smallvcf_haplotype', 'P'], ['smallvcf_recombination', 'P'], ['smallvcf_classic_popgen_window', 'P'], ['smallvcf_classic_popgen_gene', 'P'], ['smallvcf_classic_popgen_gene_admix_pops', 'P'], ['smallvcf_haplotype_popgen', 'P'], ['smallvcf_popstructure', 'P'], ['smallvcf_eigenstrat', 'P'], ['smallvcf_dapc', 'P'], ['smallvcf_h21', 'P'], ['smallvcf_raisd', 'P'], ['smallvcf_other', 'P']]


OPERATION_14 string : smallvcf_admixture
  .spread(subset_vcf_input)
  .into { vcf_admix_plink;
          vcf_admix_print }
OPERATION_14 origin : [['smallvcf_admixture', 'P'], ['subset_vcf_input', 'V']]
OPERATION_14 gives  : [['vcf_admix_plink', 'P'], ['vcf_admix_print', 'P']]


OPERATION_15 string : plink_output
  .into{ admixture_find_best_k;
         admixture_run_best_k}
OPERATION_15 origin : [['plink_output', 'P']]
OPERATION_15 gives  : [['admixture_find_best_k', 'P'], ['admixture_run_best_k', 'P']]


OPERATION_16 string : K
  .spread(rseed_find_best_k)
  .spread(admixture_find_best_k)
  .into{ admixture_genome;
         admixture_regions}
OPERATION_16 origin : [['K', 'P'], ['rseed_find_best_k)\n  .spread(admixture_find_best_k', 'V']]
OPERATION_16 gives  : [['admixture_genome', 'P'], ['admixture_regions', 'P']]


OPERATION_17 string : admix_results
  .groupTuple()
  .into{ grouped_admix;
         grouped_print}
OPERATION_17 origin : [['admix_results', 'P']]
OPERATION_17 gives  : [['grouped_admix', 'P'], ['grouped_print', 'P']]


OPERATION_18 string : bestk
  .splitText()
  .set{k_range}
OPERATION_18 origin : [['bestk', 'P']]
OPERATION_18 gives  : [['k_range', 'P']]


OPERATION_19 string : admixture_run_best_k
  .spread(k_range)
  .into{ rerun_admixture;
         rerun_admixture_extra}
OPERATION_19 origin : [['admixture_run_best_k', 'P'], ['k_range', 'V']]
OPERATION_19 gives  : [['rerun_admixture', 'P'], ['rerun_admixture_extra', 'P']]


OPERATION_20 string : eigenstrat_input
  .into{eigenstrat_no_outlier;
        eigenstrat_outlier_removal;
        eigenstrat_fst}
OPERATION_20 origin : [['eigenstrat_input', 'P']]
OPERATION_20 gives  : [['eigenstrat_no_outlier', 'P'], ['eigenstrat_outlier_removal', 'P'], ['eigenstrat_fst', 'P']]


