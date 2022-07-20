Name : fastqc
Inputs : [[0, 'fastq_reads_fastqc']]
Outputs : [[1, 'fastqc_files'], [2, 'fastqc_1_results'], [3, 'fastqc_2_results']]
Emits : []


Name : seqyclean
Inputs : [[0, 'fastq_reads_seqyclean']]
Outputs : [[0, 'paired_files'], [1, 'single_files'], [2, 'paired_files_kraken2'], [3, 'single_files_kraken2'], [4, 'seqyclean_files'], [4, 'seqyclean_files_collect'], [7, 'seqyclean_perc_kept_results'], [8, 'seqyclean_pairskept_results'], [9, 'cleaner_version']]
Emits : []


Name : fastp
Inputs : [[0, 'fastq_reads_fastp']]
Outputs : [[0, 'paired_files'], [1, 'single_files'], [2, 'paired_files_kraken2'], [3, 'single_files_kraken2'], [5, 'fastp_files'], [7, 'fastp_results'], [8, 'cleaner_version']]
Emits : []


Name : bwa
Inputs : [[0, 'paired_files'], [0, 'reference_genome'], [0, 'single_files']]
Outputs : [[0, 'sams'], [0, 'sams_filter'], [2, 'aligner_version']]
Emits : []


Name : minimap2
Inputs : [[0, 'paired_files'], [0, 'reference_genome'], [0, 'single_files']]
Outputs : [[0, 'sams'], [0, 'sams_filter'], [2, 'aligner_version']]
Emits : []


Name : sort
Inputs : [[0, 'sams']]
Outputs : [[0, 'pre_trim_bams'], [0, 'pre_trim_bams2'], [1, 'pre_trim_bams_bamsnap'], [1, 'pre_trim_bams_bedtools']]
Emits : []


Name : filter
Inputs : [[0, 'sams_filter']]
Outputs : [[0, 'filtered_reads']]
Emits : []


Name : ivar_trim
Inputs : [[0, 'pre_trim_bams'], [0, 'primer_bed']]
Outputs : [[0, 'trimmed_bams'], [0, 'trimmed_bams4'], [0, 'trimmed_bams5'], [1, 'bam_bai'], [3, 'ivar_trim_files'], [4, 'trimmer_version']]
Emits : []


Name : samtools_ampliconclip
Inputs : [[0, 'pre_trim_bams'], [0, 'primer_bed']]
Outputs : [[0, 'trimmed_bams'], [0, 'trimmed_bams4'], [0, 'trimmed_bams5'], [1, 'bam_bai'], [3, 'trimmer_version']]
Emits : []


Name : ivar_variants
Inputs : [[0, 'trimmed_bams_genome'], [0, 'gff_file']]
Outputs : [[0, 'sample'], [1, 'ivar_variant_file'], [3, 'ivar_variants_results']]
Emits : []


Name : ivar_consensus
Inputs : [[0, 'trimmed_bams_ivar_consensus']]
Outputs : [[0, 'consensus_rename'], [1, 'consensus_pangolin'], [1, 'consensus_vadr'], [1, 'consensus_nextclade'], [1, 'consensus_msa'], [4, 'consensus_results'], [5, 'ivar_version']]
Emits : []


Name : fasta_prep
Inputs : [[0, 'fastas']]
Outputs : [[0, 'fastas_results'], [1, 'fastas_rename'], [1, 'fastas_pangolin'], [1, 'fastas_vadr'], [1, 'fastas_nextclade'], [1, 'fastas_msa']]
Emits : []


Name : bcftools_variants
Inputs : [[0, 'trimmed_bams_bcftools_variants']]
Outputs : [[0, 'bcftools_variants_file'], [2, 'bcftools_variants_results']]
Emits : []


Name : bamsnap
Inputs : [[0, 'bamsnap_files']]
Outputs : []
Emits : []


Name : samtools_stats
Inputs : [[0, 'pre_post_bams']]
Outputs : [[1, 'samtools_stats_files'], [2, 'samtools_stats_before_size_results'], [3, 'samtools_stats_after_size_results']]
Emits : []


