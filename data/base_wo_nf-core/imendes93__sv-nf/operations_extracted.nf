OPERATION_1 string : IN_referece_raw = Channel.fromPath(params.reference).ifEmpty { exit 1, "[Pipeline error] No reference file provided with path:'${params.reference}'" }
OPERATION_1 origin : [['params.reference', 'A']]
OPERATION_1 gives  : [['IN_referece_raw', 'P']]


OPERATION_2 string : IN_max_nodes = Channel.value(params.max_nodes)
OPERATION_2 origin : [['params.max_nodes', 'V']]
OPERATION_2 gives  : [['IN_max_nodes', 'P']]


OPERATION_3 string : IN_vcf_raw = Channel.fromPath(params.vcf).ifEmpty { exit 1, "[Pipeline error] No vcf file provided with path:'${params.vcf}'" }
OPERATION_3 origin : [['params.vcf', 'A']]
OPERATION_3 gives  : [['IN_vcf_raw', 'P']]


OPERATION_4 string : IN_vcf_index_raw = Channel.fromPath(params.vcf_index).ifEmpty { exit 1, "[Pipeline error] No vcf index file provided with path:'${params.vcf_index}'" }
OPERATION_4 origin : [['params.vcf_index', 'A']]
OPERATION_4 gives  : [['IN_vcf_index_raw', 'P']]


OPERATION_5 string : IN_vcf_raw = Channel.from('skip')
OPERATION_5 origin : [["'skip'", 'V']]
OPERATION_5 gives  : [['IN_vcf_raw', 'P']]


OPERATION_6 string : IN_vcf_index_raw = Channel.from('skip')
OPERATION_6 origin : [["'skip'", 'V']]
OPERATION_6 gives  : [['IN_vcf_index_raw', 'P']]


OPERATION_7 string : IN_graphviz_mode = Channel.value('neato')
OPERATION_7 origin : [["'neato'", 'V']]
OPERATION_7 gives  : [['IN_graphviz_mode', 'P']]


OPERATION_8 string : IN_graphviz_mode = Channel.value(params.graphviz)
OPERATION_8 origin : [['params.graphviz', 'V']]
OPERATION_8 gives  : [['IN_graphviz_mode', 'P']]


OPERATION_9 string : IN_INDEX = Channel.fromPath(params.graph).ifEmpty { exit 1, "[Pipeline error] No reference file provided with path:'${params.graph}'" }
OPERATION_9 origin : [['params.graph', 'A']]
OPERATION_9 gives  : [['IN_INDEX', 'P']]


OPERATION_10 string : IN_KMER = Channel.value(params.kmer)
OPERATION_10 origin : [['params.kmer', 'V']]
OPERATION_10 gives  : [['IN_KMER', 'P']]


OPERATION_11 string : mapper_mode = Channel.value('map')
OPERATION_11 origin : [["'map'", 'V']]
OPERATION_11 gives  : [['mapper_mode', 'P']]


OPERATION_12 string : mapper_mode = Channel.value(params.mapper)
OPERATION_12 origin : [['params.mapper', 'V']]
OPERATION_12 gives  : [['mapper_mode', 'P']]


OPERATION_13 string : IN_graphviz_map_mode = Channel.value('neato')
OPERATION_13 origin : [["'neato'", 'V']]
OPERATION_13 gives  : [['IN_graphviz_map_mode', 'P']]


OPERATION_14 string : IN_graphviz_map_mode = Channel.value(params.graphviz)
OPERATION_14 origin : [['params.graphviz', 'V']]
OPERATION_14 gives  : [['IN_graphviz_map_mode', 'P']]


OPERATION_15 string : OUT_CONSTRUCT.into{IN_GRAPH_VIEW; IN_INDEX_1; IN_INDEX_2; IN_GRAPH_MAP}
OPERATION_15 origin : [['OUT_CONSTRUCT', 'P']]
OPERATION_15 gives  : [['IN_GRAPH_VIEW', 'P'], ['IN_INDEX_1', 'P'], ['IN_INDEX_2', 'P'], ['IN_GRAPH_MAP', 'P']]


OPERATION_16 string : IN_INDEX.into{IN_INDEX_1; IN_INDEX_2 }
OPERATION_16 origin : [['IN_INDEX', 'P']]
OPERATION_16 gives  : [['IN_INDEX_1', 'P'], ['IN_INDEX_2', 'P']]


OPERATION_17 string : XG_FILE.into{ XG_FILE_1; XG_FILE_2; XG_FILE_3}
OPERATION_17 origin : [['XG_FILE', 'P']]
OPERATION_17 gives  : [['XG_FILE_1', 'P'], ['XG_FILE_2', 'P'], ['XG_FILE_3', 'P']]


OPERATION_18 string : OUT_MAP.into{OUT_MAP_1; OUT_MAP_VIEW}
OPERATION_18 origin : [['OUT_MAP', 'P']]
OPERATION_18 gives  : [['OUT_MAP_1', 'P'], ['OUT_MAP_VIEW', 'P']]


OPERATION_19 string : OUT_MAP.into{ OUT_MAP_1; OUT_MAP_2}
OPERATION_19 origin : [['OUT_MAP', 'P']]
OPERATION_19 gives  : [['OUT_MAP_1', 'P'], ['OUT_MAP_2', 'P']]


OPERATION_20 string : GRAPH_AUG.into{ GRAPH_AUG_1; GRAPH_AUG_2 }
OPERATION_20 origin : [['GRAPH_AUG', 'P']]
OPERATION_20 gives  : [['GRAPH_AUG_1', 'P'], ['GRAPH_AUG_2', 'P']]


OPERATION_21 string : IN_VCF_PROCESS.into{ IN_VCF_PROCESS_1; IN_VCF_PROCESS_2}
OPERATION_21 origin : [['IN_VCF_PROCESS', 'P']]
OPERATION_21 gives  : [['IN_VCF_PROCESS_1', 'P'], ['IN_VCF_PROCESS_2', 'P']]


