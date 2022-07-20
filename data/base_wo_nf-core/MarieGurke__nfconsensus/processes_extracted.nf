Name : IndexBAM
Inputs : [[0, 'bam_ch']]
Outputs : [[0, 'bambai_ch']]
Emits : []


Name : GetRegion
Inputs : [[0, 'bambai_ch']]
Outputs : [[0, 'regbam_ch']]
Emits : []


Name : CreateConsensus
Inputs : [[0, 'regbam_ch']]
Outputs : [[0, 'fasta_ch']]
Emits : []


Name : FastaHeader
Inputs : [[0, 'fasta_ch']]
Outputs : []
Emits : []


