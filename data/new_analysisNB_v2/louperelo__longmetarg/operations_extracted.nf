OPERATION_1 string : in_ch = Channel.fromPath(params.input)
               .into{in_qc; in_flye; in_align; in_analysis} 
OPERATION_1 origin : [['params.input', 'A']]
OPERATION_1 gives  : [['in_ch', 'P'], ['in_qc', 'P'], ['in_flye', 'P'], ['in_align', 'P'], ['in_analysis', 'P']]


