Name : run_mutect2_tumor_only_mode
Inputs : [[0, 'bam_mutect2_tum_only_mode_channel'], [1, 'bai_mutect2_tum_only_mode_channel'], [2, 'ref_mutect2_tum_only_mode_channel'], [3, 'ref_index_mutect2_tum_only_mode_channel'], [4, 'ref_dict_mutect2_tum_only_mode_channel'], [5, 'interval_list_mutect2_tum_only_mode_channel']]
Outputs : [[0, 'vcf_for_create_GenomicsDB_channel'], [1, 'vcf_tbi_for_create_GenomicsDB_channel']]
Emits : []


Name : create_GenomicsDB
Inputs : [[0, 'vcf_for_create_GenomicsDB_channel'], [1, 'vcf_tbi_for_create_GenomicsDB_channel'], [2, 'ref_for_create_GenomicsDB_channel'], [3, 'ref_index_for_create_GenomicsDB_channel'], [4, 'ref_dict_for_create_GenomicsDB_channel'], [5, 'interval_list_create_GenomicsDB_channel']]
Outputs : [[0, 'pon_db_for_create_somatic_PoN']]
Emits : []


Name : create_somatic_PoN
Inputs : [[0, 'pon_db_for_create_somatic_PoN'], [1, 'ref_create_somatic_PoN'], [2, 'ref_index_create_somatic_PoN'], [3, 'ref_dict_create_somatic_PoN'], [4, 'af_only_gnomad_vcf_channel'], [5, 'af_only_gnomad_vcf_idx_channel']]
Outputs : [[0, 'create_somatic_PoN_results_channel']]
Emits : []


