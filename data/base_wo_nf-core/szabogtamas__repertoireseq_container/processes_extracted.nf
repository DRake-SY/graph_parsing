Name : rnaBulkTrimmomaticPE
Inputs : [[0, 'params'], [1, 'params'], [2, 'insamples']]
Outputs : [[0, 'trimmed_fastqs']]
Emits : []


Name : reconstructBCRepertoireMiXCR
Inputs : [[0, 'params'], [1, 'trimmed_fastqs']]
Outputs : [[0, 'repertoire_reports'], [1, 'repertoire_clns']]
Emits : []


Name : mergeChainedMiXCR
Inputs : [[0, 'repertoire_clns']]
Outputs : [[0, 'repertoire_tables']]
Emits : []


Name : addPathToTable
Inputs : [[0, 'repertoire_tables']]
Outputs : [[0, 'tagged_repertoire_table']]
Emits : []


Name : generateReport
Inputs : [[0, 'params'], [1, 'params'], [2, 'params'], [3, 'params'], [4, 'params'], [5, 'params'], [6, 'params'], [7, 'params'], [8, 'params'], [9, 'report_template'], [10, 'sample_metafile'], [11, 'tagged_repertoire']]
Outputs : [[0, 'summary_tab'], [1, 'final_report'], [2, 'report_source']]
Emits : []


