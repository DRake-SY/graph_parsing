Name : getSRAIDs
Inputs : [[0, 'accessionID']]
Outputs : [[0, 'sraIDs']]
Emits : []


Name : fastqDump
Inputs : [[0, 'singleSRAId']]
Outputs : [[0, 'read_files']]
Emits : []


Name : index
Inputs : [[0, 'transcriptome_file']]
Outputs : [[0, 'transcriptome_index']]
Emits : []


Name : mapping
Inputs : [[0, 'transcriptome_index'], [1, 'read_files']]
Outputs : [[0, 'kallisto_out_dirs']]
Emits : []


