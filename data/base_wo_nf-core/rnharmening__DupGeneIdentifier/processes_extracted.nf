Name : makedb
Inputs : [[0, 'file_for_db']]
Outputs : [[0, 'db']]
Emits : []


Name : blast
Inputs : [[0, 'db'], [0, 'file_for_blast'], [1, 'dbDir']]
Outputs : [[0, 'blast_table_ch']]
Emits : []


Name : identify_duplicated_genes
Inputs : [[0, 'blast_table_ch']]
Outputs : [[0, 'identical_identification_ch']]
Emits : []


Name : identify_idetical_to_remove_genes
Inputs : [[0, 'identical_identification_ch']]
Outputs : [[0, 'out_file']]
Emits : []


