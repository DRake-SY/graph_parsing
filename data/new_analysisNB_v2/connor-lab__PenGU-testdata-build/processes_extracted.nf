Name : DOWNLOAD_ASSEMBLY
Inputs : [[0, 'assemblyUrlsCsv']]
Outputs : [[0, 'choiceExtractRegion']]
Emits : []


Name : EXTRACT_REGION
Inputs : [[0, 'extractRegion']]
Outputs : [[0, 'simulateReadsRegion']]
Emits : []


Name : GETFIRSTFASTAHEADER
Inputs : [[0, 'getFirstFastaHeader']]
Outputs : [[0, 'simulateReads']]
Emits : []


Name : STAGE_AND_DECOMPRESS_REF_FASTQ
Inputs : [[0, 'referenceFastq']]
Outputs : [[0, 'decompressedReferenceFastq']]
Emits : []


Name : SIMULATE_READS
Inputs : [[0, 'simulateReads'], [0, 'readLengths'], [0, 'decompressedReferenceFastq']]
Outputs : [[0, 'simulatedReads']]
Emits : []


Name : CLEAN_SIMULATED_FASTQ
Inputs : [[0, 'simulatedReads']]
Outputs : [[0, 'name']]
Emits : []


