Name : fetchRef
Inputs : [[0, 'url'], [1, 'name']]
Outputs : [[0, 'kangaRefs'], [0, 'hisat2Refs'], [0, 'simReadsRefs']]
Emits : []


Name : fetchReads
Inputs : [[0, 'reads1url'], [1, 'reads2url']]
Outputs : [[0, 'FASTQ'], [0, 'hisat2FASTQ'], [0, 'kangaFASTQ']]
Emits : []


Name : kangaSimReads
Inputs : [[0, 'simReadsRefs'], [1, 'nsimreadsarr'], [2, 'seqerrs'], [3, '1']]
Outputs : [[0, 'kangaReads'], [0, 'hisat2reads'], [0, 'fa2fqreads']]
Emits : []


Name : fasta2mockFASTQ
Inputs : [[0, 'fa2fqreads']]
Outputs : [[0, 'MockFASTQ']]
Emits : []


Name : fastQC
Inputs : [[0, 'MockFASTQ'], [0, 'FASTQ']]
Outputs : [[0, 'fastqc_results']]
Emits : []


Name : multiQC
Inputs : [[0, 'fastqc_results']]
Outputs : [[0, 'multiqc_report'], [1, 'multiqc_data']]
Emits : []


Name : hisat2Index
Inputs : [[0, 'hisat2Refs']]
Outputs : [[0, 'hisat2dbs']]
Emits : []


Name : hisat2Align
Inputs : [[0, 'hisat2reads'], [0, 'hisat2FASTQ'], [1, 'hisat2dbs']]
Outputs : [[0, 'hisat2BAMs']]
Emits : []


Name : kangaIndex
Inputs : [[0, 'kangaRefs']]
Outputs : [[0, 'kangadbs']]
Emits : []


Name : kangaAlign
Inputs : [[0, 'kangaReads'], [0, 'kangaFASTQ'], [1, 'kangadbs']]
Outputs : [[0, 'kangaBAMs']]
Emits : []


Name : extractStatsFromBAMs
Inputs : [[0, 'kangaBAMs'], [0, 'hisat2BAMs']]
Outputs : [[0, 'statsFiles'], [1, 'longtags']]
Emits : []


Name : combineStats
Inputs : [[0, 'statsFiles'], [1, 'longtags']]
Outputs : [[0, 'allStatsForFigs'], [0, 'allStatsForDoc']]
Emits : []


Name : MOCK_generateFigures
Inputs : [[0, 'allStatsForFigs']]
Outputs : [[0, 'figures']]
Emits : []


Name : MOCK_generateReportMatter
Inputs : [[0, 'figures'], [1, 'allStatsForDoc'], [2, 'multiqc_report'], [3, 'multiqc_data'], [4, 'docheader']]
Outputs : []
Emits : []


