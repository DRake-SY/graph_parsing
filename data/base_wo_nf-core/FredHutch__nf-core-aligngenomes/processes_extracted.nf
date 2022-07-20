Name : correctHeaders
Inputs : [[0, 'reads_ch']]
Outputs : [[0, 'reads_for_alignment'], [0, 'reads_for_counting afterScript']]
Emits : []


Name : alignGenome
Inputs : [[0, 'genomes_ch'], [1, 'reads_for_alignment'], [2, '8']]
Outputs : [[0, 'bam_ch']]
Emits : []


Name : sortBAM
Inputs : [[0, 'bam_ch']]
Outputs : [[0, 'sorted_bam_ch']]
Emits : []


Name : alignmentStats
Inputs : [[0, 'sorted_bam_ch']]
Outputs : [[0, 'stats_ch'], [1, 'pileup_ch']]
Emits : []


Name : summarizeEach
Inputs : [[0, 'stats_ch']]
Outputs : [[0, 'all_stats_ch']]
Emits : []


Name : countReads
Inputs : [[0, 'reads_for_counting']]
Outputs : [[0, 'counts_ch']]
Emits : []


Name : collectPileups
Inputs : [[0, 'pileup_ch']]
Outputs : []
Emits : []


Name : collectCounts
Inputs : [[0, 'counts_ch']]
Outputs : [[0, 'readcounts_csv']]
Emits : []


Name : collectAll
Inputs : [[0, 'all_stats_ch'], [1, 'readcounts_csv']]
Outputs : []
Emits : []


