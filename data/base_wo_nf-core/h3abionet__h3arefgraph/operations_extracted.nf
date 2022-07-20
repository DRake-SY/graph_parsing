OPERATION_1 string : Channel.fromPath(params.reference_genomes)
  .splitCsv(header:true)
  .map{ row-> tuple(row.sample, file(row.path)) }
  .set { newFastaChannel }
OPERATION_1 origin : [['params.reference_genomes', 'A']]
OPERATION_1 gives  : [['newFastaChannel', 'P']]


OPERATION_2 string : ch_multiqc_config = Channel.fromPath(params.multiqc_config)
OPERATION_2 origin : [['params.multiqc_config', 'A']]
OPERATION_2 gives  : [['ch_multiqc_config', 'P']]


OPERATION_3 string : ch_output_docs = Channel.fromPath("$baseDir/docs/output.md")
OPERATION_3 origin : [['"$baseDir/docs/output.md"', 'A']]
OPERATION_3 gives  : [['ch_output_docs', 'P']]


OPERATION_4 string : Channel
             .from(params.readPaths)
             .map { row -> [ row[0], [file(row[1][0])]] }
             .ifEmpty { exit 1, "params.readPaths was empty - no input files supplied" }
             .into { read_files_fastqc; read_files_trimming }
OPERATION_4 origin : [['params.readPaths', 'V']]
OPERATION_4 gives  : [['read_files_fastqc', 'P'], ['read_files_trimming', 'P']]


OPERATION_5 string : Channel
             .from(params.readPaths)
             .map { row -> [ row[0], [file(row[1][0]), file(row[1][1])]] }
             .ifEmpty { exit 1, "params.readPaths was empty - no input files supplied" }
             .into { read_files_fastqc; read_files_trimming }
OPERATION_5 origin : [['params.readPaths', 'V']]
OPERATION_5 gives  : [['read_files_fastqc', 'P'], ['read_files_trimming', 'P']]


OPERATION_6 string : Channel
         .fromFilePairs( params.reads, size: params.singleEnd ? 1 : 2 )
         .ifEmpty { exit 1, "Cannot find any reads matching: ${params.reads}\nNB: Path needs to be enclosed in quotes!\nIf this is single-end data, please specify --singleEnd on the command line." }
         .into { read_files_fastqc; read_files_trimming; reads }
OPERATION_6 origin : [['params.reads, size: params.singleEnd ? 1 : 2', 'A']]
OPERATION_6 gives  : [['read_files_fastqc', 'P'], ['read_files_trimming', 'P'], ['reads', 'P']]


OPERATION_7 string : summary.collect { k,v -> "${k.padRight(15)}: $v" }.join("\n")
OPERATION_7 origin : [['summary', 'P']]
OPERATION_7 gives  : []


