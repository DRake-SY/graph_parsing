Name : multiBamSummary
Inputs : [[0, 'bam_ch'], [1, 'blackListFileName']]
Outputs : [[0, 'multiBamSummary_out'], [0, 'mbs_pca_in_ch']]
Emits : []


Name : plotCorrelation
Inputs : [[0, 'multiBamSummary_out'], [1, 'whatToPlot'], [2, 'method']]
Outputs : [[0, 'cor_out']]
Emits : []


Name : plotPCA
Inputs : [[0, 'mbs_pca_in_ch']]
Outputs : [[0, 'pca']]
Emits : []


