Name : get_software_versions
Inputs : []
Outputs : [[0, 'software_versions_yaml']]
Emits : []


Name : fastqc
Inputs : [[0, 'short_reads_qc']]
Outputs : [[0, 'fastqc_results']]
Emits : []


Name : nanoqc
Inputs : [[0, 'long_reads_qc']]
Outputs : [[0, 'nanoqc_results']]
Emits : []


Name : spades
Inputs : [[0, 'fasta'], [1, 'short_reads_assembly'], [2, 'long_reads_assembly']]
Outputs : [[0, 'assembly_results_scaffolds'], [1, 'assembly_results_contigs'], [2, 'spades_results']]
Emits : []


Name : quast_spades
Inputs : [[0, 'assembly_results_scaffolds'], [1, 'assembly_results_contigs']]
Outputs : [[0, 'quast_results']]
Emits : []


Name : canu
Inputs : [[0, 'long_reads_assembly']]
Outputs : [[0, 'assembly_result_canu'], [1, 'canu_results']]
Emits : []


Name : minimap
Inputs : [[0, 'assembly_mapping'], [1, 'short_reads_assembly']]
Outputs : [[0, 'minimap_alignment_results'], [1, 'short_reads_mapped_bam']]
Emits : []


Name : pilon
Inputs : [[0, 'short_reads_mapped_bam'], [1, 'assembly_pilon']]
Outputs : [[0, 'assembly_results_scaffolds']]
Emits : []


Name : quast_canu
Inputs : [[0, 'assembly_results_scaffolds']]
Outputs : [[0, 'quast_results']]
Emits : []


Name : masurca
Inputs : [[0, 'fasta'], [1, 'short_reads_assembly'], [2, 'long_reads_assembly']]
Outputs : [[0, 'masurca_config_file'], [1, 'assembly_results_scaffolds']]
Emits : []


Name : quast_masurca
Inputs : [[0, 'assembly_results_scaffolds']]
Outputs : [[0, 'quast_results']]
Emits : []


Name : multiqc
Inputs : [[0, 'multiqc_config'], [1, 'fastqc_results'], [2, 'software_versions_yaml'], [3, 'quast_results']]
Outputs : [[0, 'multiqc_report']]
Emits : []


