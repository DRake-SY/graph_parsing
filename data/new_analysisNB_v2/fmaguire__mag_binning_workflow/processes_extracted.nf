Name : trim_reads
Inputs : [[0, 'metagenome_fastq_pair']]
Outputs : [[0, '']]
Emits : []


Name : run_metaspades
Inputs : [[0, 'METASPADES_run_params']]
Outputs : [[0, 'METASPADES_assemblies']]
Emits : []


Name : run_idba_ud
Inputs : [[0, 'IDBA_UD_run_params']]
Outputs : [[0, 'IDBAUD_assemblies']]
Emits : []


Name : run_megahit
Inputs : [[0, 'MEGAHIT_run_params']]
Outputs : [[0, 'MEGAHIT_assemblies']]
Emits : []


Name : coverage_analysis
Inputs : [[0, 'assembly_coverage_input']]
Outputs : [[0, '']]
Emits : []


Name : run_metabat2
Inputs : [[0, 'METABAT2_run_params']]
Outputs : [[0, 'METABAT2_bins']]
Emits : []


Name : run_maxbin2
Inputs : [[0, 'MAXBIN2_run_params']]
Outputs : [[0, 'MAXBIN2_bins']]
Emits : []


Name : get_concoct_coverage
Inputs : [[0, 'CONCOCT_coverage_input']]
Outputs : [[0, 'CONCOCT_input']]
Emits : []


Name : run_concoct
Inputs : [[0, 'CONCOCT_run_params']]
Outputs : [[0, 'CONCOCT_bins']]
Emits : []


