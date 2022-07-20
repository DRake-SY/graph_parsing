Name : createDecoyDb
Inputs : [[0, 'fasta_file']]
Outputs : [[0, 'fasta_decoy_db']]
Emits : []


Name : createTandemConfig
Inputs : [[0, 'xtandem_template']]
Outputs : [[0, 'xtandem_settings']]
Emits : []


Name : searchTandem
Inputs : [[0, 'xtandem_settings'], [1, 'xtandem_taxonomy'], [2, 'fasta_decoy_db'], [3, 'mgf_files']]
Outputs : [[0, 'xtandem_result']]
Emits : []


Name : createMsgfDbIndex
Inputs : [[0, 'fasta_file']]
Outputs : [[0, 'msgf_fasta_index']]
Emits : []


Name : searchMsgf
Inputs : [[0, 'fasta_file'], [1, 'msgf_fasta_index'], [2, 'mgf_files_msgf'], [3, 'msgf_mods']]
Outputs : [[0, 'msgf_result']]
Emits : []


Name : annotateMsgf
Inputs : [[0, 'msgf_combined']]
Outputs : [[0, 'msgf_annotated']]
Emits : []


Name : annotateTandem
Inputs : [[0, 'xtandem_combined']]
Outputs : [[0, 'xtandem_annotated']]
Emits : []


Name : runClustering
Inputs : [[0, 'annotated_mgf']]
Outputs : [[0, 'clustering_result']]
Emits : []


Name : transferIds
Inputs : [[0, 'clustering_result'], [1, 'fasta_file']]
Outputs : [[0, 'spectral_counts']]
Emits : []


