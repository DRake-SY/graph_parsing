Name : get_software_versions
Inputs : []
Outputs : [[0, 'software_versions_yaml']]
Emits : []


Name : prokka
Inputs : [[0, 'fasta_dataset']]
Outputs : [[0, 'gff'], [1, 'prokka']]
Emits : []


Name : roary
Inputs : [[0, 'gff']]
Outputs : [[0, 'roary'], [1, 'pan_genome']]
Emits : []


Name : multiqc
Inputs : [[0, 'multiqc_config'], [1, 'software_versions_yaml'], [2, 'summary']]
Outputs : [[0, 'multiqc_report']]
Emits : []


