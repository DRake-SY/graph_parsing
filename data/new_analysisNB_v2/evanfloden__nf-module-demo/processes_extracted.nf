Name : fastqc
Inputs : [[0, 'read_filesB']]
Outputs : [[0, 'fastqc_multiQC_ch']]
Emits : []


Name : index
Inputs : [[0, 'readMappingComponents'], [1, 'transcriptome_file']]
Outputs : [[0, 'indexes']]
Emits : []


Name : quantification
Inputs : [[0, 'read_files_and_index']]
Outputs : [[0, 'quant'], [1, 'quantification_multiQC_ch']]
Emits : []


Name : results
Inputs : [[0, 'quant']]
Outputs : [[0, 'results']]
Emits : []


Name : multiQC
Inputs : [[0, 'multiqc'], [1, 'multiQC_ch']]
Outputs : [[0, 'multiQCreport'], [1, 'multiQCdata']]
Emits : []


