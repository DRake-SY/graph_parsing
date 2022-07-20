OPERATION_1 string : TRAINING_DATA = Channel.fromPath(params.training_10x_dir)
OPERATION_1 origin : [['params.training_10x_dir', 'A']]
OPERATION_1 gives  : [['TRAINING_DATA', 'P']]


OPERATION_2 string : TRAINING_METADATA = Channel.fromPath(params.metadata_file)PROCESS DEF read_training_data
OPERATION_2 origin : [['params.metadata_file', 'A']]
OPERATION_2 gives  : [['TRAINING_METADATA', 'P']]


OPERATION_3 string : TRAIN_TEST_SPLIT = Channel.create()
OPERATION_3 origin : []
OPERATION_3 gives  : [['TRAIN_TEST_SPLIT', 'P']]


OPERATION_4 string : PROCESS_TRAIN_SCE = Channel.create()
OPERATION_4 origin : []
OPERATION_4 gives  : [['PROCESS_TRAIN_SCE', 'P']]


OPERATION_5 string : PREDICTION_DATA = Channel.create()
OPERATION_5 origin : []
OPERATION_5 gives  : [['PREDICTION_DATA', 'P']]


OPERATION_6 string : PREDICTION_DATA = Channel.fromPath(params.prediction_10x_dir)
OPERATION_6 origin : [['params.prediction_10x_dir', 'A']]
OPERATION_6 gives  : [['PREDICTION_DATA', 'P']]


OPERATION_7 string : TRAINING_SCE.choice(TRAIN_TEST_SPLIT, PROCESS_TRAIN_SCE){channels[method]}
OPERATION_7 origin : [['TRAINING_SCE', 'P']]
OPERATION_7 gives  : [['TRAIN_TEST_SPLIT', 'P'], ['PROCESS_TRAIN_SCE', 'P']]


