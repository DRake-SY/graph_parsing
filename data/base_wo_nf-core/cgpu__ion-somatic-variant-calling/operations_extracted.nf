OPERATION_1 string : Channel.fromPath(params.fasta)
           .ifEmpty { exit 1, "fasta annotation file not found: ${params.fasta}" }
           .into { fasta_bwa; fasta_baserecalibrator; fasta_haplotypecaller; ref_mutect2_tum_only_mode_channel ; ref_for_create_GenomicsDB_channel ; ref_create_somatic_PoN ; fasta_mutect; fasta_variant_eval ; fasta_filter_mutect_calls ; fasta_vcf2maf }
OPERATION_1 origin : [['params.fasta', 'A']]
OPERATION_1 gives  : [['fasta_bwa', 'P'], ['fasta_baserecalibrator', 'P'], ['fasta_haplotypecaller', 'P'], ['ref_mutect2_tum_only_mode_channel', 'P'], ['ref_for_create_GenomicsDB_channel', 'P'], ['ref_create_somatic_PoN', 'P'], ['fasta_mutect', 'P'], ['fasta_variant_eval', 'P'], ['fasta_filter_mutect_calls', 'P'], ['fasta_vcf2maf', 'P']]


OPERATION_2 string : Channel.fromPath(params.fai)
           .ifEmpty { exit 1, "fasta index file not found: ${params.fai}" }
           .into { fai_mutect; fai_baserecalibrator; fai_haplotypecaller; ref_index_mutect2_tum_only_mode_channel ; ref_index_for_create_GenomicsDB_channel ; ref_index_create_somatic_PoN ; fai_variant_eval ; fai_filter_mutect_calls ; fai_vcf2maf}
OPERATION_2 origin : [['params.fai', 'A']]
OPERATION_2 gives  : [['fai_mutect', 'P'], ['fai_baserecalibrator', 'P'], ['fai_haplotypecaller', 'P'], ['ref_index_mutect2_tum_only_mode_channel', 'P'], ['ref_index_for_create_GenomicsDB_channel', 'P'], ['ref_index_create_somatic_PoN', 'P'], ['fai_variant_eval', 'P'], ['fai_filter_mutect_calls', 'P'], ['fai_vcf2maf', 'P']]


OPERATION_3 string : Channel.fromPath(params.dict)
           .ifEmpty { exit 1, "dict annotation file not found: ${params.dict}" }
           .into { dict_interval; dict_mutect; dict_baserecalibrator; dict_haplotypecaller; dict_variant_eval ; ref_dict_mutect2_tum_only_mode_channel ; ref_dict_for_create_GenomicsDB_channel ; ref_dict_create_somatic_PoN ; dict_filter_mutect_calls ; dict_vcf2maf}
OPERATION_3 origin : [['params.dict', 'A']]
OPERATION_3 gives  : [['dict_interval', 'P'], ['dict_mutect', 'P'], ['dict_baserecalibrator', 'P'], ['dict_haplotypecaller', 'P'], ['dict_variant_eval', 'P'], ['ref_dict_mutect2_tum_only_mode_channel', 'P'], ['ref_dict_for_create_GenomicsDB_channel', 'P'], ['ref_dict_create_somatic_PoN', 'P'], ['dict_filter_mutect_calls', 'P'], ['dict_vcf2maf', 'P']]


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


OPERATION_8 string : Channel.fromPath(params.af_only_gnomad_vcf)
           .ifEmpty { exit 1, "af_only_gnomad_vcf annotation file not found: ${params.af_only_gnomad_vcf}" }
           .into { af_only_gnomad_vcf_channel ; af_only_gnomad_vcf_channel_PoN }
OPERATION_8 origin : [['params.af_only_gnomad_vcf', 'A']]
OPERATION_8 gives  : [['af_only_gnomad_vcf_channel', 'P'], ['af_only_gnomad_vcf_channel_PoN', 'P']]


