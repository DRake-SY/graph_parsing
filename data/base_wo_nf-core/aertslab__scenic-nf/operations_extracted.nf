OPERATION_1 string : featherDB = Channel
    .fromPath( params.db )
    .collect()                                             
OPERATION_1 origin : [['params.db', 'A']]
OPERATION_1 gives  : [['featherDB', 'P']]


OPERATION_2 string : n = Channel.fromPath(params.db).count().get()
OPERATION_2 origin : [['params.db', 'A']]
OPERATION_2 gives  : [['n', 'P']]


OPERATION_3 string : Channel
        .fromPath(it)
        .collectFile(name: "${filename}.${ext}", storeDir: outDir)
OPERATION_3 origin : [['it', 'A']]
OPERATION_3 gives  : []


OPERATION_4 string : grn_save.subscribe {
    save(it)
}
OPERATION_4 origin : [['grn_save', 'P']]
OPERATION_4 gives  : []


OPERATION_5 string : regulons_save.subscribe {
    save(it)
}
OPERATION_5 origin : [['regulons_save', 'P']]
OPERATION_5 gives  : []


OPERATION_6 string : auc_mat.subscribe {
    save(it)
}
OPERATION_6 origin : [['auc_mat', 'P']]
OPERATION_6 gives  : []


