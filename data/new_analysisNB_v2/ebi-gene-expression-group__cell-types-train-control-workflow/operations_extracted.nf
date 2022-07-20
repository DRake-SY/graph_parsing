OPERATION_1 string : UNIQUE_MATRIX_TYPES = Channel
                    .of(garnett_matrix_type,
                        scmap_cluster_matrix_type,
                        scmap_cell_matrix_type,
                        scpred_matrix_type)
                    .filter{ it != null }
                    .unique()
OPERATION_1 origin : [['garnett_matrix_type,\n                        scmap_cluster_matrix_type,\n                        scmap_cell_matrix_type,\n                        scpred_matrix_type', 'V']]
OPERATION_1 gives  : [['UNIQUE_MATRIX_TYPES', 'P']]


OPERATION_2 string : IMPORT_PARAMS = Channel
                .fromPath(params.data_import.training_datasets)
                .splitCsv(header:false, sep:",")
                .combine(UNIQUE_MATRIX_TYPES)
OPERATION_2 origin : [['UNIQUE_MATRIX_TYPES', 'P'], ['params.data_import.training_datasets', 'A']]
OPERATION_2 gives  : [['IMPORT_PARAMS', 'P']]


OPERATION_3 string : GARNETT_CLASSIFIER = Channel.empty()
OPERATION_3 origin : []
OPERATION_3 gives  : [['GARNETT_CLASSIFIER', 'P']]


OPERATION_4 string : SCPRED_CLASSIFIER = Channel.empty()
OPERATION_4 origin : []
OPERATION_4 gives  : [['SCPRED_CLASSIFIER', 'P']]


OPERATION_5 string : SCMAP_CLUSTER_CLASSIFIER = Channel.empty()
OPERATION_5 origin : []
OPERATION_5 gives  : [['SCMAP_CLUSTER_CLASSIFIER', 'P']]


OPERATION_6 string : SCMAP_CELL_CLASSIFIER = Channel.empty()
OPERATION_6 origin : []
OPERATION_6 gives  : [['SCMAP_CELL_CLASSIFIER', 'P']]


OPERATION_7 string : SINGLECELLNET_CLASSIFIER = Channel.empty()
OPERATION_7 origin : []
OPERATION_7 gives  : [['SINGLECELLNET_CLASSIFIER', 'P']]


OPERATION_8 string : TRAINING_DATA_UNMELT.set{ TRAINING_DATA_PROCESSED }
OPERATION_8 origin : [['TRAINING_DATA_UNMELT', 'P']]
OPERATION_8 gives  : [['TRAINING_DATA_PROCESSED', 'P']]


OPERATION_9 string : TRAINING_DATA.set{ TRAINING_DATA_PROCESSED }
OPERATION_9 origin : [['TRAINING_DATA', 'P']]
OPERATION_9 gives  : [['TRAINING_DATA_PROCESSED', 'P']]


OPERATION_10 string : TRAINING_DATA_PROCESSED.into{
    GARNETT_TRAINING_DATA
    SCMAP_CELL_TRAINING_DATA
    SCMAP_CLUSTER_TRAINING_DATA
    SCPRED_TRAINING_DATA
    SINGLECELLNET_TRAINING_DATA
}
OPERATION_10 origin : [['TRAINING_DATA_PROCESSED', 'P']]
OPERATION_10 gives  : []


OPERATION_11 string : GARNETT_FULL_DATA = N_CLUST_FILT.merge(GARNETT_TRAINING_DATA)
OPERATION_11 origin : [['N_CLUST_FILT', 'P'], ['GARNETT_TRAINING_DATA', 'P']]
OPERATION_11 gives  : [['GARNETT_FULL_DATA', 'P']]


OPERATION_12 string : GARNETT_FILTERED_DATA = GARNETT_FULL_DATA.filter{ it[5] == params.garnett.matrix_type }
OPERATION_12 origin : [['GARNETT_FULL_DATA', 'P']]
OPERATION_12 gives  : [['GARNETT_FILTERED_DATA', 'P']]


OPERATION_13 string : SCPRED_FILTERED_DATA = SCPRED_TRAINING_DATA.filter{ it[4] == params.scpred.matrix_type }
OPERATION_13 origin : [['SCPRED_TRAINING_DATA', 'P']]
OPERATION_13 gives  : [['SCPRED_FILTERED_DATA', 'P']]


OPERATION_14 string : SCMAP_CLUSTER_FILTERED_DATA = SCMAP_CLUSTER_TRAINING_DATA.filter{ it[4] == params.scmap_cluster.matrix_type }
OPERATION_14 origin : [['SCMAP_CLUSTER_TRAINING_DATA', 'P']]
OPERATION_14 gives  : [['SCMAP_CLUSTER_FILTERED_DATA', 'P']]


OPERATION_15 string : SCMAP_CELL_FILTERED_DATA = SCMAP_CELL_TRAINING_DATA.filter{ it[4] == params.scmap_cell.matrix_type }
OPERATION_15 origin : [['SCMAP_CELL_TRAINING_DATA', 'P']]
OPERATION_15 gives  : [['SCMAP_CELL_FILTERED_DATA', 'P']]


OPERATION_16 string : SINGLECELLNET_FILTERED_DATA = SINGLECELLNET_TRAINING_DATA.filter{ it[4] == params.singlecellnet.matrix_type }
OPERATION_16 origin : [['SINGLECELLNET_TRAINING_DATA', 'P']]
OPERATION_16 gives  : [['SINGLECELLNET_FILTERED_DATA', 'P']]


