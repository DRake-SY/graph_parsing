OPERATION_1 string : bams = Channel.fromPath(correspondance).splitCsv(header: true, sep: '\t', strip: true)
                .map{row -> [ row.ID, file(params.input_folder + "/" +row.tumor), file(params.input_folder + "/" +row.tumor+'.bai'),
                              file(params.input_folder + "/" +row.normal), file(params.input_folder + "/" +row.normal+'.bai')]}
OPERATION_1 origin : [['correspondance', 'A']]
OPERATION_1 gives  : [['bams', 'P']]


