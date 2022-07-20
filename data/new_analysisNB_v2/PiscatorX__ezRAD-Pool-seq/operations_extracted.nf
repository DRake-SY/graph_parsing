OPERATION_1 string : Channel.fromFilePairs(reads_pattern)
       .ifEmpty{ exit 1, "params.reads empty no reads found" }
       .into{raw_reads; raw_reads_trimgalore}
OPERATION_1 origin : [['reads_pattern', 'A']]
OPERATION_1 gives  : [['raw_reads', 'P'], ['raw_reads_trimgalore', 'P']]


OPERATION_2 string : raw_reads.map{ it  -> [ it[1][0], it[1][1]] }
         .set{ raw_reads_FastQC }
OPERATION_2 origin : [['raw_reads', 'P']]
OPERATION_2 gives  : [['raw_reads_FastQC', 'P']]


