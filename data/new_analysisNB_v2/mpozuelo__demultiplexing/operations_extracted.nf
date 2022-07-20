OPERATION_1 string : Channel
  .from( ch_input )
  .splitCsv(header:false, sep:',')
  .map { it = ["${it[0]}", "${it[1]}", "${it[2]}", "${it[3]}", "${it[4]}", "${it[5]}", [file("${cluster_path}/data/01_cal/${it[4]}/${it[5]}/${it[4]}_${it[5]}_read_1.fq.gz", checkIfExists: true), file("${cluster_path}/data/01_cal/${it[4]}/${it[5]}/${it[4]}_${it[5]}_read_2.fq.gz", checkIfExists: true)]]}
  .set { ch_demux }
OPERATION_1 origin : [['ch_input', 'V']]
OPERATION_1 gives  : [['ch_demux', 'P']]


OPERATION_2 string : fastqc_results = Channel.empty()
OPERATION_2 origin : []
OPERATION_2 gives  : [['fastqc_results', 'P']]


OPERATION_3 string : summary.collect { k,v -> "${k.padRight(18)}: $v" }.join("\n")
OPERATION_3 origin : [['summary', 'P']]
OPERATION_3 gives  : []


