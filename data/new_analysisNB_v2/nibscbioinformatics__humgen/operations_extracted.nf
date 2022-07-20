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
    id: 'nf-core-humgen-summary'
    description: " - this information is collected when the pipeline is started."
    section_name: 'nibscbioinformatics/humgen Workflow Summary'
    section_href: 'https://github.com/nibscbioinformatics/humgen'
    plot_type: 'html'
    data: |
        <dl class=\"dl-horizontal\">
            $x
        </dl>
    """.stripIndent() }
    .set { ch_workflow_summary }
OPERATION_3 origin : [['summary.collect{ [it.key, it.value] }', 'V']]
OPERATION_3 gives  : [['ch_workflow_summary', 'P']]


OPERATION_4 string : ch_bwaIndex = Channel.value(file(params.bwaIndex))
OPERATION_4 origin : []
OPERATION_4 gives  : [['ch_bwaIndex', 'P']]


OPERATION_5 string : ch_dict = Channel.value(file(params.dict))
OPERATION_5 origin : []
OPERATION_5 gives  : [['ch_dict', 'P']]


OPERATION_6 string : ch_fastaFai = Channel.value(file(params.fastaFai))
OPERATION_6 origin : []
OPERATION_6 gives  : [['ch_fastaFai', 'P']]


OPERATION_7 string : Channel.value(file(params.dbsnpIndex))
OPERATION_7 origin : []
OPERATION_7 gives  : []


OPERATION_8 string : Channel.value(file(params.germlineResourceIndex))
OPERATION_8 origin : []
OPERATION_8 gives  : []


OPERATION_9 string : Channel.value(file(params.knownIndelsIndex))
OPERATION_9 origin : []
OPERATION_9 gives  : []


OPERATION_10 string : ch_ponIndex = Channel.value(file(params.pon_index))
OPERATION_10 origin : []
OPERATION_10 gives  : [['ch_ponIndex', 'P']]


OPERATION_11 string : summary.collect { k,v -> "${k.padRight(18)}: $v" }.join("\n")
OPERATION_11 origin : [['summary', 'P']]
OPERATION_11 gives  : []


OPERATION_12 string : ch_knownIndelsIndex = knownIndelsIndexBuilt.collect() 
OPERATION_12 origin : [['knownIndelsIndexBuilt', 'P']]
OPERATION_12 gives  : [['ch_knownIndelsIndex', 'P']]


OPERATION_13 string : forrecal = recaltable.join(markedbamforapply)
OPERATION_13 origin : [['recaltable', 'P'], ['markedbamforapply', 'P']]
OPERATION_13 gives  : [['forrecal', 'P']]


OPERATION_14 string : forcaller = recalibratedforcaller.join(indexedbam)
OPERATION_14 origin : [['recalibratedforcaller', 'P'], ['indexedbam', 'P']]
OPERATION_14 gives  : [['forcaller', 'P']]


OPERATION_15 string : forcaller.into {
  forcaller1
  forcaller2
}
OPERATION_15 origin : [['forcaller', 'P']]
OPERATION_15 gives  : []


OPERATION_16 string : rawvars = calledhaps.join(filteredmuts)
OPERATION_16 origin : [['calledhaps', 'P'], ['filteredmuts', 'P']]
OPERATION_16 gives  : [['rawvars', 'P']]


OPERATION_17 string : ch_bwaIndex  = bwaIndexes
OPERATION_17 origin : [['bwaIndexes', 'P']]
OPERATION_17 gives  : [['ch_bwaIndex', 'P']]


OPERATION_18 string : ch_dict  = dictBuilt
OPERATION_18 origin : [['dictBuilt', 'P']]
OPERATION_18 gives  : [['ch_dict', 'P']]


OPERATION_19 string : ch_fastaFai  = fastaFaiBuilt
OPERATION_19 origin : [['fastaFaiBuilt', 'P']]
OPERATION_19 gives  : [['ch_fastaFai', 'P']]


OPERATION_20 string : ch_dbsnpIndex  = dbsnpIndexBuilt
OPERATION_20 origin : [['dbsnpIndexBuilt', 'P']]
OPERATION_20 gives  : [['ch_dbsnpIndex', 'P']]


OPERATION_21 string : ch_germlineResourceIndex  = germlineResourceIndexBuilt
OPERATION_21 origin : [['germlineResourceIndexBuilt', 'P']]
OPERATION_21 gives  : [['ch_germlineResourceIndex', 'P']]


OPERATION_22 string : ch_ponIndex  = ponIndexBuilt
OPERATION_22 origin : [['ponIndexBuilt', 'P']]
OPERATION_22 gives  : [['ch_ponIndex', 'P']]


