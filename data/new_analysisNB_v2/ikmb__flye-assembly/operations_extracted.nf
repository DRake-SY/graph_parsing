OPERATION_1 string : Ref = Channel.fromPath(file(params.reference))
OPERATION_1 origin : [['file(params.reference', 'A']]
OPERATION_1 gives  : [['Ref', 'P']]


OPERATION_2 string : Ref = Channel.empty()
OPERATION_2 origin : []
OPERATION_2 gives  : [['Ref', 'P']]


OPERATION_3 string : bamFile = Channel
		.fromPath(params.bam)
		.ifEmpty { exit 1, "Could not find an input bam file" }
		.map { b -> [ file(b).getBaseName(), file(b), file("${b}.pbi") ] }
OPERATION_3 origin : [['params.bam', 'A']]
OPERATION_3 gives  : [['bamFile', 'P']]


OPERATION_4 string : bamFile = Channel.from(file(params.samples))
	       	.splitCsv(sep: ';', header: true)
		.map { row -> 
			def project_name = row.ProjectID
			def movie = returnFile( row.Movie )
			def movie_index = returnFile( row.MovieIndex )
			[ project_name, movie, movie_index ]
		}
OPERATION_4 origin : []
OPERATION_4 gives  : [['bamFile', 'P']]


OPERATION_5 string : HifiasmAssembly = Channel.empty()
OPERATION_5 origin : []
OPERATION_5 gives  : [['HifiasmAssembly', 'P']]


OPERATION_6 string : HifiasmAssemblyQuast = Channel.empty()
OPERATION_6 origin : []
OPERATION_6 gives  : [['HifiasmAssemblyQuast', 'P']]


OPERATION_7 string : IpaAssembly = Channel.empty()
OPERATION_7 origin : []
OPERATION_7 gives  : [['IpaAssembly', 'P']]


OPERATION_8 string : IpaAssemblyQuast = Channel.empty()
OPERATION_8 origin : []
OPERATION_8 gives  : [['IpaAssemblyQuast', 'P']]


OPERATION_9 string : FlyeAssembly = Channel.empty()
OPERATION_9 origin : []
OPERATION_9 gives  : [['FlyeAssembly', 'P']]


OPERATION_10 string : FlyeAssemblyBusco = Channel.empty()
OPERATION_10 origin : []
OPERATION_10 gives  : [['FlyeAssemblyBusco', 'P']]


OPERATION_11 string : FlyeAssemblyQuast = Channel.empty()	
OPERATION_11 origin : []
OPERATION_11 gives  : [['FlyeAssemblyQuast', 'P']]


OPERATION_12 string : CanuAssembly = Channel.empty()
OPERATION_12 origin : []
OPERATION_12 gives  : [['CanuAssembly', 'P']]


OPERATION_13 string : CanuAssemblyQuast = Channel.empty()
OPERATION_13 origin : []
OPERATION_13 gives  : [['CanuAssemblyQuast', 'P']]


OPERATION_14 string : ReadChunksGrouped = ReadChunks.groupTuple()
OPERATION_14 origin : [['ReadChunks', 'P']]
OPERATION_14 gives  : [['ReadChunksGrouped', 'P']]


OPERATION_15 string : ReadsFinal
	.groupTuple()
	.into { grouped_movies; grouped_movies_canu; grouped_movies_hifiasm; grouped_movies_ipa }
OPERATION_15 origin : [['ReadsFinal', 'P']]
OPERATION_15 gives  : [['grouped_movies', 'P'], ['grouped_movies_canu', 'P'], ['grouped_movies_hifiasm', 'P'], ['grouped_movies_ipa', 'P']]


OPERATION_16 string : Assembly = FlyeAssembly.concat(CanuAssembly).concat(HifiasmAssembly).concat(IpaAssembly)
OPERATION_16 origin : [['FlyeAssembly', 'P'], ['CanuAssembly', 'P'], ['HifiasmAssembly', 'P'], ['IpaAssembly', 'P']]
OPERATION_16 gives  : [['Assembly', 'P']]


OPERATION_17 string : AssemblyQuast = FlyeAssemblyQuast.concat(CanuAssemblyQuast).concat(HifiasmAssemblyQuast).concat(IpaAssemblyQuast)
OPERATION_17 origin : [['FlyeAssemblyQuast', 'P'], ['CanuAssemblyQuast', 'P'], ['HifiasmAssemblyQuast', 'P'], ['IpaAssemblyQuast', 'P']]
OPERATION_17 gives  : [['AssemblyQuast', 'P']]


OPERATION_18 string : mergedReads = bamFile
OPERATION_18 origin : [['bamFile', 'P']]
OPERATION_18 gives  : [['mergedReads', 'P']]


OPERATION_19 string : ReadsFinal = Reads
OPERATION_19 origin : [['Reads', 'P']]
OPERATION_19 gives  : [['ReadsFinal', 'P']]


