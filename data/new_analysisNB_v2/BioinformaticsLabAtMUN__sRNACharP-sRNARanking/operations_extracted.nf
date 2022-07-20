OPERATION_1 string : Channel
   .from(genomeFile)
   .splitFasta( record: [id: true, seqString: true ])
   .collectFile(name: lengthFile) { record -> record.id + "\t" + record.seqString.length() + "\n"}
   .set{lengthGenome}
OPERATION_1 origin : [['genomeFile', 'V']]
OPERATION_1 gives  : [['lengthGenome', 'P']]


OPERATION_2 string : sortedPromoterPredictions
  .collectFile(name: file("${params.org}_sortedPromoterPredictions.bed"))
OPERATION_2 origin : [['sortedPromoterPredictions', 'P']]
OPERATION_2 gives  : []


OPERATION_3 string : freeEnergy4sRNA
  .collectFile(name: file("${params.org}sRNAsSS.txt"))
  .set{sRNAsEnergy}
OPERATION_3 origin : [['freeEnergy4sRNA', 'P']]
OPERATION_3 gives  : [['sRNAsEnergy', 'P']]


OPERATION_4 string : transtermGTF
  .collectFile(name: file("${params.org}sRNAsTranstermRes.gtf"))
  .set{sRNAsTerminators}
OPERATION_4 origin : [['transtermGTF', 'P']]
OPERATION_4 gives  : [['sRNAsTerminators', 'P']]


OPERATION_5 string : closestPromoterDistances
  .collectFile(name: file("${params.org}_closestPromoterDistances.txt"))
  .set{promoterDistances}
OPERATION_5 origin : [['closestPromoterDistances', 'P']]
OPERATION_5 gives  : [['promoterDistances', 'P']]


OPERATION_6 string : featureTableNew
  .collectFile(name: file("${params.org}_featureTableNew.tsv"))
  .set{featureTableInput}
OPERATION_6 origin : [['featureTableNew', 'P']]
OPERATION_6 gives  : [['featureTableInput', 'P']]


OPERATION_7 string : rankedProbability.collectFile(name: file("rankedProbability.txt"))
OPERATION_7 origin : [['rankedProbability', 'P']]
OPERATION_7 gives  : []


