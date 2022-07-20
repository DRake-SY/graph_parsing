Name : log_inputs
Inputs : [[0, 'params']]
Outputs : []
Emits : []


Name : parse_sra_ids
Inputs : [[0, 'params']]
Outputs : [[0, 'sra_accessions']]
Emits : []


Name : download_sra_files
Inputs : [[0, 'sra_accessions']]
Outputs : [[0, 'sra_fastqs']]
Emits : []


Name : combine_reads
Inputs : [[0, 'sra_fastqs']]
Outputs : [[0, 'merged_fastq'], [0, 'merged_fastq_for_taxonomy_analysis'], [0, 'reads_for_refinement']]
Emits : []


Name : de_novo_assembly
Inputs : [[0, 'merged_fastq']]
Outputs : [[0, 'contigs_and_reads'], [1, 'contigs_for_identifying_viruses']]
Emits : []


Name : coverage
Inputs : [[0, 'contigs_and_reads']]
Outputs : [[0, 'contigs_with_coverage']]
Emits : []


Name : classify_contigs
Inputs : [[0, 'contigs_with_coverage']]
Outputs : [[0, 'classified_contigs']]
Emits : []


Name : taxonomy
Inputs : [[0, 'classified_contigs']]
Outputs : [[0, 'table_with_coverage_and_taxonomy']]
Emits : []


Name : classify_reads
Inputs : [[0, 'merged_fastq_for_taxonomy_analysis']]
Outputs : [[0, 'classified_reads']]
Emits : []


Name : visualize_reads
Inputs : [[0, 'classified_reads']]
Outputs : []
Emits : []


Name : identify_viral_assemblies
Inputs : [[0, 'table_with_coverage_and_taxonomy'], [1, 'contigs_for_identifying_viruses']]
Outputs : [[0, 'viruses_table'], [1, 'viral_assemblies']]
Emits : []


Name : refine_viral_assemblies
Inputs : [[0, 'viral_assemblies'], [1, 'reads_for_refinement']]
Outputs : [[1, 'pipeline_complete']]
Emits : []


Name : print_results
Inputs : [[0, 'viruses_table'], [1, 'pipeline_complete']]
Outputs : [[0, 'final_results']]
Emits : []


