OPERATION_1 string : ch_multiqc_custom_config = Channel.fromPath(params.multiqc_config, checkIfExists: true)
OPERATION_1 origin : [['params.multiqc_config, checkIfExists: true', 'A']]
OPERATION_1 gives  : [['ch_multiqc_custom_config', 'P']]


OPERATION_2 string : ch_multiqc_custom_config = Channel.empty()
OPERATION_2 origin : []
OPERATION_2 gives  : [['ch_multiqc_custom_config', 'P']]


OPERATION_3 string : Channel.from(summary.collect{ [it.key, it.value] })
    .map { k,v -> "<dt>$k</dt><dd><samp>${v ?: '<span style=\"color:#999999;\">N/A</a>'}</samp></dd>" }
    .reduce { a, b -> return [a, b].join("\n            ") }
    .map { x -> """
    id: 'nf-core-artic-summary'
    description: " - this information is collected when the pipeline is started."
    section_name: 'nf-core/artic Workflow Summary'
    section_href: 'https://github.com/nf-core/artic'
    plot_type: 'html'
    data: |
        <dl class=\"dl-horizontal\">
            $x
        </dl>
    """.stripIndent() }
    .set { ch_workflow_summary }
OPERATION_3 origin : [['summary.collect{ [it.key, it.value] }', 'V']]
OPERATION_3 gives  : [['ch_workflow_summary', 'P']]


OPERATION_4 string : summary.collect { k,v -> "${k.padRight(18)}: $v" }.join("\n")
OPERATION_4 origin : [['summary', 'P']]
OPERATION_4 gives  : []


OPERATION_5 string : ch_samplesheet_reformat
    .splitCsv(header:true, sep:',')
    .map { validate_input(it) }
    .into { ch_reads_fastqc;
            ch_reads_nanoplot;
            ch_reads_align }
OPERATION_5 origin : [['ch_samplesheet_reformat', 'P']]
OPERATION_5 gives  : [['ch_reads_fastqc', 'P'], ['ch_reads_nanoplot', 'P'], ['ch_reads_align', 'P']]


