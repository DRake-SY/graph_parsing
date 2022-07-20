Name : stats_NanoPlot
Inputs : [[0, 'in_qc']]
Outputs : []
Emits : []


Name : assembly_MetaFlye
Inputs : [[0, 'in_flye']]
Outputs : [[0, '']]
Emits : []


Name : map_CARD
Inputs : [[0, 'in_align']]
Outputs : [[0, 'card_aln']]
Emits : []


Name : mapFlye_CARD
Inputs : [[0, 'out_flye']]
Outputs : [[0, 'flyecard_aln']]
Emits : []


Name : aln_analysis
Inputs : [[0, 'card_aln'], [1, 'in_analysis']]
Outputs : [[0, 'in_summary']]
Emits : []


Name : alnFlye_analysis
Inputs : [[0, 'flyecard_aln'], [1, 'flye_analysis']]
Outputs : [[0, 'inflye_summary']]
Emits : []


Name : plasflow
Inputs : [[0, 'in_pf'], [0, 'inflye_pf']]
Outputs : [[0, 'out_pf']]
Emits : []


Name : taxonomy
Inputs : [[0, 'in_tax'], [0, 'inflye_tax']]
Outputs : [[0, '']]
Emits : []


Name : get_ssciname
Inputs : [[0, 'in_ssciname']]
Outputs : [[0, 'out_ssciname']]
Emits : []


Name : summary
Inputs : [[0, 'in_summary'], [0, 'inflye_summary'], [1, 'out_pf'], [2, 'out_taxonomy'], [3, 'out_ssciname']]
Outputs : []
Emits : []


