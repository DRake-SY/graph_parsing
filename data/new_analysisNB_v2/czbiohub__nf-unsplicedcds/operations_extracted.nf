OPERATION_1 string : Channel.fromPath(params.bam, checkIfExists: true)
       .map{ f -> tuple(f.baseName, tuple(file(f))) }
       .ifEmpty { exit 1, "Bam file not found: ${params.bam}" }
       .set{bam_ch}
OPERATION_1 origin : [['params.bam, checkIfExists: true', 'A']]
OPERATION_1 gives  : [['bam_ch', 'P']]


OPERATION_2 string : Channel.fromPath(params.gz, checkIfExists: true)
     .map{ f -> tuple(f.baseName, tuple(file(f)))}
     .ifEmpty {exit 1, "gz file not found: ${params.gz}"}
     .set{gz_ch}
OPERATION_2 origin : [['params.gz, checkIfExists: true', 'A']]
OPERATION_2 gives  : [['gz_ch', 'P']]


OPERATION_3 string : Channel.fromPath(params.gtf, checkIfExists: true)
      .map{ f -> tuple(f.baseName, tuple(file(f)))}
      .ifEmpty {exit 1, "Gtf file not found: ${params.gtf}"}
      .set{gtf_ch}
OPERATION_3 origin : [['params.gtf, checkIfExists: true', 'A']]
OPERATION_3 gives  : [['gtf_ch', 'P']]


OPERATION_4 string : gtf_ch.into{gtf_for_remove_chromM; gtf_for_extract_stop_codons}
OPERATION_4 origin : [['gtf_ch', 'P']]
OPERATION_4 gives  : [['gtf_for_remove_chromM', 'P'], ['gtf_for_extract_stop_codons', 'P']]


OPERATION_5 string : summary.collect { k,v -> "${k.padRight(18)}: $v" }.join("\n")
OPERATION_5 origin : [['summary', 'P']]
OPERATION_5 gives  : []


