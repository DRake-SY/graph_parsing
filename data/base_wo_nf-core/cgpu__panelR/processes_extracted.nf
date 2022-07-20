Name : SubsetPopVCF
Inputs : [[0, 'ch_multiVCF'], [1, 'ch_fasta'], [2, 'ch_fai'], [3, 'ch_dict']]
Outputs : [[0, '']]
Emits : []


Name : RecodeID
Inputs : [[0, 'ch_pops_vcfs_to_bcftools']]
Outputs : [[0, '']]
Emits : []


Name : GatherVCFs
Inputs : [[0, 'ch_grouped_pop_vcfs'], [1, 'ch_fasta_gather'], [2, 'ch_fai_gather'], [3, 'ch_dict_gather']]
Outputs : [[0, '']]
Emits : []


Name : CreateSNPWhiteList
Inputs : [[0, 'ch_plink_create_white_list']]
Outputs : [[0, 'ch_whitelist_for_keepIDs']]
Emits : []


Name : KeepWhitelistedSNPs
Inputs : [[0, 'ch_whitelist_for_keepIDs'], [1, 'ch_fasta_for_filterSNPs'], [2, 'ch_fai_for_filterSNPs'], [3, 'ch_dict_for_filterSNPs']]
Outputs : [[0, '']]
Emits : []


Name : GetFrqCounts
Inputs : [[0, 'ch_pruned_for_get_frq_counts']]
Outputs : [[0, 'ch_plink_frq_counts_pop_tables'], [1, 'ch_plink_frq_counts_for_panel']]
Emits : []


Name : GetPanelBase
Inputs : [[0, 'ch_panel_base']]
Outputs : [[0, 'ch_panel_base_dataframe']]
Emits : []


Name : GetPopTables
Inputs : [[0, 'ch_plink_frq_counts_pop_tables']]
Outputs : [[0, 'ch_pop_dataframes_for_panel']]
Emits : []


Name : JoinPanel
Inputs : [[0, 'ch_panel_base_dataframe'], [1, 'ch_pop_dataframes_for_panel']]
Outputs : [[0, 'ch_freq_dataframes']]
Emits : []


