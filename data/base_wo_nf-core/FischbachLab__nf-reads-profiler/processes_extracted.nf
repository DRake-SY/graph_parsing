Name : get_software_versions
Inputs : []
Outputs : [[0, 'software_versions_yaml']]
Emits : []


Name : merge_paired_end_cleaned
Inputs : [[0, 'reads_merge_paired_end_cleaned']]
Outputs : [[0, 'to_profile_taxa_merged'], [1, 'to_profile_functions_merged']]
Emits : []


Name : profile_taxa
Inputs : [[0, 'to_profile_taxa'], [0, 'to_profile_taxa_merged']]
Outputs : [[0, 'to_alpha_diversity'], [1, 'to_profile_function_bugs'], [2, 'profile_taxa_log']]
Emits : []


Name : profile_function
Inputs : [[0, 'to_profile_functions'], [0, 'to_profile_functions_merged'], [1, 'to_profile_function_bugs'], [1, 'custom_taxa_profile']]
Outputs : [[4, 'profile_functions_log']]
Emits : []


Name : alpha_diversity
Inputs : [[0, 'to_alpha_diversity']]
Outputs : [[1, 'alpha_diversity_log']]
Emits : []


Name : log
Inputs : [[0, 'multiqc_config_ch'], [1, 'summary'], [2, 'software_versions_yaml'], [3, 'merge_paired_end_cleaned_log'], [4, 'profile_taxa_log'], [5, 'profile_functions_log'], [6, 'alpha_diversity_log']]
Outputs : [[0, 'multiqc_report']]
Emits : []


