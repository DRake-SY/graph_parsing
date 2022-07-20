Name : mapping
Inputs : [[0, 'query'], [1, 'genome']]
Outputs : [[0, 'sam_files']]
Emits : []


Name : generateBam
Inputs : [[0, 'sam_files']]
Outputs : [[0, 'bam_files']]
Emits : []


Name : generateBed
Inputs : [[0, 'bam_files']]
Outputs : [[0, 'bed_files']]
Emits : []


Name : removeNonStandardChrom
Inputs : [[0, 'bed_files']]
Outputs : [[0, 'stdChr_files']]
Emits : []


Name : bedToUCSCNames
Inputs : [[0, 'stdChr_files']]
Outputs : [[0, 'bedUCSC_files']]
Emits : []


Name : generateBigBed
Inputs : [[0, 'bedUCSC_files']]
Outputs : [[0, 'bigBed_files']]
Emits : []


Name : generateBedGraph
Inputs : [[0, 'bam_files']]
Outputs : [[0, 'bedgraph_files']]
Emits : []


Name : bedgraphToUCSC
Inputs : [[0, 'bedgraph_files']]
Outputs : [[0, 'bedgraphUCSC_files']]
Emits : []


Name : bedSort
Inputs : [[0, 'bedgraphUCSC_files']]
Outputs : [[0, 'bedgraph_sorted_files']]
Emits : []


Name : generateBigWig
Inputs : [[0, 'bedgraph_sorted_files']]
Outputs : [[0, 'bigWig_files']]
Emits : []


Name : visualizeFastq
Inputs : [[0, 'query']]
Outputs : [[0, 'nanoplot_files']]
Emits : []


Name : uploadToS3
Inputs : [[0, 'bigBed_files'], [1, 'bigWig_files']]
Outputs : []
Emits : []


Name : bamIndex
Inputs : [[0, 'bam_files']]
Outputs : [[0, 'bamIndex_files']]
Emits : []


Name : flagstat
Inputs : [[0, 'bam_files']]
Outputs : [[0, 'flagstat_files']]
Emits : []


Name : geneBodyCov
Inputs : [[0, 'bam_files'], [1, 'refSeqBed'], [2, 'bamIndex_files']]
Outputs : [[0, 'geneBodyCov_files']]
Emits : []


Name : picard
Inputs : [[0, 'bam_files'], [1, 'refflat']]
Outputs : [[0, 'picard_files']]
Emits : []


