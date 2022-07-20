Name : MarkDuplicatesSpark
Inputs : [[0, 'ch_refFasta'], [1, 'ch_in_markDuplicatesSpark']]
Outputs : [[0, 'ch_out_markDuplicatesSpark']]
Emits : []


Name : HaplotypeCaller
Inputs : [[0, 'ch_refFasta'], [5, 'ch_in_haplotypeCaller']]
Outputs : [[0, 'ch_out_haplotypeCaller']]
Emits : []


