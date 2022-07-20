Name : getFastq
Inputs : []
Outputs : [[0, 'ch_getfastq_1'], [1, 'ch_getfastq_2']]
Emits : []


Name : runFastqc
Inputs : [[0, 'ch_getfastq_1'], [1, 'ch_getfastq_2']]
Outputs : [[0, 'ch_dummy1'], [1, 'ch_dummy2']]
Emits : []


Name : removePrimersAdapters
Inputs : [[0, 'ch_into_trim1'], [1, 'ch_into_trim2']]
Outputs : [[0, 'ch_removepa_1'], [1, 'ch_removepa_2']]
Emits : []


Name : trimLowQuality
Inputs : [[0, 'ch_removepa_1'], [1, 'ch_removepa_2']]
Outputs : [[0, 'ch_trimlq1'], [1, 'ch_trimlq2']]
Emits : []


Name : indexReference1
Inputs : []
Outputs : []
Emits : []


Name : alignSequence
Inputs : [[0, 'ch_into_alignment1'], [1, 'ch_into_alignment2']]
Outputs : [[0, 'ch_alignsequence']]
Emits : []


Name : convertSam
Inputs : [[0, 'ch_alignsequence']]
Outputs : [[0, 'ch_convertsam']]
Emits : []


Name : alignBam
Inputs : [[0, 'ch_convertsam']]
Outputs : [[0, 'ch_alignbam']]
Emits : []


Name : indexBam1
Inputs : [[0, 'ch_alignbam']]
Outputs : [[0, 'ch_indexbam'], [1, 'ch_indexbai']]
Emits : []


Name : runFlagstat
Inputs : [[0, 'ch_indexbam'], [1, 'ch_indexbai']]
Outputs : [[0, 'ch_runflagstat_bam'], [1, 'ch_runflagstat_bai']]
Emits : []


Name : markingDuplicates
Inputs : [[0, 'ch_runflagstat_bam'], [1, 'ch_runflagstat_bai']]
Outputs : [[0, 'ch_markingduplicates']]
Emits : []


Name : indexBam2
Inputs : [[0, 'ch_markingduplicates']]
Outputs : [[0, 'ch_indexbam2'], [1, 'ch_indexbai2']]
Emits : []


Name : runQualimap
Inputs : [[0, 'ch_indexbam2'], [1, 'ch_indexbai2']]
Outputs : [[0, 'ch_runqualimap_bam'], [1, 'ch_runqualimap_bai']]
Emits : []


Name : indexReference2
Inputs : []
Outputs : []
Emits : []


Name : createReferenceDict
Inputs : []
Outputs : []
Emits : []


Name : recalibrateData
Inputs : [[0, 'ch_runqualimap_bam'], [1, 'ch_runqualimap_bai']]
Outputs : [[0, 'ch_recalibrate_bam'], [1, 'ch_recalibrate_bai'], [2, 'ch_recalibrate_table']]
Emits : []


Name : rescoreData
Inputs : [[0, 'ch_recalibrate_bam'], [1, 'ch_recalibrate_bai'], [2, 'ch_recalibrate_table']]
Outputs : [[0, 'ch_rescored']]
Emits : []


Name : haplotypeCalling
Inputs : [[0, 'ch_rescored']]
Outputs : [[0, 'ch_haplotype_bam'], [1, 'ch_haplotype_vcf']]
Emits : []


Name : selectingVariants
Inputs : [[0, 'ch_haplotype_vcf']]
Outputs : [[0, 'ch_selectvariants']]
Emits : []


Name : runFreebayes
Inputs : [[0, 'ch_haplotype_bam']]
Outputs : [[0, 'ch_freebayes']]
Emits : []


Name : compareCalling
Inputs : [[0, 'ch_selectvariants'], [1, 'ch_freebayes']]
Outputs : [[0, 'ch_compare']]
Emits : []


Name : filterVariants
Inputs : [[0, 'ch_compare']]
Outputs : [[0, 'ch_filtervariants']]
Emits : []


Name : downloadSnpeffGenome
Inputs : []
Outputs : []
Emits : []


Name : annotateVCF
Inputs : [[0, 'ch_filtervariants']]
Outputs : [[0, 'ch_annotate']]
Emits : []


Name : geneSelection
Inputs : [[0, 'ch_annotate']]
Outputs : []
Emits : []


