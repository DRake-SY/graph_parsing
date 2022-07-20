OPERATION_1 string :  ch_qc_reads, ch_raw_reads = ch_input.into(2)
OPERATION_1 origin : [['ch_input', 'P']]
OPERATION_1 gives  : [['ch_qc_reads', 'P'], ['ch_raw_reads', 'P']]


OPERATION_2 string : ch_raw_reads.view()
OPERATION_2 origin : [['ch_raw_reads', 'P']]
OPERATION_2 gives  : []


