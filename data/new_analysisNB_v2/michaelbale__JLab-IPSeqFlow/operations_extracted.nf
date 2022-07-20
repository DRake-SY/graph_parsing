OPERATION_1 string : Channel
		  .fromPath(params.input)
		  .map { path -> tuple(getSampleID(path.getName()), path)}
		  .groupTuple()
		  .set { inFq_ch }
OPERATION_1 origin : [['params.input', 'A']]
OPERATION_1 gives  : [['inFq_ch', 'P']]


OPERATION_2 string : Channel
	  .fromFilePairs(params.input, flat: true)
	  .map { prefix, r1, r2 -> tuple(getSampleID(prefix), r1, r2) }
	  .groupTuple()
	  .set {inFq_ch}
OPERATION_2 origin : [['params.input, flat: true', 'A']]
OPERATION_2 gives  : [['inFq_ch', 'P']]


OPERATION_3 string : Channel
		.fromPath(params.input)
		.map { path -> tuple(getSampleID(path.getName()), path) }
		.set {reads_ch}
OPERATION_3 origin : [['params.input', 'A']]
OPERATION_3 gives  : [['reads_ch', 'P']]


OPERATION_4 string : Channel
		  .fromFilePairs(params.input)
		  .set {reads_ch}
OPERATION_4 origin : [['params.input', 'A']]
OPERATION_4 gives  : [['reads_ch', 'P']]


OPERATION_5 string : Channel
      .fromPath(params.addBEDFilesProfile)
	  .splitCsv(header:false)
	  .map{ row -> tuple(row[0], file(row[1])) }
	  .set { extraBEDs_ch }
OPERATION_5 origin : [['params.addBEDFilesProfile', 'A']]
OPERATION_5 gives  : [['extraBEDs_ch', 'P']]


OPERATION_6 string : Channel
      .fromPath(params.addBEDFilesRefPoint)
	  .splitCsv(header:false)
	  .map{ row -> tuple(row[0], file(row[1]), row[2], row[3]) }
	  .set { extraBEDs2_ch }
OPERATION_6 origin : [['params.addBEDFilesRefPoint', 'A']]
OPERATION_6 gives  : [['extraBEDs2_ch', 'P']]


OPERATION_7 string : BEFPDF_ch = names_ch.toSortedList()
OPERATION_7 origin : [['names_ch', 'P']]
OPERATION_7 gives  : [['BEFPDF_ch', 'P']]


OPERATION_8 string : sortedNamedBam = forBEPImage_ch.toSortedList()
OPERATION_8 origin : [['forBEPImage_ch', 'P']]
OPERATION_8 gives  : [['sortedNamedBam', 'P']]


OPERATION_9 string : extraBEDs_ch
	  .combine(bigwig2_ch)
	  .set { totalExtraBed_ch }
OPERATION_9 origin : [['extraBEDs_ch', 'P'], ['bigwig2_ch', 'P']]
OPERATION_9 gives  : [['totalExtraBed_ch', 'P']]


OPERATION_10 string : addBEDMatTupleGlobal_ch
      .groupTuple()
      .set { mixedExtraBEDsGT_ch }
OPERATION_10 origin : [['addBEDMatTupleGlobal_ch', 'P']]
OPERATION_10 gives  : [['mixedExtraBEDsGT_ch', 'P']]


OPERATION_11 string : extraBEDs2_ch
	  .combine(bigwig3_ch)
	  .set { totalExtraBed2_ch }
OPERATION_11 origin : [['extraBEDs2_ch', 'P'], ['bigwig3_ch', 'P']]
OPERATION_11 gives  : [['totalExtraBed2_ch', 'P']]


OPERATION_12 string : addBEDMatTupleGlobal2_ch
      .groupTuple()
      .set { mixedExtraBEDsGT2_ch }
OPERATION_12 origin : [['addBEDMatTupleGlobal2_ch', 'P']]
OPERATION_12 gives  : [['mixedExtraBEDsGT2_ch', 'P']]


