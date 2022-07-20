Name : buildIndex
Inputs : [[0, 'reference_file']]
Outputs : [[0, 'reference_index']]
Emits : []


Name : search
Inputs : [[0, 'reference_file'], [1, 'reference_index'], [2, 'ids']]
Outputs : [[0, 'bam_files']]
Emits : []


Name : collect_outputs
Inputs : [[0, 'bam_files']]
Outputs : [[0, 'final_outputs']]
Emits : []


