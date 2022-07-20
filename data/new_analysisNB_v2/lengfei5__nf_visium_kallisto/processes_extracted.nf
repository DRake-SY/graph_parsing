Name : starting
Inputs : []
Outputs : []
Emits : []


Name : index
Inputs : [[0, 'transcriptome_file']]
Outputs : [[0, 'transcriptome_index']]
Emits : []


Name : pseudoalPlate
Inputs : [[0, 'transcriptome_index'], [1, 'batch_kal']]
Outputs : [[0, 'kallisto_pseudo']]
Emits : []


Name : pseudoal
Inputs : [[0, 'transcriptome_index'], [1, 'read_files_kallisto']]
Outputs : [[0, 'kallisto_bus_to_sort']]
Emits : []


Name : corrsort
Inputs : [[0, 'kallisto_bus_to_sort'], [1, 'bc_wl_kal']]
Outputs : [[1, 'kal_sort_to_count'], [2, 'kal_sort_to_umi']]
Emits : []


Name : umicounts
Inputs : [[0, 'kal_sort_to_umi']]
Outputs : [[0, 'kallisto_umic']]
Emits : []


Name : countbus
Inputs : [[0, 'kal_sort_to_count'], [1, 't2g_kal']]
Outputs : [[1, 'kallisto_count']]
Emits : []


Name : getTissue
Inputs : []
Outputs : []
Emits : []


Name : makeSeuratPlate
Inputs : [[0, 'kallisto_pseudo'], [1, 't2g_plate']]
Outputs : []
Emits : []


Name : makeSeurat10x
Inputs : [[0, 'kallisto_count'], [1, 'kallisto_umic']]
Outputs : []
Emits : []


Name : makeSeuratVisium
Inputs : [[0, 'kallisto_count'], [1, 'kallisto_umic']]
Outputs : []
Emits : []


