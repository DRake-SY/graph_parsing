OPERATION_1 string : Channel
  .fromPath("${params.ref}")
  .into{ref_index_ch;ref_len_ch}
OPERATION_1 origin : [['"${params.ref}"', 'A']]
OPERATION_1 gives  : [['ref_index_ch', 'P'], ['ref_len_ch', 'P']]


OPERATION_2 string : Channel
  .fromFilePairs("${params.read_dir}*/*_R{1,2}.fastq.gz")
  .set{readPE_ch}
OPERATION_2 origin : [['"${params.read_dir}*/*_R{1,2}.fastq.gz"', 'A']]
OPERATION_2 gives  : [['readPE_ch', 'P']]


OPERATION_3 string : Channel
  .fromPath("${params.read_dir}*/*_U.fastq.gz")
  .set{readSE_ch}
OPERATION_3 origin : [['"${params.read_dir}*/*_U.fastq.gz"', 'A']]
OPERATION_3 gives  : [['readSE_ch', 'P']]


OPERATION_4 string : read_ch = readPE_ch.merge(readSE_ch)
OPERATION_4 origin : [['readPE_ch', 'P'], ['readSE_ch', 'P']]
OPERATION_4 gives  : [['read_ch', 'P']]


OPERATION_5 string : ref_and_reads = ref_mapPE_ch.combine(read_ch)
OPERATION_5 origin : [['ref_mapPE_ch', 'P'], ['read_ch', 'P']]
OPERATION_5 gives  : [['ref_and_reads', 'P']]


