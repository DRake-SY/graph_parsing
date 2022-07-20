OPERATION_1 string : Channel
  .fromFilePairs(["${params.reads}/*_R{1,2}*.{fastq,fastq.gz,fq,fq.gz}",
                  "${params.reads}/*_{1,2}*.{fastq,fastq.gz,fq,fq.gz}"], size: 2 )
  .map { reads -> tuple(reads[0].replaceAll(~/_S[0-9]+_L[0-9]+/,""), reads[1]) }
  .view { "Paired-end fastq files found : ${it[0]}" }
  .into { reads_check ; reads_seqyclean ; reads_fastqc ; reads }
OPERATION_1 origin : []
OPERATION_1 gives  : [['reads_check', 'P'], ['reads_seqyclean', 'P'], ['reads_fastqc', 'P'], ['reads', 'P']]


OPERATION_2 string : Channel
  .fromPath("${params.fastas}/*{.fa,.fasta,.fna}")
  .map { file -> tuple(file.baseName, file) }
  .view { "Fasta file found : ${it[0]}" }
  .into { fastas_check ; fastas ; fastas_mash ; fastas_quast ; fastas_prokka ; fastas_seqsero2 ; fastas_amrfinder ; fastas_serotypefinder ; fastas_kleborate ; fastas_mlst ; fastas_kraken2 }
OPERATION_2 origin : [['"${params.fastas}/*{.fa,.fasta,.fna}"', 'A']]
OPERATION_2 gives  : [['fastas_check', 'P'], ['fastas', 'P'], ['fastas_mash', 'P'], ['fastas_quast', 'P'], ['fastas_prokka', 'P'], ['fastas_seqsero2', 'P'], ['fastas_amrfinder', 'P'], ['fastas_serotypefinder', 'P'], ['fastas_kleborate', 'P'], ['fastas_mlst', 'P'], ['fastas_kraken2', 'P']]


OPERATION_3 string : Channel.fromPath("${params.gff}/*.gff", type: 'file')
  .view { "gff file : $it" }
  .into { gffs_check ; local_gffs }
OPERATION_3 origin : [['"${params.gff}/*.gff", type: \'file\'', 'A']]
OPERATION_3 gives  : [['gffs_check', 'P'], ['local_gffs', 'P']]


OPERATION_4 string : genome_sizes = Channel.fromPath(params.genome_sizes, type:'file')
OPERATION_4 origin : [["params.genome_sizes, type:'file'", 'A']]
OPERATION_4 gives  : [['genome_sizes', 'P']]


OPERATION_5 string : Channel.empty()
OPERATION_5 origin : []
OPERATION_5 gives  : []


OPERATION_6 string : Channel.empty()
OPERATION_6 origin : []
OPERATION_6 gives  : []


OPERATION_7 string : prokka_files = Channel.empty()
OPERATION_7 origin : []
OPERATION_7 gives  : [['prokka_files', 'P']]


OPERATION_8 string : gffs = Channel.empty()
OPERATION_8 origin : []
OPERATION_8 gives  : [['gffs', 'P']]


OPERATION_9 string : kraken2_files = Channel.empty()
OPERATION_9 origin : []
OPERATION_9 gives  : [['kraken2_files', 'P']]


OPERATION_10 string : kraken2_top_hit = Channel.empty()
OPERATION_10 origin : []
OPERATION_10 gives  : [['kraken2_top_hit', 'P']]


OPERATION_11 string : kraken2_top_perc = Channel.empty()
OPERATION_11 origin : []
OPERATION_11 gives  : [['kraken2_top_perc', 'P']]


OPERATION_12 string : kraken2_top_reads = Channel.empty()
OPERATION_12 origin : []
OPERATION_12 gives  : [['kraken2_top_reads', 'P']]


OPERATION_13 string : blobtools_species_results = Channel.empty()
OPERATION_13 origin : []
OPERATION_13 gives  : [['blobtools_species_results', 'P']]


OPERATION_14 string : blobtools_perc_results = Channel.empty()
OPERATION_14 origin : []
OPERATION_14 gives  : [['blobtools_perc_results', 'P']]


OPERATION_15 string : reads_check
  .concat(fastas_check)
  .concat(gffs_check)
  .ifEmpty{
    println("FATAL : No fastq or fastq.gz files were found at ${params.reads}")
    println("Set 'params.reads' to directory with paired-end reads" )
    println("FATAL : No fastas were found at ${params.fastas}")
    println("Set 'params.fastas' to directory with fastas" )
    println("FATAL : No gff files were found at ${params.gff}")
    println("Set 'params.gff' to directory with gff files" )
    exit 1
  }
OPERATION_15 origin : [['reads_check', 'P'], ['fastas_check', 'P'], ['gffs_check', 'P']]
OPERATION_15 gives  : []


OPERATION_16 string : seqyclean_files_combine
  .collectFile(name: "SummaryStatistics.tsv",
    keepHeader: true,
    sort: true,
    storeDir: "${params.outdir}/seqyclean")
OPERATION_16 origin : [['seqyclean_files_combine', 'P']]
OPERATION_16 gives  : []


OPERATION_17 string : quast_files_combine
  .collectFile(name: "report.tsv",
    keepHeader: true,
    sort: true,
    storeDir: "${params.outdir}/quast")
