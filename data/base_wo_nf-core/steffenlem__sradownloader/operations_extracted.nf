OPERATION_1 string : Channel.from(summary.collect { [it.key, it.value] })
        .map { k, v -> "<dt>$k</dt><dd><samp>${v ?: '<span style=\"color:#999999;\">N/A</a>'}</samp></dd>" }
        .reduce { a, b -> return [a, b].join("\n            ") }
        .map { x ->
            """
    id: 'nf-core-sradownloader-summary'
    description: " - this information is collected when the pipeline is started."
    section_name: 'steffenlem/sradownloader Workflow Summary'
    section_href: 'https://github.com/steffenlem/sradownloader'
    plot_type: 'html'
    data: |
        <dl class=\"dl-horizontal\">
            $x
        </dl>
    """.stripIndent()
        }
        .set { ch_workflow_summary }
OPERATION_1 origin : [['summary.collect { [it.key, it.value] }', 'V']]
OPERATION_1 gives  : [['ch_workflow_summary', 'P']]


OPERATION_2 string : summary.collect { k, v -> "${k.padRight(18)}: $v" }.join("\n")
OPERATION_2 origin : [['summary', 'P']]
OPERATION_2 gives  : []


