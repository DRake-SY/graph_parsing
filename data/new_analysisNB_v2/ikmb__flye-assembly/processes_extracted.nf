Name : BamToCCS
Inputs : [[0, 'bamFile'], [1, 'chunks']]
Outputs : [[0, 'ReadChunks'], [1, 'report']]
Emits : []


Name : CcsMerge
Inputs : [[0, 'ReadChunksGrouped']]
Outputs : [[0, 'CCSReads']]
Emits : []


Name : ExtractHiFi
Inputs : [[0, 'CCSReads']]
Outputs : [[0, 'mergedReads']]
Emits : []


Name : BamToFastq
Inputs : [[0, 'mergedReads']]
Outputs : [[0, '']]
Emits : []


Name : runFastp
Inputs : [[0, 'Reads']]
Outputs : [[0, 'ReadsFinal']]
Emits : []


Name : Hifiasm
Inputs : [[0, 'grouped_movies_hifiasm']]
Outputs : [[0, 'HifiasmGraph']]
Emits : []


Name : GfaToFasta
Inputs : [[0, 'HifiasmGraph']]
Outputs : [[0, '']]
Emits : []


Name : IPA
Inputs : [[0, 'grouped_movies_ipa']]
Outputs : [[0, '']]
Emits : []


Name : FlyeLarge
Inputs : [[0, 'grouped_movies']]
Outputs : [[0, ''], [1, 'FlyeAssemblyQuast']]
Emits : []


Name : Flye
Inputs : [[0, 'grouped_movies']]
Outputs : [[0, ''], [1, 'FlyeAssemblyQuast']]
Emits : []


Name : Canu
Inputs : [[0, 'grouped_movies_canu']]
Outputs : [[1, 'report_canu'], [2, '']]
Emits : []


Name : nanoQC
Inputs : [[0, 'ReadsNanoqc']]
Outputs : [[0, 'qc_plot']]
Emits : []


Name : nanoPlot
Inputs : [[0, 'ReadsNanoplot']]
Outputs : []
Emits : []


Name : QCN50
Inputs : [[0, 'Assembly']]
Outputs : [[0, 'assembly_report']]
Emits : []


Name : KatGCP
Inputs : [[0, 'ReadsKat']]
Outputs : [[0, 'KatDist']]
Emits : []


Name : Quast
Inputs : [[0, 'AssemblyQuast']]
Outputs : [[0, 'quast_dir']]
Emits : []


Name : makeRef
Inputs : [[0, 'Ref']]
Outputs : [[0, 'RefMap']]
Emits : []


Name : Minimap
Inputs : [[0, 'ReadsAlign'], [1, 'RefMap']]
Outputs : [[0, 'sample']]
Emits : []


