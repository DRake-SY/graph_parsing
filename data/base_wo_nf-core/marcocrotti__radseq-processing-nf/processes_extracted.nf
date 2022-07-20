Name : genome_index
Inputs : [[0, 'genome']]
Outputs : [[0, 'genome_index_ch']]
Emits : []


Name : trimmomatic_single
Inputs : [[0, 'trim_single_in_ch']]
Outputs : [[0, 'trim_single_out_ch']]
Emits : []


Name : trimmomatic_paired
Inputs : [[0, 'trim_single_out_ch']]
Outputs : [[0, 'trim_paired_out_ch']]
Emits : []


Name : alignment
Inputs : [[0, 'trim_paired_out_ch'], [1, 'genome_index_ch'], [2, 'genome']]
Outputs : [[0, 'aligned_ch']]
Emits : []


Name : stacks_refmap
Inputs : [[0, 'aligned_ch']]
Outputs : [[0, 'refmap_results']]
Emits : []


