OPERATION_1 string : Channel
        .fromPath(params.vcf)
        .ifEmpty { exit 1, "Cannot find input file : ${params.vcf}" }
        .set { ch_input }
OPERATION_1 origin : [['params.vcf', 'A']]
OPERATION_1 gives  : [['ch_input', 'P']]


OPERATION_2 string : Channel
        .fromPath(params.csv)
        .splitCsv(header:true)
        .map{ row -> file(row.vcf) }
        .flatten()
        .set { ch_input }
OPERATION_2 origin : [['params.csv', 'A']]
OPERATION_2 gives  : [['ch_input', 'P']]


OPERATION_3 string : Channel.fromPath(params.pcgr_data)
        .ifEmpty { exit 1, "Cannot find data bundle path : ${params.pcgr_data}" }
        .set{ data_bundle }
OPERATION_3 origin : [['params.pcgr_data', 'A']]
OPERATION_3 gives  : [['data_bundle', 'P']]


OPERATION_4 string : Channel.fromPath(params.pcgr_config)
    .ifEmpty { exit 1, "Cannot find config file : ${params.pcgr_config}" }
    .set{ config }
OPERATION_4 origin : [['params.pcgr_config', 'A']]
OPERATION_4 gives  : [['config', 'P']]


OPERATION_5 string : data_bundle = Channel.fromPath(pcgr_data)
OPERATION_5 origin : [['pcgr_data', 'A']]
OPERATION_5 gives  : [['data_bundle', 'P']]


OPERATION_6 string : ch_reference = Channel.value(params.pcgr_genome)
OPERATION_6 origin : [['params.pcgr_genome', 'V']]
OPERATION_6 gives  : [['ch_reference', 'P']]


OPERATION_7 string : ch_optional_metadata = Channel.fromPath(params.metadata)
OPERATION_7 origin : [['params.metadata', 'A']]
OPERATION_7 gives  : [['ch_optional_metadata', 'P']]


OPERATION_8 string : getfilter = Channel.fromPath("${projectDir}/bin/filtervcf.py",  type: 'file', followLinks: false)
OPERATION_8 origin : [['"${projectDir}/bin/filtervcf.py",  type: \'file\', followLinks: false', 'A']]
OPERATION_8 gives  : [['getfilter', 'P']]


OPERATION_9 string : run_report = Channel.fromPath("${projectDir}/bin/report.py",  type: 'file', followLinks: false)
OPERATION_9 origin : [['"${projectDir}/bin/report.py",  type: \'file\', followLinks: false', 'A']]
OPERATION_9 gives  : [['run_report', 'P']]


OPERATION_10 string : pcgr_toml_config = Channel.value(file(params.pcgr_config))
OPERATION_10 origin : []
OPERATION_10 gives  : [['pcgr_toml_config', 'P']]


OPERATION_11 string : pcgr_toml_config = Channel.fromPath("${projectDir}/bin/pcgr.toml", type: 'file', followLinks: false)
OPERATION_11 origin : [['"${projectDir}/bin/pcgr.toml", type: \'file\', followLinks: false', 'A']]
OPERATION_11 gives  : [['pcgr_toml_config', 'P']]


OPERATION_12 string : combine_tables = Channel.fromPath("${projectDir}/bin/combine.py",  type: 'file', followLinks: false)
OPERATION_12 origin : [['"${projectDir}/bin/combine.py",  type: \'file\', followLinks: false', 'A']]
OPERATION_12 gives  : [['combine_tables', 'P']]


OPERATION_13 string : pivot_gene_simple_py = Channel.fromPath("${projectDir}/bin/pivot_gene_simple.py",  type: 'file', followLinks: false)
OPERATION_13 origin : [['"${projectDir}/bin/pivot_gene_simple.py",  type: \'file\', followLinks: false', 'A']]
OPERATION_13 gives  : [['pivot_gene_simple_py', 'P']]


OPERATION_14 string : pivot_gene_complete_py = Channel.fromPath("${projectDir}/bin/pivot_gene_complete.py",  type: 'file', followLinks: false)
OPERATION_14 origin : [['"${projectDir}/bin/pivot_gene_complete.py",  type: \'file\', followLinks: false', 'A']]
OPERATION_14 gives  : [['pivot_gene_complete_py', 'P']]


OPERATION_15 string : pivot_variant_py = Channel.fromPath("${projectDir}/bin/pivot_variant.py",  type: 'file', followLinks: false)
OPERATION_15 origin : [['"${projectDir}/bin/pivot_variant.py",  type: \'file\', followLinks: false', 'A']]
OPERATION_15 gives  : [['pivot_variant_py', 'P']]


OPERATION_16 string : plot_tiers_py = Channel.fromPath("${projectDir}/bin/tiers_plot.py",  type: 'file', followLinks: false)
OPERATION_16 origin : [['"${projectDir}/bin/tiers_plot.py",  type: \'file\', followLinks: false', 'A']]
OPERATION_16 gives  : [['plot_tiers_py', 'P']]


OPERATION_17 string : summary.collect { k,v -> "${k.padRight(20)}: $v" }.join("\n")
OPERATION_17 origin : [['summary', 'P']]
OPERATION_17 gives  : []


OPERATION_18 string : ch_vcf_for_pcgr = ch_input
OPERATION_18 origin : [['ch_input', 'P']]
OPERATION_18 gives  : [['ch_vcf_for_pcgr', 'P']]


