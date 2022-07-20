OPERATION_1 string : ch_multiqc_custom_config = Channel.fromPath(params.multiqc_config, checkIfExists: true)
OPERATION_1 origin : [['params.multiqc_config, checkIfExists: true', 'A']]
OPERATION_1 gives  : [['ch_multiqc_custom_config', 'P']]


OPERATION_2 string : ch_multiqc_custom_config = Channel.empty()
OPERATION_2 origin : []
OPERATION_2 gives  : [['ch_multiqc_custom_config', 'P']]


OPERATION_3 string : Channel
            .from( params.input_paths )
            .map { row -> [ row[0], [ file( row[1][0], checkIfExists: true ) ] ] }
            .ifEmpty { exit 1, "params.input_paths or params.bams was empty - no input files supplied!" }
            .set { input_data }
OPERATION_3 origin : [['params.input_paths', 'V']]
OPERATION_3 gives  : [['input_data', 'P']]


OPERATION_4 string : Channel
            .from( params.input_paths )
            .map { row -> [ row[0], [ file( row[1][0], checkIfExists: true), file( row[1][1], checkIfExists: true) ] ] }
            .ifEmpty { exit 1, "params.input_paths or params.bams was empty - no input files supplied!" }
            .set { input_data }
OPERATION_4 origin : [['params.input_paths', 'V']]
OPERATION_4 gives  : [['input_data', 'P']]


OPERATION_5 string : Channel
    .fromFilePairs( params.input, size: params.single_end ? 1 : 2 )
    .ifEmpty { exit 1, "Cannot find any reads matching: ${params.input}\nNB: Path needs" +
    "to be enclosed in quotes!\nNB: Path requires at least one * wildcard!\nIf this is single-end data, please specify --single_end on the command line." }
    .set { input_data }
OPERATION_5 origin : [['params.input, size: params.single_end ? 1 : 2', 'A']]
OPERATION_5 gives  : [['input_data', 'P']]


OPERATION_6 string : Channel
    .fromPath( params.input )
    .map { row -> [ file(row).baseName, [ file( row, checkIfExists: true ) ] ] }
    .ifEmpty { exit 1, "Cannot find any bam file matching: ${params.input}\nNB: Path needs" +
    "to be enclosed in quotes!\n" }
    .dump()                         
    .set { input_data }
OPERATION_6 origin : [['params.input', 'A']]
OPERATION_6 gives  : [['input_data', 'P']]


OPERATION_7 string : Channel.from(summary.collect{ [it.key, it.value] })
    .map { k,v -> "<dt>$k</dt><dd><samp>${v ?: '<span style=\"color:#999999;\">N/A</a>'}</samp></dd>" }
    .reduce { a, b -> return [a, b].join("\n            ") }
    .map { x -> """
    id: 'nf-core-hlatyping-summary'
    description: " - this information is collected when the pipeline is started."
    section_name: 'nf-core/hlatyping Workflow Summary'
    section_href: 'https://github.com/nf-core/hlatyping'
    plot_type: 'html'
    data: |
        <dl class=\"dl-horizontal\">
            $x
        </dl>
    """.stripIndent() }
    .set { ch_workflow_summary }
OPERATION_7 origin : [['summary.collect{ [it.key, it.value] }', 'V']]
OPERATION_7 gives  : [['ch_workflow_summary', 'P']]


OPERATION_8 string : configFiles.join(', ')
OPERATION_8 origin : [['configFiles', 'P']]
OPERATION_8 gives  : []


OPERATION_9 string : summary.collect { k,v -> "${k.padRight(18)}: $v" }.join("\n")
OPERATION_9 origin : [['summary', 'P']]
OPERATION_9 gives  : []


