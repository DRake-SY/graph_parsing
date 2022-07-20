Name : prepareReadsBunzips
Inputs : [[0, 'sampleToFastqLocationsBunzips']]
Outputs : [[0, 'kneadedReadsBunzips']]
Emits : []


Name : prepareReadsSingle
Inputs : [[0, 'sampleToFastqLocationsSingle']]
Outputs : [[0, 'kneadedReadsSingle']]
Emits : []


Name : prepareReadsSingleSra
Inputs : [[0, 'sampleToFastqLocationsSingleSra']]
Outputs : [[0, 'kneadedReadsSingleSra']]
Emits : []


Name : prepareReadsPaired
Inputs : [[0, 'sampleToFastqLocationsPaired']]
Outputs : [[0, 'kneadedReadsPaired']]
Emits : []


Name : prepareReadsPairedSra
Inputs : [[0, 'sampleToFastqLocationsPairedSra']]
Outputs : [[0, 'kneadedReadsPairedSra']]
Emits : []


Name : runHumann
Inputs : [[0, 'kneadedReads']]
Outputs : [[0, 'taxonAbundances'], [1, 'geneAbundances'], [2, 'pathwayAbundances'], [3, 'pathwayCoverages']]
Emits : []


Name : groupFunctionalUnits
Inputs : [[0, 'geneAbundances'], [1, 'params']]
Outputs : [[0, 'functionAbundances']]
Emits : []


Name : aggregateFunctionAbundances
Inputs : [[0, 'functionAbundances'], [1, 'params']]
Outputs : []
Emits : []


Name : aggregateTaxonAbundances
Inputs : [[0, 'taxonAbundances']]
Outputs : []
Emits : []


Name : aggregatePathwayAbundances
Inputs : [[0, 'pathwayAbundances']]
Outputs : []
Emits : []


Name : aggregatePathwayCoverages
Inputs : [[0, 'pathwayCoverages']]
Outputs : []
Emits : []


