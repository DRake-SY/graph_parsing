OPERATION_1 string : oldGenome = Channel.fromPath(params.oldFasta)
OPERATION_1 origin : [['params.oldFasta', 'A']]
OPERATION_1 gives  : [['oldGenome', 'P']]


OPERATION_2 string : newGenome = Channel.fromPath(params.newFasta)
OPERATION_2 origin : [['params.newFasta', 'A']]
OPERATION_2 gives  : [['newGenome', 'P']]


OPERATION_3 string : gffFiles_ch = Channel.fromPath(gffFiles).flatten()
OPERATION_3 origin : [['gffFiles', 'A']]
OPERATION_3 gives  : [['gffFiles_ch', 'P']]


OPERATION_4 string : gffFiles_ch.into{ gffFile_1 ; gffFile_2 ; gffFile_3 }
OPERATION_4 origin : [['gffFiles_ch', 'P']]
OPERATION_4 gives  : [['gffFile_1', 'P'], ['gffFile_2', 'P'], ['gffFile_3', 'P']]


OPERATION_5 string : oldGenome.into { oldGenome_1 ; oldGenome_2 ; oldGenome_3 ; oldGenome_4 }
OPERATION_5 origin : [['oldGenome', 'P']]
OPERATION_5 gives  : [['oldGenome_1', 'P'], ['oldGenome_2', 'P'], ['oldGenome_3', 'P'], ['oldGenome_4', 'P']]


OPERATION_6 string : newGenome.into { newGenome_1 ; newGenome_2 ; newGenome_3 }
OPERATION_6 origin : [['newGenome', 'P']]
OPERATION_6 gives  : [['newGenome_1', 'P'], ['newGenome_2', 'P'], ['newGenome_3', 'P']]


OPERATION_7 string : newGenome_2.splitFasta(by:params.recordSplit,file:true).set{fastaChunks}
OPERATION_7 origin : [['newGenome_2', 'P']]
OPERATION_7 gives  : [['fastaChunks', 'P']]


OPERATION_8 string : old_2bit.into{ old_2bit_1 ; old_2bit_2 }
OPERATION_8 origin : [['old_2bit', 'P']]
OPERATION_8 gives  : [['old_2bit_1', 'P'], ['old_2bit_2', 'P']]


OPERATION_9 string : subsplitFasta_liftUp.map{ values ->
 subChunks = values[2].splitFasta(by:params.splitDepth,file:true)                                                      
 return tuple(values[0],values[1],subChunks)}.transpose().set{ subFastaChunks }
OPERATION_9 origin : [['subsplitFasta_liftUp', 'P']]
OPERATION_9 gives  : [['subFastaChunks', 'P']]


OPERATION_10 string : subFastaChunks.combine(old_2bit_1).combine(ooc).set{blatCmds}
OPERATION_10 origin : [['subFastaChunks', 'P'], ['old_2bit_1', 'P'], ['ooc', 'P']]
OPERATION_10 gives  : [['blatCmds', 'P']]


OPERATION_11 string : gffFile_1.combine(oldGenome_4).set{normalizeCmds}
OPERATION_11 origin : [['gffFile_1', 'P'], ['oldGenome_4', 'P']]
OPERATION_11 gives  : [['normalizeCmds', 'P']]


OPERATION_12 string : normalizedGff.combine(liftOverFile_2).set{ liftoverCmds }
OPERATION_12 origin : [['normalizedGff', 'P'], ['liftOverFile_2', 'P']]
OPERATION_12 gives  : [['liftoverCmds', 'P']]


