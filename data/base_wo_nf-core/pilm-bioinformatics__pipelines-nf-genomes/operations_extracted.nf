OPERATION_1 string : Channel.fromPath(params.fasta)
       .ifEmpty { exit 1, "Fasta file not found: ${params.fasta}" }
       .set { ch_fasta_for_cp }
OPERATION_1 origin : [['params.fasta', 'A']]
OPERATION_1 gives  : [['ch_fasta_for_cp', 'P']]


OPERATION_2 string : Channel.fromPath(params.gtf)
       .ifEmpty { exit 1, "gtf file not found: ${params.gtf}" }
       .set { ch_gtf_for_cp }
OPERATION_2 origin : [['params.gtf', 'A']]
OPERATION_2 gives  : [['ch_gtf_for_cp', 'P']]


OPERATION_3 string : ch_output_docs = Channel.fromPath("$baseDir/docs/output.md")
OPERATION_3 origin : [['"$baseDir/docs/output.md"', 'A']]
OPERATION_3 gives  : [['ch_output_docs', 'P']]


OPERATION_4 string : summary.collect { k,v -> "${k.padRight(18)}: $v" }.join("\n")
OPERATION_4 origin : [['summary', 'P']]
OPERATION_4 gives  : []


