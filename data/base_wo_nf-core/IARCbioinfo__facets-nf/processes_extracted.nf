Name : snppileup
Inputs : [[0, 'tn_pairs'], [1, 'ch_vcf']]
Outputs : [[0, 'snppileup_result']]
Emits : []


Name : facets
Inputs : [[0, 'snppileup_result']]
Outputs : [[0, 'stats_summary'], [6, 'stats_summary_cval500'], [7, 'stats_summary_cval1000'], [8, 'stats_summary_cval1500']]
Emits : []


