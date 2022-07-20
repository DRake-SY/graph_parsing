OPERATION_1 string : gvcf_ch = Channel
			.fromPath(params.input)
OPERATION_1 origin : [['params.input', 'A']]
OPERATION_1 gives  : [['gvcf_ch', 'P']]


OPERATION_2 string : gvcf_idx_ch = Channel
			.fromPath(params.input)
			.map { file -> file+".idx" }
OPERATION_2 origin : [['params.input', 'A']]
OPERATION_2 gives  : [['gvcf_idx_ch', 'P']]


OPERATION_3 string : chromosomes_ch = Channel
    .from( "chr1", "chr2", "chr3", "chr4", "chr5", "chr6", "chr7", "chr8", "chr9", "chr10", "chr11", "chr12", "chr13", "chr14", "chr15", "chr16", "chr17", "chr18", "chr19", "chr20", "chr21", "chr22", "chrX", "chrY" )
OPERATION_3 origin : [['"chr1", "chr2", "chr3", "chr4", "chr5", "chr6", "chr7", "chr8", "chr9", "chr10", "chr11", "chr12", "chr13", "chr14", "chr15", "chr16", "chr17", "chr18", "chr19", "chr20", "chr21", "chr22", "chrX", "chrY"', 'V']]
OPERATION_3 gives  : [['chromosomes_ch', 'P']]


