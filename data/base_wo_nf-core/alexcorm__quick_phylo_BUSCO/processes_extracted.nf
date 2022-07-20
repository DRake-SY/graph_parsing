Name : busco
Inputs : [[0, 'genomesFasta']]
Outputs : [[0, 'busco_summary_results'], [1, 'busco_single_copy_proteins']]
Emits : []


Name : concat_busco
Inputs : [[0, 'busco_single_copy_proteins']]
Outputs : [[0, 'busco_single_copy_proteins_concat']]
Emits : []


Name : filter_single_copy
Inputs : [[0, 'busco_single_copy_proteins_concat']]
Outputs : [[0, 'busco_single_copy_proteins_list']]
Emits : []


Name : seqtk
Inputs : [[0, 'busco_single_copy_proteins_list'], [1, 'busco_single_copy_proteins_concat']]
Outputs : [[0, 'busco_single_copy_proteins_toMafft']]
Emits : []


Name : mafft
Inputs : [[0, 'busco_single_copy_proteins_toMafft']]
Outputs : [[0, 'busco_single_copy_proteins_toGblocks']]
Emits : []


Name : gblocks
Inputs : [[0, 'busco_single_copy_proteins_toGblocks']]
Outputs : [[0, 'busco_single_copy_proteins_toCleanHeader']]
Emits : []


Name : cleanHeader
Inputs : [[0, 'busco_single_copy_proteins_toCleanHeader']]
Outputs : [[0, 'busco_single_copy_proteins_toFASconCAT']]
Emits : []


Name : FASconCAT
Inputs : [[0, 'busco_single_copy_proteins_toFASconCAT']]
Outputs : [[0, 'busco_single_copy_proteins_toProTest']]
Emits : []


Name : ProtTest
Inputs : [[0, 'busco_single_copy_proteins_toProTest']]
Outputs : [[0, 'busco_single_copy_proteins_toProTestResult']]
Emits : []


