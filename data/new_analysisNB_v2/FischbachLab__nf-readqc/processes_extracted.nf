Name : concatenate
Inputs : [[0, 'reads_concat']]
Outputs : [[0, 'concat_fq']]
Emits : []


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
Inputs : [[0, 'foreign_genome_ch']]
Outputs : [[0, 'ref_foreign_genome']]
Emits : []


Name : decontaminate
Inputs : [[0, 'ref_foreign_genome'], [0, 'to_decontaminate']]
Outputs : [[0, 'qcd_reads'], [1, 'decontaminate_log']]
Emits : []


Name : quality_assessment
Inputs : [[0, 'read_files_fastqc'], [0, 'qcd_reads']]
Outputs : [[0, 'fastqc_log']]
Emits : []


Name : log
Inputs : [[0, 'multiqc_config'], [1, 'summary'], [2, 'software_versions_yaml'], [3, 'fastqc_log'], [4, 'dedup_log'], [5, 'synthetic_contaminants_log'], [6, 'trimming_log'], [7, 'index_foreign_genome_log'], [8, 'decontaminate_log']]
Outputs : [[0, 'multiqc_report']]
Emits : []


