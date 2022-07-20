OPERATION_1 string : Channel
		.from([[params.prefix, [file(params.reads1)]]])
		.into { to_profile_taxa; to_profile_functions }
OPERATION_1 origin : []
OPERATION_1 gives  : [['to_profile_taxa', 'P'], ['to_profile_functions', 'P']]


OPERATION_2 string : reads_merge_paired_end_cleaned = Channel.empty()
OPERATION_2 origin : []
OPERATION_2 gives  : [['reads_merge_paired_end_cleaned', 'P']]


OPERATION_3 string : merge_paired_end_cleaned_log = Channel.empty()
OPERATION_3 origin : []
OPERATION_3 gives  : [['merge_paired_end_cleaned_log', 'P']]


OPERATION_4 string : Channel
		.from([[params.prefix, [file(params.reads1), file(params.reads2)]]] )
		.set { reads_merge_paired_end_cleaned }
OPERATION_4 origin : []
OPERATION_4 gives  : [['reads_merge_paired_end_cleaned', 'P']]


OPERATION_5 string : merge_paired_end_cleaned_log = Channel.from(file("$baseDir/assets/merge_paired_end_cleaned_mqc.yaml"))
OPERATION_5 origin : []
OPERATION_5 gives  : [['merge_paired_end_cleaned_log', 'P']]


OPERATION_6 string : to_profile_taxa = Channel.empty()
OPERATION_6 origin : []
OPERATION_6 gives  : [['to_profile_taxa', 'P']]


OPERATION_7 string : to_profile_functions = Channel.empty()
OPERATION_7 origin : []
OPERATION_7 gives  : [['to_profile_functions', 'P']]


OPERATION_8 string : Channel
		.from([[params.prefix, file(params.taxonomic_profile)]])
		.set{ custom_taxa_profile }
OPERATION_8 origin : []
OPERATION_8 gives  : [['custom_taxa_profile', 'P']]


OPERATION_9 string : custom_taxa_profile = Channel.empty()
OPERATION_9 origin : []
OPERATION_9 gives  : [['custom_taxa_profile', 'P']]


OPERATION_10 string : Channel
	.fromPath(params.multiqc_config)
	.set {multiqc_config_ch}
OPERATION_10 origin : [['params.multiqc_config', 'A']]
OPERATION_10 gives  : [['multiqc_config_ch', 'P']]


OPERATION_11 string : summary.collect { k,v -> "${k.padRight(27)}: $v" }.join("\n")
OPERATION_11 origin : [['summary', 'P']]
OPERATION_11 gives  : []


