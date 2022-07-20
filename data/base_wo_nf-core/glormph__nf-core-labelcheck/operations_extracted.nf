OPERATION_1 string : ch_output_docs = Channel.fromPath("$baseDir/docs/output.md")
OPERATION_1 origin : [['"$baseDir/docs/output.md"', 'A']]
OPERATION_1 gives  : [['ch_output_docs', 'P']]


OPERATION_2 string : Channel
    .from(file("${params.mzmldef}").readLines())
    .map { it -> it.tokenize('\t') }
    .map { it -> [file(it[0]), file(it[0]).baseName, or_na(it, 1), or_na(it, 2)] }
    .set { mzml_in }
OPERATION_2 origin : []
OPERATION_2 gives  : [['mzml_in', 'P']]


OPERATION_3 string : Channel
    .fromPath(params.mzmls)
    .map { it -> [file(it), file(it).baseName, 'NA', 'NA'] }
    .set { mzml_in }
OPERATION_3 origin : [['params.mzmls', 'A']]
OPERATION_3 gives  : [['mzml_in', 'P']]


OPERATION_4 string : summary.collect { k,v -> "${k.padRight(18)}: $v" }.join("\n")
OPERATION_4 origin : [['summary', 'P']]
OPERATION_4 gives  : []


OPERATION_5 string : mzml_in
  .tap { mzml_msgf; mzml_quant; input_order }
  .toList()
  .map { it.sort( {a, b -> a[1] <=> b[1]}) }                                                       
  .map { it -> [it.collect() { it[0] }, it.collect() { it[1] } ] }                                 
  .set{ mzmlfiles_all }
OPERATION_5 origin : [['mzml_in', 'P']]
OPERATION_5 gives  : [['mzmlfiles_all', 'P']]


OPERATION_6 string : isobaricxml
  .toList()
  .map { it.sort({a, b -> a[0] <=> b[0]}) }
  .map { it -> it.collect() { it[1] } }
  .set { isofiles_sorted }
OPERATION_6 origin : [['isobaricxml', 'P']]
OPERATION_6 gives  : [['isofiles_sorted', 'P']]


OPERATION_7 string : mzids
  .groupTuple(by: [0,1,2])
  .set { mzids_2pin }
OPERATION_7 origin : [['mzids', 'P']]
OPERATION_7 gives  : [['mzids_2pin', 'P']]


OPERATION_8 string : mzidtsvs
  .groupTuple()
  .join(percolated)
  .set { mzperco }
OPERATION_8 origin : [['mzidtsvs', 'P'], ['percolated', 'P']]
OPERATION_8 gives  : [['mzperco', 'P']]


OPERATION_9 string : tmzidtsv_perco
  .toList()
  .map { it.sort( {a, b -> a[0] <=> b[0]}) }                                            
  .transpose()
  .toList()
  .combine(quantlookup)
  .set { prepsm }
OPERATION_9 origin : [['tmzidtsv_perco', 'P'], ['quantlookup', 'P']]
OPERATION_9 gives  : [['prepsm', 'P']]


OPERATION_10 string : setpsmtables
  .transpose()
  .set { psm_pep }
OPERATION_10 origin : [['setpsmtables', 'P']]
OPERATION_10 gives  : [['psm_pep', 'P']]


OPERATION_11 string : psmmeans
  .toList()
  .transpose()
  .toList()
  .set { psmdata }
OPERATION_11 origin : [['psmmeans', 'P']]
OPERATION_11 gives  : [['psmdata', 'P']]


OPERATION_12 string : input_order
  .map { it -> it[1] }                  
  .toList()
  .map { it -> [it] }                                    
  .merge(psmdata)
  .set { psm_values }
OPERATION_12 origin : [['input_order', 'P'], ['psmdata', 'P']]
OPERATION_12 gives  : [['psm_values', 'P']]


