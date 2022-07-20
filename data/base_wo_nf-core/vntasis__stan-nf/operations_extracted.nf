OPERATION_1 string : Channel.empty().into {
  model2build_ch;
  model2sample_ch;
  model_ch;
  model2gen_quan_ch;
  gen_quan_ch;
}
OPERATION_1 origin : []
OPERATION_1 gives  : [['model2build_ch', 'P'], ['model2sample_ch', 'P'], ['model_ch', 'P'], ['model2gen_quan_ch', 'P'], ['gen_quan_ch', 'P'], ['', 'P']]


OPERATION_2 string : Channel
  .of(1..params.chains)
  .set{ chains_ch }
OPERATION_2 origin : [['1..params.chains', 'V']]
OPERATION_2 gives  : [['chains_ch', 'P']]


OPERATION_3 string : Channel
    .fromPath(params.model, checkIfExists: true)
    .map{ [ it.simpleName, it ] }
    .set{ model2build_ch }
OPERATION_3 origin : [['params.model, checkIfExists: true', 'A']]
OPERATION_3 gives  : [['model2build_ch', 'P']]


OPERATION_4 string : Channel
    .fromPath(params.model, checkIfExists: true)
    .map{ [ it.simpleName, it ] }
    .set{ model_ch }
OPERATION_4 origin : [['params.model, checkIfExists: true', 'A']]
OPERATION_4 gives  : [['model_ch', 'P']]


OPERATION_5 string : Channel
    .fromPath(params.data, checkIfExists: true)
    .map{ [ it.simpleName, it ] }
    .combine(model_ch)
    .combine(chains_ch)
    .set{ model2sample_ch }
OPERATION_5 origin : [['model_ch', 'P'], ['chains_ch', 'P'], ['params.data, checkIfExists: true', 'A']]
OPERATION_5 gives  : [['model2sample_ch', 'P']]


OPERATION_6 string : Channel
    .fromPath(params.model, checkIfExists: true)
    .map{ [ it.simpleName, it ] }
    .set{ model_ch }
OPERATION_6 origin : [['params.model, checkIfExists: true', 'A']]
OPERATION_6 gives  : [['model_ch', 'P']]


OPERATION_7 string : Channel
    .fromPath(params.data, checkIfExists: true)
    .map{ [ it.simpleName, it ] }
    .combine(model_ch)
    .set{ model2gen_quan_ch }
OPERATION_7 origin : [['model_ch', 'P'], ['params.data, checkIfExists: true', 'A']]
OPERATION_7 gives  : [['model2gen_quan_ch', 'P']]


OPERATION_8 string : Channel
    .fromPath(params.fittedParams, checkIfExists: true)
    .collect()
    .map{ [ it ] }
    .combine(model2gen_quan_ch)
    .map{ [ it[3], it[1], it[4], it[2], it[0] ] }
    .set{ gen_quan_ch }
OPERATION_8 origin : [['model2gen_quan_ch', 'P'], ['params.fittedParams, checkIfExists: true', 'A']]
OPERATION_8 gives  : [['gen_quan_ch', 'P']]


OPERATION_9 string : Channel
    .fromPath(params.data, checkIfExists: true)
    .map{ [ it.simpleName, it ] }
    .combine(model_built_ch)
    .combine(chains_ch)
    .set{ model2sample_ch }
OPERATION_9 origin : [['model_built_ch', 'P'], ['chains_ch', 'P'], ['params.data, checkIfExists: true', 'A']]
OPERATION_9 gives  : [['model2sample_ch', 'P']]


OPERATION_10 string : samples2summary_ch
  .groupTuple(by: [0,1])
  .set{ summarise_ch }
OPERATION_10 origin : [['samples2summary_ch', 'P']]
OPERATION_10 gives  : [['summarise_ch', 'P']]


OPERATION_11 string : samples2gen_quan_ch
    .groupTuple(by: [0,1])
    .map { [ it[0], it[1], it[2][1], it[3][1], it[4] ] }
    .set{ gen_quan_ch }
OPERATION_11 origin : [['samples2gen_quan_ch', 'P']]
OPERATION_11 gives  : [['gen_quan_ch', 'P']]


