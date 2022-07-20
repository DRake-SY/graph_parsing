OPERATION_1 string : kraken2_output_ch = Channel
  .fromPath(params.input_kraken2_dir + '/' + params.kraken2_output)
  .ifEmpty { exit 1, "Cannot find  kraken2 report matching: ${params.kraken2_output}"}
  .map { file -> tuple(file.simpleName, file) }
OPERATION_1 origin : [["params.input_kraken2_dir + '/' + params.kraken2_output", 'A']]
OPERATION_1 gives  : [['kraken2_output_ch', 'P']]


OPERATION_2 string : reads_ch = Channel
                        .fromPath(params.input_seq_dir + '/' + params.single_end)
                        .map { file -> tuple(file.simpleName, file) }
OPERATION_2 origin : [["params.input_seq_dir + '/' + params.single_end", 'A']]
OPERATION_2 gives  : [['reads_ch', 'P']]


OPERATION_3 string : Channel
      .fromFilePairs(params.input_seq_dir + '/' + params.paired_end, size: 2 )
      .ifEmpty { exit 1, "Cannot find any reads matching: ${params.paired_end}"}
      .set {reads_ch}
OPERATION_3 origin : [["params.input_seq_dir + '/' + params.paired_end, size: 2", 'A']]
OPERATION_3 gives  : [['reads_ch', 'P']]


OPERATION_4 string : Channel.fromPath("${params.outdir}/tbprofiler/results", type: 'dir')
  .ifEmpty { exit 1, "Cannot find  directory: ${params.outdir}tbprofiler/results"}
  .set{ results_dir_ch}
OPERATION_4 origin : [['"${params.outdir}/tbprofiler/results", type: \'dir\'', 'A']]
OPERATION_4 gives  : [['results_dir_ch', 'P']]


