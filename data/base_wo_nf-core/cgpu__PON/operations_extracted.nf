OPERATION_1 string : Channel
    .fromPath("${params.normal_bam_folder}/*.bai")
    .set {  bai_mutect2_tum_only_mode_channel }
OPERATION_1 origin : [['"${params.normal_bam_folder}/*.bai"', 'A']]
OPERATION_1 gives  : [['bai_mutect2_tum_only_mode_channel', 'P']]


OPERATION_2 string : Channel
    .fromPath(params.ref)
    .into { ref_mutect2_tum_only_mode_channel ; ref_for_create_GenomicsDB_channel ; ref_create_somatic_PoN }
OPERATION_2 origin : [['params.ref', 'A']]
OPERATION_2 gives  : [['ref_mutect2_tum_only_mode_channel', 'P'], ['ref_for_create_GenomicsDB_channel', 'P'], ['ref_create_somatic_PoN', 'P']]


OPERATION_3 string : Channel
    .fromPath(params.ref_index)
    .into { ref_index_mutect2_tum_only_mode_channel ; ref_index_for_create_GenomicsDB_channel ; ref_index_create_somatic_PoN }
OPERATION_3 origin : [['params.ref_index', 'A']]
OPERATION_3 gives  : [['ref_index_mutect2_tum_only_mode_channel', 'P'], ['ref_index_for_create_GenomicsDB_channel', 'P'], ['ref_index_create_somatic_PoN', 'P']]


OPERATION_4 string : Channel
    .fromPath(params.ref_dict)
    .into { ref_dict_mutect2_tum_only_mode_channel ; ref_dict_for_create_GenomicsDB_channel ; ref_dict_create_somatic_PoN }
OPERATION_4 origin : [['params.ref_dict', 'A']]
OPERATION_4 gives  : [['ref_dict_mutect2_tum_only_mode_channel', 'P'], ['ref_dict_for_create_GenomicsDB_channel', 'P'], ['ref_dict_create_somatic_PoN', 'P']]


OPERATION_5 string : Channel
    .fromPath(params.interval_list)
    .into { interval_list_create_GenomicsDB_channel ; interval_list_mutect2_tum_only_mode_channel }
OPERATION_5 origin : [['params.interval_list', 'A']]
OPERATION_5 gives  : [['interval_list_create_GenomicsDB_channel', 'P'], ['interval_list_mutect2_tum_only_mode_channel', 'P']]


OPERATION_6 string : Channel
    .fromPath(params.af_only_gnomad_vcf)
    .set { af_only_gnomad_vcf_channel }
OPERATION_6 origin : [['params.af_only_gnomad_vcf', 'A']]
OPERATION_6 gives  : [['af_only_gnomad_vcf_channel', 'P']]


OPERATION_7 string : Channel
    .fromPath(params.af_only_gnomad_vcf_idx)
    .set { af_only_gnomad_vcf_idx_channel }
OPERATION_7 origin : [['params.af_only_gnomad_vcf_idx', 'A']]
OPERATION_7 gives  : [['af_only_gnomad_vcf_idx_channel', 'P']]


OPERATION_8 string : Channel
    .fromPath("${params.normal_bam_folder}/*.bam")
    .set {  bam_mutect2_tum_only_mode_channel }
OPERATION_8 origin : [['"${params.normal_bam_folder}/*.bam"', 'A']]
OPERATION_8 gives  : [['bam_mutect2_tum_only_mode_channel', 'P']]


