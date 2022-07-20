OPERATION_1 string : fastaForGenomeSizes = Channel.fromPath( params.fasta , checkIfExists: true)
      .ifEmpty { exit 1, "Genome fasta file not found: ${params.fasta}" }
OPERATION_1 origin : [['params.fasta , checkIfExists: true', 'A']]
OPERATION_1 gives  : [['fastaForGenomeSizes', 'P']]


OPERATION_2 string : bwaIndex = Channel.fromPath( bwa_dir , checkIfExists: true)
      .ifEmpty { exit 1, "Genome index: Provided index not found: ${params.bwa}" }
OPERATION_2 origin : [['bwa_dir , checkIfExists: true', 'A']]
OPERATION_2 gives  : [['bwaIndex', 'P']]


OPERATION_3 string : fastaForBwa = Channel.fromPath(params.fasta, checkIfExists: true)
      .ifEmpty { exit 1, "Genome fasta file not found: ${params.fasta}" }
OPERATION_3 origin : [['params.fasta, checkIfExists: true', 'A']]
OPERATION_3 gives  : [['fastaForBwa', 'P']]


OPERATION_4 string : designCheckedChannel
        .splitCsv(header:true, sep:',')
        .map { row -> [ row.sample_id, [ file(row.fastq_1, checkIfExists: true) ] ] }
        .into { rawReadsFastqcChannel;
                rawReadsTrimgaloreChannel;
                designMultipleGroups }
OPERATION_4 origin : [['designCheckedChannel', 'P']]
OPERATION_4 gives  : [['rawReadsFastqcChannel', 'P'], ['rawReadsTrimgaloreChannel', 'P'], ['designMultipleGroups', 'P']]


OPERATION_5 string : designCheckedChannel
        .splitCsv(header:true, sep:',')
        .map { row -> [ row.sample_id, [ file(row.fastq_1, checkIfExists: true), file(row.fastq_2, checkIfExists: true) ] ] }
        .into { rawReadsFastqcChannel;
                rawReadsTrimgaloreChannel;
                designMultipleGroups }
OPERATION_5 origin : [['designCheckedChannel', 'P']]
OPERATION_5 gives  : [['rawReadsFastqcChannel', 'P'], ['rawReadsTrimgaloreChannel', 'P'], ['designMultipleGroups', 'P']]


OPERATION_6 string : multipleGroups = designMultipleGroups
                     .map { it -> it[0].split('_')[0] }
                     .flatten()
                     .unique()
                     .count()
                     .val > 1
OPERATION_6 origin : [['designMultipleGroups', 'P']]
OPERATION_6 gives  : [['multipleGroups', 'P']]


OPERATION_7 string : bwaChannel
    .map { it -> [ it[0].split('_')[0] + "_" + it[0].split('_')[1], it[1] ] }
    .groupTuple(by: [0])
    .map { it ->  [ it[0], it[1].flatten() ] }
    .set { mergeChannel }
OPERATION_7 origin : [['bwaChannel', 'P']]
OPERATION_7 gives  : [['mergeChannel', 'P']]


OPERATION_8 string : bedGraphChannel
    .map { it ->
        def condition = it[0].split('_')[0]
        def phase = it[0].split('_')[1]
        def dictionary = [ (phase) : it[1].flatten()]
        return tuple(condition, dictionary)
     }
    .groupTuple(by: [0])
    .map { it ->  [ it[0], it[1].flatten() ] }
    .set { conditionChannel }
OPERATION_8 origin : [['bedGraphChannel', 'P']]
OPERATION_8 gives  : [['conditionChannel', 'P']]


OPERATION_9 string : RTNormalizationChannel
  .flatten()
  .map { it ->  [ it.baseName, it ] }
  .set { bigwigInputChannel }
OPERATION_9 origin : [['RTNormalizationChannel', 'P']]
OPERATION_9 gives  : [['bigwigInputChannel', 'P']]


