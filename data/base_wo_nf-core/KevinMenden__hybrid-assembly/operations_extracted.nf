OPERATION_1 string : Channel
    .fromFilePairs( params.shortReads, size: 2 )
    .ifEmpty { exit 1, "Cannot find any reads matching: ${params.shortReads}\nNB: Path needs to be enclosed in quotes!\nNB: Path requires at least one * wildcard!" }
    .into { short_reads_qc; short_reads_assembly }
OPERATION_1 origin : [['params.shortReads, size: 2', 'A']]
OPERATION_1 gives  : [['short_reads_qc', 'P'], ['short_reads_assembly', 'P']]


OPERATION_2 string : Channel
        .fromPath( params.longReads )
        .ifEmpty { exit 1, "Cannot find any long reads matching: ${params.reads}\nNB: Path needs to be enclosed in quotes!" }
        .into { long_reads_qc; long_reads_assembly; long_reads_scaffolding }
OPERATION_2 origin : [['params.longReads', 'A']]
OPERATION_2 gives  : [['long_reads_qc', 'P'], ['long_reads_assembly', 'P'], ['long_reads_scaffolding', 'P']]


OPERATION_3 string : summary.collect { k,v -> "${k.padRight(15)}: $v" }.join("\n")
OPERATION_3 origin : [['summary', 'P']]
OPERATION_3 gives  : []


OPERATION_4 string : assembly_result_canu.into{ assembly_mapping; assembly_pilon }
OPERATION_4 origin : [['assembly_result_canu', 'P']]
OPERATION_4 gives  : [['assembly_mapping', 'P'], ['assembly_pilon', 'P']]


