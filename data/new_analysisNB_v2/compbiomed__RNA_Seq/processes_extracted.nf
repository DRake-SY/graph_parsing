Name : generateGTF
Inputs : []
Outputs : [[0, '']]
Emits : []


Name : generateBED
Inputs : [[0, 'generateGTF_to_generateBED']]
Outputs : [[0, '']]
Emits : []


Name : runSTAR1pass
Inputs : [[0, 'readInput_to_runSTAR1pass']]
Outputs : [[0, 'runSTAR1pass_to_runSTARgenomeGenerate']]
Emits : []


Name : runSTARgenomeGenerate
Inputs : [[0, 'runSTAR1pass_to_runSTARgenomeGenerate'], [1, 'generateGTF_to_runSTARgenomeGenerate']]
Outputs : [[0, 'runSTARgenomeGenerateOutput'], [1, 'runSTARgenomeGenerate_to_runSTAR2pass']]
Emits : []


Name : runSTAR2pass
Inputs : [[0, 'readInput_to_runSTAR2pass'], [1, 'runSTARgenomeGenerate_to_runSTAR2pass']]
Outputs : [[0, 'runSTAR2pass_to_runMultiQCSample'], [1, ''], [2, 'runSTAR2pass_to_runRSEMcalculateExpression'], [3, 'runSTAR2passOutput']]
Emits : []


Name : runRSEMprepareReference
Inputs : [[0, 'generateGTF_to_runRSEMprepareReference']]
Outputs : [[0, 'runRSEMprepareReference_to_runRSEMcalculateExpression']]
Emits : []


Name : runRSEMcalculateExpression
Inputs : [[0, 'runSTAR2pass_to_runRSEMcalculateExpression'], [1, 'runRSEMprepareReference_to_runRSEMcalculateExpression']]
Outputs : [[0, 'runRSEMcalculateExpressionGenes_to_createSE'], [1, 'runRSEMcalculateExpressionIsoforms_to_createSE'], [2, 'runRSEMcalculateExpressionOutput']]
Emits : []


Name : runFastQC
Inputs : [[0, 'readInput_to_runFastQC']]
Outputs : [[0, 'runFastQC_to_runMultiQCFastq']]
Emits : []


Name : runRSeQCbamStat
Inputs : [[0, 'runSTAR2pass_to_runRSeQCbamStat']]
Outputs : [[0, 'runRSeQCbamStat_to_runMultiQCSample']]
Emits : []


Name : runRSeQCclippingProfile
Inputs : [[0, 'runSTAR2pass_to_runRSeQCclippingProfile']]
Outputs : [[0, 'runRSeQCclippingProfileOutput']]
Emits : []


Name : runRSeQCdeletionProfile
Inputs : [[0, 'runSTAR2pass_to_runRSeQCdeletionProfile']]
Outputs : [[0, 'runRSeQCdeletionProfileOutput']]
Emits : []


Name : runRSeQCgeneBodyCoverage
Inputs : [[0, 'runSTAR2pass_to_runRSeQCgeneBodyCoverage'], [1, 'generateBED_to_runRSeQCgeneBodyCoverage']]
Outputs : [[0, 'runRSeQCgeneBodyCoverage_to_runMultiQCSample'], [1, 'runRSeQCgeneBodyCoverageOutput']]
Emits : []


Name : runRSeQCinferExperiment
Inputs : [[0, 'runSTAR2pass_to_runRSeQCinferExperiment'], [1, 'generateBED_to_runRSeQCinferExperiment']]
Outputs : [[0, 'runRSeQCinferExperiment_to_runMultiQCSample']]
Emits : []


Name : runRSeQCinnerDistance
Inputs : [[0, 'runSTAR2pass_to_runRSeQCinnerDistance'], [1, 'generateBED_to_runRSeQCinnerDistance']]
Outputs : [[0, 'runRSeQCinnerDistance_to_runMultiQCSample'], [1, 'runRSeQCinnerDistanceOutput']]
Emits : []


Name : runRSeQCinsertionProfile
Inputs : [[0, 'runSTAR2pass_to_runRSeQCinsertionProfile']]
Outputs : [[0, 'runRSeQCinsertionProfileOutput']]
Emits : []


