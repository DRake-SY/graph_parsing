Name : buildIndex
Inputs : [[0, 'genome_file']]
Outputs : [[0, 'genome_index']]
Emits : []


Name : mapping
Inputs : [[0, 'genome_file'], [1, 'annotation_file'], [2, 'genome_index'], [3, 'read_pairs']]
Outputs : [[0, 'bam']]
Emits : []


Name : makeTranscript
Inputs : [[0, 'annotation_file'], [1, 'bam']]
Outputs : [[0, 'transcripts']]
Emits : []


