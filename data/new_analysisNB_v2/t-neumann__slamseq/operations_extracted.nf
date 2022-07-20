OPERATION_1 string : Channel
            .fromPath(params.fasta,  checkIfExists: true)
            .set { fastaGunzipChannel }
OPERATION_1 origin : [['params.fasta,  checkIfExists: true', 'A']]
OPERATION_1 gives  : [['fastaGunzipChannel', 'P']]


OPERATION_2 string : Channel
            .fromPath(params.fasta, checkIfExists: true)
            .into { fastaMapChannel
                    fastaSnpChannel
                    fastaCountChannel
                    fastaRatesChannel
                    fastaUtrRatesChannel
                    fastaReadPosChannel
                    fastaUtrPosChannel }
OPERATION_2 origin : [['params.fasta, checkIfExists: true', 'A']]
OPERATION_2 gives  : []


OPERATION_3 string : Channel
        .fromPath(gtf, checkIfExists: true)
        .ifEmpty { exit 1, "GTF annotation file not found: ${gtf}" }
        .set { gtfChannel }
OPERATION_3 origin : [['gtf, checkIfExists: true', 'A']]
OPERATION_3 gives  : [['gtfChannel', 'P']]


OPERATION_4 string : Channel
        .fromPath(params.bed, checkIfExists: true)
        .ifEmpty { exit 1, "BED 3' UTR annotation file not found: ${params.bed}" }
        .into { utrFilterChannel
                utrCountChannel
                utrratesChannel
                utrposChannel }
OPERATION_4 origin : [['params.bed, checkIfExists: true', 'A']]
OPERATION_4 gives  : []


OPERATION_5 string : Channel
        .fromPath(params.mapping, checkIfExists: true)
        .ifEmpty { exit 1, "Mapping file not found: ${params.mapping}" }
        .set { utrFilterChannel }
OPERATION_5 origin : [['params.mapping, checkIfExists: true', 'A']]
OPERATION_5 gives  : [['utrFilterChannel', 'P']]


OPERATION_6 string : Channel
        .fromPath(params.vcf, checkIfExists: true)
        .ifEmpty { exit 1, "Vcf file not found: ${params.vcf}" }
        .set { vcfChannel }
OPERATION_6 origin : [['params.vcf, checkIfExists: true', 'A']]
OPERATION_6 gives  : [['vcfChannel', 'P']]


OPERATION_7 string : Channel
        .empty()
        .set { vcfChannel }
OPERATION_7 origin : []
OPERATION_7 gives  : [['vcfChannel', 'P']]


OPERATION_8 string : ch_multiqc_custom_config = Channel.fromPath(params.multiqc_config, checkIfExists: true)
OPERATION_8 origin : [['params.multiqc_config, checkIfExists: true', 'A']]
OPERATION_8 gives  : [['ch_multiqc_custom_config', 'P']]


OPERATION_9 string : ch_multiqc_custom_config = Channel.empty()
OPERATION_9 origin : []
OPERATION_9 gives  : [['ch_multiqc_custom_config', 'P']]


OPERATION_10 string : Channel
    .fromPath(params.input, checkIfExists: true)
    .ifEmpty { exit 1, "input file not found: ${params.input}" }
    .set { checkChannel }
OPERATION_10 origin : [['params.input, checkIfExists: true', 'A']]
OPERATION_10 gives  : [['checkChannel', 'P']]


OPERATION_11 string : Channel.from(summary.collect{ [it.key, it.value] })
    .map { k,v -> "<dt>$k</dt><dd><samp>${v ?: '<span style=\"color:#999999;\">N/A</a>'}</samp></dd>" }
    .reduce { a, b -> return [a, b].join("\n            ") }
    .map { x -> """
    id: 'nf-core-slamseq-summary'
    description: " - this information is collected when the pipeline is started."
    section_name: 'nf-core/slamseq Workflow Summary'
    section_href: 'https://github.com/nf-core/slamseq'
    plot_type: 'html'
    data: |
        <dl class=\"dl-horizontal\">
            $x
        </dl>
    """.stripIndent() }
    .set { ch_workflow_summary }
