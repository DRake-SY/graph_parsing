Name : convertFAto2bit_old
Inputs : [[0, 'oldGenome_1']]
Outputs : [[0, 'old_2bit']]
Emits : []


Name : constructOocFile
Inputs : [[0, 'old_2bit_2']]
Outputs : [[0, 'ooc']]
Emits : []


Name : subRecordChunks
Inputs : [[0, 'fastaChunks']]
Outputs : [[0, 'subsplitFasta_liftUp']]
Emits : []


Name : blat_align
Inputs : [[0, 'blatCmds']]
Outputs : [[0, 'axtChainCmds']]
Emits : []


Name : axtChain
Inputs : [[0, 'axtChainCmds'], [1, 'oldGenome_3'], [2, 'newGenome_3']]
Outputs : [[0, 'chains']]
Emits : []


Name : chainSortFirst
Inputs : [[0, 'chains']]
Outputs : [[0, 'sorted_chains']]
Emits : []


Name : chainMergeSort_chainSplit
Inputs : [[0, 'sorted_chains']]
Outputs : [[0, 'sortMergedChains']]
Emits : []


Name : chainSortSecond
Inputs : [[0, 'sortMergedChains']]
Outputs : [[0, 'allSortedChain_1'], [0, 'allSortedChain_2']]
Emits : []


Name : calculateChromInfo
Inputs : [[0, 'oldGenome_2'], [1, 'newGenome_1']]
Outputs : [[0, 'chromInfos']]
Emits : []


Name : chainNet
Inputs : [[0, 'allSortedChain_1'], [1, 'chromInfos']]
Outputs : [[0, 'netFile']]
Emits : []


Name : produceLiftOverFile
Inputs : [[0, 'netFile'], [1, 'allSortedChain_2']]
Outputs : [[0, 'liftOverFile_1'], [0, 'liftOverFile_2']]
Emits : []


Name : crossmap_liftover
Inputs : [[0, 'gffFile_3'], [1, 'liftOverFile_1']]
Outputs : [[0, 'crossmap_lifted_gff']]
Emits : []


Name : normalizeGff
Inputs : [[0, 'normalizeCmds']]
Outputs : [[0, 'normalizedGff']]
Emits : []


Name : ucsc_liftover
Inputs : [[0, 'liftoverCmds']]
Outputs : [[0, 'gffOriginal'], [1, 'ucsc_lifted_gff'], [1, 'ucsc_lifted_gff_ch2'], [2, 'unmapped_gff'], [2, 'unmapped_gff_ch2']]
Emits : []


Name : rescue_unlifted_features
Inputs : [[0, 'gffOriginal'], [1, 'ucsc_lifted_gff_ch2'], [2, 'unmapped_gff_ch2']]
Outputs : [[0, 'rescuedGff']]
Emits : []


Name : sort_gff
Inputs : [[0, 'ucsc_lifted_gff'], [1, 'unmapped_gff'], [2, 'rescuedGff']]
Outputs : [[0, 'final_gff']]
Emits : []


Name : compare_gffs
Inputs : [[0, 'gffFile_2'], [1, 'final_gff']]
Outputs : []
Emits : []


