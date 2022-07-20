Name : download_db
Inputs : []
Outputs : [[0, 'silva_db'], [1, 'silva_species_db']]
Emits : []


Name : AdapterRemoval
Inputs : [[0, 'reads_to_trim']]
Outputs : [[0, 'trimmed_reads'], [1, 'adapter_removal_results']]
Emits : []


Name : dada2
Inputs : [[0, 'trimmed_reads'], [1, 'silva_db'], [2, 'silva_species_db']]
Outputs : [[0, 'dada_out'], [1, 'dada_classify'], [2, 'dada_read_count_table']]
Emits : []


Name : dada2_to_taxo
Inputs : [[0, 'dada_out']]
Outputs : [[0, 'dada_taxo']]
Emits : []


Name : dada_merge
Inputs : [[0, 'dada_taxo']]
Outputs : [[0, 'dada_merged']]
Emits : []


