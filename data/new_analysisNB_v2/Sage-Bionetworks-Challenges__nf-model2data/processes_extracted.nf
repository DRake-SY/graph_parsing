Name : get_submission
Inputs : [[1, 'params']]
Outputs : [[0, 'submission']]
Emits : []


Name : run_docker
Inputs : [[0, 'submission'], [1, 'params']]
Outputs : [[0, 'prediction']]
Emits : []


Name : validate
Inputs : [[0, 'prediction']]
Outputs : [[0, 'validated']]
Emits : []


Name : score
Inputs : [[0, 'validated'], [1, 'prediction']]
Outputs : [[0, 'scores']]
Emits : []


