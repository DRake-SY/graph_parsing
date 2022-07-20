OPERATION_1 string : Channel
    .fromPath("${params.genomeDir}/annotations/*.annotations.{csv.gz,feather}")
    .first()
    .ifEmpty{ exit 1, "Cannot find annotation csv/feather in: ${params.genomeDir}/annotations\nGenome directory not properly formed" }
    .set{annotationFeather}
OPERATION_1 origin : [['"${params.genomeDir}/annotations/*.annotations.{csv.gz,feather}"', 'A']]
OPERATION_1 gives  : [['annotationFeather', 'P']]


OPERATION_2 string : Channel
    .fromPath("${params.genomeDir}/annotations/*.annotations.pickle")
    .first()
    .ifEmpty{ exit 1, "Cannot find annotation pickle in: ${params.genomeDir}/annotations\nGenome directory not properly formed" }
    .set{annotationPickle}
OPERATION_2 origin : [['"${params.genomeDir}/annotations/*.annotations.pickle"', 'A']]
OPERATION_2 gives  : [['annotationPickle', 'P']]


OPERATION_3 string : Channel
    .fromPath("${params.genomeDir}/original/*.{fa,fasta}")
    .first()
    .ifEmpty{ exit 1, "Cannot find genome fasta in ${params.genomeDir}/original\nGenome directory not properly formed" }
    .set{genomeFasta}
OPERATION_3 origin : [['"${params.genomeDir}/original/*.{fa,fasta}"', 'A']]
OPERATION_3 gives  : [['genomeFasta', 'P']]


OPERATION_4 string : Channel
    .fromPath("${params.genomeDir}/original/*.fai")
    .first()
    .ifEmpty{ exit 1, "Cannot find genome index in ${params.genomeDir}/original\nGenome directory not properly formed" }
    .set{genomeFai}
OPERATION_4 origin : [['"${params.genomeDir}/original/*.fai"', 'A']]
OPERATION_4 gives  : [['genomeFai', 'P']]


OPERATION_5 string : Channel
    .fromPath("${params.genomeDir}/star_tRNAmasked_${params.starOverhang}")
    .ifEmpty{ exit 1, "Cannot find STAR index with overhang ${params.starOverhang} in: ${params.genomeDir}\nGenome directory not properly formed" }
    .set{starIndex}
OPERATION_5 origin : [['"${params.genomeDir}/star_tRNAmasked_${params.starOverhang}"', 'A']]
OPERATION_5 gives  : [['starIndex', 'P']]


OPERATION_6 string : Channel
      .fromPath("${params.genomeDir}/rRNA_depletion")
      .ifEmpty{ exit 1, "Cannot find rRNA depletion index in ${params.genomeDir}\nGenome directory not properly formed" }
      .set(rRNAIndex)
OPERATION_6 origin : [['"${params.genomeDir}/rRNA_depletion"', 'A']]
OPERATION_6 gives  : []


OPERATION_7 string : Channel
      .fromPath("${params.genomeDir}/rRNA_depletion")
      .ifEmpty{ exit 1, "Cannot find rRNA depletion index in ${params.genomeDir}\nGenome directory not properly formed" }
      .set(tRNAIndex)
OPERATION_7 origin : [['"${params.genomeDir}/rRNA_depletion"', 'A']]
OPERATION_7 gives  : []


OPERATION_8 string : Channel
  .fromFilePairs (params.reads, size: params.bulk ? 1:2)
  .ifEmpty{ exit 1, "Cannot find any reads matching: ${params.reads}\nPath needs to be enclosed in quotes!\nPath requires at least one * wildcard!" }
  .into { raw_reads_fastqc; raw_reads_trim }
OPERATION_8 origin : [['params.reads, size: params.bulk ? 1:2', 'A']]
OPERATION_8 gives  : [['raw_reads_fastqc', 'P'], ['raw_reads_trim', 'P']]


OPERATION_9 string : multiqc_trimmed_fastqc = Channel.empty()
OPERATION_9 origin : []
OPERATION_9 gives  : [['multiqc_trimmed_fastqc', 'P']]


OPERATION_10 string : depleted_reads_fastqc = Channel.empty()
OPERATION_10 origin : []
OPERATION_10 gives  : [['depleted_reads_fastqc', 'P']]


OPERATION_11 string : multiqc_depleted_fastqc = Channel.empty()
OPERATION_11 origin : []
OPERATION_11 gives  : [['multiqc_depleted_fastqc', 'P']]


OPERATION_12 string : annotations.{csv.gz,feather}"
OPERATION_12 origin : [['annotations', 'P']]
OPERATION_12 gives  : []


OPERATION_13 string : raw_reads_trim.set{ trimmed_reads }
OPERATION_13 origin : [['raw_reads_trim', 'P']]
OPERATION_13 gives  : [['trimmed_reads', 'P']]


OPERATION_14 string : trimmed_reads .set { depleted_reads }
OPERATION_14 origin : [['trimmed_reads', 'P']]
OPERATION_14 gives  : [['depleted_reads', 'P']]


