OPERATION_1 string : Channel.fromPath(params.samples)
    .ifEmpty { exit 1, "samples file not found: ${params.samples}" }
    .splitCsv(sep: '\t')
    .map{ patientId, sampleId, status, fastq1, fastq2 -> [patientId, sampleId, status, file(fastq1).baseName, [file(fastq1), file(fastq2)]] }
    .into { samples; reads; reads_kraken }
OPERATION_1 origin : [['params.samples', 'A']]
OPERATION_1 gives  : [['samples', 'P'], ['reads', 'P'], ['reads_kraken', 'P']]


OPERATION_2 string : Channel.fromPath(params.fasta)
           .ifEmpty { exit 1, "fasta annotation file not found: ${params.fasta}" }
           .into { fasta_bwa; fasta_baserecalibrator; fasta_haplotypecaller; fasta_mutect; fasta_variant_eval }
OPERATION_2 origin : [['params.fasta', 'A']]
OPERATION_2 gives  : [['fasta_bwa', 'P'], ['fasta_baserecalibrator', 'P'], ['fasta_haplotypecaller', 'P'], ['fasta_mutect', 'P'], ['fasta_variant_eval', 'P']]


OPERATION_3 string : Channel.fromPath(params.fai)
           .ifEmpty { exit 1, "fasta index file not found: ${params.fai}" }
           .into { fai_mutect; fai_baserecalibrator; fai_haplotypecaller; fai_variant_eval }
OPERATION_3 origin : [['params.fai', 'A']]
OPERATION_3 gives  : [['fai_mutect', 'P'], ['fai_baserecalibrator', 'P'], ['fai_haplotypecaller', 'P'], ['fai_variant_eval', 'P']]


OPERATION_4 string : Channel.fromPath(params.dict)
           .ifEmpty { exit 1, "dict annotation file not found: ${params.dict}" }
           .into { dict_interval; dict_mutect; dict_baserecalibrator; dict_haplotypecaller; dict_variant_eval }
OPERATION_4 origin : [['params.dict', 'A']]
OPERATION_4 gives  : [['dict_interval', 'P'], ['dict_mutect', 'P'], ['dict_baserecalibrator', 'P'], ['dict_haplotypecaller', 'P'], ['dict_variant_eval', 'P']]


OPERATION_5 string : Channel.fromPath(params.dbsnp_gz)
           .ifEmpty { exit 1, "dbsnp annotation file not found: ${params.dbsnp_gz}" }
           .set { dbsnp_gz}
OPERATION_5 origin : [['params.dbsnp_gz', 'A']]
OPERATION_5 gives  : [['dbsnp_gz', 'P']]


OPERATION_6 string : Channel.fromPath(params.dbsnp_idx_gz)
           .ifEmpty { exit 1, "dbsnp_idx_gz annotation file not found: ${params.dbsnp_idx_gz}" }
           .set { dbsnp_idx_gz}
OPERATION_6 origin : [['params.dbsnp_idx_gz', 'A']]
OPERATION_6 gives  : [['dbsnp_idx_gz', 'P']]


OPERATION_7 string : Channel.fromPath(params.golden_indel_gz)
           .ifEmpty { exit 1, "golden_indel_gz annotation file not found: ${params.golden_indel_gz}" }
           .set { golden_indel_gz }
OPERATION_7 origin : [['params.golden_indel_gz', 'A']]
OPERATION_7 gives  : [['golden_indel_gz', 'P']]


OPERATION_8 string : Channel.fromPath(params.golden_indel_idx_gz)
           .ifEmpty { exit 1, "golden_indel_idx_gz annotation file not found: ${params.golden_indel_idx_gz}" }
           .set { golden_indel_idx_gz }
OPERATION_8 origin : [['params.golden_indel_idx_gz', 'A']]
OPERATION_8 gives  : [['golden_indel_idx_gz', 'P']]


