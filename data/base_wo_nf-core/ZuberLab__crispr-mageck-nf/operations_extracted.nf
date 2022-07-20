OPERATION_1 string : Channel
    .fromPath( params.contrasts )
    .splitCsv(sep: '\t', header: true)
    .set { contrastsMageck }
OPERATION_1 origin : [['params.contrasts', 'A']]
OPERATION_1 gives  : [['contrastsMageck', 'P']]


OPERATION_2 string : Channel
    .fromPath( params.counts )
    .set { countsMageck }
OPERATION_2 origin : [['params.counts', 'A']]
OPERATION_2 gives  : [['countsMageck', 'P']]


OPERATION_3 string : Channel
    .fromPath( params.cnv )
    .set { cnvMageck }
OPERATION_3 origin : [['params.cnv', 'A']]
OPERATION_3 gives  : [['cnvMageck', 'P']]


