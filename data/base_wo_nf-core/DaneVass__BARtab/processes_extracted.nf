Name : fastqc
Inputs : [[0, 'qcChannel']]
Outputs : [[0, 'ch_out_fastqc']]
Emits : []


Name : merge_reads
Inputs : [[0, 'readsChannel']]
Outputs : [[0, 'mergedReadsChannel'], [5, 'mergedLogChannel']]
Emits : []


Name : gunzip_reads_PE
Inputs : [[0, 'mergedReadsChannel']]
Outputs : [[0, 'prefilterReadsChannel']]
Emits : []


Name : gunzip_reads_SE
Inputs : [[0, 'readsChannel']]
Outputs : [[0, 'prefilterReadsChannel']]
Emits : []


Name : filter_reads_PE
Inputs : [[0, 'prefilterReadsChannel']]
Outputs : [[0, 'filteredReadsChannel'], [1, 'filteredLogChannel']]
Emits : []


Name : filter_reads_SE
Inputs : [[0, 'prefilterReadsChannel']]
Outputs : [[0, 'filteredReadsChannel'], [1, 'filteredLogChannel']]
Emits : []


Name : cutadapt_reads
Inputs : [[0, 'filteredReadsChannel']]
Outputs : [[0, 'trimmedReadsChannel'], [1, 'trimmedLogChannel']]
Emits : []


Name : buildIndex
Inputs : [[0, 'params']]
Outputs : [[0, 'indexChannel']]
Emits : []


Name : align_barcodes
Inputs : [[0, 'trimmedReadsChannel'], [1, 'indexChannel']]
Outputs : [[0, 'mappedReadsChannel'], [1, 'unmappedReadsChannel'], [3, 'mappedLogChannel']]
Emits : []


Name : get_barcode_counts
Inputs : [[0, 'mappedReadsChannel']]
Outputs : [[0, 'rawCountsChannel']]
Emits : []


Name : combine_barcode_counts
Inputs : [[0, 'rawCountsChannel']]
Outputs : []
Emits : []


Name : multiqc
Inputs : [[0, 'ch_config_for_multiqc'], [1, 'ch_out_fastqc'], [2, 'filteredLogChannel'], [3, 'trimmedLogChannel'], [4, 'mappedLogChannel']]
Outputs : [[0, 'multiqc_report']]
Emits : []


Name : software_check
Inputs : []
Outputs : [[0, 'versionsChannel']]
Emits : []


