Name : qualimap
Inputs : [[0, 'bams'], [1, 'qualimap_ff']]
Outputs : [[0, 'qualimap_results']]
Emits : []


Name : flagstat
Inputs : [[0, 'bams2']]
Outputs : [[0, 'flagstat_results']]
Emits : []


Name : multiqc
Inputs : [[0, 'qualimap_results'], [1, 'flagstat_results'], [2, 'multiqc_config']]
Outputs : [[0, 'final_output'], [1, 'final_output_data']]
Emits : []


