OPERATION_1 string : Channel
      .fromPath(params.query)
      .splitFasta(by: params.chunkSize, file: true)
      .set { queryFile_ch }
OPERATION_1 origin : [['params.query', 'A']]
OPERATION_1 gives  : [['queryFile_ch', 'P']]


OPERATION_2 string : genomefile_ch = Channel
                  .fromPath(params.genome)
                  .map { file -> tuple(file.simpleName, file.parent, file) }
OPERATION_2 origin : [['params.genome', 'A']]
OPERATION_2 gives  : [['genomefile_ch', 'P']]


OPERATION_3 string : Channel
      .fromPath(params.dbDir)
      .set{dbDir_ch}
OPERATION_3 origin : [['params.dbDir', 'A']]
OPERATION_3 gives  : [['dbDir_ch', 'P']]


OPERATION_4 string : Channel
   .from(params.dbName)
   .set{dbName_ch}
OPERATION_4 origin : [['params.dbName', 'V']]
OPERATION_4 gives  : [['dbName_ch', 'P']]


OPERATION_5 string : blast_output_ch
.collectFile(name: 'blast_output_combined.txt', storeDir: params.outdir)
OPERATION_5 origin : [['blast_output_ch', 'P']]
OPERATION_5 gives  : []


