Name : createHisat2index
Inputs : [[0, '"$params']]
Outputs : []
Emits : []


Name : collectHisat2index
Inputs : []
Outputs : [[0, 'hiast2IndexProcess_collected'], [1, 'hs2_indices_collected'], [1, 'hs2_indices_collected_duplicate']]
Emits : []


Name : createJellyfishIndex
Inputs : [[0, '"$params'], [1, '"$projectDir/helperScripts/buildJellyfishIndexes']]
Outputs : []
Emits : []


Name : collectJellyfishindex
Inputs : []
Outputs : [[0, 'jellyfishIndexProcess_collected'], [1, 'jellyfish_indices_collected'], [1, 'jellyfish_indices_collected_duplicate']]
Emits : []


Name : blockParse
Inputs : [[0, 'hiast2IndexProcess_collected'], [1, 'jellyfishIndexProcess_collected'], [2, '"$projectDir/OligoMiner/blockParse'], [3, '"${params']]
Outputs : [[0, 'blockparseProcess'], [0, 'blockparseProcess_count'], [0, 'blockparseProcess_unfiltered']]
Emits : []


Name : countInitialProbes
Inputs : [[0, 'blockparseProcess_count']]
Outputs : [[0, 'InitialNprobesProcess']]
Emits : []


Name : outputUnfiltered
Inputs : [[0, 'blockparseProcess_unfiltered']]
Outputs : [[0, 'unfilteredProbesEndo'], [0, 'unfilteredProbesExo']]
Emits : []


Name : initial_mapping
Inputs : [[0, 'blockparseProcess'], [1, 'hs2_indices_collected']]
Outputs : [[0, 'initialMappingProcess_endo'], [0, 'initialMappingProcess_exo']]
Emits : []


Name : filteringEndo
Inputs : [[0, '"$projectDir/OligoMiner/outputClean'], [1, 'initialMappingProcess_endo']]
Outputs : [[0, 'outputCleanProcessEndo']]
Emits : []


Name : filteringExo
Inputs : [[0, '"$projectDir/OligoMiner/outputClean'], [1, 'initialMappingProcess_exo']]
Outputs : [[0, 'outputCleanProcessExo']]
Emits : []


Name : checkStrand
Inputs : [[0, 'outputCleanProcessEndo'], [0, 'outputCleanProcessExo'], [1, '"$projectDir/OligoMiner/probeRC']]
Outputs : [[0, 'checkStrandProcess']]
Emits : []


Name : kmerFilter
Inputs : [[0, 'checkStrandProcess'], [1, '"$projectDir/OligoMiner/kmerFilter'], [2, 'jellyfish_indices_collected']]
Outputs : [[0, 'kmerFilterProcess']]
Emits : []


Name : structureCheck
Inputs : [[0, 'kmerFilterProcess'], [1, '"$projectDir/OligoMiner/structureCheck']]
Outputs : [[0, 'structureCheckProcessFastq'], [0, 'structureCheckProcessFasta']]
Emits : []


Name : bed2fasta
Inputs : [[0, 'structureCheckProcessFasta'], [1, '"$projectDir/helperScripts/customBed2Fasta']]
Outputs : [[0, 'bed2fastaProcessEndoZip'], [0, 'bed2fastaProcessExoZip'], [0, 'bed2fastaProcessExoAlign'], [0, 'bed2fastaProcessRevCompl'], [0, 'bed2fastaProcessTm'], [0, 'bed2fastaProcessTab']]
Emits : []


Name : fasta2tab
Inputs : [[0, 'bed2fastaProcessTab']]
Outputs : [[0, 'fasta2tabEndoZip'], [0, 'fasta2tabExoZip']]
Emits : []


Name : bed2fastq
Inputs : [[0, 'structureCheckProcessFastq'], [1, '"$projectDir/OligoMiner/bedToFastq']]
Outputs : [[0, 'finalFastqProcessMapping'], [0, 'finalFastqProcessCount']]
Emits : []


Name : countFinalProbes
Inputs : [[0, 'finalFastqProcessCount']]
Outputs : [[0, 'FinalNprobesProcess']]
Emits : []


Name : mappingFinalProbes
Inputs : [[0, 'finalFastqProcessMapping'], [1, 'hs2_indices_collected_duplicate']]
Outputs : [[0, 'mappingFinalProcess']]
Emits : []


Name : sam2bam
Inputs : [[0, 'mappingFinalProcess']]
Outputs : [[0, 'finalBamProcess']]
Emits : []


Name : sortBam
Inputs : [[0, 'finalBamProcess']]
Outputs : [[0, 'alignment1ProcessSort'], [0, 'alignment1ProcessZip']]
Emits : []


Name : sortIndexBam
Inputs : [[0, 'alignment1ProcessSort']]
Outputs : [[0, 'alignment2Process']]
Emits : []


Name : revComplement
Inputs : [[0, 'bed2fastaProcessRevCompl']]
Outputs : [[0, 'revComplEndo'], [0, 'revComplExo']]
Emits : []


Name : probeTm
Inputs : [[0, 'bed2fastaProcessTm'], [1, '"$projectDir/OligoMiner/probeTm']]
Outputs : [[0, 'probeTmEndo'], [0, 'probeTmExo']]
Emits : []


Name : makeLog
Inputs : [[0, 'InitialNprobesProcess'], [1, 'FinalNprobesProcess']]
Outputs : [[0, 'makeLogProcessPrint'], [1, 'makeLogProcessEndo'], [1, 'makeLogProcessExo']]
Emits : []


Name : alignExo
Inputs : [[0, 'bed2fastaProcessExoAlign'], [1, '"${params']]
Outputs : [[0, 'alignExoProcess']]
Emits : []


Name : createTempZip
Inputs : [[0, 'unfilteredProbesExo'], [0, 'unfilteredProbesEndo']]
Outputs : [[0, 'temp_zip_endo'], [0, 'temp_zip_exo']]
Emits : []


Name : zipOutFilesEndo
Inputs : [[0, 'alignment1ProcessZip'], [1, 'alignment2Process'], [2, 'bed2fastaProcessEndoZip'], [3, 'fasta2tabEndoZip'], [4, 'revComplEndo'], [5, 'probeTmEndo'], [6, 'makeLogProcessEndo'], [7, 'temp_zip_endo']]
Outputs : [[0, 'zip_endo']]
Emits : []


Name : zipOutFilesExo
Inputs : [[0, 'bed2fastaProcessExoZip'], [1, 'fasta2tabExoZip'], [2, 'alignExoProcess'], [3, 'revComplExo'], [4, 'probeTmExo'], [5, 'makeLogProcessExo'], [6, 'temp_zip_exo']]
Outputs : [[0, 'zip_exo']]
Emits : []


