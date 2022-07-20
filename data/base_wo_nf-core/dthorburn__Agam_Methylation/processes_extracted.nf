Name : Decompress
Inputs : [[0, 'tarball'], [1, 'run_id']]
Outputs : [[0, 'fast5s']]
Emits : []


Name : Guppy_Call
Inputs : [[0, 'ref_genome'], [1, 'Gup_container'], [2, 'fast5s'], [3, 'fast5_dir']]
Outputs : [[0, 'all_bams1'], [0, 'all_bams2']]
Emits : []


Name : IndexBams
Inputs : [[0, 'bams_ch']]
Outputs : [[0, 'bais_ch']]
Emits : []


Name : ProcBams
Inputs : [[0, 'all_bams2'], [1, 'bais_ch'], [2, 'ref_genome'], [3, 'run_id']]
Outputs : []
Emits : []


