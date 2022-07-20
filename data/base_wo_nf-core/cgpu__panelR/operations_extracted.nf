OPERATION_1 string : Channel.fromPath(params.fasta)
        .ifEmpty { exit 1, "fasta annotation file not found: ${params.fasta}" }
        .into { ch_fasta ; ch_fasta_gather; ch_fasta_for_filterSNPs}
OPERATION_1 origin : [['params.fasta', 'A']]
OPERATION_1 gives  : [['ch_fasta', 'P'], ['ch_fasta_gather', 'P'], ['ch_fasta_for_filterSNPs', 'P']]


OPERATION_2 string : Channel.fromPath(params.fai)
        .ifEmpty { exit 1, "fasta index file not found: ${params.fai}" }
        .into { ch_fai ; ch_fai_gather ; ch_fai_for_filterSNPs}
OPERATION_2 origin : [['params.fai', 'A']]
OPERATION_2 gives  : [['ch_fai', 'P'], ['ch_fai_gather', 'P'], ['ch_fai_for_filterSNPs', 'P']]


OPERATION_3 string : Channel.fromPath(params.dict)
        .ifEmpty { exit 1, "dict annotation file not found: ${params.dict}" }
        .into { ch_dict ; ch_dict_gather ; ch_dict_for_filterSNPs }
OPERATION_3 origin : [['params.dict', 'A']]
OPERATION_3 gives  : [['ch_dict', 'P'], ['ch_dict_gather', 'P'], ['ch_dict_for_filterSNPs', 'P']]


OPERATION_4 string : Channel.fromPath(params.multiVCF_table)
       .ifEmpty { exit 1, "File with vcf and respective index not found or not passed to --multiVCF_table" }
       .splitCsv(sep: ',',  skip: 1 )
       .map{ vcf, vcf_index -> [file(vcf), file(vcf_index)] }
       .set { ch_multiVCF_table }
OPERATION_4 origin : [['params.multiVCF_table', 'A']]
OPERATION_4 gives  : [['ch_multiVCF_table', 'P']]


OPERATION_5 string : Channel.fromPath("${params.list_folder}/*.list")
       .flatten()
       .into { ch_subset_lists; ch_subset_lists_view}
OPERATION_5 origin : [['"${params.list_folder}/*.list"', 'A']]
OPERATION_5 gives  : [['ch_subset_lists', 'P'], ['ch_subset_lists_view', 'P']]


OPERATION_6 string : ch_multiVCF = ch_subset_lists_view.combine(ch_multiVCF_table)
OPERATION_6 origin : [['ch_subset_lists_view', 'P'], ['ch_multiVCF_table', 'P']]
OPERATION_6 gives  : [['ch_multiVCF', 'P']]


OPERATION_7 string : ch_pops_vcfs_to_bcftools_to_inspect.view()
OPERATION_7 origin : [['ch_pops_vcfs_to_bcftools_to_inspect', 'P']]
OPERATION_7 gives  : []


OPERATION_8 string : ch_pops_vcfs_to_inspect
                        .groupTuple(by: 0)
                                                                         
                        .view()
OPERATION_8 origin : [['ch_pops_vcfs_to_inspect', 'P']]
OPERATION_8 gives  : []


OPERATION_9 string : ch_grouped_pop_vcfs = ch_pops_vcfs.groupTuple(by: 0)
OPERATION_9 origin : [['ch_pops_vcfs', 'P']]
OPERATION_9 gives  : [['ch_grouped_pop_vcfs', 'P']]


OPERATION_10 string : ch_plink_count_freqs_to_inspect.view()
OPERATION_10 origin : [['ch_plink_count_freqs_to_inspect', 'P']]
OPERATION_10 gives  : []


OPERATION_11 string : ch_pruned_for_get_frq_counts_to_inspect.view()
OPERATION_11 origin : [['ch_pruned_for_get_frq_counts_to_inspect', 'P']]
OPERATION_11 gives  : []


OPERATION_12 string : ch_panel_base = ch_plink_frq_counts_for_panel.take( 1 )
OPERATION_12 origin : [['ch_plink_frq_counts_for_panel', 'P']]
OPERATION_12 gives  : [['ch_panel_base', 'P']]


