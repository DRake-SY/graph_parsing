OPERATION_1 string : Channel
  .fromFilePairs(["${params.reads}/*_R{1,2}*.{fastq,fastq.gz,fq,fq.gz}",
                  "${params.reads}/*{1,2}*.{fastq,fastq.gz,fq,fq.gz}"], size: 2 )
  .map { reads -> tuple(reads[0].replaceAll(~/_S[0-9]+_L[0-9]+/,""), reads[1], "paired" ) }
  .view { "Fastq file found : ${it[0]}" }
  .into { paried_reads_check ; paired_reads }
OPERATION_1 origin : []
OPERATION_1 gives  : [['paried_reads_check', 'P'], ['paired_reads', 'P']]


OPERATION_2 string : Channel
  .fromPath("${params.single_reads}/*.{fastq,fastq.gz,fq,fq.gz}")
  .map { reads -> tuple(reads.simpleName, reads, "single" ) }
  .view { "Fastq file found : ${it[0]}" }
  .into { single_reads_check ; single_reads }
OPERATION_2 origin : [['"${params.single_reads}/*.{fastq,fastq.gz,fq,fq.gz}"', 'A']]
OPERATION_2 gives  : [['single_reads_check', 'P'], ['single_reads', 'P']]


OPERATION_3 string : Channel
  .fromPath("${params.fastas}/*{.fa,.fasta,.fna}", type:'file')
  .map { fasta -> tuple(fasta.baseName, fasta ) }
  .view { "Fasta file found : ${it[0]}" }
  .into { fastas_check ; fastas }
OPERATION_3 origin : [['"${params.fastas}/*{.fa,.fasta,.fna}", type:\'file\'', 'A']]
OPERATION_3 gives  : [['fastas_check', 'P'], ['fastas', 'P']]


OPERATION_4 string : Channel
  .fromPath("${params.multifastas}/*{.fa,.fasta,.fna}", type:'file')
  .view { "MultiFasta file found : ${it}" }
  .into { multifastas_check ; multifastas_pangolin ; multifastas_vadr ; multifastas_nextclade ; multifastas_msa}
OPERATION_4 origin : [['"${params.multifastas}/*{.fa,.fasta,.fna}", type:\'file\'', 'A']]
OPERATION_4 gives  : [['multifastas_check', 'P'], ['multifastas_pangolin', 'P'], ['multifastas_vadr', 'P'], ['multifastas_nextclade', 'P'], ['multifastas_msa', 'P']]


OPERATION_5 string : Channel
  .fromPath("${workflow.projectDir}/bin/combine_results.py", type:'file')
  .set { combine_results_script }
OPERATION_5 origin : [['"${workflow.projectDir}/bin/combine_results.py", type:\'file\'', 'A']]
OPERATION_5 gives  : [['combine_results_script', 'P']]


OPERATION_6 string : Channel
  .fromPath(params.reference_genome, type:'file')
  .ifEmpty{
    println("No reference genome was selected. Set with 'params.reference_genome'")
    exit 1
  }
  .view { "Reference Genome : $it"}
  .into { reference_genome ; reference_genome2 ; reference_genome_msa ; reference_genome_bamsnap ; reference_genome3 }
OPERATION_6 origin : [["params.reference_genome, type:'file'", 'A']]
OPERATION_6 gives  : [['reference_genome', 'P'], ['reference_genome2', 'P'], ['reference_genome_msa', 'P'], ['reference_genome_bamsnap', 'P'], ['reference_genome3', 'P']]


OPERATION_7 string : Channel
  .fromPath(params.gff_file, type:'file')
  .view { "GFF file for Reference Genome : $it"}
  .set { gff_file }
OPERATION_7 origin : [["params.gff_file, type:'file'", 'A']]
OPERATION_7 gives  : [['gff_file', 'P']]


OPERATION_8 string : Channel
  .fromPath(params.primer_bed, type:'file')
  .ifEmpty{
    println("A bedfile for primers is required. Set with 'params.primer_bed'.")
    exit 1
  }
  .view { "Primer BedFile : $it"}
  .into { primer_bed ; primer_bed_bedtools ; primer_bed_ampliconstats }
OPERATION_8 origin : [["params.primer_bed, type:'file'", 'A']]
OPERATION_8 gives  : [['primer_bed', 'P'], ['primer_bed_bedtools', 'P'], ['primer_bed_ampliconstats', 'P']]


