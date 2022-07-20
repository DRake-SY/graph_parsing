OPERATION_1 string : QUERY_10X_DIR = Channel.fromPath(params.query_10x_dir)PROCESS DEF build_query_cds
OPERATION_1 origin : [['params.query_10x_dir', 'A']]
OPERATION_1 gives  : [['QUERY_10X_DIR', 'P']]


OPERATION_2 string : CLASSIFIERS = Channel.fromPath(params.classifiers).map{ f -> tuple("${f.simpleName}", f) } PROCESS DEF run_garnett_predictions
OPERATION_2 origin : [['params.classifiers', 'A']]
OPERATION_2 gives  : [['CLASSIFIERS', 'P']]


OPERATION_3 string : GARNETT_LABELS_DIR.view()
OPERATION_3 origin : [['GARNETT_LABELS_DIR', 'P']]
OPERATION_3 gives  : []


