OPERATION_1 string : Channel.fromFilePairs(params.reads).into{reads_ch; reads_ch2}
OPERATION_1 origin : [['params.reads', 'A']]
OPERATION_1 gives  : [['reads_ch', 'P'], ['reads_ch2', 'P']]


OPERATION_2 string : _fastqc.{zip,html}" into results_qual_ch
OPERATION_2 origin : [['_fastqc', 'P']]
OPERATION_2 gives  : []


