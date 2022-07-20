OPERATION_1 string : Channel
    .fromPath(params.list_run_ids)
    .splitCsv(header: true, sep: "\t")
    .map{ 
        [it.Sample_ID, it.Run_ID]
    }
    .into{run_ids; run_ids_}
OPERATION_1 origin : [['params.list_run_ids', 'A']]
OPERATION_1 gives  : [['run_ids', 'P'], ['run_ids_', 'P']]


OPERATION_2 string : run_ids_.println()
OPERATION_2 origin : [['run_ids_', 'P']]
OPERATION_2 gives  : []


