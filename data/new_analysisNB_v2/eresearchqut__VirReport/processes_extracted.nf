Name : readprocessing
Inputs : [[0, 'read_size_selection_ch']]
Outputs : [[2, 'velvet_ch'], [3, 'spades_ch']]
Emits : []


Name : velvet
Inputs : [[0, 'velvet_ch']]
Outputs : [[1, 'sampleid'], [2, 'cap3_ch']]
Emits : []


Name : cap3
Inputs : [[0, 'cap3_ch']]
Outputs : [[0, 'blastn_nt_velvet_ch'], [1, 'blast_nt_localdb_velvet_ch'], [1, 'getorf_ch']]
Emits : []


Name : blastn_nt_velvet
Inputs : [[0, 'blastn_nt_velvet_ch']]
Outputs : [[3, 'blastTools_blastn_velvet_ch']]
Emits : []


Name : BlastTools_blastn_velvet
Inputs : [[0, 'blastTools_blastn_velvet_ch']]
Outputs : [[1, 'blastTools_results_ch']]
Emits : []


Name : blast_nt_localdb_velvet
Inputs : [[0, 'blast_nt_localdb_velvet_ch']]
Outputs : [[2, 'filter_blast_nt_localdb_velvet_ch']]
Emits : []


Name : filter_blast_nt_localdb_velvet
Inputs : [[0, 'filter_blast_nt_localdb_velvet_ch']]
Outputs : []
Emits : []


Name : filter_n_cov
Inputs : [[0, 'blastTools_results_ch']]
Outputs : [[1, 'contamination_flag']]
Emits : []


Name : contamination_detection
Inputs : [[0, 'contamination_detection_ch'], [1, 'contamination_flag']]
Outputs : []
Emits : []


Name : getorf
Inputs : [[0, 'getorf_ch']]
Outputs : [[2, 'blastp_ch']]
Emits : []


Name : blastp
Inputs : [[0, 'blastp_ch']]
Outputs : [[1, 'blastpdbcmd_ch']]
Emits : []


Name : blastpdbcmd
Inputs : [[0, 'blastpdbcmd_ch']]
Outputs : [[1, 'BlastToolsp_ch']]
Emits : []


Name : BlastToolsp
Inputs : [[0, 'BlastToolsp_ch']]
Outputs : []
Emits : []


Name : spades
Inputs : [[0, 'spades_ch']]
Outputs : [[2, 'cap3_spades_ch']]
Emits : []


Name : cap3_spades
Inputs : [[0, 'cap3_spades_ch']]
Outputs : [[1, 'blastn_nt_spades_ch']]
Emits : []


Name : blastn_nt_spades
Inputs : [[0, 'blastn_nt_spades_ch']]
Outputs : [[3, 'BlastTools_blastn_spades_ch']]
Emits : []


Name : BlastTools_blastn_spades
Inputs : [[0, 'BlastTools_blastn_spades_ch']]
Outputs : []
Emits : []


