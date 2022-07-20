OPERATION_1 string : Channel
  .fromPath(params.sequencing_summary, type:'file')
  .view { "Summary File : $it" }
  .ifEmpty{
    params.nanoplot = false
    println("Could not find sequencing summary file! Set with 'params.sequencing_summary'")
  }
  .set { sequencing_summary }
OPERATION_1 origin : [["params.sequencing_summary, type:'file'", 'A']]
OPERATION_1 gives  : [['sequencing_summary', 'P']]


OPERATION_2 string : Channel
  .fromPath("${params.reads}/*.{fastq,fastq.gz,fq,fq.gz}", type:'file')
  .ifEmpty {
    println("Could not find fastq files for nanopore sequencing. Set with 'params.reads'")
    exit 1
  }
  .map { reads -> tuple(reads.simpleName, reads ) }
  .view { "Fastq file found : ${it[0]}" }
  .set { fastq }
OPERATION_2 origin : [['"${params.reads}/*.{fastq,fastq.gz,fq,fq.gz}", type:\'file\'', 'A']]
OPERATION_2 gives  : [['fastq', 'P']]


OPERATION_3 string : Channel
  .fromFilePairs("${params.illumina}/*_R{1,2}*.{fastq,fastq.gz}", size: 2 )
  .map { reads -> tuple(reads[0].replaceAll(~/_S[0-9]+_L[0-9]+/,""), reads[1]) }
  .view { "Illumina fastq files for for greater accuracy : ${it[0]}" }
  .into { illumina_fastqs ; illumina_fastqs_polishing }
OPERATION_3 origin : [['"${params.illumina}/*_R{1,2}*.{fastq,fastq.gz}", size: 2', 'A']]
OPERATION_3 gives  : [['illumina_fastqs', 'P'], ['illumina_fastqs_polishing', 'P']]


OPERATION_4 string : assembled_fastas = Channel.empty()
OPERATION_4 origin : []
OPERATION_4 gives  : [['assembled_fastas', 'P']]


OPERATION_5 string : round = Channel.of( 0 )
OPERATION_5 origin : [['0', 'V']]
OPERATION_5 gives  : [['round', 'P']]


OPERATION_6 string : changes = Channel.of(10000)
OPERATION_6 origin : [['10000', 'V']]
OPERATION_6 gives  : [['changes', 'P']]


OPERATION_7 string : new_rounds = Channel.create()
OPERATION_7 origin : []
OPERATION_7 gives  : [['new_rounds', 'P']]


OPERATION_8 string : medaka_fastas
  .join(illumina_fastqs_polishing, by:0 )
  .combine(round)
  .combine(changes)
  .set{ round_1 }
OPERATION_8 origin : [['medaka_fastas', 'P'], ['round', 'P'], ['changes', 'P']]
OPERATION_8 gives  : [['round_1', 'P']]


OPERATION_9 string : round_1
  .mix(new_rounds)
  .view()
  .set{ for_polca }
OPERATION_9 origin : [['round_1', 'P'], ['new_rounds', 'P']]
OPERATION_9 gives  : [['for_polca', 'P']]


