Name : fastp
Inputs : [[0, 'IN_fastq_raw']]
Outputs : [[0, 'OUT_fastp']]
Emits : []


Name : kraken2
Inputs : [[0, 'OUT_fastp']]
Outputs : [[0, 'OUT_KRAKEN']]
Emits : []


Name : krona
Inputs : [[0, 'OUT_KRAKEN']]
Outputs : []
Emits : []


