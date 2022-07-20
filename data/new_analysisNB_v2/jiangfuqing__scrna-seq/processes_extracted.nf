Name : get_software_versions
Inputs : []
Outputs : [[0, 'software_versions_yaml']]
Emits : []


Name : build_salmon_index
Inputs : [[0, 'fasta_alevin']]
Outputs : [[0, 'salmon_index_alevin']]
Emits : []


Name : build_txp2gene
Inputs : [[0, 'gtf_alevin']]
Outputs : [[0, 'txp2gene_alevin']]
Emits : []


Name : run_alevin
Inputs : [[0, 'read_files_alevin'], [1, 'salmon_index_alevin'], [2, 'txp2gene_alevin']]
Outputs : [[0, 'alevin_results']]
Emits : []


Name : run_alevin_qc
Inputs : [[0, 'alevin_results']]
Outputs : [[0, 'alevinqc_results']]
Emits : []


Name : output_documentation
Inputs : [[0, 'ch_output_docs']]
Outputs : []
Emits : []


