OPERATION_1 string : Channel
  .fromFilePairs( params.reads, size: params.singleEnd ? 1 : 2 )
  .ifEmpty { exit 1, "Cannot find any reads matching: ${params.reads}\nNB: Path needs to be enclosed in quotes!\nNB: Path requires at least one * wildcard!\nIf this is single-end data, please specify --singleEnd on the command line." }
  .set { raw_reads_fastqc }
OPERATION_1 origin : [['params.reads, size: params.singleEnd ? 1 : 2', 'A']]
OPERATION_1 gives  : [['raw_reads_fastqc', 'P']]


