Name : CreateSequenceDictionary
Inputs : [[0, 'ch_refFasta']]
Outputs : [[0, 'ch_out_createSequenceDictionary']]
Emits : []


Name : CollectAlignmentSummaryMetrics
Inputs : [[0, 'ch_refFasta'], [1, 'ch_in_collectAlignmentSummaryMetrics']]
Outputs : [[0, 'ch_out_collectAlignmentSummaryMetrics']]
Emits : []


Name : CollectInsertSizeMetrics
Inputs : [[0, 'ch_in_collectInsertSizeMetrics']]
Outputs : [[0, 'ch_out_collectInsertSizeMetrics']]
Emits : []


