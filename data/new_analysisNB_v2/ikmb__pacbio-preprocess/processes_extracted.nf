Name : get_software_versions
Inputs : []
Outputs : [[1, 'software_versions_yaml']]
Emits : []


Name : BamToCCS
Inputs : [[0, 'bamFile'], [1, 'chunks']]
Outputs : [[0, 'ReadChunks'], [1, 'report']]
Emits : []


Name : CcsMerge
Inputs : [[0, 'ReadChunksGrouped']]
Outputs : [[0, 'mergedBam']]
Emits : []


Name : GetHiFiReads
Inputs : [[0, 'mergedBam']]
Outputs : [[0, 'ExtractedBam']]
Emits : []


Name : IndexBam
Inputs : [[0, 'ExtractedBam']]
Outputs : [[0, '']]
Emits : []


Name : PbDemux
Inputs : [[0, 'HiFiBam'], [1, 'barcodes']]
Outputs : [[0, 'final_bams'], [1, 'lima_reports']]
Emits : []


Name : bam2fasta
Inputs : [[0, 'bamQC']]
Outputs : [[0, 'fasta_reads']]
Emits : []


Name : nanoplot
Inputs : [[0, 'fasta_reads']]
Outputs : []
Emits : []