OPERATION_9 string : Channel.fromPath(params.af_only_gnomad_vcf_idx)
           .ifEmpty { exit 1, "af_only_gnomad_vcf_idx annotation file not found: ${params.af_only_gnomad_vcf_idx}" }
           .into { af_only_gnomad_vcf_idx_channel ; af_only_gnomad_vcf_idx_channel_PoN }
OPERATION_9 origin : [['params.af_only_gnomad_vcf_idx', 'A']]
OPERATION_9 gives  : [['af_only_gnomad_vcf_idx_channel', 'P'], ['af_only_gnomad_vcf_idx_channel_PoN', 'P']]


OPERATION_10 string : Channel.fromPath(params.bwa_index_amb)
           .ifEmpty { exit 1, "bwa_index_amb annotation file not found: ${params.bwa_index_amb}" }
           .set { bwa_index_amb }
OPERATION_10 origin : [['params.bwa_index_amb', 'A']]
OPERATION_10 gives  : [['bwa_index_amb', 'P']]


OPERATION_11 string : Channel.fromPath(params.bwa_index_ann)
           .ifEmpty { exit 1, "bwa_index_ann annotation file not found: ${params.bwa_index_ann}" }
           .set { bwa_index_ann }
OPERATION_11 origin : [['params.bwa_index_ann', 'A']]
OPERATION_11 gives  : [['bwa_index_ann', 'P']]


OPERATION_12 string : Channel.fromPath(params.bwa_index_bwt)
           .ifEmpty { exit 1, "bwa_index_bwt annotation file not found: ${params.bwa_index_bwt}" }
           .set { bwa_index_bwt }
OPERATION_12 origin : [['params.bwa_index_bwt', 'A']]
OPERATION_12 gives  : [['bwa_index_bwt', 'P']]


OPERATION_13 string : Channel.fromPath(params.bwa_index_pac)
           .ifEmpty { exit 1, "bwa_index_pac annotation file not found: ${params.bwa_index_pac}" }
           .set { bwa_index_pac }
OPERATION_13 origin : [['params.bwa_index_pac', 'A']]
OPERATION_13 gives  : [['bwa_index_pac', 'P']]


OPERATION_14 string : Channel.fromPath(params.bwa_index_sa)
           .ifEmpty { exit 1, "bwa_index_sa annotation file not found: ${params.bwa_index_sa}" }
           .set { bwa_index_sa }
OPERATION_14 origin : [['params.bwa_index_sa', 'A']]
OPERATION_14 gives  : [['bwa_index_sa', 'P']]


OPERATION_15 string : Channel.fromPath(params.bed)
           .ifEmpty { exit 1, "BED file for to define regions not found: ${params.bed}" }
           .into { bed; bed_basename }
OPERATION_15 origin : [['params.bed', 'A']]
OPERATION_15 gives  : [['bed', 'P'], ['bed_basename', 'P']]


OPERATION_16 string : Channel.fromPath(params.interval_list_path, type: 'file')
       .into { intervals_haplotypecaller; intervals_mutect ;  interval_list_create_GenomicsDB_channel ; interval_list_mutect2_tum_only_mode_channel}
OPERATION_16 origin : [["params.interval_list_path, type: 'file'", 'A']]
OPERATION_16 gives  : [['intervals_haplotypecaller', 'P'], ['intervals_mutect', 'P'], ['interval_list_create_GenomicsDB_channel', 'P'], ['interval_list_mutect2_tum_only_mode_channel', 'P']]


OPERATION_17 string : Channel.fromPath(params.samples)
    .ifEmpty { exit 1, "samples file not found: ${params.samples}" }
    .splitCsv(sep: ',',  skip: 1 )
    .map{ shared_matched_pair_id, unique_subject_id, case_control_status, bam -> [shared_matched_pair_id, unique_subject_id, case_control_status, file(bam).baseName, file(bam)] }
    .into { samples; bams }
OPERATION_17 origin : [['params.samples', 'A']]
OPERATION_17 gives  : [['samples', 'P'], ['bams', 'P']]


OPERATION_18 string : bamsNormal = Channel.create()
OPERATION_18 origin : []
OPERATION_18 gives  : [['bamsNormal', 'P']]


