OPERATION_1 string : Channel
  .fromPath(params.samplesheet)
  .subscribe{ println it }
OPERATION_1 origin : [['params.samplesheet', 'A']]
OPERATION_1 gives  : []


OPERATION_2 string : Channel
  .fromPath(params.runfolder)
  .subscribe{ println it }
OPERATION_2 origin : [['params.runfolder', 'A']]
OPERATION_2 gives  : []


OPERATION_3 string : samplesheet = Channel
      .fromPath(params.samplesheet)
      .ifEmpty{exit 1, "samplesheet file not found: ${params.samplesheet}"}
OPERATION_3 origin : [['params.samplesheet', 'A']]
OPERATION_3 gives  : [['samplesheet', 'P']]


OPERATION_4 string : runfolder = Channel
      .fromPath(params.runfolder)
      .ifEmpty{exit 1, "runfolder not found: ${params.runfolder}"}
      .view{}
OPERATION_4 origin : [['params.runfolder', 'A']]
OPERATION_4 gives  : [['runfolder', 'P']]


OPERATION_5 string : summary.collect { k,v -> "${k.padRight(15)}: $v" }.join("\n")
OPERATION_5 origin : [['summary', 'P']]
OPERATION_5 gives  : []


OPERATION_6 string : fastq_output
  .flatMap()
  .view()
  .set{ read_files_fastqc }
OPERATION_6 origin : [['fastq_output', 'P']]
OPERATION_6 gives  : [['read_files_fastqc', 'P']]


