OPERATION_1 string : Channel.fromPath(params.fasta)
           .ifEmpty { exit 1, "fasta annotation file not found: ${params.fasta}" }
           .into { fasta_scatter_intervals; fasta_bwa; fasta_baserecalibrator; fasta_haplotypecaller; fasta_genotypegvcfs; fasta_variantrecalibrator_snps; fasta_variantrecalibrator_tranches; fasta_variant_eval; fasta_structural_variantcaller }
OPERATION_1 origin : [['params.fasta', 'A']]
OPERATION_1 gives  : [['fasta_scatter_intervals', 'P'], ['fasta_bwa', 'P'], ['fasta_baserecalibrator', 'P'], ['fasta_haplotypecaller', 'P'], ['fasta_genotypegvcfs', 'P'], ['fasta_variantrecalibrator_snps', 'P'], ['fasta_variantrecalibrator_tranches', 'P'], ['fasta_variant_eval', 'P'], ['fasta_structural_variantcaller', 'P']]


OPERATION_2 string : Channel.fromPath(params.fai)
           .ifEmpty { exit 1, "fai annotation file not found: ${params.fai}" }
           .into { fai_scatter_intervals; fai_bwa; fai_baserecalibrator; fai_haplotypecaller; fai_genotypegvcfs; fai_variantrecalibrator_snps; fai_variantrecalibrator_tranches; fai_variant_eval; fai_structural_variantcaller }
OPERATION_2 origin : [['params.fai', 'A']]
OPERATION_2 gives  : [['fai_scatter_intervals', 'P'], ['fai_bwa', 'P'], ['fai_baserecalibrator', 'P'], ['fai_haplotypecaller', 'P'], ['fai_genotypegvcfs', 'P'], ['fai_variantrecalibrator_snps', 'P'], ['fai_variantrecalibrator_tranches', 'P'], ['fai_variant_eval', 'P'], ['fai_structural_variantcaller', 'P']]


OPERATION_3 string : Channel.fromPath(params.dict)
           .ifEmpty { exit 1, "dict annotation file not found: ${params.dict}" }
           .into { dict_scatter_intervals; dict_bwa; dict_baserecalibrator; dict_haplotypecaller; dict_genotypegvcfs; dict_variantrecalibrator_snps; dict_variantrecalibrator_tranches; dict_variant_eval }
OPERATION_3 origin : [['params.dict', 'A']]
OPERATION_3 gives  : [['dict_scatter_intervals', 'P'], ['dict_bwa', 'P'], ['dict_baserecalibrator', 'P'], ['dict_haplotypecaller', 'P'], ['dict_genotypegvcfs', 'P'], ['dict_variantrecalibrator_snps', 'P'], ['dict_variantrecalibrator_tranches', 'P'], ['dict_variant_eval', 'P']]


OPERATION_4 string : Channel.fromPath(params.dbsnp_gz)
           .ifEmpty { exit 1, "dbsnp annotation file not found: ${params.dbsnp_gz}" }
           .set { dbsnp_gz}
OPERATION_4 origin : [['params.dbsnp_gz', 'A']]
OPERATION_4 gives  : [['dbsnp_gz', 'P']]


OPERATION_5 string : Channel.fromPath(params.dbsnp_idx_gz)
           .ifEmpty { exit 1, "dbsnp_idx_gz annotation file not found: ${params.dbsnp_idx_gz}" }
           .set { dbsnp_idx_gz}
OPERATION_5 origin : [['params.dbsnp_idx_gz', 'A']]
OPERATION_5 gives  : [['dbsnp_idx_gz', 'P']]


OPERATION_6 string : Channel.fromPath(params.golden_indel_gz)
           .ifEmpty { exit 1, "golden_indel_gz annotation file not found: ${params.golden_indel_gz}" }
           .set { golden_indel_gz }
OPERATION_6 origin : [['params.golden_indel_gz', 'A']]
OPERATION_6 gives  : [['golden_indel_gz', 'P']]


