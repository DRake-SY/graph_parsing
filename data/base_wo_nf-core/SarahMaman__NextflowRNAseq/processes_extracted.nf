Name : make_directories
Inputs : []
Outputs : []
Emits : []


Name : indexation_star
Inputs : []
Outputs : []
Emits : []


Name : star
Inputs : [[2, 'read_pairs']]
Outputs : []
Emits : []


Name : fastQCreport
Inputs : [[0, 'read_pairs5']]
Outputs : []
Emits : []


Name : Rsem
Inputs : [[2, 'read_pairs2']]
Outputs : []
Emits : []


Name : RsemConcat
Inputs : []
Outputs : []
Emits : []


Name : Cufflinks
Inputs : [[0, 'BAMtrans_ch'], [1, 'read_pairs3']]
Outputs : []
Emits : []


Name : CufflinksList
Inputs : []
Outputs : []
Emits : []


Name : Cuffmerge
Inputs : [[0, 'transcripts_ch']]
Outputs : []
Emits : []


Name : fCounts
Inputs : [[1, 'read_pairs_3']]
Outputs : []
Emits : []


Name : fCounts_quality
Inputs : []
Outputs : []
Emits : []


Name : fCountsOnRef
Inputs : [[1, 'read_pairs_4']]
Outputs : []
Emits : []


Name : fCountsOnRef_quality
Inputs : []
Outputs : []
Emits : []


Name : FEELnc
Inputs : []
Outputs : []
Emits : []


Name : quality
Inputs : []
Outputs : []
Emits : []


