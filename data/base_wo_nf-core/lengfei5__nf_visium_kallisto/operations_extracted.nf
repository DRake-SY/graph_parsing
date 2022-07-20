OPERATION_1 string : R1files = Channel
    .from(params.reads.tokenize())
    .flatMap{ files(it) }
    .filter{it =~ /.*R1.*/}
    .toSortedList()
    .flatten()
OPERATION_1 origin : []
OPERATION_1 gives  : [['R1files', 'P']]


OPERATION_2 string : R2files = Channel
    .from(params.reads.tokenize())
    .flatMap{ files(it) }
    .filter{it =~ /.*R2.*/}
    .toSortedList()
    .flatten()
OPERATION_2 origin : []
OPERATION_2 gives  : [['R2files', 'P']]


OPERATION_3 string : Channel.fromPath(params.reads)
        .set{batch_kal}
OPERATION_3 origin : [['params.reads', 'A']]
OPERATION_3 gives  : [['batch_kal', 'P']]


OPERATION_4 string : Channel.fromPath(params.white)
        .set{bc_wl_kal}
OPERATION_4 origin : [['params.white', 'A']]
OPERATION_4 gives  : [['bc_wl_kal', 'P']]


OPERATION_5 string : Channel.fromPath(params.t2g)
        .set{t2g_kal}
OPERATION_5 origin : [['params.t2g', 'A']]
OPERATION_5 gives  : [['t2g_kal', 'P']]


OPERATION_6 string : Channel.fromPath(params.t2g)
        .set{t2g_plate}
OPERATION_6 origin : [['params.t2g', 'A']]
OPERATION_6 gives  : [['t2g_plate', 'P']]


OPERATION_7 string : R1files
    .merge(R2files){ a, b -> tuple(a,b) }
    .flatten()
    .view()
    .set{read_files_kallisto}
OPERATION_7 origin : [['R1files', 'P'], ['R2files', 'P']]
OPERATION_7 gives  : [['read_files_kallisto', 'P']]


