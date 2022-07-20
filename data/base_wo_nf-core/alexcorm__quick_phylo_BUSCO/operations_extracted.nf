OPERATION_1 string : genomesFasta = Channel
	.fromPath( [params.indir, '*.fna'].join(File.separator) )
	.map { file -> tuple(file.baseName, file) }
OPERATION_1 origin : [["[params.indir, '*.fna'].join(File.separator", 'A']]
OPERATION_1 gives  : [['genomesFasta', 'P']]


