OPERATION_1 string : read_pairs = Channel.fromFilePairs("$PWD/fq_${params.marker}/*_L001_R{1,2}_001.fastq", flat: true).ifEmpty("No fastq files are found")
OPERATION_1 origin : [['"$PWD/fq_${params.marker}/*_L001_R{1,2}_001.fastq", flat: true', 'A']]
OPERATION_1 gives  : [['read_pairs', 'P']]


OPERATION_2 string : read_pairs = Channel.fromFilePairs("$PWD/fq_${params.marker}/*_L001_R{1,2}_001.fastq", flat: true).ifEmpty("No fastq files are found")
OPERATION_2 origin : [['"$PWD/fq_${params.marker}/*_L001_R{1,2}_001.fastq", flat: true', 'A']]
OPERATION_2 gives  : [['read_pairs', 'P']]


OPERATION_3 string : Channel.empty().ifEmpty("No fastq files are provided")
OPERATION_3 origin : []
OPERATION_3 gives  : []


OPERATION_4 string : out.println("")
OPERATION_4 origin : [['out', 'P']]
OPERATION_4 gives  : []


OPERATION_5 string : out.println("nfp4MBC - A nextflow pipeline for metabarcoding amplicon sequences - Version: 1.20.03.2020 (20.03.2020)")
OPERATION_5 origin : [['out', 'P']]
OPERATION_5 gives  : []


OPERATION_6 string : out.println("")
OPERATION_6 origin : [['out', 'P']]
OPERATION_6 gives  : []


OPERATION_7 string : out.println("Usage: ")
OPERATION_7 origin : [['out', 'P']]
OPERATION_7 gives  : []


OPERATION_8 string : out.println("	nextflow run nfp4MBC.nf ")
OPERATION_8 origin : [['out', 'P']]
OPERATION_8 gives  : []


