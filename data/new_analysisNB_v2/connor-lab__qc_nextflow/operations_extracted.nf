OPERATION_1 string : Channel.fromFilePairs( "${fastqGlob}" , flat: true)
       .set{ ch_inputReads }
OPERATION_1 origin : [['"${fastqGlob}" , flat: true', 'A']]
OPERATION_1 gives  : [['ch_inputReads', 'P']]


OPERATION_2 string : Channel.fromPath( "${centrifugeDbUri}".replace("file:\\/\\/", "") )
           .set{ ch_centrifugeDbUri }
OPERATION_2 origin : [['"${centrifugeDbUri}".replace("file:\\\\/\\\\/", ""', 'A']]
OPERATION_2 gives  : [['ch_centrifugeDbUri', 'P']]


OPERATION_3 string : Channel.from( "${ centrifugeDbUri }" )
           .set{ ch_centrifugeDbUri }
OPERATION_3 origin : []
OPERATION_3 gives  : [['ch_centrifugeDbUri', 'P']]


OPERATION_4 string : Channel.fromPath( "${humanGenomeFastaUri}".replace("file:\\/\\/", "") )
           .set{ ch_humanGenomeUri }
OPERATION_4 origin : [['"${humanGenomeFastaUri}".replace("file:\\\\/\\\\/", ""', 'A']]
OPERATION_4 gives  : [['ch_humanGenomeUri', 'P']]


OPERATION_5 string : Channel.from( "${ humanGenomeFastaUri }" )
           .set{ ch_humanGenomeUri }
OPERATION_5 origin : []
OPERATION_5 gives  : [['ch_humanGenomeUri', 'P']]


OPERATION_6 string : Channel.from( "taxonomy" )
       .set{ ch_kronaDummy }
OPERATION_6 origin : [['"taxonomy"', 'V']]
OPERATION_6 gives  : [['ch_kronaDummy', 'P']]


