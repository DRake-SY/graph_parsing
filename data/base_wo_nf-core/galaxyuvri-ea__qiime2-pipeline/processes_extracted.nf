Name : runfastQC
Inputs : [[0, 'data']]
Outputs : [[0, 'fastqc_files']]
Emits : []


Name : runMultiQC
Inputs : [[0, 'fastqc_files']]
Outputs : []
Emits : []


Name : importData
Inputs : [[0, 'man_file']]
Outputs : [[0, 'demux_view'], [0, 'demux_trim'], [0, 'demux_dada2']]
Emits : []


Name : adapter_trimming
Inputs : [[0, 'demux_trim']]
Outputs : [[0, 'trimmed_view'], [0, 'trimmed_denoise']]
Emits : []


Name : run_dada2
Inputs : [[0, 'trimmed_denoise']]
Outputs : [[0, 'seqs'], [1, 'table'], [2, 'denoised']]
Emits : []


Name : merge_paired
Inputs : [[0, 'trimmed_denoise']]
Outputs : [[0, 'joined']]
Emits : []


Name : run_deblur
Inputs : [[0, 'joined']]
Outputs : [[0, 'seqs'], [1, 'table'], [2, 'denoised']]
Emits : []


Name : alignment
Inputs : [[0, 'seqs']]
Outputs : [[0, 'aligned'], [1, 'masked']]
Emits : []


Name : tree_construction
Inputs : [[0, 'masked']]
Outputs : [[0, 'phylo_tree']]
Emits : []


Name : classification
Inputs : [[0, 'ref'], [1, 'seqs']]
Outputs : [[0, 'taxa']]
Emits : []


Name : export_artifacts
Inputs : [[0, 'table'], [1, 'seqs'], [2, 'taxa'], [3, 'phylo_tree'], [4, 'denoised']]
Outputs : [[0, 'abundance'], [1, 'taxonomy'], [2, 'tree'], [3, 'stats'], [4, 'asv_biom'], [5, 'asv_fasta']]
Emits : []


Name : run_picrust2
Inputs : [[0, 'asv_biom'], [1, 'asv_fasta']]
Outputs : []
Emits : []


