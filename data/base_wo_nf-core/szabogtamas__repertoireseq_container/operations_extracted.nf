OPERATION_1 string : Channel
    .fromFilePairs(params.input_folder + '/' + params.sample_prefix + '*_{1,2}.f*')
    .map{ [it[1][0], it[1][1], it[0]] }
    .set{ insamples }
OPERATION_1 origin : [["params.input_folder + '/' + params.sample_prefix + '*_{1,2}.f*'", 'A']]
OPERATION_1 gives  : [['insamples', 'P']]


OPERATION_2 string : Channel
    .fromPath(params.sample_metadata)
    .set{ sample_metafile }
OPERATION_2 origin : [['params.sample_metadata', 'A']]
OPERATION_2 gives  : [['sample_metafile', 'P']]


OPERATION_3 string : Channel
    .fromPath(params.report_template)
    .set{ report_template }
OPERATION_3 origin : [['params.report_template', 'A']]
OPERATION_3 gives  : [['report_template', 'P']]


OPERATION_4 string : tagged_repertoire_table
    .collectFile(name: 'merged_repertoire.txt', keepHeader: true, newLine: true)
    .set{ tagged_repertoire }
OPERATION_4 origin : [['tagged_repertoire_table', 'P']]
OPERATION_4 gives  : [['tagged_repertoire', 'P']]


