Name : FastQCPre
Inputs : [[0, 'reads_prefilter_ch']]
Outputs : []
Emits : []


Name : runBBMapReadRepair
Inputs : [[0, 'read_pairs_ch']]
Outputs : [[0, 'read_pairs_repaired_ch']]
Emits : []


Name : runBBMapAdapterTrimming
Inputs : [[0, 'read_pairs_repaired_ch']]
Outputs : [[0, 'read_pairs_trimmed_ch']]
Emits : []


Name : runBBMapQualityFiltering
Inputs : [[0, 'read_pairs_trimmed_ch']]
Outputs : [[0, 'read_pairs_qfilter_ch']]
Emits : []


Name : runBBMapReadCorrection
Inputs : [[0, 'read_pairs_qfilter_ch']]
Outputs : [[0, 'read_pairs_corrected_ch'], [0, 'reads_postqc_ch']]
Emits : []


Name : FastQCPost
Inputs : [[0, 'reads_postqc_ch']]
Outputs : []
Emits : []


Name : runSKESA
Inputs : [[0, 'read_pairs_corrected_ch']]
Outputs : [[0, 'assembly_ch']]
Emits : []


Name : produceBAM
Inputs : [[0, 'assembly_ch']]
Outputs : [[0, 'bam_ch']]
Emits : []


Name : sortBAM
Inputs : [[0, 'bam_ch']]
Outputs : [[0, 'sorted_bam_ch']]
Emits : []


Name : indexBAM
Inputs : [[0, 'sorted_bam_ch']]
Outputs : [[0, 'indexed_bam_ch'], [0, 'bamqc_ch']]
Emits : []


Name : runPilon
Inputs : [[0, 'indexed_bam_ch']]
Outputs : [[0, 'polished_assembly_ch1'], [0, 'polished_assembly_ch2'], [0, 'polished_assembly_ch3'], [0, 'polished_assembly_ch4'], [0, 'polished_assembly_ch5'], [0, 'polished_assembly_ch6'], [0, 'polished_assembly_ch7']]
Emits : []


Name : runQuast
Inputs : [[0, 'polished_assembly_ch7']]
Outputs : []
Emits : []


Name : runProkka
Inputs : [[0, 'polished_assembly_ch1']]
Outputs : []
Emits : []


Name : runStarAMR
Inputs : [[0, 'polished_assembly_ch2']]
Outputs : []
Emits : []


Name : runAbricate
Inputs : [[0, 'polished_assembly_ch6'], [1, 'params']]
Outputs : []
Emits : []


Name : runMobRecon
Inputs : [[0, 'polished_assembly_ch3']]
Outputs : []
Emits : []


Name : runMLST
Inputs : [[0, 'polished_assembly_ch4']]
Outputs : []
Emits : []


