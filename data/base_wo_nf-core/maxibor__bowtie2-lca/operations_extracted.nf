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
    id: 'nf-core-btlca-summary'
    description: " - this information is collected when the pipeline is started."
    section_name: 'nf-core/btlca Workflow Summary'
    section_href: 'https://github.com/nf-core/btlca'
    plot_type: 'html'
    data: |
        <dl class=\"dl-horizontal\">
            $x
        </dl>
    """.stripIndent() }
    .set { ch_workflow_summary }
OPERATION_6 origin : [['summary.collect{ [it.key, it.value] }', 'V']]
OPERATION_6 gives  : [['ch_workflow_summary', 'P']]


OPERATION_7 string : fasta_ref = Channel.fromPath(params.fasta)
OPERATION_7 origin : [['params.fasta', 'A']]
OPERATION_7 gives  : [['fasta_ref', 'P']]


OPERATION_8 string : Channel.fromPath(params.bt_db)
    .set {bowtie_db}
OPERATION_8 origin : [['params.bt_db', 'A']]
OPERATION_8 gives  : [['bowtie_db', 'P']]


OPERATION_9 string : Channel.fromPath(params.bt_db)
    .map{it -> file(it).simpleName}
    .first()
    .set{ bt_db_name }
OPERATION_9 origin : [['params.bt_db', 'A']]
OPERATION_9 gives  : [['bt_db_name', 'P']]


OPERATION_10 string : Channel.fromPath(params.lca_tree)
    .first()
    .set {lca_tree_ch}
OPERATION_10 origin : [['params.lca_tree', 'A']]
OPERATION_10 gives  : [['lca_tree_ch', 'P']]


OPERATION_11 string : Channel.fromPath(params.dummy1)
    .first()
    .set {lca_tree_ch}
OPERATION_11 origin : [['params.dummy1', 'A']]
OPERATION_11 gives  : [['lca_tree_ch', 'P']]


OPERATION_12 string : Channel.fromPath(params.dummy2)
    .first()
    .set {ete_taxo_db}
OPERATION_12 origin : [['params.dummy2', 'A']]
OPERATION_12 gives  : [['ete_taxo_db', 'P']]


OPERATION_13 string : configFiles.join(', ')
OPERATION_13 origin : [['configFiles', 'P']]
OPERATION_13 gives  : []


OPERATION_14 string : summary.collect { k,v -> "${k.padRight(18)}: $v" }.join("\n")
OPERATION_14 origin : [['summary', 'P']]
OPERATION_14 gives  : []


OPERATION_15 string : aligned_bam.merge(lca_tree_ch, ete_taxo_db, ete_checked).view().set {sam2lca_ch}
OPERATION_15 origin : [['aligned_bam', 'P'], ['lca_tree_ch', 'P'], ['ete_taxo_db', 'P'], ['ete_checked', 'P']]
OPERATION_15 gives  : [['sam2lca_ch', 'P']]