OPERATION_9 string : Channel.fromPath(params.bwa_index_amb)
           .ifEmpty { exit 1, "bwa_index_amb annotation file not found: ${params.bwa_index_amb}" }
           .set { bwa_index_amb }
OPERATION_9 origin : [['params.bwa_index_amb', 'A']]
OPERATION_9 gives  : [['bwa_index_amb', 'P']]


OPERATION_10 string : Channel.fromPath(params.bwa_index_ann)
           .ifEmpty { exit 1, "bwa_index_ann annotation file not found: ${params.bwa_index_ann}" }
           .set { bwa_index_ann }
OPERATION_10 origin : [['params.bwa_index_ann', 'A']]
OPERATION_10 gives  : [['bwa_index_ann', 'P']]


OPERATION_11 string : Channel.fromPath(params.bwa_index_bwt)
           .ifEmpty { exit 1, "bwa_index_bwt annotation file not found: ${params.bwa_index_bwt}" }
           .set { bwa_index_bwt }
OPERATION_11 origin : [['params.bwa_index_bwt', 'A']]
OPERATION_11 gives  : [['bwa_index_bwt', 'P']]


OPERATION_12 string : Channel.fromPath(params.bwa_index_pac)
           .ifEmpty { exit 1, "bwa_index_pac annotation file not found: ${params.bwa_index_pac}" }
           .set { bwa_index_pac }
OPERATION_12 origin : [['params.bwa_index_pac', 'A']]
OPERATION_12 gives  : [['bwa_index_pac', 'P']]


OPERATION_13 string : Channel.fromPath(params.bwa_index_sa)
           .ifEmpty { exit 1, "bwa_index_sa annotation file not found: ${params.bwa_index_sa}" }
           .set { bwa_index_sa }
OPERATION_13 origin : [['params.bwa_index_sa', 'A']]
OPERATION_13 gives  : [['bwa_index_sa', 'P']]


OPERATION_14 string : Channel.fromPath(params.bed)
           .ifEmpty { exit 1, "BED file for to define regions not found: ${params.bed}" }
           .into { bed; bed_basename }
OPERATION_14 origin : [['params.bed', 'A']]
OPERATION_14 gives  : [['bed', 'P'], ['bed_basename', 'P']]


OPERATION_15 string : bamsNormal = Channel.create()
OPERATION_15 origin : []
OPERATION_15 gives  : [['bamsNormal', 'P']]


OPERATION_16 string : bamsTumour = Channel.create()
OPERATION_16 origin : []
OPERATION_16 gives  : [['bamsTumour', 'P']]


OPERATION_17 string : bed_basename.map { file -> tuple(file.baseName, file) }.set{ bed_interval }
OPERATION_17 origin : [['bed_basename', 'P']]
OPERATION_17 gives  : [['bed_interval', 'P']]


OPERATION_18 string : bwa_index = fasta_bwa.merge(bwa_index_amb, bwa_index_ann, bwa_index_bwt, bwa_index_pac, bwa_index_sa)
OPERATION_18 origin : [['fasta_bwa', 'P'], ['bwa_index_amb', 'P'], ['bwa_index_ann', 'P'], ['bwa_index_bwt', 'P'], ['bwa_index_pac', 'P'], ['bwa_index_sa', 'P']]
OPERATION_18 gives  : [['bwa_index', 'P']]


OPERATION_19 string : bwa = samples.combine(bwa_index)
OPERATION_19 origin : [['samples', 'P'], ['bwa_index', 'P']]
OPERATION_19 gives  : [['bwa', 'P']]


OPERATION_20 string : baserecalibrator_index = fasta_baserecalibrator.merge(fai_baserecalibrator, dict_baserecalibrator, dbsnp, dbsnp_idx, golden_indel, golden_indel_idx)
OPERATION_20 origin : [['fasta_baserecalibrator', 'P'], ['fai_baserecalibrator', 'P'], ['dict_baserecalibrator', 'P'], ['dbsnp', 'P'], ['dbsnp_idx', 'P'], ['golden_indel', 'P'], ['golden_indel_idx', 'P']]
OPERATION_20 gives  : [['baserecalibrator_index', 'P']]


