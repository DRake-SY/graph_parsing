Name : buildindexGenome
Inputs : []
Outputs : []
Emits : []


Name : alignReads
Inputs : [[0, 'SAMPLE_FILES'], [1, 'INDEXREAD_FILE']]
Outputs : [[0, 'BAM_FILES'], [1, 'VCF_FILES']]
Emits : []


Name : countFeatures
Inputs : []
Outputs : [[0, 'COUNT_FILES'], [1, 'COUNT_FILES_SUMMARY']]
Emits : []


