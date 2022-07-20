Name : bam2cram
Inputs : [[0, 'inputbams'], [1, 'ch_fasta'], [2, 'ch_fai']]
Outputs : [[0, 'cramfiles'], [0, 'cramstats'], [0, 'sizecrams']]
Emits : []


Name : stats_bams
Inputs : [[0, 'bamstats']]
Outputs : [[0, 'bam_qc']]
Emits : []


Name : stats_crams
Inputs : [[0, 'cramstats']]
Outputs : [[0, 'cram_qc']]
Emits : []


Name : check_conversion
Inputs : [[0, 'cram_bam_qc'], [1, 'cram_bam_size']]
Outputs : [[0, 'report_qc']]
Emits : []


