Name : _pre1_fastqc_before
Inputs : [[0, 'fastq_inputs'], [1, 'mkfiles_pre1']]
Outputs : [[0, 'results_pre1_fastqc_before']]
Emits : []


Name : _001_trimmomatic
Inputs : [[0, 'fastq_inputs_again'], [1, 'mkfiles_001']]
Outputs : [[0, 'results_001_trimmomatic_trimmed_fq'], [1, 'results_001_trimmomatic_trimlog'], [2, 'results_001_trimmomatic_trimreport']]
Emits : []


Name : _an1_trimreport
Inputs : [[0, 'all_trimreports'], [1, 'mkfiles_an1']]
Outputs : []
Emits : []


Name : _pos1_gather_sample
Inputs : [[0, 'results_001_trimmomatic_trimmed_fq'], [1, 'mkfiles_pos1']]
Outputs : []
Emits : []


Name : _register_configs
Inputs : [[0, 'nfconfig']]
Outputs : []
Emits : []


