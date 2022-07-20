Name : _pre1_filter_vcf
Inputs : [[0, 'vcf_inputs'], [1, 'mkfiles_pre1']]
Outputs : [[0, 'results_pre1_filter_vcf']]
Emits : []


Name : _pre2_extract_chromosomes
Inputs : [[0, 'results_pre1_filter_vcf'], [1, 'mkfiles_pre2']]
Outputs : [[0, 'results_pre2_extract_chromosomes']]
Emits : []


Name : _pre3_split_chromosomes
Inputs : [[0, 'results_pre2_extract_chromosomes'], [1, 'mkfiles_pre3']]
Outputs : [[0, 'results_pre3_split_chromosomes']]
Emits : []


Name : _001_untangle_multiallelic
Inputs : [[0, 'results_pre3_split_chromosomes'], [1, 'mkfiles_001']]
Outputs : [[0, 'results_001_untangle_multiallelic']]
Emits : []


Name : _002_annotate_rsID
Inputs : [[0, 'results_001_untangle_multiallelic'], [1, 'reference_dbSNP'], [2, 'mkfiles_002']]
Outputs : [[0, 'results_002_annotate_rsID']]
Emits : []


Name : _003_vep_extended
Inputs : [[0, 'results_002_annotate_rsID'], [1, 'references_for_VEP'], [2, 'mkfiles_003']]
Outputs : [[0, 'results_003_vep_extended']]
Emits : []


Name : _pos1_rejoin_chromosomes
Inputs : [[0, 'inputs_for_003'], [1, 'mkfiles_pos1']]
Outputs : [[0, '_pos1_rejoin_chromosomes']]
Emits : []