Name : runRSeQCjunctionAnnotation
Inputs : [[0, 'runSTAR2pass_to_runRSeQCjunctionAnnotation'], [1, 'generateBED_to_runRSeQCjunctionAnnotation']]
Outputs : [[0, 'runRSeQCjunctionAnnotation_to_runMultiQCSample'], [1, 'runRSeQCjunctionAnnotationOutput']]
Emits : []


Name : runRSeQCjunctionSaturation
Inputs : [[0, 'runSTAR2pass_to_runRSeQCjunctionSaturation'], [1, 'generateBED_to_runRSeQCjunctionSaturation']]
Outputs : [[0, 'runRSeQCjunctionSaturation_to_runMultiQCSample'], [1, 'runRSeQCjunctionSaturationOutput']]
Emits : []


Name : runRSeQCreadDistribution
Inputs : [[0, 'runSTAR2pass_to_runRSeQCreadDistribution'], [1, 'generateBED_to_runRSeQCreadDistribution']]
Outputs : [[0, 'runRSeQCreadDistribution_to_runMultiQCSample']]
Emits : []


Name : runRSeQCreadDuplication
Inputs : [[0, 'runSTAR2pass_to_runRSeQCreadDuplication']]
Outputs : [[0, 'runRSeQCreadDuplication_to_runMultiQCSample'], [1, 'runRSeQCreadDuplicationOutput']]
Emits : []


Name : runRSeQCreadGC
Inputs : [[0, 'runSTAR2pass_to_runRSeQCreadGC']]
Outputs : [[0, 'runRSeQCreadGC_to_runMultiQCSample'], [1, 'runRSeQCreadGCOutput']]
Emits : []


Name : runRSeQCreadNVC
Inputs : [[0, 'runSTAR2pass_to_runRSeQCreadNVC']]
Outputs : [[0, 'runRSeQCreadNVCOutput']]
Emits : []


Name : runRSeQCreadQuality
Inputs : [[0, 'runSTAR2pass_to_runRSeQCreadQuality']]
Outputs : [[0, 'runRSeQCreadQualityOutput']]
Emits : []


Name : runRSeQCtin
Inputs : [[0, 'runSTAR2pass_to_runRSeQCtin'], [1, 'generateBED_to_runRSeQCtin']]
Outputs : [[0, 'runRSeQCtin_to_createSE'], [1, 'runRSeQCtinOutput']]
Emits : []


Name : runMultiQCFastq
Inputs : [[0, 'runFastQC_to_runMultiQCFastq']]
Outputs : [[0, 'runMultiQCFastqOutput'], [1, 'runMultiQCFastq_to_createSE']]
Emits : []


Name : runMultiQCSample
Inputs : [[0, 'runRSeQCbamStat_to_runMultiQCSample'], [1, 'runRSeQCgeneBodyCoverage_to_runMultiQCSample'], [2, 'runRSeQCinferExperiment_to_runMultiQCSample'], [3, 'runRSeQCinnerDistance_to_runMultiQCSample'], [4, 'runRSeQCjunctionAnnotation_to_runMultiQCSample'], [5, 'runRSeQCjunctionSaturation_to_runMultiQCSample'], [6, 'runRSeQCreadDistribution_to_runMultiQCSample'], [7, 'runRSeQCreadDuplication_to_runMultiQCSample'], [8, 'runRSeQCreadGC_to_runMultiQCSample'], [9, 'runSTAR2pass_to_runMultiQCSample']]
Outputs : [[0, 'runMultiQCSampleOutput'], [1, 'runMultiQCSampleRSeQC_to_createSE'], [2, 'runMultiQCSampleSTAR_to_createSE']]
Emits : []


Name : createSE
Inputs : [[0, 'runMultiQCFastq_to_createSE'], [1, 'runRSeQCtin_to_createSE'], [2, 'runMultiQCSampleRSeQC_to_createSE'], [3, 'runMultiQCSampleSTAR_to_createSE'], [4, 'runRSEMcalculateExpressionGenes_to_createSE'], [5, 'runRSEMcalculateExpressionIsoforms_to_createSE'], [6, 'generateGTF_to_createSE']]
Outputs : [[0, 'runCreateSEOutput']]
Emits : []


