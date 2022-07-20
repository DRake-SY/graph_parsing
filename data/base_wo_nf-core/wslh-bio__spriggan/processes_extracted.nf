Name : preProcess
Inputs : [[0, 'raw_reads']]
Outputs : [[0, 'read_files_fastqc'], [0, 'read_files_trimming']]
Emits : []


Name : clean_reads
Inputs : [[0, 'read_files_trimming']]
Outputs : [[0, 'cleaned_reads_shovill'], [0, 'cleaned_reads_fastqc'], [0, 'read_files_kraken'], [1, 'phix_cleanning_stats'], [2, 'adapter_cleanning_stats'], [3, 'bbduk_files'], [4, 'multiqc_clean_reads']]
Emits : []


Name : fastqc
Inputs : [[0, 'combined_reads']]
Outputs : [[0, 'fastqc_results'], [0, 'fastqc_multiqc']]
Emits : []


Name : fastqc_summary
Inputs : [[0, 'fastqc_results']]
Outputs : [[0, 'fastqc_summary']]
Emits : []


Name : shovill
Inputs : [[0, 'cleaned_reads_shovill']]
Outputs : [[0, 'assembled_genomes_quality'], [0, 'assembled_genomes_ar'], [0, 'assembled_genomes_mlst'], [1, 'sam_files']]
Emits : []


Name : samtools
Inputs : [[0, 'sam_files']]
Outputs : [[0, 'cov_files'], [1, 'stats_multiqc']]
Emits : []


Name : coverage_stats
Inputs : [[0, 'cov_files']]
Outputs : [[0, 'coverage_tsv']]
Emits : []


Name : quast
Inputs : [[0, 'assembled_genomes_quality']]
Outputs : [[0, 'quast_files'], [1, 'quast_multiqc']]
Emits : []


Name : quast_summary
Inputs : [[0, 'quast_files']]
Outputs : [[0, 'quast_tsv']]
Emits : []


Name : mlst
Inputs : [[0, 'assembled_genomes_mlst']]
Outputs : [[0, 'mlst_results']]
Emits : []


Name : mlst_formatting
Inputs : [[0, 'mlst_results']]
Outputs : [[0, 'mlst_tsv']]
Emits : []


Name : kraken
Inputs : [[0, 'read_files_kraken']]
Outputs : [[0, 'kraken_files'], [0, 'kraken_multiqc'], [1, 'kraken_version']]
Emits : []


Name : kraken_summary
Inputs : [[0, 'kraken_files']]
Outputs : [[0, 'kraken_tsv'], [1, 'kraken_amr']]
Emits : []


Name : amrfinder_setup
Inputs : [[0, 'kraken_amr'], [1, 'assembled_genomes_ar']]
Outputs : [[0, 'ar_input']]
Emits : []


Name : amrfinder
Inputs : [[0, 'ar_input']]
Outputs : [[0, 'ar_predictions'], [1, 'amrfinder_version']]
Emits : []


Name : amrfinder_summary
Inputs : [[0, 'ar_predictions']]
Outputs : [[1, 'ar_tsv'], [2, 'selected_ar_tsv']]
Emits : []


Name : bbduk_summary
Inputs : [[0, 'bbduk_files']]
Outputs : [[0, 'bbduk_tsv']]
Emits : []


Name : merge_results
Inputs : [[0, 'bbduk_tsv'], [1, 'quast_tsv'], [2, 'coverage_tsv'], [3, 'mlst_tsv'], [4, 'kraken_tsv'], [5, 'ar_tsv'], [6, 'selected_ar_tsv'], [7, 'kraken_version'], [8, 'amrfinder_version']]
Outputs : []
Emits : []


Name : multiqc
Inputs : [[0, 'multiqc_clean_reads'], [1, 'fastqc_multiqc'], [2, 'stats_multiqc'], [3, 'kraken_multiqc'], [4, 'quast_multiqc'], [5, 'multiqc_config']]
Outputs : [[0, 'multiqc_output']]
Emits : []


