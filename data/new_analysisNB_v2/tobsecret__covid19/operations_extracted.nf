OPERATION_1 string : Channel
        .fromPath(bwa_dir, checkIfExists: true)
        .set { ch_bwa_index }
OPERATION_1 origin : [['bwa_dir, checkIfExists: true', 'A']]
OPERATION_1 gives  : [['ch_bwa_index', 'P']]


OPERATION_2 string : ch_minimap2_index = Channel.fromPath(params.minimap2_index, checkIfExists: true) }

                                                    
                                                    
                                                    

ch_multiqc_config = file("$baseDir/assets/multiqc_config.yaml", checkIfExists: true)
if (params.multiqc_config ) { 
OPERATION_2 origin : [['params.minimap2_index, checkIfExists: true', 'A']]
OPERATION_2 gives  : [['ch_minimap2_index', 'P']]


OPERATION_3 string : ch_multiqc_custom_config = Channel.fromPath(params.multiqc_config, checkIfExists: true)
OPERATION_3 origin : [['params.multiqc_config, checkIfExists: true', 'A']]
OPERATION_3 gives  : [['ch_multiqc_custom_config', 'P']]


OPERATION_4 string : ch_multiqc_custom_config = Channel.empty()
OPERATION_4 origin : []
OPERATION_4 gives  : [['ch_multiqc_custom_config', 'P']]


OPERATION_5 string : Channel.from(summary.collect{ [it.key, it.value] })
    .map { k,v -> "<dt>$k</dt><dd><samp>${v ?: '<span style=\"color:#999999;\">N/A</a>'}</samp></dd>" }
    .reduce { a, b -> return [a, b].join("\n            ") }
    .map { x -> """
    id: 'nf-core-covid19-summary'
    description: " - this information is collected when the pipeline is started."
    section_name: 'nf-core/covid19 Workflow Summary'
    section_href: 'https://github.com/nf-core/covid19'

    plot_type: 'html'
    data: |
        <dl class=\"dl-horizontal\">
            $x
        </dl>
    """.stripIndent() }
    .set { ch_workflow_summary }
OPERATION_5 origin : [['summary.collect{ [it.key, it.value] }', 'V']]
OPERATION_5 gives  : [['ch_workflow_summary', 'P']]


OPERATION_6 string : summary.collect { k,v -> "${k.padRight(18)}: $v" }.join("\n")
OPERATION_6 origin : [['summary', 'P']]
OPERATION_6 gives  : []


OPERATION_7 string : ch_samplesheet_reformat
    .splitCsv(header:true, sep:',')
    .map { validate_input(it) }
    .into { ch_reads_nanoplot;
            ch_reads_fastqc;
            ch_reads_bwa;
            ch_reads_minimap2 }
OPERATION_7 origin : [['ch_samplesheet_reformat', 'P']]
OPERATION_7 gives  : [['ch_reads_nanoplot', 'P'], ['ch_reads_fastqc', 'P'], ['ch_reads_bwa', 'P'], ['ch_reads_minimap2', 'P']]


