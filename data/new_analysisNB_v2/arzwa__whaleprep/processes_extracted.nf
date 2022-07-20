Name : PrankAlignment
Inputs : [[0, 'fasta']]
Outputs : [[0, 'aln']]
Emits : []


Name : MrBayesMCMC
Inputs : [[0, 'aln']]
Outputs : [[0, 'mb']]
Emits : []


Name : AleObserve
Inputs : [[0, 'mb']]
Outputs : [[0, 'ale']]
Emits : []


