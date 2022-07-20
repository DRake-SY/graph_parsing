Name : unzip_inputfiles
Inputs : [[0, 'gzipped_fastq']]
Outputs : [[0, 'ch_input']]
Emits : []


Name : concat_fastqs
Inputs : [[1, 'ch_input']]
Outputs : [[0, 'ch_fastq_porechop'], [1, 'ch1'], [2, 'ch2']]
Emits : []


Name : porechop
Inputs : [[0, 'ch_fastq_porechop']]
Outputs : [[0, 'ch_fastq_nanoplot'], [0, 'ch_fastq_nanofilt']]
Emits : []


Name : nanoplot1
Inputs : [[0, 'ch_fastq_nanoplot']]
Outputs : [[1, 'ch3'], [2, 'ch4']]
Emits : []


Name : nanofilt
Inputs : [[0, 'ch_fastq_nanofilt']]
Outputs : [[0, 'ch_fastq_filtered']]
Emits : []


Name : nanoplot2
Inputs : [[0, 'ch_fastq_filtered']]
Outputs : [[1, 'ch5'], [2, 'ch6']]
Emits : []


Name : readsummary
Inputs : [[0, 'ch1'], [1, 'ch2'], [2, 'ch3'], [3, 'ch4'], [4, 'ch5'], [5, 'ch6']]
Outputs : []
Emits : []


Name : get_software_versions
Inputs : []
Outputs : [[0, 'software_versions_yaml']]
Emits : []


Name : output_documentation
Inputs : [[0, 'ch_output_docs']]
Outputs : []
Emits : []


