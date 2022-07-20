OPERATION_1 string : FAILED_RUN_TEMPLATE = Channel.fromPath("${params.failed_run_report_template}").collect()
OPERATION_1 origin : [['"${params.failed_run_report_template}"', 'A']]
OPERATION_1 gives  : [['FAILED_RUN_TEMPLATE', 'P']]


OPERATION_2 string : SKIP_SAMPLES_FILE = Channel.fromPath("${params.skip_samples}")
OPERATION_2 origin : [['"${params.skip_samples}"', 'A']]
OPERATION_2 gives  : [['SKIP_SAMPLES_FILE', 'P']]


OPERATION_3 string : Channel.value('NA').set { SKIP_SAMPLES_FILE }
OPERATION_3 origin : [["'NA'", 'V']]
OPERATION_3 gives  : [['SKIP_SAMPLES_FILE', 'P']]


OPERATION_4 string : Channel.empty().set { LOCAL_SAMPLE_FILES_FOR_STAGING }
OPERATION_4 origin : []
OPERATION_4 gives  : [['LOCAL_SAMPLE_FILES_FOR_STAGING', 'P']]


OPERATION_5 string : Channel.empty().set { LOCAL_SAMPLE_FILES_FOR_JOIN }
OPERATION_5 origin : []
OPERATION_5 gives  : [['LOCAL_SAMPLE_FILES_FOR_JOIN', 'P']]


OPERATION_6 string : Channel.fromFilePairs( "${params.local_samples}", size: -1 )
    .set { LOCAL_SAMPLE_FILES_FOR_STAGING }
OPERATION_6 origin : [['"${params.local_samples}", size: -1', 'A']]
OPERATION_6 gives  : [['LOCAL_SAMPLE_FILES_FOR_STAGING', 'P']]


OPERATION_7 string : Channel.fromFilePairs( "${params.local_samples}", size: -1 )
    .set { LOCAL_SAMPLE_FILES_FOR_JOIN }
OPERATION_7 origin : [['"${params.local_samples}", size: -1', 'A']]
OPERATION_7 gives  : [['LOCAL_SAMPLE_FILES_FOR_JOIN', 'P']]


OPERATION_8 string : Channel.empty().set { PREPROCESSED_FORWARD_READS }
OPERATION_8 origin : []
OPERATION_8 gives  : [['PREPROCESSED_FORWARD_READS', 'P']]


OPERATION_9 string : Channel.empty().set { PREPROCESSED_REVERSE_READS }
OPERATION_9 origin : []
OPERATION_9 gives  : [['PREPROCESSED_REVERSE_READS', 'P']]


OPERATION_10 string : Channel.fromFilePairs( "${params.preprocessed_samples}", size: -1 )
    .map { it[1][0] }
    .set { PREPROCESSED_FORWARD_READS }
OPERATION_10 origin : [['"${params.preprocessed_samples}", size: -1', 'A']]
OPERATION_10 gives  : [['PREPROCESSED_FORWARD_READS', 'P']]


OPERATION_11 string : Channel.fromFilePairs( "${params.preprocessed_samples}", size: -1 )
    .map { it[1][1] }
    .set { PREPROCESSED_REVERSE_READS }
OPERATION_11 origin : [['"${params.preprocessed_samples}", size: -1', 'A']]
OPERATION_11 gives  : [['PREPROCESSED_REVERSE_READS', 'P']]


OPERATION_12 string : Channel.fromPath("${params.input_assemblies}").set { INPUT_ASSEMBLIES }
OPERATION_12 origin : [['"${params.input_assemblies}"', 'A']]
OPERATION_12 gives  : [['INPUT_ASSEMBLIES', 'P']]


OPERATION_13 string : Channel.empty().set { SRR_FILE }
OPERATION_13 origin : []
OPERATION_13 gives  : [['SRR_FILE', 'P']]


OPERATION_14 string : Channel.fromPath("${params.sra_samples}").set { SRR_FILE }
OPERATION_14 origin : [['"${params.sra_samples}"', 'A']]
OPERATION_14 gives  : [['SRR_FILE', 'P']]


OPERATION_15 string : LOCAL_SAMPLES = Channel.create()
OPERATION_15 origin : []
OPERATION_15 gives  : [['LOCAL_SAMPLES', 'P']]


OPERATION_16 string : REMOTE_SAMPLES = Channel.create()
OPERATION_16 origin : []
OPERATION_16 gives  : [['REMOTE_SAMPLES', 'P']]


