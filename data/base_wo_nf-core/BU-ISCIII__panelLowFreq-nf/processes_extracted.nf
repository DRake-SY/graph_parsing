Name : makeBWAindex
Inputs : [[0, 'fasta_file']]
Outputs : [[0, 'bwa_index'], [0, 'bwa_index_pileup']]
Emits : []


Name : fastqc
Inputs : [[0, 'raw_reads_fastqc']]
Outputs : [[0, 'fastqc_results'], [0, 'fastqc_results_picard'], [1, 'fastqc_stdout']]
Emits : []


Name : trimming
Inputs : [[0, 'raw_reads_trimming']]
Outputs : [[0, 'trimmed_paired_reads'], [0, 'trimmed_paired_reads_bwa'], [1, 'trimmed_unpaired_reads'], [1, 'trimmed_unpaired_reads_picard'], [2, 'trimmomatic_fastqc_reports'], [2, 'trimmomatic_fastqc_reports_picard'], [3, 'trimmomatic_results'], [3, 'trimmomatic_results_picard']]
Emits : []


Name : bwa
Inputs : [[0, 'raw_reads_bwa'], [1, 'fasta_file'], [2, 'bwa_index']]
Outputs : [[0, 'bwa_bam']]
Emits : []


Name : samtools
Inputs : [[0, 'bwa_bam']]
Outputs : [[0, 'bam_picard'], [0, 'bam_samtools'], [0, 'bam_stats'], [0, 'picard_stats'], [0, 'bedtools_coverage'], [1, 'bai_picard'], [1, 'bai_samtools'], [1, 'bai_bamstats'], [1, 'bai_picard_stats'], [1, 'bai_bedtools_coverage'], [2, 'samtools_stats']]
Emits : []


Name : picard
Inputs : [[0, 'bam_picard'], [1, 'bai_picard']]
Outputs : [[0, 'bam_dedup_mpileup'], [0, 'dedup_bam_stats'], [0, 'dedup_picard_stats'], [0, 'dedup_bedtools_coverage'], [1, 'bai_dedup_stats'], [1, 'bai_dedup_picard_stats'], [1, 'bai_dedup_mpileup'], [1, 'bai_dedup_bedtools_coverage'], [2, 'picard_reports']]
Emits : []


Name : mpileup
Inputs : [[0, 'bam_samtools'], [1, 'bai_samtools'], [2, 'fasta_file'], [3, 'bwa_index_pileup']]
Outputs : [[0, 'pileup_results']]
Emits : []


Name : varscan
Inputs : [[0, 'pileup_results']]
Outputs : [[0, 'vcf_file']]
Emits : []


Name : kggseq
Inputs : [[0, 'vcf_file'], [1, 'resourceDatasets_file']]
Outputs : [[0, 'bcftools_tables'], [1, 'kggseq_flt_file'], [2, 'kggseq_annot_log'], [3, 'header_table']]
Emits : []


Name : rmerge
Inputs : [[0, 'header_table'], [1, 'kggseq_flt_file']]
Outputs : [[0, 'r_merged_tables']]
Emits : []


Name : bamstats
Inputs : [[0, 'bamstatsTargets_file'], [1, 'bam_stats'], [2, 'bai_bamstats']]
Outputs : [[0, 'bamstats_result']]
Emits : []


Name : picard_all_out
Inputs : [[0, 'picard_all_out']]
Outputs : [[0, 'picardstats_all_result']]
Emits : []


Name : multiqc
Inputs : [[0, 'multiqc_config'], [1, 'fastqc_results'], [2, 'trimmomatic_results'], [3, 'trimmomatic_fastqc_reports'], [4, 'bamstats_result'], [5, 'picardstats_result']]
Outputs : [[0, 'multiqc_report'], [1, 'multiqc_data'], [2, 'multiqc_stderr'], [3, 'multiqc_prefix']]
Emits : []


