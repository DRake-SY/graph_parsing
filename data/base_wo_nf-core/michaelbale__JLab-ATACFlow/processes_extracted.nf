Name : catLanes
Inputs : [[0, 'inFq_ch']]
Outputs : [[0, 'reads_ch']]
Emits : []


Name : trim
Inputs : [[0, 'reads_ch']]
Outputs : [[0, 'trimmomaticLogs_ch'], [1, 'trimmedReads_ch'], [1, 'tReadsFqc_ch']]
Emits : []


Name : fastqc
Inputs : [[0, 'tReadsFqc_ch']]
Outputs : [[0, 'fastqc_ch']]
Emits : []


Name : bowtieAlign
Inputs : [[0, 'params'], [1, 'trimmedReads_ch']]
Outputs : [[0, 'bt2Logs_ch'], [1, 'bt2Bam_ch']]
Emits : []


Name : filterPrimaryAln
Inputs : [[0, 'params'], [1, 'bt2Bam_ch']]
Outputs : [[0, 'idxstats_ch'], [1, 'picardISStats_ch'], [2, 'picardDupStats_ch'], [3, 'finalBam_ch'], [3, 'bamForPeaks_ch'], [4, 'forPCA_ch'], [4, 'forBEPImage_ch'], [5, 'names_ch']]
Emits : []


Name : callHMMRATAC
Inputs : [[0, 'bamForPeaks_ch'], [1, 'params']]
Outputs : [[0, 'narrowPeaks_ch']]
Emits : []


Name : ChIPr
Inputs : [[0, 'params'], [1, 'groupedNarrowPeaks_ch']]
Outputs : []
Emits : []


Name : makeBigwig
Inputs : [[0, 'finalBam_ch']]
Outputs : [[0, 'bigwig_ch'], [0, 'bigwig2_ch'], [0, 'bigwig3_ch'], [1, 'labels_ch'], [2, 'forGEnrichPlot_ch']]
Emits : []


Name : generateGlobalFragmentPDF
Inputs : [[0, 'sortedNamedBam'], [1, 'BEFPDF_ch'], [2, 'params']]
Outputs : []
Emits : []


Name : plotPCA
Inputs : [[0, 'forPCA_ch'], [1, 'params'], [2, 'params']]
Outputs : [[0, 'results_ch']]
Emits : []


Name : multiqc
Inputs : [[0, 'fastqc_ch'], [0, 'idxstats_ch'], [0, 'picardISStats_ch'], [0, 'picardDupStats_ch'], [0, 'trimmomaticLogs_ch'], [0, 'bt2Logs_ch']]
Outputs : []
Emits : []


Name : computeMatrixDefault
Inputs : [[0, 'bigwig_ch'], [1, 'params']]
Outputs : [[0, 'tssMatrixGW_ch'], [1, 'profileMatrixGW_ch'], [2, 'tssMatrixglob_ch'], [3, 'srMatrixglob_ch']]
Emits : []


Name : generateEnrichPlots
Inputs : [[0, 'tssMatrixGW_ch'], [1, 'profileMatrixGW_ch']]
Outputs : []
Emits : []


Name : makeGlobalEnrichPlots
Inputs : [[0, 'params'], [1, 'tssMatrixglob_ch'], [2, 'srMatrixglob_ch']]
Outputs : []
Emits : []


Name : computeMatExtra
Inputs : [[0, 'totalExtraBed_ch']]
Outputs : [[0, 'addBEDMatTuple_ch'], [1, 'addBEDMatTupleGlobal_ch']]
Emits : []


Name : generateExtraBEDProfiles
Inputs : [[0, 'addBEDMatTuple_ch']]
Outputs : []
Emits : []


Name : generateGlobalExtraBED
Inputs : [[0, 'mixedExtraBEDsGT_ch']]
Outputs : []
Emits : []


Name : computeMatExtraRP
Inputs : [[0, 'totalExtraBed2_ch']]
Outputs : [[0, 'addBEDMatTuple2_ch'], [1, 'addBEDMatTupleGlobal2_ch']]
Emits : []


Name : generateExtraBEDRP
Inputs : [[0, 'addBEDMatTuple2_ch']]
Outputs : []
Emits : []


Name : generateGlobalExtraBEDRP
Inputs : [[0, 'mixedExtraBEDsGT2_ch']]
Outputs : []
Emits : []


