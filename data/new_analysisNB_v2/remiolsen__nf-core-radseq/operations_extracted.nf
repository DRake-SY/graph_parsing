OPERATION_1 string : Channel
             .from(params.readPaths)
             .map { row -> [ row[0], [file(row[1][0])]] }
             .ifEmpty { exit 1, "params.readPaths was empty - no input files supplied" }
             .into { read_files_trim }
OPERATION_1 origin : [['params.readPaths', 'V']]
OPERATION_1 gives  : [['read_files_trim', 'P']]


OPERATION_2 string : Channel
             .from(params.readPaths)
             .map { row -> [ row[0], [file(row[1][0]), file(row[1][1])]] }
             .ifEmpty { exit 1, "params.readPaths was empty - no input files supplied" }
             .into { read_files_trim }
OPERATION_2 origin : [['params.readPaths', 'V']]
OPERATION_2 gives  : [['read_files_trim', 'P']]


OPERATION_3 string : Channel
         .fromFilePairs( params.reads, size: params.singleEnd ? 1 : 2 )
         .ifEmpty { exit 1, "Cannot find any reads matching: ${params.reads}\nNB: Path needs to be enclosed in quotes!\nIf this is single-end data, please specify --singleEnd on the command line." }
         .into { read_files_trim }
OPERATION_3 origin : [['params.reads, size: params.singleEnd ? 1 : 2', 'A']]
OPERATION_3 gives  : [['read_files_trim', 'P']]


OPERATION_4 string : summary.collect { k,v -> "${k.padRight(15)}: $v" }.join("\n")
OPERATION_4 origin : [['summary', 'P']]
OPERATION_4 gives  : []


