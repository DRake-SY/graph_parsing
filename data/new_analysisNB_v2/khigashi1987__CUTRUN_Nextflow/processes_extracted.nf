Name : MAKE_GENOME_FILTER
Inputs : [[0, 'ch_fasta'], [1, 'ch_blacklist']]
Outputs : [[2, 'ch_genome_filter_regions'], [3, 'ch_genome_sizes_bigwig'], [3, 'ch_genome_sizes_bedgraph']]
Emits : []


Name : FASTQC
Inputs : [[0, 'ch_raw_reads_fastqc']]
Outputs : [[0, 'ch_fastqc_reports_mqc']]
Emits : []


Name : TRIM_1STROUND
Inputs : [[0, 'ch_raw_reads_trim'], [1, 'ch_adapter']]
Outputs : [[0, 'ch_trimmed_1st'], [1, 'ch_trim1st_fastqc_reports_mqc']]
Emits : []


Name : TRIM_2NDROUND
Inputs : [[0, 'ch_trimmed_1st']]
Outputs : [[0, 'ch_trimmed_2nd'], [1, 'ch_trim2nd_fastqc_reports_mqc']]
Emits : []


Name : BOWTIE2
Inputs : [[0, 'ch_trimmed_2nd'], [1, 'ch_bt2_index']]
Outputs : [[0, 'ch_bt2']]
Emits : []


Name : SORT_BAM
Inputs : [[0, 'ch_bt2']]
Outputs : [[0, 'ch_sorted_bam']]
Emits : []


Name : DEDUP
Inputs : [[0, 'ch_sorted_bam']]
Outputs : [[0, 'ch_dedup_bam'], [1, 'ch_picard_metrics_mqc']]
Emits : []


Name : FILTER120
Inputs : [[0, 'ch_dedup_bam']]
Outputs : [[0, 'ch_filtered_bam']]
Emits : []


Name : FLAGSTAT
Inputs : [[0, 'ch_filtered_bam_flagstat']]
Outputs : [[0, 'ch_flagstat_bigwig'], [0, 'ch_flagstat_macs'], [1, 'ch_flagstat_mqc']]
Emits : []


Name : BIGWIG
Inputs : [[0, 'ch_filtered_bam_bigwig'], [1, 'ch_genome_sizes_bigwig']]
Outputs : [[0, 'ch_bigwig_plotprofile']]
Emits : []


Name : BEDGRAPH
Inputs : [[0, 'ch_filtered_bam_bedgraph'], [1, 'ch_genome_sizes_bedgraph']]
Outputs : [[0, 'ch_bedgraph_seacr']]
Emits : []


Name : MACS2
Inputs : [[0, 'ch_filtered_bam_macs']]
Outputs : [[0, 'ch_macs_peaks']]
Emits : []


Name : SEACR
Inputs : [[0, 'ch_bedgraph_seacr']]
Outputs : [[0, 'ch_seacr_peaks']]
Emits : []


Name : FILTER_MACS_PEAKS
Inputs : [[0, 'ch_macs_peaks'], [1, 'ch_genome_filter_regions_macs'], [2, 'ch_peak_count_header'], [3, 'ch_frip_score_header']]
Outputs : [[0, 'ch_filtered_macs_peaks_qc'], [0, 'ch_filtered_macs_peaks_annot'], [1, 'ch_macs_mqc']]
Emits : []


Name : FILTER_SEACR_PEAKS
Inputs : [[0, 'ch_seacr_peaks'], [1, 'ch_genome_filter_regions_seacr']]
Outputs : [[0, 'ch_filtered_seacr_peaks'], [0, 'ch_filtered_seacr_peaks_annot']]
Emits : []


Name : PEAK_ANNOTATION_MACS
Inputs : [[0, 'ch_filtered_macs_peaks_annot'], [1, 'ch_fasta'], [2, 'ch_gtf']]
Outputs : []
Emits : []


Name : PEAK_ANNOTATION_SEACR
Inputs : [[0, 'ch_filtered_seacr_peaks_annot'], [1, 'ch_fasta'], [2, 'ch_gtf']]
Outputs : []
Emits : []


Name : PLOTPROFILE
Inputs : [[0, 'ch_bigwig_plotprofile'], [1, 'ch_gene_bed']]
Outputs : [[0, 'ch_plotprofile_mqc']]
Emits : []


Name : MULTIQC
Inputs : [[0, 'ch_multiqc_config'], [1, 'ch_workflow_summary'], [2, 'ch_fastqc_reports_mqc'], [3, 'ch_trim1st_fastqc_reports_mqc'], [4, 'ch_trim2nd_fastqc_reports_mqc'], [5, 'ch_flagstat_mqc'], [6, 'ch_picard_metrics_mqc'], [7, 'ch_macs_mqc'], [8, 'ch_plotprofile_mqc']]
Outputs : []
Emits : []


