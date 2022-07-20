Name : get_software_versions
Inputs : []
Outputs : [[0, 'software_versions_yaml'], [1, 'software_versions_text']]
Emits : []


Name : sra_dump
Inputs : [[0, 'read_files_sra']]
Outputs : [[0, 'fastq_reads_qc_sra'], [0, 'fastq_reads_trim_sra'], [0, 'fastq_reads_hisat2_notrim_sra']]
Emits : []


Name : fastQC
Inputs : [[0, 'fastq_reads_qc'], [0, 'fastq_reads_qc_sra']]
Outputs : [[0, 'fastqc_results'], [1, 'fastqc_stats']]
Emits : []


Name : bbduk_hisat2
Inputs : [[0, 'hisat2_indices'], [1, 'hisat2_indices'], [2, 'fastq_reads_trim'], [2, 'fastq_reads_trim_sra']]
Outputs : [[0, 'trimmed_reads_fastqc'], [1, 'trim_stats'], [2, 'hisat2_sam'], [3, 'hisat2_mapstats']]
Emits : []


Name : fastqc_trimmed
Inputs : [[0, 'trimmed_reads_fastqc']]
Outputs : [[0, 'trimmed_fastqc_results']]
Emits : []


Name : hisat2
Inputs : [[0, 'hisat2_indices'], [1, 'hisat2_indices'], [2, 'fastq_reads_hisat2_notrim_sra'], [2, 'fastq_reads_hisat2_notrim']]
Outputs : [[0, 'hisat2_sam'], [1, 'hisat2_mapstats']]
Emits : []


Name : samtools
Inputs : [[0, 'hisat2_sam']]
Outputs : [[0, 'sorted_bam_ch'], [1, 'sorted_bam_indices_ch'], [2, 'bam_flagstat'], [3, 'bam_milmapped_bedgraph'], [4, 'cram_out'], [5, 'cram_index_out']]
Emits : []


Name : picard
Inputs : [[0, 'sorted_bams_for_picard'], [1, 'sorted_bam_indices_for_picard']]
Outputs : [[0, 'picard_stats_multiqc'], [0, 'picard_stats_nqc'], [1, 'picard_dup_bam']]
Emits : []


Name : preseq
Inputs : [[0, 'sorted_bams_for_preseq'], [1, 'sorted_bam_indices_for_preseq']]
Outputs : [[0, 'preseq_results']]
Emits : []


Name : rseqc
Inputs : [[0, 'sorted_bams_for_rseqc'], [1, 'sorted_bam_indices_for_rseqc']]
Outputs : [[0, 'rseqc_results']]
Emits : []


Name : pileup
Inputs : [[0, 'sorted_bams_for_pileup'], [1, 'sorted_bam_indicies_for_pileup']]
Outputs : [[0, 'pileup_results']]
Emits : []


Name : bedgraphs
Inputs : [[0, 'sorted_bam_for_bedgraph'], [1, 'sorted_bam_index_for_bedgraph'], [2, 'bam_milmapped_bedgraph']]
Outputs : [[0, 'non_normalized_bedgraphs'], [1, 'bedgraph_tdf'], [1, 'bedgraph_bigwig']]
Emits : []


Name : normalized_bigwigs
Inputs : [[0, 'bedgraph_bigwig'], [1, 'chrom_sizes']]
Outputs : [[0, 'normalized_bigwig']]
Emits : []


Name : igvtools
Inputs : [[0, 'bedgraph_tdf'], [1, 'chrom_sizes']]
Outputs : [[0, 'tiled_data_ch']]
Emits : []


Name : multiqc
Inputs : [[0, 'multiqc_config'], [1, 'fastqc_results'], [2, 'trimmed_fastqc_results'], [3, 'trim_stats'], [4, 'bam_flagstat'], [5, 'rseqc_results'], [6, 'preseq_results'], [7, 'software_versions_yaml'], [8, 'hisat2_mapstats'], [9, 'picard_stats_multiqc']]
Outputs : [[0, 'multiqc_report'], [1, 'multiqc_report_files']]
Emits : []


