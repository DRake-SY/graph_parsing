OPERATION_1 string : PRED_LABELS_DIR = Channel.fromPath(params.input_dir).first()
OPERATION_1 origin : [['params.input_dir', 'A']]
OPERATION_1 gives  : [['PRED_LABELS_DIR', 'P']]


OPERATION_2 string : REF_LABELS_FILE = Channel.fromPath(params.ref_labels_file).first()
OPERATION_2 origin : [['params.ref_labels_file', 'A']]
OPERATION_2 gives  : [['REF_LABELS_FILE', 'P']]


OPERATION_3 string : ONTOLOGY_GRAPH = Channel.fromPath(params.ontology_graph).first()
OPERATION_3 origin : [['params.ontology_graph', 'A']]
OPERATION_3 gives  : [['ONTOLOGY_GRAPH', 'P']]