OPERATION_19 string : bamsTumour = Channel.create()
OPERATION_19 origin : []
OPERATION_19 gives  : [['bamsTumour', 'P']]


OPERATION_20 string : bed_basename.map { file -> tuple(file.baseName, file) }.set{ bed_interval }
OPERATION_20 origin : [['bed_basename', 'P']]
OPERATION_20 gives  : [['bed_interval', 'P']]


OPERATION_21 string : baserecalibrator_index = fasta_baserecalibrator.merge(fai_baserecalibrator, dict_baserecalibrator, dbsnp, dbsnp_idx, golden_indel, golden_indel_idx)
OPERATION_21 origin : [['fasta_baserecalibrator', 'P'], ['fai_baserecalibrator', 'P'], ['dict_baserecalibrator', 'P'], ['dbsnp', 'P'], ['dbsnp_idx', 'P'], ['golden_indel', 'P'], ['golden_indel_idx', 'P']]
OPERATION_21 gives  : [['baserecalibrator_index', 'P']]


OPERATION_22 string : baserecalibrator = bam_sort_baserecalibrator.combine(baserecalibrator_index)
OPERATION_22 origin : [['bam_sort_baserecalibrator', 'P'], ['baserecalibrator_index', 'P']]
OPERATION_22 gives  : [['baserecalibrator', 'P']]


OPERATION_23 string : applybqsr = baserecalibrator_table.join(bam_sort_applybqsr)
OPERATION_23 origin : [['baserecalibrator_table', 'P'], ['bam_sort_applybqsr', 'P']]
OPERATION_23 gives  : [['applybqsr', 'P']]


OPERATION_24 string : bam_mutect.choice( bamsTumour, bamsNormal ) { it[2]  = 0
 } else { 
bam_mutect.choice( bamsTumour, bamsNormal ) { it[2]  = 1 }
 }
OPERATION_24 origin : [['bam_mutect', 'P']]
OPERATION_24 gives  : [['bamsTumour', 'P'], ['bamsNormal', 'P'], ['bamsTumour', 'P'], ['bamsNormal', 'P']]


OPERATION_25 string : bamsNormal.into {bamsNormal_PoN ; bamsNormal_mutect}
OPERATION_25 origin : [['bamsNormal', 'P']]
OPERATION_25 gives  : [['bamsNormal_PoN', 'P'], ['bamsNormal_mutect', 'P']]


OPERATION_26 string : combined_bam = bamsNormal_mutect.combine(bamsTumour, by: 0)
OPERATION_26 origin : [['bamsNormal_mutect', 'P']]
OPERATION_26 gives  : [['combined_bam', 'P']]


OPERATION_27 string : bamsNormal_PoN.into {bamsNormal_PoN_bam_ ; bamsNormal_PoN_bai_ }
OPERATION_27 origin : [['bamsNormal_PoN', 'P']]
OPERATION_27 gives  : [['bamsNormal_PoN_bam_', 'P'], ['bamsNormal_PoN_bai_', 'P']]


OPERATION_28 string : bamsNormal_PoN_bam = bamsNormal_PoN_bam_.map { shared_matched_pair_id, unique_subject_id, case_control_status, name, bam, bai -> [bam]}
OPERATION_28 origin : [['bamsNormal_PoN_bam_', 'P']]
OPERATION_28 gives  : [['bamsNormal_PoN_bam', 'P']]


OPERATION_29 string : bamsNormal_PoN_bai = bamsNormal_PoN_bai_.map { shared_matched_pair_id, unique_subject_id, case_control_status, name, bam, bai -> [bai]}
OPERATION_29 origin : [['bamsNormal_PoN_bai_', 'P']]
OPERATION_29 gives  : [['bamsNormal_PoN_bai', 'P']]


OPERATION_30 string : combined_bam.into {combined_bam_to_view ; combined_bam_mutect }
OPERATION_30 origin : [['combined_bam', 'P']]
OPERATION_30 gives  : [['combined_bam_to_view', 'P'], ['combined_bam_mutect', 'P']]


