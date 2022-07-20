OPERATION_1 string : UNIQUE_MATRIX_TYPES = Channel.of(
		garnett_matrix_type,
		scmap_cluster_matrix_type,
		scmap_cell_matrix_type,
		scpred_matrix_type)
		.filter{ it != null }
		.unique()
OPERATION_1 origin : [['garnett_matrix_type,\n\t\tscmap_cluster_matrix_type,\n\t\tscmap_cell_matrix_type,\n\t\tscpred_matrix_type', 'V']]
OPERATION_1 gives  : [['UNIQUE_MATRIX_TYPES', 'P']]


OPERATION_2 string : IMPORT_PARAMS = Channel
                .fromPath(params.download_data.import_datasets)
                .splitCsv(header:false, sep:",")
                .combine(UNIQUE_MATRIX_TYPES)
OPERATION_2 origin : [['UNIQUE_MATRIX_TYPES', 'P'], ['params.download_data.import_datasets', 'A']]
OPERATION_2 gives  : [['IMPORT_PARAMS', 'P']]


OPERATION_3 string : BARCODES_FOLDS = BARCODES.first()  
OPERATION_3 origin : [['BARCODES', 'P']]
OPERATION_3 gives  : [['BARCODES_FOLDS', 'P']]


OPERATION_4 string : DATASET_ID = DATA_ID.first()
OPERATION_4 origin : [['DATA_ID', 'P']]
OPERATION_4 gives  : [['DATASET_ID', 'P']]


OPERATION_5 string : K_FOLD_CELL_INDEXES
	.flatten()
	.map{ f -> tuple("${f}".split("\\.")[1], f) }
	.set{FOLDS}
OPERATION_5 origin : [['K_FOLD_CELL_INDEXES', 'P']]
OPERATION_5 gives  : [['FOLDS', 'P']]


OPERATION_6 string : FOLD_DATA = FOLDS.combine(FETCH_DATA_UNMELT)
OPERATION_6 origin : [['FOLDS', 'P'], ['FETCH_DATA_UNMELT', 'P']]
OPERATION_6 gives  : [['FOLD_DATA', 'P']]


OPERATION_7 string : GROUPED_DATA = SPLIT_DATA.groupTuple(by:[0, 1])
OPERATION_7 origin : [['SPLIT_DATA', 'P']]
OPERATION_7 gives  : [['GROUPED_DATA', 'P']]


