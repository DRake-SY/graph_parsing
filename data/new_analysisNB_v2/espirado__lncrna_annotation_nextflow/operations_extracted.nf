OPERATION_1 string : Channel
    .fromPath( params.reads )
    .ifEmpty { error "Cannot find any reads matching: ${params.reads}" }
    .map { path -> 
       def prefix = readPrefix(path, params.reads)
       tuple(prefix, path) 
    }
    .groupTuple(sort: true)
    .set { read_files }
OPERATION_1 origin : [['params.reads', 'A']]
OPERATION_1 gives  : [['read_files', 'P']]


OPERATION_2 string : cufflinksTranscripts_postprocess_fn
  .collectFile () { file ->  ['gtf_filenames.txt', file.name + '\n' ] }
  .set { GTFfilenames }
OPERATION_2 origin : [['cufflinksTranscripts_postprocess_fn', 'P']]
OPERATION_2 gives  : [['GTFfilenames', 'P']]