OPERATION_11 origin : [['summary.collect{ [it.key, it.value] }', 'V']]
OPERATION_11 gives  : [['ch_workflow_summary', 'P']]


OPERATION_12 string : trimgaloreQC = Channel.empty()
OPERATION_12 origin : []
OPERATION_12 gives  : [['trimgaloreQC', 'P']]


OPERATION_13 string : trimgaloreFastQC = Channel.empty()
OPERATION_13 origin : []
OPERATION_13 gives  : [['trimgaloreFastQC', 'P']]


OPERATION_14 string : summary.collect { k,v -> "${k.padRight(18)}: $v" }.join("\n")
OPERATION_14 origin : [['summary', 'P']]
OPERATION_14 gives  : []


OPERATION_15 string : rawFileChannel
    .splitCsv( header: true, sep: '\t' )
    .map { row -> tuple(row, file(row.reads, checkIfExists: true) ) }
    .set { rawFiles }
OPERATION_15 origin : [['rawFileChannel', 'P']]
OPERATION_15 gives  : [['rawFiles', 'P']]


OPERATION_16 string : splitChannel
    .splitCsv( header: true, sep: '\t' )
    .set { conditionDeconvolution }
OPERATION_16 origin : [['splitChannel', 'P']]
OPERATION_16 gives  : [['conditionDeconvolution', 'P']]


OPERATION_17 string : vcfSampleChannel
    .splitCsv( header: true, sep: '\t' )
    .map{ it -> return it.name }
    .combine(vcfChannel)
    .set{ vcfCombineChannel }
OPERATION_17 origin : [['vcfSampleChannel', 'P'], ['vcfChannel', 'P']]
OPERATION_17 gives  : [['vcfCombineChannel', 'P']]


OPERATION_18 string : rawFiles
        .map{ it -> return tuple(it, file(it.reads)) }
        .set{ trimmedFiles }
OPERATION_18 origin : [['rawFiles', 'P']]
OPERATION_18 gives  : [['trimmedFiles', 'P']]


OPERATION_19 string : vcfComb = slamdunkSnp.mix(vcfCombineChannel)
OPERATION_19 origin : [['slamdunkSnp', 'P'], ['vcfCombineChannel', 'P']]
OPERATION_19 gives  : [['vcfComb', 'P']]


OPERATION_20 string : slamdunkCount
    .join(vcfComb)
    .into { slamdunkResultsChannel
            slamdunkForRatesChannel
            slamdunkForUtrRatesChannel
            slamdunkForTcPerReadPosChannel
            slamdunkForTcPerUtrPosChannel }
OPERATION_20 origin : [['slamdunkCount', 'P'], ['vcfComb', 'P']]
OPERATION_20 gives  : []


OPERATION_21 string : slamdunkFilterSummary
    .flatten()
    .filter( ~/.*bam$/ )
    .collect()
    .set { slamdunkFilterSummaryCollected }
OPERATION_21 origin : [['slamdunkFilterSummary', 'P']]
OPERATION_21 gives  : [['slamdunkFilterSummaryCollected', 'P']]


OPERATION_22 string : slamdunkCountAlleyoop
    .collect()
    .flatten()
    .filter( ~/.*tsv$/ )
    .collect()
    .set { slamdunkCountAlleyoopCollected }
OPERATION_22 origin : [['slamdunkCountAlleyoop', 'P']]
OPERATION_22 gives  : [['slamdunkCountAlleyoopCollected', 'P']]


OPERATION_23 string : conditionDeconvolution
    .map { it -> return tuple(it.name, it.group) }
    .join(slamdunkCollapseOut)
    .map { it -> return tuple(it[1],it[2]) }
    .groupTuple()
    .set { deseq2FileChannel }
OPERATION_23 origin : [['conditionDeconvolution', 'P'], ['slamdunkCollapseOut', 'P']]
OPERATION_23 gives  : [['deseq2FileChannel', 'P']]