Name : samtools_coverage
Inputs : [[0, 'pre_post_bams2']]
Outputs : [[2, 'samtools_coverage_results'], [3, 'samtools_covdepth_results']]
Emits : []


Name : samtools_flagstat
Inputs : [[0, 'pre_post_bams3']]
Outputs : [[1, 'samtools_flagstat_files']]
Emits : []


Name : samtools_depth
Inputs : [[0, 'pre_post_bams4']]
Outputs : [[1, 'samtools_depth_results']]
Emits : []


Name : kraken2
Inputs : [[0, 'paired_files_kraken2'], [0, 'kraken2_db'], [0, 'single_files_kraken2']]
Outputs : [[0, 'kraken2_files'], [2, 'kraken2_sars_results'], [3, 'kraken2_human_results']]
Emits : []


Name : bedtools_multicov
Inputs : [[0, 'bam_bai'], [0, 'amplicon_bed']]
Outputs : [[1, 'bedtools_results']]
Emits : []


Name : samtools_ampliconstats
Inputs : [[0, 'trimmed_bams5'], [0, 'primer_bed_ampliconstats']]
Outputs : [[0, 'samtools_ampliconstats_files'], [1, 'samtools_ampliconstats_results']]
Emits : []


Name : samtools_plot_ampliconstats
Inputs : [[0, 'samtools_ampliconstats_files']]
Outputs : []
Emits : []


Name : pangolin
Inputs : [[0, 'consensus_pangolin'], [0, 'fastas_pangolin'], [0, 'multifastas_pangolin']]
Outputs : [[1, 'pangolin_file'], [1, 'pangolin_files']]
Emits : []


Name : nextclade
Inputs : [[0, 'consensus_nextclade'], [0, 'fastas_nextclade'], [0, 'multifastas_nextclade']]
Outputs : [[0, 'nextclade_file'], [2, 'nextclade_aligned_fasta'], [3, 'prepped_nextalign']]
Emits : []


Name : vadr
Inputs : [[0, 'consensus_vadr'], [0, 'fastas_vadr'], [0, 'multifastas_vadr']]
Outputs : [[1, 'vadr_file']]
Emits : []


Name : freyja
Inputs : [[0, 'trimmed_bams_freyja']]
Outputs : [[0, 'freyja_demix']]
Emits : []


Name : freyja_aggregate
Inputs : [[0, 'freyja_demix']]
Outputs : [[1, 'aggregated_freyja_file']]
Emits : []


Name : summary
Inputs : [[0, 'results']]
Outputs : [[0, 'summary_file'], [0, 'summary']]
Emits : []


Name : combine_results
Inputs : [[0, 'nextclade_file'], [1, 'pangolin_file'], [2, 'vadr_file'], [3, 'aggregated_freyja_file'], [4, 'summary_file'], [5, 'combine_results_script']]
Outputs : []
Emits : []


Name : mafft
Inputs : [[0, 'consensus_msa'], [0, 'fastas_msa'], [0, 'multifastas_msa'], [1, 'reference_genome_msa']]
Outputs : [[0, 'msa_file'], [0, 'msa_file2']]
Emits : []


Name : nextalign
Inputs : [[0, 'consensus_msa'], [0, 'fastas_msa'], [0, 'multifastas_msa'], [1, 'prepped_nextalign']]
Outputs : [[0, 'msa_file'], [0, 'msa_file2']]
Emits : []


Name : snpdists
Inputs : [[0, 'msa_file']]
Outputs : []
Emits : []


Name : iqtree2
Inputs : [[0, 'msa_file2']]
Outputs : []
Emits : []


Name : rename
Inputs : [[0, 'rename']]
Outputs : []
Emits : []


Name : multiqc
Inputs : [[0, 'fastqc_files'], [1, 'fastp_files'], [2, 'seqyclean_files'], [3, 'kraken2_files'], [4, 'pangolin_files'], [5, 'ivar_trim_files'], [6, 'samtools_stats_files'], [7, 'samtools_flagstat_files']]
Outputs : []
Emits : []


