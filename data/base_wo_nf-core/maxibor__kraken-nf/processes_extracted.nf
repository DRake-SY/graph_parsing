Name : AdapterRemoval
Inputs : [[0, 'reads_to_trim']]
Outputs : [[0, 'trimmed_reads'], [1, 'adapter_removal_results_multiqc']]
Emits : []


Name : kraken2
Inputs : [[0, 'trimmed_reads'], [1, 'krakendb']]
Outputs : [[0, 'kraken_out'], [1, 'kraken_report']]
Emits : []


Name : kraken_report_backward_compatibility
Inputs : [[0, 'kraken_report_back']]
Outputs : [[0, 'kraken_report_old']]
Emits : []


Name : build_bracken_db
Inputs : [[0, 'krakendb']]
Outputs : [[0, 'bracken_db']]
Emits : []


Name : bracken
Inputs : [[0, 'kraken_report_bracken'], [1, 'bracken_db']]
Outputs : [[0, 'bracken_report'], [1, 'bracken_new_report']]
Emits : []


Name : kraken_parse
Inputs : [[0, 'kraken_report_parse']]
Outputs : [[0, 'kraken_parsed']]
Emits : []


Name : kraken_merge
Inputs : [[0, 'kraken_parsed']]
Outputs : [[0, 'kraken_merged']]
Emits : []


Name : multiqc
Inputs : [[0, 'adapter_removal_results_multiqc'], [1, 'kraken_report_multiqc_file']]
Outputs : []
Emits : []


