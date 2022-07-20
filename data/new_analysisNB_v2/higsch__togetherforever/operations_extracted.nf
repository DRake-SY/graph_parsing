OPERATION_1 string : Channel
  .fromPath(params.gtfs)
  .map { it -> [it.baseName.split('\\.')[0], file(it)] }
  .set { gtfs }
OPERATION_1 origin : [['params.gtfs', 'A']]
OPERATION_1 gives  : [['gtfs', 'P']]


OPERATION_2 string : Channel
  .from(file("${params.mzmldef}").readLines())
  .map { it -> it.tokenize(' |\t') }
  .map { it -> [it[2], it[1], it[0].replaceFirst(/.*\/(\S+)\.mzML/, "\$1"), file(it[0])] }                       
  .tap { mzmls }
  .collect { it[0] }
  .set { fractions }
OPERATION_2 origin : []
OPERATION_2 gives  : [['fractions', 'P'], ['mzmls', 'P']]


OPERATION_3 string : aa_fastas
  .map { it -> it[1] }
  .collect()
  .set { aa_fastas_combined }
OPERATION_3 origin : [['aa_fastas', 'P']]
OPERATION_3 gives  : [['aa_fastas_combined', 'P']]


OPERATION_4 string : pI_fastas
  .flatten()
  .map { it -> [it.baseName.split("_")[1], file(it)] }
  .set { pI_tdbs }
OPERATION_4 origin : [['pI_fastas', 'P']]
OPERATION_4 gives  : [['pI_tdbs', 'P']]


OPERATION_5 string : combined_tdbs
  .cross(mzmls)
  .map { it -> [it[0][0], it[1][1], it[1][2], it[1][3], it[0][1]] }
  .set { mzmls_fastas }
OPERATION_5 origin : [['combined_tdbs', 'P'], ['mzmls', 'P']]
OPERATION_5 gives  : [['mzmls_fastas', 'P']]


OPERATION_6 string : mzids
  .groupTuple()
  .set { mzids2pin }
OPERATION_6 origin : [['mzids', 'P']]
OPERATION_6 gives  : [['mzids2pin', 'P']]


OPERATION_7 string : mzidtsvs
  .groupTuple()
  .join(percolated)
  .set { mzperco }
OPERATION_7 origin : [['mzidtsvs', 'P'], ['percolated', 'P']]
OPERATION_7 gives  : [['mzperco', 'P']]


