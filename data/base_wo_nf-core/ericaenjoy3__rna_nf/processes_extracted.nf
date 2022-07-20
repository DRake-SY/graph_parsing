Name : fastQC
Inputs : [[0, 'FASTQC_FQ']]
Outputs : [[0, 'FASTQC_STAR'], [0, 'FASTQC_TOPHAT'], [0, 'FASTQC_SALMON']]
Emits : []


Name : salmonIndex
Inputs : [[0, 'SALMON_TRANS_FA']]
Outputs : [[0, 'SALMON_INDEX']]
Emits : []


Name : startIndex
Inputs : [[0, 'STAR_GENOME_FA'], [1, 'STAR_GTF']]
Outputs : [[0, 'STAR_INDEX']]
Emits : []


Name : bowtie2Index
Inputs : [[0, 'BOWTIE2_GENOME_FA']]
Outputs : [[0, 'BOWTIE2_INDEX']]
Emits : []


Name : starAlign
Inputs : [[0, 'STAR_INDEX'], [1, 'STAR_FQ'], [2, 'STAR_BAM_INDEX_TOOL']]
Outputs : [[0, 'STAR_BAM'], [1, 'STAR_ALL']]
Emits : []


Name : tophatAlign
Inputs : [[0, 'BOWTIE2_INDEX'], [1, 'TOPHAT_GTF'], [2, 'TOPHAT_FQ'], [3, 'TOPHAT_BAM_INDEX_TOOL']]
Outputs : [[0, 'TOPHAT_BAM'], [1, 'TOPHAT_ALL']]
Emits : []


Name : alignmentMetrics
Inputs : [[0, 'BAM_2ALIGN_STATS'], [1, 'PICARD_ALIGN_GENOME_FA']]
Outputs : [[0, 'ALIGN_STATS']]
Emits : []


Name : refFlat
Inputs : [[0, 'REFFLAT_GTF']]
Outputs : [[0, 'REFFlat_FOUT']]
Emits : []


Name : fetchChrSize
Inputs : [[0, 'CHRSIZE_FA']]
Outputs : [[0, 'CHRSIZE']]
Emits : []


Name : rRNAInterval
Inputs : [[0, 'CHRSIZE'], [1, 'RRNA_GTF']]
Outputs : [[0, 'RRNA']]
Emits : []


Name : seqMetrics
Inputs : [[0, 'BAM_2SEQ_STATS'], [1, 'PICARD_SEQ_GENOME_FA'], [2, 'RRNA'], [3, 'REFFlat_FOUT']]
Outputs : [[0, 'SEQ_STATS']]
Emits : []


Name : featureCounts
Inputs : [[0, 'BAM_2CNT'], [1, 'CNT_GTF']]
Outputs : [[0, 'CNT_FOUT']]
Emits : []


Name : salmonQuant
Inputs : [[0, 'SALMON_INDEX'], [1, 'SALMON_FQ']]
Outputs : [[0, 'SALMON_OUT']]
Emits : []


