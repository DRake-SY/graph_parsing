Name : cnvkit
Inputs : [[0, 'cnvkit_input'], [1, 'aa_repo_dir_path']]
Outputs : [[0, 'cnvkit_out'], [1, 'cnvkit_seeds']]
Emits : []


Name : amplified_intervals
Inputs : [[0, 'cnvkit_seeds'], [1, 'aa_repo_dir_path'], [2, 'mosek_license']]
Outputs : [[0, 'ampinter_seeds']]
Emits : []


Name : amplicon_architect
Inputs : [[0, 'seed_crams'], [1, 'aa_repo_dir_path'], [2, 'mosek_license']]
Outputs : [[0, 'aa_results'], [1, 'aa_results_log']]
Emits : []


Name : amplicon_classifier
Inputs : [[0, 'aa_results'], [1, 'aa_repo_dir_path'], [2, 'mosek_license']]
Outputs : [[0, 'aa_clases']]
Emits : []


