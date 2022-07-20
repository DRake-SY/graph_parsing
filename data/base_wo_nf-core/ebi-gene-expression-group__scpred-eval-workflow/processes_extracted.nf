Name : read_training_data
Inputs : [[0, 'TRAINING_DATA'], [1, 'TRAINING_METADATA']]
Outputs : [[0, 'TRAINING_SCE']]
Emits : []


Name : eval_train_test_split
Inputs : [[0, 'TRAIN_TEST_SPLIT']]
Outputs : [[0, 'EVAL_TRAINING_MATRIX'], [1, 'EVAL_TEST_MATRIX'], [2, 'EVAL_TRAINING_LABELS'], [3, 'EVAL_TEST_LABELS']]
Emits : []


Name : eval_eigen_decompose
Inputs : [[0, 'EVAL_TRAINING_MATRIX'], [1, 'EVAL_TRAINING_LABELS']]
Outputs : [[0, 'SCPRED_TRAINING_OBJECT']]
Emits : []


Name : eval_get_features
Inputs : [[0, 'SCPRED_TRAINING_OBJECT']]
Outputs : [[0, 'SCPRED_TRAINING_FEATURES']]
Emits : []


Name : eval_train_model
Inputs : [[0, 'SCPRED_TRAINING_FEATURES']]
Outputs : [[0, 'EVAL_TRAINED_MODEL']]
Emits : []


Name : eval_predict_labels
Inputs : [[0, 'EVAL_TRAINED_MODEL'], [1, 'EVAL_TEST_MATRIX'], [2, 'EVAL_TEST_LABELS']]
Outputs : []
Emits : []


Name : read_prediction_data
Inputs : [[0, 'PREDICTION_DATA']]
Outputs : [[0, 'PREDICTION_SCE']]
Emits : []


Name : pred_process_training_sce
Inputs : [[0, 'PROCESS_TRAIN_SCE']]
Outputs : [[0, 'PRED_TRAINING_MATRIX'], [1, 'PRED_TRAINING_LABELS']]
Emits : []


Name : pred_process_prediction_sce
Inputs : [[0, 'PREDICTION_SCE']]
Outputs : [[0, 'PREDICTION_MAT']]
Emits : []


Name : pred_eigen_decompose
Inputs : [[0, 'PRED_TRAINING_MATRIX'], [1, 'PRED_TRAINING_LABELS']]
Outputs : [[0, 'PRED_TRAINING_OBJECT']]
Emits : []


Name : pred_get_features
Inputs : [[0, 'PRED_TRAINING_OBJECT']]
Outputs : [[0, 'PRED_TRAINING_FEATURES']]
Emits : []


Name : pred_train_model
Inputs : [[0, 'PRED_TRAINING_FEATURES']]
Outputs : [[0, 'PRED_TRAINED_MODEL'], [1, 'PRED_TRAIN_PROBS']]
Emits : []


Name : pred_predict_labels
Inputs : [[0, 'PRED_TRAINED_MODEL'], [1, 'PREDICTION_MAT']]
Outputs : [[0, 'PRED_MODEL_PREDICTIONS']]
Emits : []


Name : get_pred_output
Inputs : [[0, 'PRED_MODEL_PREDICTIONS'], [1, 'PRED_TRAINED_MODEL']]
Outputs : [[0, 'FINAL_TABLE']]
Emits : []