OPERATION_21 string : baserecalibrator = bam_markdup_baserecalibrator.combine(baserecalibrator_index)
OPERATION_21 origin : [['bam_markdup_baserecalibrator', 'P'], ['baserecalibrator_index', 'P']]
OPERATION_21 gives  : [['baserecalibrator', 'P']]


OPERATION_22 string : applybqsr = baserecalibrator_table.join(bam_markdup_applybqsr)
OPERATION_22 origin : [['baserecalibrator_table', 'P'], ['bam_markdup_applybqsr', 'P']]
OPERATION_22 gives  : [['applybqsr', 'P']]


OPERATION_23 string : interval_list
    .splitText()
    .map { it -> it.trim() }
    .set { intervals }
OPERATION_23 origin : [['interval_list', 'P']]
OPERATION_23 gives  : [['intervals', 'P']]


OPERATION_24 string : haplotypecaller_index = fasta_haplotypecaller.merge(fai_haplotypecaller, dict_haplotypecaller, bam_haplotypecaller)
OPERATION_24 origin : [['fasta_haplotypecaller', 'P'], ['fai_haplotypecaller', 'P'], ['dict_haplotypecaller', 'P'], ['bam_haplotypecaller', 'P']]
OPERATION_24 gives  : [['haplotypecaller_index', 'P']]


OPERATION_25 string : haplotypecaller = intervals.combine(haplotypecaller_index)
OPERATION_25 origin : [['intervals', 'P'], ['haplotypecaller_index', 'P']]
OPERATION_25 gives  : [['haplotypecaller', 'P']]


OPERATION_26 string : bam_mutect.choice( bamsTumour, bamsNormal ) { it[2]  = 0
 } else { 
bam_mutect.choice( bamsTumour, bamsNormal ) { it[2]  = 1 }
 }
OPERATION_26 origin : [['bam_mutect', 'P']]
OPERATION_26 gives  : [['bamsTumour', 'P'], ['bamsNormal', 'P'], ['bamsTumour', 'P'], ['bamsNormal', 'P']]


OPERATION_27 string : combined_bam = bamsNormal.combine(bamsTumour, by: 0)
OPERATION_27 origin : [['bamsNormal', 'P']]
OPERATION_27 gives  : [['combined_bam', 'P']]


OPERATION_28 string : ref_mutect = fasta_mutect.merge(fai_mutect, dict_mutect)
OPERATION_28 origin : [['fasta_mutect', 'P'], ['fai_mutect', 'P'], ['dict_mutect', 'P']]
OPERATION_28 gives  : [['ref_mutect', 'P']]


OPERATION_29 string : variant_calling = combined_bam.combine(ref_mutect)
OPERATION_29 origin : [['combined_bam', 'P'], ['ref_mutect', 'P']]
OPERATION_29 gives  : [['variant_calling', 'P']]


OPERATION_30 string : variant_calling.into{ mutect; manta_no_bed}
OPERATION_30 origin : [['variant_calling', 'P']]
OPERATION_30 gives  : [['mutect', 'P'], ['manta_no_bed', 'P']]


OPERATION_31 string : manta = manta_no_bed.merge(bed)
OPERATION_31 origin : [['manta_no_bed', 'P'], ['bed', 'P']]
OPERATION_31 gives  : [['manta', 'P']]


OPERATION_32 string : variant_eval = vcf_variant_eval.merge(fasta_variant_eval, fai_variant_eval, dict_variant_eval)
OPERATION_32 origin : [['vcf_variant_eval', 'P'], ['fasta_variant_eval', 'P'], ['fai_variant_eval', 'P'], ['dict_variant_eval', 'P']]
OPERATION_32 gives  : [['variant_eval', 'P']]


OPERATION_33 string : manta = manta_no_bed
OPERATION_33 origin : [['manta_no_bed', 'P']]
OPERATION_33 gives  : [['manta', 'P']]


