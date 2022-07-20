OPERATION_1 string : Channel
    .fromPath(params.query)
    .splitFasta(by: params.chunkSize, file:true)                                                             
    .set { Query_chunks }
OPERATION_1 origin : [['params.query', 'A']]
OPERATION_1 gives  : [['Query_chunks', 'P']]


OPERATION_2 string : genomefile = Channel
                .fromPath(params.genome)
                .map { file -> tuple(file.simpleName, file.parent, file) }                                                                                             
OPERATION_2 origin : [['params.genome', 'A']]
OPERATION_2 gives  : [['genomefile', 'P']]


OPERATION_3 string : dbName_ch = Channel.from(params.dbName)
OPERATION_3 origin : [['params.dbName', 'V']]
OPERATION_3 gives  : [['dbName_ch', 'P']]


OPERATION_4 string : dbDir_ch = Channel.fromPath(params.dbDir)
OPERATION_4 origin : [['params.dbDir', 'A']]
OPERATION_4 gives  : [['dbDir_ch', 'P']]


OPERATION_5 string : blast_output                                                                                                  
    .collectFile(name: 'blast_output_combined.txt', storeDir: params.outdir)                                                                                                            
    .subscribe {                                                                                     
        println "Entries are saved to file: $it"
    }
OPERATION_5 origin : [['blast_output', 'P']]
OPERATION_5 gives  : []


