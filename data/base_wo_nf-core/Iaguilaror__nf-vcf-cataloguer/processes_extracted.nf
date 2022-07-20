Name : _pre1_custom_filter
Inputs : [[0, 'vcf_input'], [1, 'mkfiles_pre1']]
Outputs : [[0, 'results_pre1_custom_filter'], [0, 'also_results_pre1_custom_filter']]
Emits : []


Name : _pre2_separate_snv_indel
Inputs : [[0, 'results_pre1_custom_filter'], [1, 'mkfiles_pre2']]
Outputs : [[0, 'results_pre2_separate_snv_indel'], [0, 'also_results_pre2_separate_snv_indel'], [0, 'again_results_pre2_separate_snv_indel'], [0, 'more_results_pre2_separate_snv_indel mode flatten'], [1, 'pre2_results_for_001'], [1, 'pre2_results_for_002'], [1, 'pre2_results_for_003'], [1, 'pre2_results_for_004'], [1, 'pre2_results_for_005'], [1, 'pre2_results_for_006'], [1, 'pre2_results_for_007'], [1, 'pre2_results_for_008 mode flatten'], [2, 'pre2_results_for_pos1']]
Emits : []


Name : _pre3s1_separate_rare_low_common_freq
Inputs : [[0, 'results_pre2_separate_snv_indel'], [1, 'mkfiles_pre3s1']]
Outputs : [[0, 'pre3s1_results_for_001'], [0, 'pre3s1_results_for_002'], [0, 'pre3s1_results_for_003'], [0, 'pre3s1_results_for_004'], [0, 'pre3s1_results_for_005'], [0, 'pre3s1_results_for_006'], [0, 'pre3s1_results_for_007'], [0, 'pre3s1_results_for_008 mode flatten'], [1, 'pre3s1_results_for_pos1']]
Emits : []


Name : _pre3s2_separate_selection_signals
Inputs : [[0, 'also_results_pre2_separate_snv_indel'], [1, 'mkfiles_pre3s2']]
Outputs : [[0, 'pre3s2_results_for_001'], [0, 'pre3s2_results_for_002'], [0, 'pre3s2_results_for_003'], [0, 'pre3s2_results_for_004'], [0, 'pre3s2_results_for_005'], [0, 'pre3s2_results_for_006'], [0, 'pre3s2_results_for_007'], [0, 'pre3s2_results_for_008 mode flatten'], [1, 'pre3s2_results_for_pos1']]
Emits : []


Name : _pre3s3_separate_lowEAS_lowEUR
Inputs : [[0, 'again_results_pre2_separate_snv_indel'], [1, 'mkfiles_pre3s3']]
Outputs : [[0, 'pre3s3_results_for_001'], [0, 'pre3s3_results_for_002'], [0, 'pre3s3_results_for_003'], [0, 'pre3s3_results_for_004'], [0, 'pre3s3_results_for_005'], [0, 'pre3s3_results_for_006'], [0, 'pre3s3_results_for_007'], [0, 'pre3s3_results_for_008 mode flatten'], [1, 'pre3s3_results_for_pos1']]
Emits : []


Name : _pre3s4_separate_commonAMR_lowEUR
Inputs : [[0, 'more_results_pre2_separate_snv_indel'], [1, 'mkfiles_pre3s4']]
Outputs : [[0, 'pre3s4_results_for_001'], [0, 'pre3s4_results_for_002'], [0, 'pre3s4_results_for_003'], [0, 'pre3s4_results_for_004'], [0, 'pre3s4_results_for_005'], [0, 'pre3s4_results_for_006'], [0, 'pre3s4_results_for_007'], [0, 'pre3s4_results_for_008 mode flatten'], [1, 'pre3s4_results_for_pos1']]
Emits : []


Name : _001_get_clinvar_omim
Inputs : [[0, 'inputs_001'], [1, 'mkfiles_001']]
Outputs : [[0, 'results_001_get_clinvar_omim']]
Emits : []


Name : _002_get_GeneHancer
Inputs : [[0, 'inputs_002'], [1, 'mkfiles_002']]
Outputs : [[0, 'results_002_get_GeneHancer']]
Emits : []


Name : _003_get_GWASCatalog
Inputs : [[0, 'inputs_003'], [1, 'mkfiles_003']]
Outputs : [[0, 'results_003_get_GWASCatalog']]
Emits : []


Name : _004_get_miRNA
Inputs : [[0, 'inputs_004'], [1, 'mkfiles_004']]
Outputs : [[0, 'results_004_get_miRNA']]
Emits : []


Name : _005_get_novel_and_known
Inputs : [[0, 'inputs_005'], [1, 'mkfiles_005']]
Outputs : [[0, 'results_005_get_novel_and_known']]
Emits : []


Name : _006_get_coding
Inputs : [[0, 'inputs_006'], [1, 'mkfiles_006']]
Outputs : [[0, 'results_006_get_coding']]
Emits : []


Name : _007_get_PGKB
Inputs : [[0, 'inputs_007'], [1, 'mkfiles_007']]
Outputs : [[0, 'results_007_get_PGKB']]
Emits : []


Name : _008_get_utr
Inputs : [[0, 'inputs_008'], [1, 'mkfiles_008']]
Outputs : [[0, 'results_008_get_utr']]
Emits : []


Name : _pos1_vcf2tsv
Inputs : [[0, 'inputs_pos1'], [1, 'mkfiles_pos1']]
Outputs : [[0, 'results_pos1_vcf2tsv'], [0, 'also_results_pos1_vcf2tsv']]
Emits : []


Name : _pos2_count_variants
Inputs : [[0, 'inputs_pos2'], [1, 'mkfiles_pos2']]
Outputs : [[0, 'results_pos2_count_variants']]
Emits : []


Name : _pos4_organize_vcfs
Inputs : [[0, 'inputs_pos4']]
Outputs : []
Emits : []


Name : _pos5_QC_vep_consequence_plot
Inputs : [[0, 'also_results_pos1_vcf2tsv'], [1, 'mkfiles_pos5']]
Outputs : []
Emits : []