OPERATION_9 string : Channel.empty()
OPERATION_9 origin : []
OPERATION_9 gives  : []


OPERATION_10 string : Channel.empty()
OPERATION_10 origin : []
OPERATION_10 gives  : []


OPERATION_11 string : fastp_results = Channel.empty()
OPERATION_11 origin : []
OPERATION_11 gives  : [['fastp_results', 'P']]


OPERATION_12 string : fastp_files = Channel.empty()
OPERATION_12 origin : []
OPERATION_12 gives  : [['fastp_files', 'P']]


OPERATION_13 string : seqyclean_perc_kept_results = Channel.empty()
OPERATION_13 origin : []
OPERATION_13 gives  : [['seqyclean_perc_kept_results', 'P']]


OPERATION_14 string : seqyclean_pairskept_results = Channel.empty()
OPERATION_14 origin : []
OPERATION_14 gives  : [['seqyclean_pairskept_results', 'P']]


OPERATION_15 string : seqyclean_files = Channel.empty()
OPERATION_15 origin : []
OPERATION_15 gives  : [['seqyclean_files', 'P']]


OPERATION_16 string : ivar_trim_files = Channel.empty()
OPERATION_16 origin : []
OPERATION_16 gives  : [['ivar_trim_files', 'P']]


OPERATION_17 string : trimmer_version = Channel.empty()
OPERATION_17 origin : []
OPERATION_17 gives  : [['trimmer_version', 'P']]


OPERATION_18 string : trimmed_bams4 = Channel.empty()
OPERATION_18 origin : []
OPERATION_18 gives  : [['trimmed_bams4', 'P']]


OPERATION_19 string : ivar_trim_files = Channel.empty()
OPERATION_19 origin : []
OPERATION_19 gives  : [['ivar_trim_files', 'P']]


OPERATION_20 string : aggregated_freyja_file = Channel.empty()
OPERATION_20 origin : []
OPERATION_20 gives  : [['aggregated_freyja_file', 'P']]


OPERATION_21 string : Channel
    .fromPath(params.sample_file, type:'file')
    .ifEmpty{
      println("No sample file was found. Set with 'params.sample_file'")
      exit 1
    }
    .view { "Sample File : $it" }
    .set{ sample_file }
OPERATION_21 origin : [["params.sample_file, type:'file'", 'A']]
OPERATION_21 gives  : [['sample_file', 'P']]


OPERATION_22 string : paried_reads_check
  .concat(single_reads_check)
  .concat(fastas_check)
  .concat(multifastas_check)
  .ifEmpty{
    println("FATAL : No input files were found!")
    println("No paired-end fastq files were found at ${params.reads}." )
    println("Set 'params.reads' to directory with paired-end reads")
    println("No single-end fastq files were found at ${params.single_reads}." )
    println("Set 'params.single_reads' to directory with single-end reads")
    println("No fasta files were found at ${params.fastas}." )
    println("Set 'params.fastas' to directory with fastas.")
    println("No multifasta files were found at ${params.fastas}." )
    println("Set 'params.multifastas' to directory with multifastas.")
    exit 1
  }
OPERATION_22 origin : [['paried_reads_check', 'P'], ['single_reads_check', 'P'], ['fastas_check', 'P'], ['multifastas_check', 'P']]
OPERATION_22 gives  : []


OPERATION_23 string : paired_reads
  .concat(single_reads)
  .ifEmpty{ println("No fastq or fastq.gz files were found at ${params.reads} or ${params.single_reads}") }
  .into { fastq_reads_seqyclean ; fastq_reads_fastp ; fastq_reads_fastqc ; fastq_reads_rename }
OPERATION_23 origin : [['paired_reads', 'P'], ['single_reads', 'P']]
OPERATION_23 gives  : [['fastq_reads_seqyclean', 'P'], ['fastq_reads_fastp', 'P'], ['fastq_reads_fastqc', 'P'], ['fastq_reads_rename', 'P']]


OPERATION_24 string : seqyclean_files_collect
    .collectFile(name: "Combined_SummaryStatistics.tsv",
      keepHeader: true,
      sort: true,
      storeDir: "${params.outdir}/seqyclean")
OPERATION_24 origin : [['seqyclean_files_collect', 'P']]
OPERATION_24 gives  : []


OPERATION_25 string : pre_trim_bams
    .into { trimmed_bams ; trimmed_bams5 }
