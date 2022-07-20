OPERATION_1 string : Channel.fromPath(params.inputdir, type: 'dir')
  .ifEmpty { exit 1, "Cannot find  directory: ${params.inputdir}"}
  .set{rawreads_ch}
OPERATION_1 origin : [["params.inputdir, type: 'dir'", 'A']]
OPERATION_1 gives  : [['rawreads_ch', 'P']]


OPERATION_2 string : fastq_input_to_fastqc = Channel
                        .fromPath(params.inputdir + '/' + params.single_end)
                        .map { file -> tuple(file.simpleName, file) }
OPERATION_2 origin : [["params.inputdir + '/' + params.single_end", 'A']]
OPERATION_2 gives  : [['fastq_input_to_fastqc', 'P']]


OPERATION_3 string : fastq_input_to_qc = Channel
                        .fromPath(params.inputdir + '/' + params.single_end)
                        .map { file -> tuple(file.simpleName, file) } 
OPERATION_3 origin : [["params.inputdir + '/' + params.single_end", 'A']]
OPERATION_3 gives  : [['fastq_input_to_qc', 'P']]


OPERATION_4 string : fastq_input_to_rawstats = Channel
                        .fromPath(params.inputdir + '/' + params.single_end)
                        .map { file -> tuple(file.simpleName, file) }                   
OPERATION_4 origin : [["params.inputdir + '/' + params.single_end", 'A']]
OPERATION_4 gives  : [['fastq_input_to_rawstats', 'P']]


OPERATION_5 string : Channel
      .fromFilePairs(params.inputdir + '/' + params.paired_end, size: 2 )
      .ifEmpty { exit 1, "Cannot find any reads matching: ${params.paired_end}"}
                                                 
      .into { fastq_input_to_rawstats; fastq_input_to_fastqc; fastq_input_to_qc}
OPERATION_5 origin : [["params.inputdir + '/' + params.paired_end, size: 2", 'A']]
OPERATION_5 gives  : [['fastq_input_to_rawstats', 'P'], ['fastq_input_to_fastqc', 'P'], ['fastq_input_to_qc', 'P']]


OPERATION_6 string : Channel.fromPath("${params.outdir}", type: 'dir')
  .ifEmpty { exit 1, "Cannot find  directory: ${params.outdir}"}

                                                 
           
  .set{qcreads_ch}
OPERATION_6 origin : [['"${params.outdir}", type: \'dir\'', 'A']]
OPERATION_6 gives  : [['qcreads_ch', 'P']]


