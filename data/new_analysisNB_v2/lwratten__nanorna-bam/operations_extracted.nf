OPERATION_1 string : ch_multiqc_config = Channel.fromPath(params.multiqc_config)
OPERATION_1 origin : [['params.multiqc_config', 'A']]
OPERATION_1 gives  : [['ch_multiqc_config', 'P']]


OPERATION_2 string : ch_output_docs = Channel.fromPath("$baseDir/docs/output.md")
OPERATION_2 origin : [['"$baseDir/docs/output.md"', 'A']]
OPERATION_2 gives  : [['ch_output_docs', 'P']]


OPERATION_3 string : summary.collect { k,v -> "${k.padRight(18)}: $v" }.join("\n")
OPERATION_3 origin : [['summary', 'P']]
OPERATION_3 gives  : []


OPERATION_4 string : ch_samplesheet_reformat
    .splitCsv(header:true, sep:',')
    .map { get_sample_info(it, params.genomes) }
    .map { it -> [ it[0], it[1], it[2] ] }                                  
    .into { ch_txome_reconstruction;
            ch_annot_feature_count}
OPERATION_4 origin : [['ch_samplesheet_reformat', 'P']]
OPERATION_4 gives  : [['ch_txome_reconstruction', 'P'], ['ch_annot_feature_count', 'P']]


OPERATION_5 string : ch_annot_feature_count
    .concat(ch_txome_feature_count)
    .set{ ch_feature_count }
OPERATION_5 origin : [['ch_annot_feature_count', 'P'], ['ch_txome_feature_count', 'P']]
OPERATION_5 gives  : [['ch_feature_count', 'P']]


