OPERATION_1 string : Channel
  .fromPath(params.seqs)
  .ifEmpty{ error "No Seqs found in ${params.seqs}"}
  .map { item -> [ item.baseName, item] }
  .into { seqs; seqs2; seqs3  }
OPERATION_1 origin : [['params.seqs', 'A']]
OPERATION_1 gives  : [['seqs', 'P'], ['seqs2', 'P'], ['seqs3', 'P']]


OPERATION_2 string : Channel
    .fromPath(params.template)
    .ifEmpty{ error "No Templates found in ${params.template}"}
     .map { item -> [ item.simpleName.tokenize("_")[0], item] }
    .into { template; template2 }
OPERATION_2 origin : [['params.template', 'A']]
OPERATION_2 gives  : [['template', 'P'], ['template2', 'P']]


OPERATION_3 string : seqs2
    .combine( template, by: 0 )
    .set { seqsAndTemplates }
OPERATION_3 origin : [['seqs2', 'P']]
OPERATION_3 gives  : [['seqsAndTemplates', 'P']]


