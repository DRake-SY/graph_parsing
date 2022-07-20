OPERATION_1 string : ch_multiqc_custom_config = Channel.fromPath(params.multiqc_config, checkIfExists: true)
OPERATION_1 origin : [['params.multiqc_config, checkIfExists: true', 'A']]
OPERATION_1 gives  : [['ch_multiqc_custom_config', 'P']]


OPERATION_2 string : ch_multiqc_custom_config = Channel.empty()
OPERATION_2 origin : []
OPERATION_2 gives  : [['ch_multiqc_custom_config', 'P']]


OPERATION_3 string : Channel
            .from(params.input_paths)
            .map { row -> [ row[0], [ file(row[1][0], checkIfExists: true) ] ] }
            .ifEmpty { exit 1, "params.input_paths was empty - no input files supplied" }
            .into { ch_read_files_fastqc; ch_read_files_trimming }
OPERATION_3 origin : [['params.input_paths', 'V']]
OPERATION_3 gives  : [['ch_read_files_fastqc', 'P'], ['ch_read_files_trimming', 'P']]


OPERATION_4 string : Channel
            .from(params.input_paths)
            .map { row -> [ row[0], [ file(row[1][0], checkIfExists: true), file(row[1][1], checkIfExists: true) ] ] }
            .ifEmpty { exit 1, "params.input_paths was empty - no input files supplied" }
            .into { ch_read_files_fastqc; ch_read_files_trimming }
OPERATION_4 origin : [['params.input_paths', 'V']]
OPERATION_4 gives  : [['ch_read_files_fastqc', 'P'], ['ch_read_files_trimming', 'P']]


OPERATION_5 string : Channel
        .fromFilePairs(params.input, size: params.single_end ? 1 : 2)
        .ifEmpty { exit 1, "Cannot find any reads matching: ${params.input}\nNB: Path needs to be enclosed in quotes!\nIf this is single-end data, please specify --single_end on the command line." }
        .into { ch_read_files_fastqc; ch_read_files_trimming }
OPERATION_5 origin : [['params.input, size: params.single_end ? 1 : 2', 'A']]
OPERATION_5 gives  : [['ch_read_files_fastqc', 'P'], ['ch_read_files_trimming', 'P']]


OPERATION_6 string : Channel.from(summary.collect{ [it.key, it.value] })
    .map { k,v -> "<dt>$k</dt><dd><samp>${v ?: '<span style=\"color:#999999;\">N/A</a>'}</samp></dd>" }
    .reduce { a, b -> return [a, b].join("\n            ") }
    .map { x -> """
    id: 'nf-core-babysarek-summary'
    description: " - this information is collected when the pipeline is started."
    section_name: 'nf-core/babysarek Workflow Summary'
    section_href: 'https://github.com/nf-core/babysarek'
    plot_type: 'html'
    data: |
        <dl class=\"dl-horizontal\">
            $x
        </dl>
    """.stripIndent() }
    .set { ch_workflow_summary }
OPERATION_6 origin : [['summary.collect{ [it.key, it.value] }', 'V']]
OPERATION_6 gives  : [['ch_workflow_summary', 'P']]


OPERATION_7 string : configFiles.join(', ')
OPERATION_7 origin : [['configFiles', 'P']]
OPERATION_7 gives  : []


OPERATION_8 string : summary.collect { k,v -> "${k.padRight(18)}: $v" }.join("\n")
OPERATION_8 origin : [['summary', 'P']]
OPERATION_8 gives  : []


