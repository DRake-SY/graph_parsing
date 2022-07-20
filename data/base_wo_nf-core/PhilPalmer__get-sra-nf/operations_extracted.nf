OPERATION_1 string : Channel
  .fromPath(params.experiment)
  .ifEmpty { exit 1, "Experiment CSV file not found: ${params.experiment}" }
  .splitCsv(skip: 1)
  .map { sraID, condition, replicate -> sraID }
  .set { singleSRAId }
OPERATION_1 origin : [['params.experiment', 'A']]
OPERATION_1 gives  : [['singleSRAId', 'P']]


OPERATION_2 string : sraIDs.splitText().map { it -> it.trim() }.set { singleSRAId }
OPERATION_2 origin : [['sraIDs', 'P']]
OPERATION_2 gives  : [['singleSRAId', 'P']]


