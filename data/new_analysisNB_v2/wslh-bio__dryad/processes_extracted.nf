Name : preProcess
Inputs : [[0, 'raw_reads']]
Outputs : [[0, 'read_files_fastqc'], [0, 'read_files_trimming'], [0, 'read_files_kraken']]
Emits : []


Name : clean_reads
Inputs : [[0, 'read_files_trimming']]
Outputs : [[0, 'cleaned_reads_shovill'], [0, 'cleaned_reads_fastqc'], [0, 'cleaned_reads_mapping'], [0, 'cleaned_reads_kraken'], [1, 'cleaned_reads_snp'], [2, 'phix_cleanning_stats'], [3, 'adapter_cleanning_stats'], [4, 'multiqc_clean_reads'], [5, 'bbduk_files']]
Emits : []


Name : bbduk_summary
Inputs : [[0, 'bbduk_files']]
Outputs : [[0, 'bbduk_tsv']]
Emits : []


Name : fastqc
Inputs : [[0, 'combined_reads']]
Outputs : [[0, 'fastqc_results'], [0, 'fastqc_multiqc']]
Emits : []


Name : fastqc_summary
Inputs : [[0, 'fastqc_results']]
Outputs : [[0, 'fastqc_summary']]
Emits : []


Name : kraken
Inputs : [[0, 'cleaned_reads_kraken']]
Outputs : [[0, 'kraken_files'], [0, 'kraken_multiqc'], [1, 'kraken_version']]
Emits : []


Name : kraken_summary
Inputs : [[0, 'kraken_files']]
Outputs : [[0, 'kraken_tsv'], [1, 'kraken_prokka']]
Emits : []


Name : shovill
Inputs : [[0, 'cleaned_reads_shovill']]
Outputs : [[0, 'assembled_genomes_quality'], [0, 'assembled_genomes_prokka'], [1, 'assembly_sams']]
Emits : []


Name : quast
Inputs : [[0, 'assembled_genomes_quality']]
Outputs : [[0, 'quast_files'], [1, 'quast_multiqc']]
Emits : []


Name : quast_summary
Inputs : [[0, 'quast_files']]
Outputs : [[0, 'quast_tsv']]
Emits : []


Name : prokka_setup
Inputs : [[0, 'kraken_prokka'], [1, 'assembled_genomes_prokka']]
Outputs : [[0, 'prokka_input']]
Emits : []


Name : prokka
Inputs : [[0, 'prokka_input']]
Outputs : [[0, 'annotated_genomes'], [1, 'prokka_multiqc']]
Emits : []


Name : roary
Inputs : [[0, 'annotated_genomes']]
Outputs : [[0, 'core_aligned_genomes'], [1, 'core_aligned_stats']]
Emits : []


Name : cg_tree
Inputs : [[0, 'core_aligned_genomes']]
Outputs : [[0, 'cgtree']]
Emits : []


Name : cfsan
Inputs : [[0, 'cleaned_reads_snp'], [1, 'snp_reference'], [2, 'snp_config']]
Outputs : [[0, 'snp_mat'], [1, 'snp_alignment']]
Emits : []


Name : snp_tree
Inputs : [[0, 'snp_alignment']]
Outputs : []
Emits : []


Name : bwa
Inputs : [[0, 'mapping_reference'], [1, 'cleaned_reads_mapping']]
Outputs : [[0, 'reference_sams']]
Emits : []


Name : samtools
Inputs : [[0, 'sam_files']]
Outputs : [[0, 'reference_depth_results'], [0, 'assembly_depth_results'], [1, 'reference_mapped_results'], [1, 'assembly_mapped_results']]
Emits : []


Name : assembly_coverage_stats
Inputs : [[0, 'assembly_depth_results'], [1, 'assembly_mapped_results']]
Outputs : [[0, 'assembly_mapping_tsv']]
Emits : []


Name : reference_mapping_stats
Inputs : [[0, 'reference_depth_results'], [1, 'reference_mapped_results']]
Outputs : [[0, 'reference_mapping_tsv']]
Emits : []


Name : merge_results
Inputs : [[0, 'bbduk_tsv'], [1, 'quast_tsv'], [2, 'assembly_mapping_tsv'], [3, 'kraken_tsv'], [4, 'kraken_version'], [5, 'reference_mapping_tsv']]
Outputs : []
Emits : []


Name : multiqc
Inputs : [[0, 'multiqc_clean_reads'], [1, 'fastqc_multiqc'], [2, 'kraken_multiqc'], [3, 'quast_multiqc'], [4, 'prokka_multiqc'], [5, 'logo'], [6, 'multiqc_config']]
Outputs : [[0, 'multiqc_output']]
Emits : []


