OPERATION_1 string : UNIQUE_MATRIX_TYPES = Channel.of(
				garnett_matrix_type,
	                        scmap_cluster_matrix_type,
	                        scmap_cell_matrix_type,
	                        scpred_matrix_type)
	                    .filter{ it != null }
	                    .unique()
OPERATION_1 origin : [['garnett_matrix_type,\n\t                        scmap_cluster_matrix_type,\n\t                        scmap_cell_matrix_type,\n\t                        scpred_matrix_type', 'V']]
OPERATION_1 gives  : [['UNIQUE_MATRIX_TYPES', 'P']]


OPERATION_2 string : IMPORT_PARAMS = Channel
	                .fromPath(params.data_import.training_datasets)
	                .splitCsv(header:false, sep:",")
	                .combine(UNIQUE_MATRIX_TYPES)
OPERATION_2 origin : [['UNIQUE_MATRIX_TYPES', 'P'], ['params.data_import.training_datasets', 'A']]
OPERATION_2 gives  : [['IMPORT_PARAMS', 'P']]


OPERATION_3 string : MANUAL_INPUT_DATA = Channel.fromPath("${params.input_data}/*")
OPERATION_3 origin : [['"${params.input_data}/*"', 'A']]
OPERATION_3 gives  : [['MANUAL_INPUT_DATA', 'P']]


OPERATION_4 string : BARCODE_COL = Channel.from(params.metadata.query_barcode_col_name).first()
OPERATION_4 origin : [['params.metadata.query_barcode_col_name', 'V']]
OPERATION_4 gives  : [['BARCODE_COL', 'P']]


OPERATION_5 string : CELL_LABEL_COL = Channel.from(params.metadata.query_label_col_name).first()
OPERATION_5 origin : [['params.metadata.query_label_col_name', 'V']]
OPERATION_5 gives  : [['CELL_LABEL_COL', 'P']]


OPERATION_6 string : GARNETT_OUTPUT = Channel.empty()
OPERATION_6 origin : []
OPERATION_6 gives  : [['GARNETT_OUTPUT', 'P']]


OPERATION_7 string : SCMAP_CELL_OUTPUT = Channel.empty()
OPERATION_7 origin : []
OPERATION_7 gives  : [['SCMAP_CELL_OUTPUT', 'P']]


OPERATION_8 string : SCMAP_CLUST_OUTPUT = Channel.empty()
OPERATION_8 origin : []
OPERATION_8 gives  : [['SCMAP_CLUST_OUTPUT', 'P']]


OPERATION_9 string : SCPRED_OUTPUT = Channel.empty()
OPERATION_9 origin : []
OPERATION_9 gives  : [['SCPRED_OUTPUT', 'P']]


OPERATION_10 string : TRAINING_DATA_UNMELT.set{ TRAINING_DATA_PROCESSED }
OPERATION_10 origin : [['TRAINING_DATA_UNMELT', 'P']]
OPERATION_10 gives  : [['TRAINING_DATA_PROCESSED', 'P']]


OPERATION_11 string : TRAINING_DATA.set{ TRAINING_DATA_PROCESSED }
OPERATION_11 origin : [['TRAINING_DATA', 'P']]
OPERATION_11 gives  : [['TRAINING_DATA_PROCESSED', 'P']]


OPERATION_12 string : TRAINING_DATA_PROCESSED.into{
	    GARNETT_DATA
	    SCMAP_CELL_DATA
	    SCMAP_CLUSTER_DATA
	    SCPRED_DATA
	}
OPERATION_12 origin : [['TRAINING_DATA_PROCESSED', 'P']]
OPERATION_12 gives  : []


OPERATION_13 string : GARNETT_FULL_DATA = GARNETT_DATA.merge(N_CLUST)
OPERATION_13 origin : [['GARNETT_DATA', 'P'], ['N_CLUST', 'P']]
OPERATION_13 gives  : [['GARNETT_FULL_DATA', 'P']]


OPERATION_14 string : MANUAL_INPUT_DATA.map{it -> tuple(it, it.getBaseName().toString().split('\\.')[0], it.getBaseName().toString().split('\\.')[2] ) }.set{ZIP_FILES}
OPERATION_14 origin : [['MANUAL_INPUT_DATA', 'P']]
OPERATION_14 gives  : [['ZIP_FILES', 'P']]


OPERATION_15 string : ZIP_FILES.groupTuple(by:[1, 2]).map{it -> tuple(it[0][0], it[0][1], it[1], it[2]) }.set{GROUPED_DATA}
OPERATION_15 origin : [['ZIP_FILES', 'P']]
OPERATION_15 gives  : [['GROUPED_DATA', 'P']]


OPERATION_16 string : MARKERS.map{it -> it.getBaseName().toString().split('\\_')[2] }.first().set{N_CLUST}
OPERATION_16 origin : [['MARKERS', 'P']]
OPERATION_16 gives  : [['N_CLUST', 'P']]


OPERATION_17 string : DATA.into{
	    GARNETT_DATA
	    SCMAP_CELL_DATA
	    SCMAP_CLUSTER_DATA
	    SCPRED_DATA
	}
OPERATION_17 origin : [['DATA', 'P']]
OPERATION_17 gives  : []


OPERATION_18 string : GARNETT_FULL_DATA = GARNETT_DATA.merge(N_CLUST)
OPERATION_18 origin : [['GARNETT_DATA', 'P'], ['N_CLUST', 'P']]
OPERATION_18 gives  : [['GARNETT_FULL_DATA', 'P']]


OPERATION_19 string : GARNETT_FILTERED_DATA = GARNETT_FULL_DATA.filter{ it[5] == params.garnett.matrix_type }
OPERATION_19 origin : [['GARNETT_FULL_DATA', 'P']]
OPERATION_19 gives  : [['GARNETT_FILTERED_DATA', 'P']]


OPERATION_20 string : SCMAP_CELL_FILTERED_DATA = SCMAP_CELL_DATA.filter{ it[5] == params.scmap_cell.matrix_type }
OPERATION_20 origin : [['SCMAP_CELL_DATA', 'P']]
OPERATION_20 gives  : [['SCMAP_CELL_FILTERED_DATA', 'P']]


OPERATION_21 string : SCMAP_CLUSTER_FILTERED_DATA = SCMAP_CLUSTER_DATA.filter{ it[5] == params.scmap_cluster.matrix_type }
OPERATION_21 origin : [['SCMAP_CLUSTER_DATA', 'P']]
OPERATION_21 gives  : [['SCMAP_CLUSTER_FILTERED_DATA', 'P']]


OPERATION_22 string : SCPRED_FILTERED_DATA = SCPRED_DATA.filter{ it[5] == params.scpred.matrix_type }
OPERATION_22 origin : [['SCPRED_DATA', 'P']]
OPERATION_22 gives  : [['SCPRED_FILTERED_DATA', 'P']]


OPERATION_23 string : ALL_RESULTS = GARNETT_OUTPUT
    .concat(SCMAP_CLUST_OUTPUT)
    .concat(SCMAP_CELL_OUTPUT)
    .concat(SCPRED_OUTPUT)
OPERATION_23 origin : [['GARNETT_OUTPUT', 'P'], ['SCMAP_CLUST_OUTPUT', 'P'], ['SCMAP_CELL_OUTPUT', 'P'], ['SCPRED_OUTPUT', 'P']]
OPERATION_23 gives  : [['ALL_RESULTS', 'P']]


