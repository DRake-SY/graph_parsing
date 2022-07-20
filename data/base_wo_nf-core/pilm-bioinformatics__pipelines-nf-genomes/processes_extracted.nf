Name : get_software_versions
Inputs : []
Outputs : [[0, 'software_versions_yaml']]
Emits : []


Name : copy_fasta
Inputs : [[0, 'ch_fasta_for_cp']]
Outputs : [[0, 'ch_fasta_for_star_index'], [0, 'ch_fasta_for_hisat_index'], [0, 'ch_fasta_for_txome'], [0, 'ch_fasta_for_gentrome'], [0, 'ch_fasta_for_config']]
Emits : []


Name : copy_gtf
Inputs : [[0, 'ch_gtf_for_cp']]
Outputs : [[0, 'gtf_makeHisatSplicesites'], [0, 'gtf_makeHISATindex'], [0, 'gtf_makeSTARindex'], [0, 'ch_gtf_for_txome'], [0, 'ch_gtf_for_gentrome'], [0, 'ch_gtf_for_config'], [1, 'ch_pre_gtf']]
Emits : []


Name : makeSTARindex
Inputs : [[0, 'ch_fasta_for_star_index'], [1, 'gtf_makeSTARindex']]
Outputs : [[0, 'star_index']]
Emits : []


Name : makeHisatSplicesites
Inputs : [[0, 'gtf_makeHisatSplicesites']]
Outputs : [[0, 'indexing_splicesites'], [0, 'alignment_splicesites']]
Emits : []


Name : makeHISATindex
Inputs : [[0, 'ch_fasta_for_hisat_index'], [1, 'indexing_splicesites'], [2, 'gtf_makeHISATindex']]
Outputs : [[0, 'hs2_indices']]
Emits : []


Name : makeTxome
Inputs : [[0, 'ch_fasta_for_txome'], [1, 'ch_gtf_for_txome'], [2, 'ch_pre_gtf']]
Outputs : [[0, 'ch_txfasta_for_gentrome'], [0, 'ch_txfasta_for_config'], [1, 'ch_pre_txfasta_for_config']]
Emits : []


Name : makeGentrome
Inputs : [[0, 'ch_fasta_for_gentrome'], [1, 'ch_gtf_for_gentrome'], [2, 'ch_txfasta_for_gentrome']]
Outputs : [[0, 'ch_gentrome_for_config'], [1, 'ch_decoys_for_config']]
Emits : []


Name : config_file
Inputs : [[0, 'ch_fasta_for_config'], [1, 'ch_gtf_for_config'], [2, 'ch_txfasta_for_config'], [3, 'ch_pre_txfasta_for_config'], [4, 'ch_gentrome_for_config'], [5, 'ch_decoys_for_config']]
Outputs : []
Emits : []


Name : output_documentation
Inputs : [[0, 'ch_output_docs']]
Outputs : []
Emits : []


