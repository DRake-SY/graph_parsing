Name : metaphlan2
Inputs : [[0, 'input_channel']]
Outputs : [[0, 'metaphlan2_9_20_tabular_outputs_ignore_unknowns'], [1, 'metaphlan2_9_20_tabular_outputs_use_unknowns'], [2, 'metaphlan2_9_20_bowtie_outputs'], [3, 'logs']]
Emits : []


Name : metaphlan2_single_read
Inputs : [[0, 'input_channel']]
Outputs : [[0, 'metaphlan2_9_20_tabular_outputs_ignore_unknowns'], [1, 'metaphlan2_9_20_tabular_outputs_use_unknowns'], [2, 'metaphlan2_9_20_bowtie_outputs'], [3, 'logs']]
Emits : []


Name : merge_metaphlan_tables
Inputs : [[0, 'metaphlan2_9_20_tabular_outputs_ignore_unknowns'], [1, 'metaphlan2_9_20_tabular_outputs_use_unknowns']]
Outputs : [[0, 'final_outputs'], [1, 'final_outputs2'], [2, 'final_outputs3'], [3, 'final_outputs4'], [4, 'final_output5'], [5, 'final_output6']]
Emits : []