OPERATION_25 origin : [['pre_trim_bams', 'P']]
OPERATION_25 gives  : [['trimmed_bams', 'P'], ['trimmed_bams5', 'P']]


OPERATION_26 string : pre_trim_bams_bedtools
    .set { bam_bai }
OPERATION_26 origin : [['pre_trim_bams_bedtools', 'P']]
OPERATION_26 gives  : [['bam_bai', 'P']]


OPERATION_27 string : trimmed_bams
 .combine(reference_genome2)
 .into { trimmed_bams_genome ; trimmed_bams_ivar_consensus ; trimmed_bams_bcftools_variants ; trimmed_bams_freyja  }
OPERATION_27 origin : [['trimmed_bams', 'P'], ['reference_genome2', 'P']]
OPERATION_27 gives  : [['trimmed_bams_genome', 'P'], ['trimmed_bams_ivar_consensus', 'P'], ['trimmed_bams_bcftools_variants', 'P'], ['trimmed_bams_freyja', 'P']]


OPERATION_28 string : pre_trim_bams_bamsnap
  .join(ivar_variant_file, remainder: true, by:0)
  .join(bcftools_variants_file, remainder: true, by:0)
  .combine(reference_genome_bamsnap)
  .set { bamsnap_files }
OPERATION_28 origin : [['pre_trim_bams_bamsnap', 'P'], ['reference_genome_bamsnap', 'P']]
OPERATION_28 gives  : [['bamsnap_files', 'P']]


OPERATION_29 string : pre_trim_bams2
   .join(trimmed_bams4, remainder: true, by: 0)
   .into { pre_post_bams ; pre_post_bams2 ; pre_post_bams3 ; pre_post_bams4 }
OPERATION_29 origin : [['pre_trim_bams2', 'P']]
OPERATION_29 gives  : [['pre_post_bams', 'P'], ['pre_post_bams2', 'P'], ['pre_post_bams3', 'P'], ['pre_post_bams4', 'P']]


OPERATION_30 string : consensus_results
  .concat(fastas_results)
  .join(fastqc_1_results, remainder: true, by: 0)
  .join(fastqc_2_results, remainder: true, by: 0)
  .join(seqyclean_pairskept_results, remainder: true, by: 0)
  .join(seqyclean_perc_kept_results, remainder: true, by: 0)
  .join(fastp_results, remainder: true, by: 0)
  .join(ivar_variants_results, remainder: true, by: 0)
  .join(bcftools_variants_results, remainder: true, by:0)
  .join(samtools_coverage_results, remainder: true, by: 0)
  .join(samtools_covdepth_results, remainder: true, by: 0)
  .join(samtools_depth_results, remainder: true, by: 0)
  .join(samtools_stats_before_size_results, remainder: true, by: 0)
  .join(samtools_stats_after_size_results, remainder: true, by: 0)
  .join(kraken2_human_results, remainder: true, by: 0)
  .join(kraken2_sars_results, remainder: true, by: 0)
  .join(bedtools_results, remainder: true, by: 0)
  .join(samtools_ampliconstats_results, remainder: true, by: 0)
  .join(aligner_version, remainder: true, by: 0)
  .join(trimmer_version, remainder: true, by: 0)
  .join(cleaner_version, remainder: true, by: 0)
  .join(ivar_version, remainder: true, by: 0)
  .set { results }
OPERATION_30 origin : [['consensus_results', 'P'], ['fastas_results', 'P']]
OPERATION_30 gives  : [['results', 'P']]


OPERATION_31 string : summary
  .collectFile(name: "combined_summary.csv",
    keepHeader: true,
    sort: true,
    skip: 1,
    storeDir: "${params.outdir}/summary")
OPERATION_31 origin : [['summary', 'P']]
OPERATION_31 gives  : []


OPERATION_32 string : nextclade_aligned_fasta
      .into { msa_file ; msa_file2 }
OPERATION_32 origin : [['nextclade_aligned_fasta', 'P']]
OPERATION_32 gives  : [['msa_file', 'P'], ['msa_file2', 'P']]


OPERATION_33 string : fastq_reads_rename
    .join(consensus_rename, by:0)
    .join(fastas_rename, by:0)
    .join(filtered_reads, remainder: true, by: 0)
    .combine(sample_file)
    .set { rename }
OPERATION_33 origin : [['fastq_reads_rename', 'P'], ['sample_file', 'P']]
OPERATION_33 gives  : [['rename', 'P']]


