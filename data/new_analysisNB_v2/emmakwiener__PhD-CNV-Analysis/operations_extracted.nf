OPERATION_1 string : mixed_pairs = Channel.fromFilePairs("${mixed}{.bam,.bai}", size:2)
OPERATION_1 origin : [['"${mixed}{.bam,.bai}", size:2', 'A']]
OPERATION_1 gives  : [['mixed_pairs', 'P']]


OPERATION_2 string : mixed_bams = Channel.fromPath("${mixed}{.bam,.bai}")
OPERATION_2 origin : [['"${mixed}{.bam,.bai}"', 'A']]
OPERATION_2 gives  : [['mixed_bams', 'P']]


OPERATION_3 string : kg_pairs = Channel.fromFilePairs("${kg}{.bam,.bai}", size:2) { file -> file.simpleName }
OPERATION_3 origin : [['"${kg}{.bam,.bai}", size:2', 'A']]
OPERATION_3 gives  : [['kg_pairs', 'P']]


OPERATION_4 string : kg_bams = Channel.fromPath("${kg}{.bam,.bai}")
OPERATION_4 origin : [['"${kg}{.bam,.bai}"', 'A']]
OPERATION_4 gives  : [['kg_bams', 'P']]


OPERATION_5 string : pairs = kg_pairs.mix(mixed_pairs)
OPERATION_5 origin : [['kg_pairs', 'P'], ['mixed_pairs', 'P']]
OPERATION_5 gives  : [['pairs', 'P']]


OPERATION_6 string : bams = kg_bams.mix(mixed_bams)
OPERATION_6 origin : [['kg_bams', 'P'], ['mixed_bams', 'P']]
OPERATION_6 gives  : [['bams', 'P']]


OPERATION_7 string : chrom_list = chroms.join(" ")
OPERATION_7 origin : [['chroms', 'P']]
OPERATION_7 gives  : [['chrom_list', 'P']]


