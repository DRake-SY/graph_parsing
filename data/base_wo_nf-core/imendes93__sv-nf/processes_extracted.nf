Name : construct
Inputs : [[0, 'IN_referece_raw'], [1, 'IN_vcf_raw'], [2, 'IN_vcf_index_raw'], [3, 'IN_max_nodes']]
Outputs : [[0, 'OUT_CONSTRUCT']]
Emits : []


Name : view_construct
Inputs : [[0, 'IN_GRAPH_VIEW']]
Outputs : [[0, 'GRAPH_DOTFILE']]
Emits : []


Name : graphviz
Inputs : [[0, 'GRAPH_DOTFILE'], [2, 'IN_graphviz_mode']]
Outputs : [[0, 'OUT_GRAPH_GRAPHVIZ']]
Emits : []


Name : index
Inputs : [[0, 'IN_INDEX_1'], [1, 'IN_KMER']]
Outputs : [[0, 'XG_FILE'], [1, 'GCSA_FILE']]
Emits : []


Name : map
Inputs : [[0, 'XG_FILE_1'], [1, 'GCSA_FILE'], [2, 'mapper_mode']]
Outputs : [[0, 'OUT_MAP']]
Emits : []


Name : view_map
Inputs : [[0, 'IN_INDEX_2'], [1, 'OUT_MAP_VIEW']]
Outputs : [[0, 'MAP_VIEW']]
Emits : []


Name : graphviz_map
Inputs : [[0, 'MAP_VIEW'], [1, 'IN_graphviz_map_mode']]
Outputs : [[0, 'OUT_MAP_GRAPHVIZ']]
Emits : []


Name : pgconvert
Inputs : [[0, 'XG_FILE_2']]
Outputs : [[0, 'GRAPH_PG']]
Emits : []


Name : augment
Inputs : [[0, 'GRAPH_PG'], [1, 'OUT_MAP_1']]
Outputs : [[0, 'GRAPH_AUG']]
Emits : []


Name : pack_aug
Inputs : [[0, 'GRAPH_AUG_1'], [1, 'OUT_MAP_2']]
Outputs : [[0, 'OUT_PACK']]
Emits : []


Name : call_aug
Inputs : [[0, 'OUT_PACK'], [1, 'GRAPH_AUG_2']]
Outputs : [[0, 'IN_VCF_PROCESS']]
Emits : []


Name : pack
Inputs : [[0, 'XG_FILE_2'], [1, 'OUT_MAP']]
Outputs : [[0, 'OUT_PACK']]
Emits : []


Name : call
Inputs : [[0, 'OUT_PACK'], [1, 'XG_FILE_3']]
Outputs : [[0, 'IN_VCF_PROCESS']]
Emits : []


Name : bcftools
Inputs : [[0, 'IN_VCF_PROCESS_1']]
Outputs : [[0, 'OUT_BCF']]
Emits : []


Name : process_bcf_stats
Inputs : [[0, 'OUT_BCF']]
Outputs : [[0, 'SUBS_BCF'], [1, 'SUM_BCF']]
Emits : []


Name : vcfR
Inputs : [[0, 'IN_VCF_PROCESS_2']]
Outputs : [[0, 'OUT_VCRF_PLOT1']]
Emits : []


Name : report
Inputs : [[0, 'OUT_GRAPH_GRAPHVIZ'], [1, 'OUT_VCRF_PLOT1'], [2, 'OUT_MAP_GRAPHVIZ'], [3, 'SUBS_BCF'], [4, 'SUM_BCF']]
Outputs : []
Emits : []


