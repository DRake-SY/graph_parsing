Name : copyFiles
Inputs : [[0, 'fq']]
Outputs : [[0, 'fq_channel']]
Emits : []


Name : runFastqc
Inputs : [[0, 'ch_fastqc']]
Outputs : [[0, 'results_fastqc']]
Emits : []


Name : runTrimgalore
Inputs : [[0, 'ch_trimgalore']]
Outputs : [[0, 'results_trimgalore'], [1, 'trimmed_channel']]
Emits : []


Name : runBismarkPE
Inputs : [[0, 'ch_BismarkPE']]
Outputs : [[0, 'results_BismarkPE'], [1, 'bismarkR1_channel'], [2, 'bismarkR2_channel'], [3, 'bamPE_channel']]
Emits : []


Name : runBismarkR1
Inputs : [[0, 'bismarkR1_channel']]
Outputs : [[0, 'results_BismarkR1'], [1, 'bamR1_channel']]
Emits : []


Name : runBismarkR2
Inputs : [[0, 'bismarkR2_channel']]
Outputs : [[0, 'results_BismarkR2'], [1, 'bamR2_channel']]
Emits : []


Name : runBismark_extractor
Inputs : [[0, 'ch_Bismark_extractor_bamPE'], [1, 'ch_Bismark_extractor_bamR1'], [2, 'ch_Bismark_extractor_bamR2']]
Outputs : [[0, 'results_BismarkExtractor']]
Emits : []


Name : runSamtools_view
Inputs : [[0, 'ch_Samtools_bamPE'], [1, 'ch_Samtools_bamR1'], [2, 'ch_Samtools_bamR2']]
Outputs : [[0, 'merge_channel']]
Emits : []


Name : runSamtools_merge
Inputs : [[0, 'merge_channel']]
Outputs : [[0, 'sam_merge_channel']]
Emits : []


Name : runSamtools_merge_sort
Inputs : [[0, 'ch_Samtools_merge_sort']]
Outputs : [[0, 'sam_sort_channel']]
Emits : []


Name : runSamtools_merge_index
Inputs : [[0, 'ch_Samtools_merge_index']]
Outputs : [[0, 'results_Samtools_index']]
Emits : []


Name : runBismark_extractor_merged
Inputs : [[0, 'ch_Bismark_extractor_merged']]
Outputs : [[0, 'results_BismarkExtractor_merged']]
Emits : []


