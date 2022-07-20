Name : makeBWAindex
Inputs : [[0, 'fasta']]
Outputs : [[0, 'bwa_index']]
Emits : []


Name : fastqc
Inputs : [[0, 'raw_reads_fastqc']]
Outputs : [[0, 'fastqc_results'], [1, 'fastqc_stdout']]
Emits : []


Name : bbduk
Inputs : [[0, 'raw_reads_bbduk'], [1, 'adapters']]
Outputs : [[0, 'trimmed_reads']]
Emits : []


Name : bwa
Inputs : [[0, 'trimmed_reads'], [1, 'bwa_index']]
Outputs : [[0, 'bwa_bam']]
Emits : []


Name : samtools
Inputs : [[0, 'bwa_bam']]
Outputs : [[0, 'bam_picard'], [0, 'bam_for_mapped'], [1, 'bwa_bai'], [1, 'bai_for_mapped'], [2, 'bed_total'], [3, 'samtools_stats']]
Emits : []


Name : bwa_mapped
Inputs : [[0, 'bam_for_mapped'], [1, 'bai_for_mapped']]
Outputs : [[0, 'bwa_mapped']]
Emits : []


Name : picard
Inputs : [[0, 'bam_picard']]
Outputs : [[0, 'bam_dedup_ssp'], [0, 'bam_dedup_ngsplot'], [0, 'bam_dedup_deepTools'], [0, 'bam_dedup_macs'], [0, 'bam_dedup_saturation'], [1, 'bai_dedup_deepTools'], [1, 'bai_dedup_ngsplot'], [1, 'bai_dedup_macs'], [1, 'bai_dedup_ssp'], [2, 'bed_dedup'], [3, 'picard_reports']]
Emits : []


Name : countstat
Inputs : [[0, 'bed_total'], [0, 'bed_dedup']]
Outputs : [[0, 'countstat_results']]
Emits : []


Name : ssp
Inputs : [[0, 'bam_dedup_ssp'], [1, 'bai_dedup_ssp'], [2, 'chrom_sizes']]
Outputs : [[0, 'ssp_results']]
Emits : []


Name : deepTools
Inputs : [[0, 'bam_dedup_deepTools'], [1, 'bai_dedup_deepTools']]
Outputs : [[0, 'deepTools_results'], [1, 'deepTools_multiqc']]
Emits : []


Name : multiqc
Inputs : [[0, 'multiqc_config'], [1, 'fastqc_results'], [2, 'samtools_stats'], [3, 'picard_reports'], [4, 'deepTools_multiqc']]
Outputs : [[0, 'multiqc_report'], [1, 'multiqc_data'], [2, 'multiqc_stderr'], [3, 'multiqc_prefix']]
Emits : []


