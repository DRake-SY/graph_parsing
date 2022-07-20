OPERATION_1 string : ch_multiqc_custom_config = Channel.fromPath(params.multiqc_config, checkIfExists: true)
OPERATION_1 origin : [['params.multiqc_config, checkIfExists: true', 'A']]
OPERATION_1 gives  : [['ch_multiqc_custom_config', 'P']]


OPERATION_2 string : ch_multiqc_custom_config = Channel.empty()
OPERATION_2 origin : []
OPERATION_2 gives  : [['ch_multiqc_custom_config', 'P']]


OPERATION_3 string : Channel.fromPath(params.vcf_file)
           .ifEmpty { exit 1, "VCF file containing  not found: ${params.vcf_file}" }
           .into { vcf_file; vcfs_to_split }
OPERATION_3 origin : [['params.vcf_file', 'A']]
OPERATION_3 gives  : [['vcf_file', 'P'], ['vcfs_to_split', 'P']]


OPERATION_4 string : Channel.fromPath(params.gene_loc_file)
        .into { ch_gene_loc_file; ch_gene_loc_file_2 }
OPERATION_4 origin : [['params.gene_loc_file', 'A']]
OPERATION_4 gives  : [['ch_gene_loc_file', 'P'], ['ch_gene_loc_file_2', 'P']]


OPERATION_5 string : Channel.fromPath(params.set_anot_file)
        .into { ch_set_anot; ch_set_anot_2 }
OPERATION_5 origin : [['params.set_anot_file', 'A']]
OPERATION_5 gives  : [['ch_set_anot', 'P'], ['ch_set_anot_2', 'P']]


OPERATION_6 string : Channel.fromPath(params.cov_file)
        .set { ch_cov }
OPERATION_6 origin : [['params.cov_file', 'A']]
OPERATION_6 gives  : [['ch_cov', 'P']]


OPERATION_7 string : Channel.fromPath(params.plink_bed)
        .ifEmpty { exit 1, "PLINK binary pedigree file not found: ${params.bed}" }
        .set { ch_bed }
OPERATION_7 origin : [['params.plink_bed', 'A']]
OPERATION_7 gives  : [['ch_bed', 'P']]


OPERATION_8 string : Channel.fromPath(params.plink_bim)
        .ifEmpty { exit 1, "PLINK BIM file not found: ${params.bim}" }
        .set { ch_bim }
OPERATION_8 origin : [['params.plink_bim', 'A']]
OPERATION_8 gives  : [['ch_bim', 'P']]


OPERATION_9 string : Channel.fromPath(params.plink_fam)
        .ifEmpty { exit 1, "PLINK FAM file not found: ${params.fam}" }
        .set { ch_fam }
OPERATION_9 origin : [['params.plink_fam', 'A']]
OPERATION_9 gives  : [['ch_fam', 'P']]


OPERATION_10 string : Channel.fromPath(params.ref_panel_bed)
        .ifEmpty { exit 1, "File not found: ${params.ref_panel_bed}" }
        .set { ch_ref_panel_bed }
OPERATION_10 origin : [['params.ref_panel_bed', 'A']]
OPERATION_10 gives  : [['ch_ref_panel_bed', 'P']]


OPERATION_11 string : Channel.fromPath(params.ref_panel_bim)
        .ifEmpty { exit 1, "File not found: ${params.ref_panel_bim}" }
        .set { ch_ref_panel_bim }
OPERATION_11 origin : [['params.ref_panel_bim', 'A']]
OPERATION_11 gives  : [['ch_ref_panel_bim', 'P']]


OPERATION_12 string : Channel.fromPath(params.ref_panel_fam)
        .ifEmpty { exit 1, "File not found: ${params.ref_panel_fam}" }
        .set { ch_ref_panel_fam }
OPERATION_12 origin : [['params.ref_panel_fam', 'A']]
OPERATION_12 gives  : [['ch_ref_panel_fam', 'P']]


