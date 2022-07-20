Name : getFASTAsRNAs
Inputs : [[0, 'genomeFile'], [1, 'bedFile']]
Outputs : [[0, 'sRNAsFASTA'], [1, 'sequences']]
Emits : []


Name : reorderAndSortPromoterPredictions
Inputs : [[0, 'promoterFile']]
Outputs : [[0, 'sortedPromoterPredictions']]
Emits : []


Name : getFreeEnergySS
Inputs : [[0, 'sRNAsFASTA']]
Outputs : [[0, 'freeEnergy4sRNA']]
Emits : []


Name : createCRDFile
Inputs : [[0, 'annotationFile']]
Outputs : [[0, 'CRDFile']]
Emits : []


Name : runTransterm
Inputs : [[0, 'genomeFile'], [1, 'CRDFile']]
Outputs : [[0, 'predictedTerminators']]
Emits : []


Name : parseTranstermResults
Inputs : [[0, 'predictedTerminators']]
Outputs : [[0, 'transtermGTF']]
Emits : []


Name : getDistances
Inputs : [[0, 'bedFile'], [1, 'annotationFile'], [2, 'sRNAsTerminators'], [3, 'sortedPromoterPredictions']]
Outputs : [[0, 'sortedBed'], [1, 'downORFs'], [2, 'upORFs'], [3, 'downTerminator'], [4, 'closestPromoterDistances']]
Emits : []


Name : createAttributeTable
Inputs : [[0, 'sRNAsEnergy'], [1, 'sortedBed'], [2, 'downORFs'], [3, 'upORFs'], [4, 'downTerminator'], [5, 'promoterDistances']]
Outputs : [[0, 'attributesTable']]
Emits : []


Name : createTetranucleotideRC_features
Inputs : [[0, 'sequences'], [1, 'attributesTable']]
Outputs : [[0, 'featureTableNew']]
Emits : []


