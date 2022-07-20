Name : pairReads
Inputs : [[0, 'raw_reads']]
Outputs : [[0, 'pair_reads']]
Emits : []


Name : splitKmerReads
Inputs : [[0, 'pair_reads']]
Outputs : [[0, 'split_to_align'], [0, 'split_to_compare']]
Emits : []


Name : alignSplitFile
Inputs : [[0, 'split_to_align']]
Outputs : [[0, 'alignment']]
Emits : []


Name : iqTree
Inputs : [[0, 'alignment']]
Outputs : [[0, 'tree_file']]
Emits : []


Name : rCode
Inputs : [[0, 'tree_file']]
Outputs : []
Emits : []


Name : skaCompare
Inputs : [[0, 'split_to_compare']]
Outputs : [[0, 'split_distances']]
Emits : []


Name : jsonify
Inputs : [[0, 'split_distances']]
Outputs : []
Emits : []


