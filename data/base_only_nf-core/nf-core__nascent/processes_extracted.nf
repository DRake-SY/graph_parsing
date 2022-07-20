Name : get_software_versions
Inputs : []
Outputs : [[0, 'software_versions_yaml']]
Emits : []


Name : sra_dump
Inputs : [[0, 'read_files_sra']]
Outputs : [[0, 'fastq_reads_qc_sra'], [0, 'fastq_reads_trim_sra'], [0, 'fastq_reads_gzip_sra']]
Emits : []


Name : make_hisat_index
Inputs : [[0, 'ch_fasta_for_hisat_index']]
Outputs : [[0, 'hisat2_indices']]
Emits : []


Name : fastqc
Inputs : [[0, 'fastq_reads_qc'], [0, 'fastq_reads_qc_sra']]
Outputs : [[0, 'fastqc_results']]
Emits : []


Name : gzip_fastq
Inputs : [[0, 'fastq_reads_gzip'], [0, 'fastq_reads_gzip_sra']]
Outputs : [[0, 'compressed_fastq']]
Emits : []


Name : bbduk
Inputs : [[0, 'fastq_reads_trim'], [0, 'fastq_reads_trim_sra']]
Outputs : [[0, 'trimmed_reads_fastqc'], [0, 'trimmed_reads_hisat2'], [0, 'trimmed_reads_gzip'], [1, 'trim_stats']]
Emits : []


Name : fastqc_trimmed
Inputs : [[0, 'trimmed_reads_fastqc']]
Outputs : [[0, 'trimmed_fastqc_results']]
Emits : []


Name : gzip_trimmed
Inputs : [[0, 'trimmed_reads_gzip']]
Outputs : [[0, 'trimmed_gzip']]
Emits : []


Name : hisat2
Inputs : [[0, 'hisat2_indices'], [1, 'trimmed_reads_hisat2']]
Outputs : [[0, 'hisat2_sam']]
Emits : []


Name : samtools
Inputs : [[0, 'hisat2_sam']]
Outputs : [[0, 'sorted_bam_ch'], [1, 'sorted_bam_indices_ch'], [2, 'bam_flagstat'], [3, 'bam_milmapped_bedgraph']]
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
Inputs : [[0, 'sorted_bams_for_bedtools_bedgraph'], [1, 'sorted_bam_indices_for_bedtools_bedgraph'], [2, 'bam_milmapped_bedgraph']]
Outputs : [[0, 'non_normalized_bedgraphs'], [1, 'bedgraph_tdf'], [2, 'bedgraph_bigwig_pos'], [3, 'bedgraph_bigwig_neg']]
Emits : []


Name : make_chromosome_sizes
Inputs : [[0, 'genome_fasta']]
Outputs : [[0, 'chrom_sizes_ch']]
Emits : []


Name : dreg_prep
Inputs : [[0, 'sorted_bams_for_dreg_prep'], [1, 'chrom_sizes_for_bed']]
Outputs : [[0, 'dreg_bigwig']]
Emits : []


Name : normalized_bigwigs
Inputs : [[0, 'bedgraph_bigwig_neg'], [1, 'bedgraph_bigwig_pos'], [2, 'chrom_sizes_for_bigwig']]
Outputs : [[0, 'normalized_bigwig']]
Emits : []


Name : igvtools
Inputs : [[0, 'bedgraph_tdf'], [1, 'chrom_sizes_for_igv']]
Outputs : [[0, 'tiled_data_ch']]
Emits : []


Name : multiqc
Inputs : [[0, 'ch_multiqc_config'], [1, 'fastqc_results'], [2, 'trimmed_fastqc_results'], [3, 'trim_stats'], [4, 'bam_flagstat'], [5, 'rseqc_results'], [6, 'preseq_results'], [7, 'software_versions_yaml']]
Outputs : [[0, 'multiqc_report'], [1, 'multiqc_report_files']]
Emits : []


