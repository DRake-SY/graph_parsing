OPERATION_1 string : ch_samples
    .splitCsv()
    .map { row -> tuple(row[0], row[1]) }
    .set { ch_biosamples }
OPERATION_1 origin : [['ch_samples', 'P']]
OPERATION_1 gives  : [['ch_biosamples', 'P']]


OPERATION_2 string : ch_biosamples
    .into { ch_biosamples1; ch_biosamples2 }
OPERATION_2 origin : [['ch_biosamples', 'P']]
OPERATION_2 gives  : [['ch_biosamples1', 'P'], ['ch_biosamples2', 'P']]


OPERATION_3 string : ch_run_name
    .into { ch_run_name1; ch_run_name2; ch_run_name3 }
OPERATION_3 origin : [['ch_run_name', 'P']]
OPERATION_3 gives  : [['ch_run_name1', 'P'], ['ch_run_name2', 'P'], ['ch_run_name3', 'P']]


