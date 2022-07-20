OPERATION_1 string : Channel
	.from([[params.prefix, [file(params.reads1)]]])
	.into { read_files_fastqc; read_files_dedup; read_files_synthetic_contaminants }
OPERATION_1 origin : []
OPERATION_1 gives  : [['read_files_fastqc', 'P'], ['read_files_dedup', 'P'], ['read_files_synthetic_contaminants', 'P']]


OPERATION_2 string : Channel
	.from([[params.prefix, [file(params.reads1), file(params.reads2)]]] )
	.into { read_files_fastqc; read_files_dedup; read_files_synthetic_contaminants }
OPERATION_2 origin : []
OPERATION_2 gives  : [['read_files_fastqc', 'P'], ['read_files_dedup', 'P'], ['read_files_synthetic_contaminants', 'P']]


OPERATION_3 string : dedup_log = Channel.from(file("$baseDir/assets/no_dedup.yaml"))
OPERATION_3 origin : []
OPERATION_3 gives  : [['dedup_log', 'P']]


OPERATION_4 string : Channel.fromPath( "${params.artefacts}", checkIfExists: true ).set { artefacts }
OPERATION_4 origin : [['"${params.artefacts}", checkIfExists: true', 'A']]
OPERATION_4 gives  : [['artefacts', 'P']]


OPERATION_5 string : Channel.fromPath( "${params.phix174ill}", checkIfExists: true ).set { phix174ill }
OPERATION_5 origin : [['"${params.phix174ill}", checkIfExists: true', 'A']]
OPERATION_5 gives  : [['phix174ill', 'P']]


OPERATION_6 string : Channel.fromPath( "${params.adapters}", checkIfExists: true ).set { adapters }
OPERATION_6 origin : [['"${params.adapters}", checkIfExists: true', 'A']]
OPERATION_6 gives  : [['adapters', 'P']]


OPERATION_7 string : Channel.fromPath( "${params.foreign_genome}", checkIfExists: true ).set { foreign_genome }
OPERATION_7 origin : [['"${params.foreign_genome}", checkIfExists: true', 'A']]
OPERATION_7 gives  : [['foreign_genome', 'P']]


OPERATION_8 string : index_foreign_genome_log = Channel.from(file("$baseDir/assets/foreign_genome_indexing_mqc.yaml"))
OPERATION_8 origin : []
OPERATION_8 gives  : [['index_foreign_genome_log', 'P']]


OPERATION_9 string : index_foreign_genome_log = Channel.empty()
OPERATION_9 origin : []
OPERATION_9 gives  : [['index_foreign_genome_log', 'P']]


OPERATION_10 string : ref_foreign_genome = Channel.from(file(params.foreign_genome_ref))
OPERATION_10 origin : []
OPERATION_10 gives  : [['ref_foreign_genome', 'P']]


OPERATION_11 string : Channel
	.from([[params.prefix, [file(params.reads1)]]])
	.into { reads_profile_taxa; reads_profile_functions }
OPERATION_11 origin : []
OPERATION_11 gives  : [['reads_profile_taxa', 'P'], ['reads_profile_functions', 'P']]


OPERATION_12 string : reads_merge_paired_end_cleaned = Channel.empty()
OPERATION_12 origin : []
OPERATION_12 gives  : [['reads_merge_paired_end_cleaned', 'P']]


OPERATION_13 string : merge_paired_end_cleaned_log = Channel.empty()
OPERATION_13 origin : []
OPERATION_13 gives  : [['merge_paired_end_cleaned_log', 'P']]


OPERATION_14 string : Channel
	.from([[params.prefix, [file(params.reads1), file(params.reads2)]]] )
	.set { reads_merge_paired_end_cleaned }
OPERATION_14 origin : []
OPERATION_14 gives  : [['reads_merge_paired_end_cleaned', 'P']]


OPERATION_15 string : merge_paired_end_cleaned_log = Channel.from(file("$baseDir/assets/merge_paired_end_cleaned_mqc.yaml"))
OPERATION_15 origin : []
OPERATION_15 gives  : [['merge_paired_end_cleaned_log', 'P']]


OPERATION_16 string : reads_profile_taxa = Channel.empty()
OPERATION_16 origin : []
OPERATION_16 gives  : [['reads_profile_taxa', 'P']]


OPERATION_17 string : reads_profile_functions = Channel.empty()
OPERATION_17 origin : []
OPERATION_17 gives  : [['reads_profile_functions', 'P']]


OPERATION_18 string : reads_merge_paired_end_cleaned = Channel.empty()
OPERATION_18 origin : []
OPERATION_18 gives  : [['reads_merge_paired_end_cleaned', 'P']]


OPERATION_19 string : merge_paired_end_cleaned_log = Channel.empty()
OPERATION_19 origin : []
OPERATION_19 gives  : [['merge_paired_end_cleaned_log', 'P']]


OPERATION_20 string : reads_profile_taxa = Channel.empty()
OPERATION_20 origin : []
OPERATION_20 gives  : [['reads_profile_taxa', 'P']]


OPERATION_21 string : reads_profile_functions = Channel.empty()
OPERATION_21 origin : []
OPERATION_21 gives  : [['reads_profile_functions', 'P']]


OPERATION_22 string : reads_profile_taxa = Channel.empty()
OPERATION_22 origin : []
OPERATION_22 gives  : [['reads_profile_taxa', 'P']]


OPERATION_23 string : Channel.fromPath( params.metaphlan_databases, type: 'dir', checkIfExists: true ).set { bowtie2_metaphlan_databases }
OPERATION_23 origin : [["params.metaphlan_databases, type: 'dir', checkIfExists: true", 'A']]
OPERATION_23 gives  : [['bowtie2_metaphlan_databases', 'P']]


OPERATION_24 string : Channel.fromPath( params.chocophlan, type: 'dir', checkIfExists: true ).set { chocophlan_databases }
OPERATION_24 origin : [["params.chocophlan, type: 'dir', checkIfExists: true", 'A']]
OPERATION_24 gives  : [['chocophlan_databases', 'P']]


OPERATION_25 string : Channel.fromPath( params.uniref, type: 'dir', checkIfExists: true ).set { uniref_databases }
OPERATION_25 origin : [["params.uniref, type: 'dir', checkIfExists: true", 'A']]
OPERATION_25 gives  : [['uniref_databases', 'P']]


OPERATION_26 string : summary.collect { k,v -> "${k.padRight(27)}: $v" }.join("\n")
OPERATION_26 origin : [['summary', 'P']]
OPERATION_26 gives  : []


OPERATION_27 string : to_synthetic_contaminants = read_files_synthetic_contaminants
OPERATION_27 origin : [['read_files_synthetic_contaminants', 'P']]
OPERATION_27 gives  : [['to_synthetic_contaminants', 'P']]


