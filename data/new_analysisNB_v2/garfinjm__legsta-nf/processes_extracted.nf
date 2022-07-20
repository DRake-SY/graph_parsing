Name : runSeqyclean
Inputs : [[0, 'readsQueue']]
Outputs : [[0, 'cleanreadsQueue']]
Emits : []


Name : runShovill
Inputs : [[0, 'cleanreadsQueue']]
Outputs : [[0, 'quastQueue'], [0, 'legstaQueue']]
Emits : []


Name : runQuast
Inputs : [[0, 'quastQueue']]
Outputs : [[0, 'quastResults'], [1, 'quastReports']]
Emits : []


Name : runLegsta
Inputs : [[0, 'legstaQueue']]
Outputs : [[0, 'legstaResults']]
Emits : []


