OPERATION_1 string : extractionCombinations = Channel.from(mzxmlFiles).combine(Channel.from(params.extract_patterns))
OPERATION_1 origin : [['mzxmlFiles', 'V'], ['params.extract_patterns', 'V']]
OPERATION_1 gives  : [['extractionCombinations', 'P']]


