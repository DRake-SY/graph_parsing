Name : unicyclerShortReadsOnly
Inputs : [[0, '16'], [1, '"short_reads"'], [2, 'params'], [3, 'illumina_ch'], [4, 'unicycler_modes']]
Outputs : [[2, 'contigsShortReadsOnly']]
Emits : []


Name : unicyclerLongReadsOnly
Inputs : [[0, '16'], [1, '"long_reads"'], [2, 'params'], [3, 'long_read_ch'], [4, 'unicycler_modes']]
Outputs : [[1, 'contigsLongReadsOnly']]
Emits : []


Name : unicyclerHybrid
Inputs : [[0, '16'], [1, '"hybrid"'], [2, 'params'], [3, 'hybrid_ch'], [4, 'unicycler_modes']]
Outputs : [[1, 'contigsHybrid']]
Emits : []


Name : summarizeAssemblies
Inputs : [[0, 'contigsForSummary']]
Outputs : [[0, 'assembly_summaries_ch']]
Emits : []


Name : prokkaAnnotate
Inputs : [[0, 'contigsForProkka'], [1, '16']]
Outputs : []
Emits : []


Name : summarizeAll
Inputs : [[0, 'assembly_summaries_ch']]
Outputs : []
Emits : []


