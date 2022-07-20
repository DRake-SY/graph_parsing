OPERATION_1 string : in_bundles = Channel
      .fromFilePairs("$params.root_set/**/F__Surface_Enhanced_Tractography/*.fib",
                     size: -1) { it.parent.parent.name }
OPERATION_1 origin : []
OPERATION_1 gives  : [['in_bundles', 'P']]


OPERATION_2 string : in_reference = Channel
        .fromFilePairs("$params.root_tractoflow/**/DTI_Metrics/*fa.nii.gz",
                       size: 1, flat: true) { it.parent.parent.name }
OPERATION_2 origin : []
OPERATION_2 gives  : [['in_reference', 'P']]


OPERATION_3 string : in_bundles
    .flatMap{ sid, bundles -> bundles.collect{ [sid, it.getBaseName(), it] } }
    .set{bundles_to_combine}
OPERATION_3 origin : [['in_bundles', 'P']]
OPERATION_3 gives  : [['bundles_to_combine', 'P']]


OPERATION_4 string : in_reference.combine(bundles_to_combine, by: 0).set{data_ready}
OPERATION_4 origin : [['in_reference', 'P']]
OPERATION_4 gives  : [['data_ready', 'P']]


OPERATION_5 string : data_to_concatenate.groupTuple(by: 0).set{data_input}
OPERATION_5 origin : [['data_to_concatenate', 'P']]
OPERATION_5 gives  : [['data_input', 'P']]


