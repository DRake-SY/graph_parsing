Name : mapping
Inputs : [[0, 'read_pairs'], [1, 'genome_ref_dir']]
Outputs : [[0, 'sam_files']]
Emits : []


Name : bamsorter
Inputs : [[0, 'sam_files']]
Outputs : [[0, 'sorted_bam_files']]
Emits : []


Name : bamindexer
Inputs : [[0, 'sorted_bam_files']]
Outputs : [[0, 'indexed_bam_files']]
Emits : []