OPERATION_7 string : Channel.fromPath(params.golden_indel_idx_gz)
           .ifEmpty { exit 1, "golden_indel_idx_gz annotation file not found: ${params.golden_indel_idx_gz}" }
           .set { golden_indel_idx_gz }
OPERATION_7 origin : [['params.golden_indel_idx_gz', 'A']]
OPERATION_7 gives  : [['golden_indel_idx_gz', 'P']]


OPERATION_8 string : Channel.fromPath(params.bwa_index_amb)
           .ifEmpty { exit 1, "bwa_index_amb annotation file not found: ${params.bwa_index_amb}" }
           .set { bwa_index_amb }
OPERATION_8 origin : [['params.bwa_index_amb', 'A']]
OPERATION_8 gives  : [['bwa_index_amb', 'P']]


OPERATION_9 string : Channel.fromPath(params.bwa_index_ann)
           .ifEmpty { exit 1, "bwa_index_ann annotation file not found: ${params.bwa_index_ann}" }
           .set { bwa_index_ann }
OPERATION_9 origin : [['params.bwa_index_ann', 'A']]
OPERATION_9 gives  : [['bwa_index_ann', 'P']]


OPERATION_10 string : Channel.fromPath(params.bwa_index_bwt)
           .ifEmpty { exit 1, "bwa_index_bwt annotation file not found: ${params.bwa_index_bwt}" }
           .set { bwa_index_bwt }
OPERATION_10 origin : [['params.bwa_index_bwt', 'A']]
OPERATION_10 gives  : [['bwa_index_bwt', 'P']]


OPERATION_11 string : Channel.fromPath(params.bwa_index_pac)
           .ifEmpty { exit 1, "bwa_index_pac annotation file not found: ${params.bwa_index_pac}" }
           .set { bwa_index_pac }
OPERATION_11 origin : [['params.bwa_index_pac', 'A']]
OPERATION_11 gives  : [['bwa_index_pac', 'P']]


OPERATION_12 string : Channel.fromPath(params.bwa_index_sa)
           .ifEmpty { exit 1, "bwa_index_sa annotation file not found: ${params.bwa_index_sa}" }
           .set { bwa_index_sa }
OPERATION_12 origin : [['params.bwa_index_sa', 'A']]
OPERATION_12 gives  : [['bwa_index_sa', 'P']]


OPERATION_13 string : Channel.fromPath(params.intervals)
           .ifEmpty { exit 1, "Interval list file for HaplotypeCaller not found: ${params.intervals}" }
           .set { intervals_input }
OPERATION_13 origin : [['params.intervals', 'A']]
OPERATION_13 gives  : [['intervals_input', 'P']]


OPERATION_14 string : Channel.fromPath(params.bai)
           .ifEmpty { exit 1, "BAM index file not found: ${params.bai}" }
           .set { bai }
OPERATION_14 origin : [['params.bai', 'A']]
OPERATION_14 gives  : [['bai', 'P']]


OPERATION_15 string : Channel
      .fromPath(params.reads)
      .map { file -> tuple(file.baseName, file) }
      .ifEmpty { exit 1, "Cannot find any reads matching: ${reads}\nNB: Path needs to be enclosed in quotes!\nIf this is single-end data, please specify --singleEnd on the command line." }
      .into { reads_fastqc; reads_files }
OPERATION_15 origin : [['params.reads', 'A']]
OPERATION_15 gives  : [['reads_fastqc', 'P'], ['reads_files', 'P']]


OPERATION_16 string : Channel
      .fromFilePairs(reads, size: 2)
      .ifEmpty { exit 1, "Cannot find any reads matching: ${reads}\nNB: Path needs to be enclosed in quotes!\nIf this is single-end data, please specify --singleEnd on the command line." }
      .into { reads_fastqc; reads_files}
OPERATION_16 origin : [['reads, size: 2', 'A']]
OPERATION_16 gives  : [['reads_fastqc', 'P'], ['reads_files', 'P']]


OPERATION_17 string : Channel.fromPath(params.bam)
         .map { file -> tuple(file.baseName, file) }
         .ifEmpty { exit 1, "BAM file not found: ${params.bam}" }
         .set { bam_bqsr }
