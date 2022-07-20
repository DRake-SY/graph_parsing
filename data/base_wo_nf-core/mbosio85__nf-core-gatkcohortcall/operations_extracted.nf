OPERATION_1 string : chromosomes_ch = Channel
    .from( "chr1", "chr2", "chr3", "chr4", "chr5", "chr6", "chr7", "chr8", "chr9", "chr10", "chr11", "chr12", "chr13", "chr14", "chr15", "chr16", "chr17", "chr18", "chr19", "chr20", "chr21", "chr22", "chrX", "chrY" )
OPERATION_1 origin : [['"chr1", "chr2", "chr3", "chr4", "chr5", "chr6", "chr7", "chr8", "chr9", "chr10", "chr11", "chr12", "chr13", "chr14", "chr15", "chr16", "chr17", "chr18", "chr19", "chr20", "chr21", "chr22", "chrX", "chrY"', 'V']]
OPERATION_1 gives  : [['chromosomes_ch', 'P']]


OPERATION_2 string : chromosomes_ch = Channel
    .from( "1", "2", "3", "4", "5", "6", "7", "8", "9", "10", "11", "12", "13", "14", "15", "16", "17", "18", "19", "20", "21", "22", "X", "Y" )
OPERATION_2 origin : [['"1", "2", "3", "4", "5", "6", "7", "8", "9", "10", "11", "12", "13", "14", "15", "16", "17", "18", "19", "20", "21", "22", "X", "Y"', 'V']]
OPERATION_2 gives  : [['chromosomes_ch', 'P']]


OPERATION_3 string : ch_output_docs = Channel.fromPath("${baseDir}/docs/output.md")
OPERATION_3 origin : [['"${baseDir}/docs/output.md"', 'A']]
OPERATION_3 gives  : [['ch_output_docs', 'P']]


OPERATION_4 string : inputSample = Channel.empty()
OPERATION_4 origin : []
OPERATION_4 gives  : [['inputSample', 'P']]


OPERATION_5 string : ch_dbsnp = Channel.value(file(params.dbsnp))
OPERATION_5 origin : []
OPERATION_5 gives  : [['ch_dbsnp', 'P']]


OPERATION_6 string : ch_fasta = Channel.value(file(params.fasta))
OPERATION_6 origin : []
OPERATION_6 gives  : [['ch_fasta', 'P']]


OPERATION_7 string : ch_fastaFai = Channel.value(file(params.fastaFai))
OPERATION_7 origin : []
OPERATION_7 gives  : [['ch_fastaFai', 'P']]


OPERATION_8 string : ch_knownIndels = Channel.value(li_knownIndels.collect())
OPERATION_8 origin : []
OPERATION_8 gives  : [['ch_knownIndels', 'P']]


OPERATION_9 string : Channel.value(file(params.knownIndels))
OPERATION_9 origin : []
OPERATION_9 gives  : []


OPERATION_10 string : summary.collect { k, v -> "${k.padRight(18)}: $v" }.join("\n")
OPERATION_10 origin : [['summary', 'P']]
OPERATION_10 gives  : []


