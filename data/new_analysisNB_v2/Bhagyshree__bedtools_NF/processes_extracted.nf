Name : sortBED
Inputs : [[0, 'bedfiles']]
Outputs : [[0, 'sorted_bed']]
Emits : []


Name : avg_feature
Inputs : [[0, 'sorted_bed'], [1, 'featurefiles']]
Outputs : [[0, 'feature_results']]
Emits : []