OPERATION_17 origin : [['params.bam', 'A']]
OPERATION_17 gives  : [['bam_bqsr', 'P']]


OPERATION_18 string : reads_files
    .combine(fasta_bwa)
    .dump(tag:'input')
    .set { reads_bwa }
OPERATION_18 origin : [['reads_files', 'P'], ['fasta_bwa', 'P']]
OPERATION_18 gives  : [['reads_bwa', 'P']]


OPERATION_19 string : reads_files
    .combine(fasta_bwa)
    .dump(tag:'input')
    .set { reads_bwa }
OPERATION_19 origin : [['reads_files', 'P'], ['fasta_bwa', 'P']]
OPERATION_19 gives  : [['reads_bwa', 'P']]


OPERATION_20 string : scattered_intervals_ref = fasta_scatter_intervals.merge(fai_scatter_intervals, dict_scatter_intervals)
OPERATION_20 origin : [['fasta_scatter_intervals', 'P'], ['fai_scatter_intervals', 'P'], ['dict_scatter_intervals', 'P']]
OPERATION_20 gives  : [['scattered_intervals_ref', 'P']]


OPERATION_21 string : expanded_intervals.into { intervals_file; split_intervals}
OPERATION_21 origin : [['expanded_intervals', 'P']]
OPERATION_21 gives  : [['intervals_file', 'P'], ['split_intervals', 'P']]


OPERATION_22 string : split_intervals
        .splitText()
        .map { it -> it.trim() }
        .set { interval }
OPERATION_22 origin : [['split_intervals', 'P']]
OPERATION_22 gives  : [['interval', 'P']]


OPERATION_23 string : bwa_index = bwa_index_amb.merge(bwa_index_ann, bwa_index_bwt, bwa_index_pac, bwa_index_sa)
OPERATION_23 origin : [['bwa_index_amb', 'P'], ['bwa_index_ann', 'P'], ['bwa_index_bwt', 'P'], ['bwa_index_pac', 'P'], ['bwa_index_sa', 'P']]
OPERATION_23 gives  : [['bwa_index', 'P']]


OPERATION_24 string : bwa = reads_bwa.combine(bwa_index)
OPERATION_24 origin : [['reads_bwa', 'P'], ['bwa_index', 'P']]
OPERATION_24 gives  : [['bwa', 'P']]


OPERATION_25 string : baserecalibrator_index = fasta_baserecalibrator.merge(fai_baserecalibrator, dict_baserecalibrator, dbsnp, dbsnp_idx, golden_indel, golden_indel_idx)
OPERATION_25 origin : [['fasta_baserecalibrator', 'P'], ['fai_baserecalibrator', 'P'], ['dict_baserecalibrator', 'P'], ['dbsnp', 'P'], ['dbsnp_idx', 'P'], ['golden_indel', 'P'], ['golden_indel_idx', 'P']]
OPERATION_25 gives  : [['baserecalibrator_index', 'P']]


OPERATION_26 string : baserecalibrator = bam_markdup_baserecalibrator.combine(baserecalibrator_index)
OPERATION_26 origin : [['bam_markdup_baserecalibrator', 'P'], ['baserecalibrator_index', 'P']]
OPERATION_26 gives  : [['baserecalibrator', 'P']]


OPERATION_27 string : applybqsr = baserecalibrator_table.join(bam_markdup_applybqsr)
OPERATION_27 origin : [['baserecalibrator_table', 'P'], ['bam_markdup_applybqsr', 'P']]
OPERATION_27 gives  : [['applybqsr', 'P']]


OPERATION_28 string : bam_bqsr.merge(bai).into { indexed_bam_bqsr; indexed_bam_qc; indexed_bam_structural_variantcaller }
OPERATION_28 origin : [['bam_bqsr', 'P'], ['bai', 'P']]
OPERATION_28 gives  : [['indexed_bam_bqsr', 'P'], ['indexed_bam_qc', 'P'], ['indexed_bam_structural_variantcaller', 'P']]


