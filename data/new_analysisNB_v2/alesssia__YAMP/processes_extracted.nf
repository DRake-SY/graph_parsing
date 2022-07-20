Name : get_software_versions
Inputs : []
Outputs : [[0, 'software_versions_yaml']]
Emits : []


Name : dedup
Inputs : [[0, 'read_files_dedup']]
Outputs : [[0, 'to_synthetic_contaminants'], [1, 'dedup_log']]
Emits : []


Name : remove_synthetic_contaminants
Inputs : [[0, 'artefacts'], [0, 'phix174ill'], [0, 'to_synthetic_contaminants']]
Outputs : [[0, 'to_trim'], [1, 'synthetic_contaminants_log']]
Emits : []


Name : trim
Inputs : [[0, 'adapters'], [0, 'to_trim']]
Outputs : [[0, 'to_decontaminate'], [1, 'trimming_log']]
Emits : []


Name : index_foreign_genome
Inputs : [[0, 'foreign_genome']]
Outputs : [[0, 'ref_foreign_genome']]
Emits : []


Name : decontaminate
Inputs : [[0, 'ref_foreign_genome'], [0, 'to_decontaminate']]
Outputs : [[0, 'qcd_reads'], [1, 'to_profile_taxa_decontaminated'], [2, 'to_profile_functions_decontaminated'], [3, 'decontaminate_log']]
Emits : []


Name : quality_assessment
Inputs : [[0, 'read_files_fastqc'], [0, 'qcd_reads']]
Outputs : [[0, 'fastqc_log']]
Emits : []


Name : merge_paired_end_cleaned
Inputs : [[0, 'reads_merge_paired_end_cleaned']]
Outputs : [[0, 'to_profile_taxa_merged'], [1, 'to_profile_functions_merged']]
Emits : []


Name : profile_taxa
Inputs : [[0, 'to_profile_taxa_decontaminated'], [0, 'to_profile_taxa_merged'], [0, 'reads_profile_taxa'], [1, 'bowtie2_metaphlan_databases']]
Outputs : [[0, 'to_alpha_diversity'], [1, 'to_profile_function_bugs'], [2, 'profile_taxa_log']]
Emits : []


Name : profile_function
Inputs : [[0, 'to_profile_functions_decontaminated'], [0, 'to_profile_functions_merged'], [0, 'reads_profile_functions'], [1, 'to_profile_function_bugs'], [2, 'chocophlan_databases'], [3, 'uniref_databases']]
Outputs : [[4, 'profile_functions_log']]
Emits : []


Name : alpha_diversity
Inputs : [[0, 'to_alpha_diversity']]
Outputs : [[1, 'alpha_diversity_log']]
Emits : []


Name : log
Inputs : [[0, 'multiqc_config'], [1, 'summary'], [2, 'software_versions_yaml'], [3, 'fastqc_log'], [4, 'dedup_log'], [5, 'synthetic_contaminants_log'], [6, 'trimming_log'], [7, 'index_foreign_genome_log'], [8, 'decontaminate_log'], [9, 'merge_paired_end_cleaned_log'], [10, 'profile_taxa_log'], [11, 'profile_functions_log'], [12, 'alpha_diversity_log']]
Outputs : [[0, 'multiqc_report']]
Emits : []


