Name : index
Inputs : []
Outputs : [[0, 'mnm_index'], [1, 'pbsv_fasta']]
Emits : []


Name : guppy
Inputs : []
Outputs : [[0, 'qc_summary'], [1, 'barcodedir']]
Emits : []


Name : pycoqc
Inputs : [[0, 'qc_summary']]
Outputs : [[0, 'completed_11']]
Emits : []


Name : minimap2
Inputs : [[0, 'barcodeIDmap'], [1, 'barcodedir'], [2, 'mnm_index']]
Outputs : [[0, ''], [1, 'mnm_fastq']]
Emits : []


Name : nanostat
Inputs : [[0, 'nanostat_bam']]
Outputs : [[0, 'nnosttc']]
Emits : []


Name : pbsv_discover_call
Inputs : [[0, 'pbsv_fasta'], [1, 'pbsv_bam']]
Outputs : [[0, 'pbsv_vcf'], [1, 'pbsv_complete']]
Emits : []


Name : pbsv_vcf
Inputs : [[0, 'pbsv_vcf']]
Outputs : [[0, 'pbsv_complete2']]
Emits : []


