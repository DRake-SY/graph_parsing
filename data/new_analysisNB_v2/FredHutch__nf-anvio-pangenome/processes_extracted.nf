Name : parseSampleSheet
Inputs : []
Outputs : [[0, 'sample_sheet_ch'], [0, 'sample_sheet_to_parse']]
Emits : []


Name : makeGenomeDB
Inputs : [[0, 'sample_sheet_ch']]
Outputs : [[0, 'genomeDB_ch'], [0, 'nameDB_ch'], [0, 'aniDB_ch']]
Emits : []


Name : setupNCBIcogs
Inputs : []
Outputs : [[0, 'anvio_cogs_tar']]
Emits : []


Name : annotateGenes
Inputs : [[0, 'genomeDB_ch'], [1, 'anvio_cogs_tar']]
Outputs : [[0, 'annotatedDB']]
Emits : []


Name : linkGeneName
Inputs : [[0, 'nameDB_ch']]
Outputs : [[0, 'layer_txt_for_combineGenomes']]
Emits : []


Name : combineGenomes
Inputs : [[0, 'annotatedDB'], [1, 'layer_txt_for_combineGenomes']]
Outputs : [[0, 'combinedDB'], [1, 'external_genomes_for_ani']]
Emits : []


Name : panGenomeAnalysis
Inputs : [[0, 'combinedDB'], [1, 'params'], [2, 'params'], [3, 'params'], [4, 'params'], [5, 'params'], [6, 'params']]
Outputs : [[0, 'panGenome_for_addMetadata'], [0, 'panGenome_for_getSeqs']]
Emits : []


Name : getSequencesForGCs
Inputs : [[0, 'panGenome_for_getSeqs'], [1, 'combinedDB'], [2, 'params']]
Outputs : []
Emits : []


Name : addMetadata
Inputs : [[0, 'panGenome_for_addMetadata'], [1, 'combinedDB'], [2, 'sample_sheet_to_parse']]
Outputs : [[0, 'panGenome_for_enrichFunctions'], [0, 'panGenome_for_ani']]
Emits : []


Name : enrichFunctions
Inputs : [[0, 'panGenome_for_enrichFunctions'], [1, 'combinedDB'], [2, 'params']]
Outputs : []
Emits : []


Name : computeANI
Inputs : [[0, 'panGenome_for_ani'], [1, 'params'], [2, 'params'], [3, 'combinedDB'], [4, 'aniDB_ch'], [5, 'external_genomes_for_ani']]
Outputs : []
Emits : []