OPERATION_17 origin : [['quast_files_combine', 'P']]
OPERATION_17 gives  : []


OPERATION_18 string : shuffled_files
  .join(mash_genome_size_gc, by: 0)
  .join(mash_genus_gc, by: 0)
  .join(mash_species_gc, by: 0)
  .combine(genome_sizes)
  .set { for_gc }
OPERATION_18 origin : [['shuffled_files', 'P'], ['genome_sizes', 'P']]
OPERATION_18 gives  : [['for_gc', 'P']]


OPERATION_19 string : cg_pipeline_files
  .collectFile(name: "cg_pipeline_report.txt",
    keepHeader: true,
    sort: true,
    storeDir: "${params.outdir}/cg_pipeline")
OPERATION_19 origin : [['cg_pipeline_files', 'P']]
OPERATION_19 gives  : []


OPERATION_20 string : seqsero2_files
  .collectFile(name: "SeqSero_result.tsv",
    keepHeader: true,
    sort: true,
    storeDir: "${params.outdir}/seqsero2")
OPERATION_20 origin : [['seqsero2_files', 'P']]
OPERATION_20 gives  : []


OPERATION_21 string : kleborate_files
  .collectFile(name: "kleborate_results.txt",
    keepHeader: true,
    sort: true,
    storeDir: "${params.outdir}/kleborate")
OPERATION_21 origin : [['kleborate_files', 'P']]
OPERATION_21 gives  : []


OPERATION_22 string : amrfinder_files
  .collectFile(name: "ncbi-AMRFinderplus.txt",
    keepHeader: true,
    sort: true,
    storeDir: "${params.outdir}/ncbi-AMRFinderplus")
OPERATION_22 origin : [['amrfinder_files', 'P']]
OPERATION_22 gives  : []


OPERATION_23 string : mlst_files
  .collectFile(name: "mlst_result.tsv",
    keepHeader: false,
    sort: true,
    storeDir: "${params.outdir}/mlst")
OPERATION_23 origin : [['mlst_files', 'P']]
OPERATION_23 gives  : []


OPERATION_24 string : reads
  .concat(fastas)
  .join(seqyclean_perc_kept_results, remainder: true, by: 0)
  .join(seqyclean_pairskept_results, remainder: true, by: 0)
  .join(fastqc_1_results, remainder: true, by: 0)
  .join(fastqc_2_results, remainder: true, by: 0)
  .join(mash_genome_size_results, remainder: true, by: 0)
  .join(mash_coverage_results, remainder: true, by: 0)
  .join(mash_genus_results, remainder: true, by: 0)
  .join(mash_species_results, remainder: true, by: 0)
  .join(mash_full_results, remainder: true, by: 0)
  .join(mash_pvalue_results, remainder: true, by: 0)
  .join(mash_distance_results, remainder: true, by: 0)
  .join(quast_gc_results, remainder: true, by: 0)
  .join(quast_contigs_results, remainder: true, by: 0)
  .join(quast_N50_contigs_results, remainder: true, by: 0)
  .join(quast_length_results, remainder: true, by: 0)
  .join(cg_avrl_results, remainder: true, by: 0)
  .join(cg_quality_results, remainder: true, by: 0)
  .join(cg_cov_results, remainder: true, by: 0)
  .join(ref_genome_length, remainder: true, by: 0)
  .join(seqsero2_profile_results, remainder: true, by: 0)
  .join(seqsero2_serotype_results, remainder: true, by: 0)
  .join(seqsero2_contamination_results, remainder: true, by: 0)
  .join(serotypefinder_results_o, remainder: true, by: 0)
  .join(serotypefinder_results_h, remainder: true, by: 0)
  .join(shigatyper_predictions, remainder: true, by: 0)
  .join(shigatyper_cadA, remainder: true, by: 0)
  .join(kleborate_score, remainder: true, by: 0)
  .join(kleborate_mlst, remainder: true, by: 0)
  .join(blobtools_species_results, remainder: true, by: 0)
  .join(blobtools_perc_results, remainder: true, by: 0)
  .join(kraken2_top_hit, remainder: true, by: 0)
  .join(kraken2_top_perc, remainder: true, by: 0)
  .join(kraken2_top_reads, remainder: true, by: 0)
  .join(amr_genes, remainder: true, by: 0)
  .join(virulence_genes, remainder: true, by:0)
  .join(mlst_results, remainder: true, by: 0)
  .set { results }
OPERATION_24 origin : [['reads', 'P'], ['fastas', 'P']]
OPERATION_24 gives  : [['results', 'P']]


OPERATION_25 string : summary_files_txt
  .collectFile(name: "grandeur_summary.txt",
    keepHeader: true,
    sort: true,
    storeDir: "${params.outdir}/summary")
OPERATION_25 origin : [['summary_files_txt', 'P']]
OPERATION_25 gives  : []


OPERATION_26 string : summary_files_tsv
  .collectFile(name: "grandeur_results.tsv",
    keepHeader: true,
    sort: true,
    storeDir: "${params.outdir}")
OPERATION_26 origin : [['summary_files_tsv', 'P']]
OPERATION_26 gives  : []


