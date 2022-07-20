OPERATION_1 string : Channel
    .fromPath("${params.normal_vcf_folder}/*.vcf.gz.tbi")
    .set {  vcf_tbi_for_create_GenomicsDB_channel }
OPERATION_1 origin : [['"${params.normal_vcf_folder}/*.vcf.gz.tbi"', 'A']]
OPERATION_1 gives  : [['vcf_tbi_for_create_GenomicsDB_channel', 'P']]


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
    .fromPath(params.intervals_list)
    .set { intervals_create_GenomicsDB_channel  }
OPERATION_5 origin : [['params.intervals_list', 'A']]
OPERATION_5 gives  : [['intervals_create_GenomicsDB_channel', 'P']]


OPERATION_6 string : Channel
    .fromPath("${params.normal_vcf_folder}/*.vcf.gz")
    .into {  vcf_for_create_GenomicsDB_V_string ; vcf_for_create_GenomicsDB_channel }
OPERATION_6 origin : [['"${params.normal_vcf_folder}/*.vcf.gz"', 'A']]
OPERATION_6 gives  : [['vcf_for_create_GenomicsDB_V_string', 'P'], ['vcf_for_create_GenomicsDB_channel', 'P']]


OPERATION_7 string : vcf_string = vcf_for_create_GenomicsDB_V_string.map{'-V '+it.getName()+' ' }.toList().toString()
OPERATION_7 origin : [['vcf_for_create_GenomicsDB_V_string', 'P']]
OPERATION_7 gives  : [['vcf_string', 'P']]


