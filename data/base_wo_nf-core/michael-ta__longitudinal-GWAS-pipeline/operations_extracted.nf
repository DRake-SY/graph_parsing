OPERATION_1 string : vfiles = Channel
              .fromPath(params.input_vcf)
              .map { file -> tuple( file.getName(), file.size(), file) }
OPERATION_1 origin : [['params.input_vcf', 'A']]
OPERATION_1 gives  : [['vfiles', 'P']]


OPERATION_2 string : mergelist_file = mergelist_shred
  .collectFile() { plink_prefix -> 
    [ "gwas_mergelist.txt", plink_prefix + '\n' ] 
  }
OPERATION_2 origin : [['mergelist_shred', 'P']]
OPERATION_2 gives  : [['mergelist_file', 'P']]


OPERATION_3 string : p1_out_pgen
  .into { p2_in_pgen; p3_in_pgen }
OPERATION_3 origin : [['p1_out_pgen', 'P']]
OPERATION_3 gives  : [['p2_in_pgen', 'P'], ['p3_in_pgen', 'P']]


OPERATION_4 string : p1_out_pvar
  .into { p2_in_pvar; p3_in_pvar }
OPERATION_4 origin : [['p1_out_pvar', 'P']]
OPERATION_4 gives  : [['p2_in_pvar', 'P'], ['p3_in_pvar', 'P']]


OPERATION_5 string : p1_out_psam
  .into { p2_in_psam; p3_in_psam }
OPERATION_5 origin : [['p1_out_psam', 'P']]
OPERATION_5 gives  : [['p2_in_psam', 'P'], ['p3_in_psam', 'P']]


OPERATION_6 string : p3_in_pgen
  .map { file ->
    tuple(file.getName().replaceFirst(/.pgen/, ""), file)
  }
  .set { p3_in_pgen_new }
OPERATION_6 origin : [['p3_in_pgen', 'P']]
OPERATION_6 gives  : [['p3_in_pgen_new', 'P']]


OPERATION_7 string : p3_in_pvar
  .map { file ->
    tuple(file.getName().replaceFirst(/.pvar/, ""), file)
  }
  .set { p3_in_pvar_new }
OPERATION_7 origin : [['p3_in_pvar', 'P']]
OPERATION_7 gives  : [['p3_in_pvar_new', 'P']]


OPERATION_8 string : p3_in_psam
  .map { file ->
    tuple(file.getName().replaceFirst(/.psam/, ""), file)
  }
  .set { p3_in_psam_new }
OPERATION_8 origin : [['p3_in_psam', 'P']]
OPERATION_8 gives  : [['p3_in_psam_new', 'P']]


OPERATION_9 string : p3_in_pgen_new
  .join(p3_in_pvar_new)
  .join(p3_in_psam_new)
  .set { p3_in_files }
OPERATION_9 origin : [['p3_in_pgen_new', 'P'], ['p3_in_pvar_new', 'P'], ['p3_in_psam_new', 'P']]
OPERATION_9 gives  : [['p3_in_files', 'P']]


OPERATION_10 string : p3_in_files
  .into { p3_in_files_gallop; p3_in_files_plink }
OPERATION_10 origin : [['p3_in_files', 'P']]
OPERATION_10 gives  : [['p3_in_files_gallop', 'P'], ['p3_in_files_plink', 'P']]


OPERATION_11 string : p2_in_plink2
  .into { p2_qcin_plink2; p3_pcain_plink2 }
OPERATION_11 origin : [['p2_in_plink2', 'P']]
OPERATION_11 gives  : [['p2_qcin_plink2', 'P'], ['p3_pcain_plink2', 'P']]


OPERATION_12 string : gwas_samplelist_pca
  .into { gwas_samplelist_plink; gwas_samplelist_gallop }
OPERATION_12 origin : [['gwas_samplelist_pca', 'P']]
OPERATION_12 gives  : [['gwas_samplelist_plink', 'P'], ['gwas_samplelist_gallop', 'P']]


