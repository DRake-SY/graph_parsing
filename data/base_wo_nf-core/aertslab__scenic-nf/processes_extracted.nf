Name : GRNinference
Inputs : [[0, '1'], [1, 'tfs'], [2, 'expr']]
Outputs : [[0, 'grn'], [0, 'grn_save']]
Emits : []


Name : cisTarget
Inputs : [[0, 'expr'], [1, 'grn'], [2, 'featherDB'], [3, 'motifs']]
Outputs : [[0, 'regulons'], [0, 'regulons_save']]
Emits : []


Name : AUCell
Inputs : [[0, 'expr'], [1, 'regulons']]
Outputs : [[0, 'auc_mat']]
Emits : []


