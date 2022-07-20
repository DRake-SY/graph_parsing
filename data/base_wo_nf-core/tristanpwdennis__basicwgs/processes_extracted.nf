Name : ReadTrimming
Inputs : [[0, 'read_pairs_ch']]
Outputs : [[0, 'trimmed_reads'], [0, 'readsforqc']]
Emits : []


Name : FastQC
Inputs : [[0, 'readsforqc']]
Outputs : [[0, 'fastqc_ch']]
Emits : []


Name : bwaAlign
Inputs : [[0, 'ref1']]
Outputs : [[0, 'bwa_bam']]
Emits : []


Name : bwaSort
Inputs : [[0, 'bwa_bam']]
Outputs : [[0, 'bwa_sorted']]
Emits : []


Name : MarkDuplicates
Inputs : [[0, 'bwa_sorted']]
Outputs : [[0, 'dupmarked_ch']]
Emits : []


Name : AddOrReplaceReadGroups
Inputs : [[0, 'dupmarked_ch']]
Outputs : [[0, 'rg_bam'], [0, 'bamqc1'], [0, 'bamqc2'], [0, 'bamqc3']]
Emits : []


Name : Qualimap
Inputs : [[0, 'bamqc1']]
Outputs : [[0, 'qualimap_results']]
Emits : []


Name : FlagstatRun
Inputs : [[0, 'bamqc2']]
Outputs : [[0, 'flagstat_results'], [1, 'flagstat_collect']]
Emits : []


Name : FlagstatCollect
Inputs : [[0, 'flagstat_collect']]
Outputs : [[0, 'flagtextfile_ch']]
Emits : []


Name : MultiQC
Inputs : [[0, 'fastqc_ch'], [1, 'qualimap_results']]
Outputs : []
Emits : []


