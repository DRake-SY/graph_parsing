Name : download_genome_patric
Inputs : [[0, 'genomes']]
Outputs : [[0, 'ffiles']]
Emits : []


Name : download_genomes
Inputs : [[0, 'genomes'], [1, 'apikey']]
Outputs : [[0, 'ffiles']]
Emits : []


Name : build_db
Inputs : [[0, 'ffiles']]
Outputs : [[0, 'bdb']]
Emits : []


Name : run_blast
Inputs : [[0, 'bdb'], [1, 'seqs']]
Outputs : [[0, 'blout']]
Emits : []


Name : filter_blast
Inputs : [[0, 'blout'], [1, 'seqs']]
Outputs : [[0, 'digest'], [1, 'outseqs']]
Emits : []


Name : msa
Inputs : [[0, 'outseqs']]
Outputs : [[0, 'msa']]
Emits : []


Name : combine_out
Inputs : [[0, 'digest'], [1, 'seqs']]
Outputs : [[0, 'allout']]
Emits : []


Name : prune_tree
Inputs : [[0, 'tree_ch'], [1, 'genomes_lst']]
Outputs : [[0, 'prntree']]
Emits : []