OPERATION_13 string : Channel.fromPath(params.ref_panel_synonyms)
        .ifEmpty { exit 1, "File not found: ${params.ref_panel_synonyms}" }
        .set { ch_ref_panel_synonyms }
OPERATION_13 origin : [['params.ref_panel_synonyms', 'A']]
OPERATION_13 gives  : [['ch_ref_panel_synonyms', 'P']]


OPERATION_14 string : Channel.from(summary.collect{ [it.key, it.value] })
    .map { k,v -> "<dt>$k</dt><dd><samp>${v ?: '<span style=\"color:#999999;\">N/A</a>'}</samp></dd>" }
    .reduce { a, b -> return [a, b].join("\n            ") }
    .map { x -> """
    id: 'nf-core-gwasgsa-summary'
    description: " - this information is collected when the pipeline is started."
    section_name: 'nf-core/gwasgsa Workflow Summary'
    section_href: 'https://github.com/nf-core/gwasgsa'
    plot_type: 'html'
    data: |
        <dl class=\"dl-horizontal\">
            $x
        </dl>
    """.stripIndent() }
    .set { ch_workflow_summary }
OPERATION_14 origin : [['summary.collect{ [it.key, it.value] }', 'V']]
OPERATION_14 gives  : [['ch_workflow_summary', 'P']]


OPERATION_15 string : Channel.fromPath(params.summary_stats)
        .set { ch_summary_stats }
OPERATION_15 origin : [['params.summary_stats', 'A']]
OPERATION_15 gives  : [['ch_summary_stats', 'P']]


OPERATION_16 string : Channel.fromPath(params.snp_subset)
        .ifEmpty { exit 1, "A .bim file not found: ${params.snp_subset}" }
        .set { ch_snp_subset }
OPERATION_16 origin : [['params.snp_subset', 'A']]
OPERATION_16 gives  : [['ch_snp_subset', 'P']]


OPERATION_17 string : vcfs_to_split
        .splitCsv(header: true)
        .map{ row -> [file(row.vcf)] }
        .set { vcfs }
OPERATION_17 origin : [['vcfs_to_split', 'P']]
OPERATION_17 gives  : [['vcfs', 'P']]


OPERATION_18 string : summary.collect { k,v -> "${k.padRight(18)}: $v" }.join("\n")
OPERATION_18 origin : [['summary', 'P']]
OPERATION_18 gives  : []


OPERATION_19 string : ch_plink = ch_plink_direct
OPERATION_19 origin : [['ch_plink_direct', 'P']]
OPERATION_19 gives  : [['ch_plink', 'P']]


OPERATION_20 string : ch_plink_2 = ch_plink_direct_2
OPERATION_20 origin : [['ch_plink_direct_2', 'P']]
OPERATION_20 gives  : [['ch_plink_2', 'P']]


OPERATION_21 string : ch_plink = ch_plink_ref_panel
OPERATION_21 origin : [['ch_plink_ref_panel', 'P']]
OPERATION_21 gives  : [['ch_plink', 'P']]


OPERATION_22 string : ch_plink_2 = ch_plink_ref_panel_2
OPERATION_22 origin : [['ch_plink_ref_panel_2', 'P']]
OPERATION_22 gives  : [['ch_plink_2', 'P']]


OPERATION_23 string : ch_plink = ch_plink_undirect
OPERATION_23 origin : [['ch_plink_undirect', 'P']]
OPERATION_23 gives  : [['ch_plink', 'P']]


OPERATION_24 string : ch_plink_2 = ch_plink_undirect_2
OPERATION_24 origin : [['ch_plink_undirect_2', 'P']]
OPERATION_24 gives  : [['ch_plink_2', 'P']]


OPERATION_25 string : ch_snp_p = ch_snp_p_txt
OPERATION_25 origin : [['ch_snp_p_txt', 'P']]
OPERATION_25 gives  : [['ch_snp_p', 'P']]


