OPERATION_1 string : Channel
  .fromPath(params.feature_counts)
  .ifEmpty { exit 1, "Feature counts TSV file not found: ${params.feature_counts}" }
  .set { feature_counts }
OPERATION_1 origin : [['params.feature_counts', 'A']]
OPERATION_1 gives  : [['feature_counts', 'P']]


OPERATION_2 string : Channel
  .fromPath(params.annotation)
  .ifEmpty { exit 1, "Sample groups annotation CSV file not found: ${params.annotation}" }
  .set { annotation  }
OPERATION_2 origin : [['params.annotation', 'A']]
OPERATION_2 gives  : [['annotation', 'P']]


OPERATION_3 string : Channel
  .fromPath(params.rmarkdown)
  .ifEmpty { exit 1, "R Markdown script not found: ${params.rmarkdown}" }
  .set { rmarkdown  }
OPERATION_3 origin : [['params.rmarkdown', 'A']]
OPERATION_3 gives  : [['rmarkdown', 'P']]