OPERATION_17 string : REMOTE_SAMPLES_LIST
  .splitCsv()
  .groupTuple(by: 1)
  .map { [it[1], it[0].toString().replaceAll(/[\[\]\'\,]/,''), 'remote'] }
  .set{REMOTE_SAMPLES_FOR_STAGING}
OPERATION_17 origin : [['REMOTE_SAMPLES_LIST', 'P']]
OPERATION_17 gives  : [['REMOTE_SAMPLES_FOR_STAGING', 'P']]


OPERATION_18 string : LOCAL_SAMPLE_FILES_FOR_STAGING
  .map{ [it[0], it[1], 'local'] }
  .set{LOCAL_SAMPLES_FOR_STAGING}
OPERATION_18 origin : [['LOCAL_SAMPLE_FILES_FOR_STAGING', 'P']]
OPERATION_18 gives  : [['LOCAL_SAMPLES_FOR_STAGING', 'P']]


OPERATION_19 string : ALL_SAMPLES = REMOTE_SAMPLES_FOR_STAGING
  .mix(LOCAL_SAMPLES_FOR_STAGING)
OPERATION_19 origin : [['REMOTE_SAMPLES_FOR_STAGING', 'P'], ['LOCAL_SAMPLES_FOR_STAGING', 'P']]
OPERATION_19 gives  : [['ALL_SAMPLES', 'P']]


OPERATION_20 string : SAMPLE_FILE_CONTENTS
  .splitCsv(quote: '"')
OPERATION_20 origin : [['SAMPLE_FILE_CONTENTS', 'P']]
OPERATION_20 gives  : []


OPERATION_21 string : LOCAL_SAMPLES
  .map {[it[0], 'hi']}
  .mix(LOCAL_SAMPLE_FILES_FOR_JOIN)
  .groupTuple(size: 2)
  .map {[it[0], it[1][0]]}
  .set {LOCAL_SAMPLES_FOR_TRIMMING}
OPERATION_21 origin : [['LOCAL_SAMPLES', 'P'], ['LOCAL_SAMPLE_FILES_FOR_JOIN', 'P']]
OPERATION_21 gives  : [['LOCAL_SAMPLES_FOR_TRIMMING', 'P']]


OPERATION_22 string : COMBINED_SAMPLES = LOCAL_SAMPLES_FOR_TRIMMING.mix(MERGED_SAMPLES_FOR_TRIMMING)
OPERATION_22 origin : [['LOCAL_SAMPLES_FOR_TRIMMING', 'P'], ['MERGED_SAMPLES_FOR_TRIMMING', 'P']]
OPERATION_22 gives  : [['COMBINED_SAMPLES', 'P']]


OPERATION_23 string : FORWARD_READS_FOR_ASSEMBLY
  .mix( PREPROCESSED_FORWARD_READS )
  .collectFile(name: "combined_forward_reads.fq", newLine: false, skip: 0)
  .set { COMBINED_FORWARD_READS_FOR_ASSEMBLY }
OPERATION_23 origin : [['FORWARD_READS_FOR_ASSEMBLY', 'P'], ['PREPROCESSED_FORWARD_READS', 'P']]
OPERATION_23 gives  : [['COMBINED_FORWARD_READS_FOR_ASSEMBLY', 'P']]


OPERATION_24 string : REVERSE_READS_FOR_ASSEMBLY
  .mix( PREPROCESSED_REVERSE_READS )
  .collectFile(name: "combined_reverse_reads.fq", newLine: false, skip: 0)
  .set  { COMBINED_REVERSE_READS_FOR_ASSEMBLY }
OPERATION_24 origin : [['REVERSE_READS_FOR_ASSEMBLY', 'P'], ['PREPROCESSED_REVERSE_READS', 'P']]
OPERATION_24 gives  : [['COMBINED_REVERSE_READS_FOR_ASSEMBLY', 'P']]


OPERATION_25 string : COMBINED_FORWARD_READS_FOR_ASSEMBLY.into { FORWARD_READS_FOR_TRINITY }
OPERATION_25 origin : [['COMBINED_FORWARD_READS_FOR_ASSEMBLY', 'P']]
OPERATION_25 gives  : [['FORWARD_READS_FOR_TRINITY', 'P']]


OPERATION_26 string : COMBINED_REVERSE_READS_FOR_ASSEMBLY.into { REVERSE_READS_FOR_TRINITY }
OPERATION_26 origin : [['COMBINED_REVERSE_READS_FOR_ASSEMBLY', 'P']]
OPERATION_26 gives  : [['REVERSE_READS_FOR_TRINITY', 'P']]


OPERATION_27 string : TRANSCRIPTOME_ASSEMBLIES
  .mix ( INPUT_ASSEMBLIES )
  .collectFile(name: "combined_assemblies.fastq", newLine: false, skip: 0)
  .set { COMBINED_ASSEMBLY }
OPERATION_27 origin : [['TRANSCRIPTOME_ASSEMBLIES', 'P'], ['INPUT_ASSEMBLIES', 'P']]
OPERATION_27 gives  : [['COMBINED_ASSEMBLY', 'P']]


