OPERATION_1 string : Channel.fromPath("$baseDir/assets/where_are_my_files.txt")
       .into{ch_where_trim_galore; ch_where_star; ch_where_hisat2; ch_where_hisat2_sort}
OPERATION_1 origin : [['"$baseDir/assets/where_are_my_files.txt"', 'A']]
OPERATION_1 gives  : [['ch_where_trim_galore', 'P'], ['ch_where_star', 'P'], ['ch_where_hisat2', 'P'], ['ch_where_hisat2_sort', 'P']]


OPERATION_2 string : ch_multiqc_config = Channel.fromPath(params.multiqc_config)
OPERATION_2 origin : [['params.multiqc_config', 'A']]
OPERATION_2 gives  : [['ch_multiqc_config', 'P']]


OPERATION_3 string : ch_output_docs = Channel.fromPath("$baseDir/docs/output.md")
OPERATION_3 origin : [['"$baseDir/docs/output.md"', 'A']]
OPERATION_3 gives  : [['ch_output_docs', 'P']]


OPERATION_4 string : Channel
        .fromPath(params.gtf)
        .ifEmpty { exit 1, "GTF annotation file not found: ${params.gtf}" }
        .into { gtfFile }
OPERATION_4 origin : [['params.gtf', 'A']]
OPERATION_4 gives  : [['gtfFile', 'P']]


OPERATION_5 string : Channel
        .fromPath(params.gff)
        .ifEmpty { exit 1, "GFF annotation file not found: ${params.gff}" }
        .into { gffFile }
OPERATION_5 origin : [['params.gff', 'A']]
OPERATION_5 gives  : [['gffFile', 'P']]


OPERATION_6 string : reads_ch = Channel.fromFilePairs(params.reads)
OPERATION_6 origin : [['params.reads', 'A']]
OPERATION_6 gives  : [['reads_ch', 'P']]


OPERATION_7 string : newSampleSheet
  .splitCsv(header:true)
  .map { row-> tuple(row.number, file(row.R1), file(row.R2), row.isolate) }
  .set { newSampleChannel }
OPERATION_7 origin : [['newSampleSheet', 'P']]
OPERATION_7 gives  : [['newSampleChannel', 'P']]


OPERATION_8 string : newSampleSheetFastQC
  .splitCsv(header:true)
  .map { row-> tuple(row.number, file(row.R1), file(row.R2), row.isolate) }
  .set { newSampleChannelFastQC }
OPERATION_8 origin : [['newSampleSheetFastQC', 'P']]
OPERATION_8 gives  : [['newSampleChannelFastQC', 'P']]


OPERATION_9 string : _fastqc.{zip,html}" into fastqc_results
OPERATION_9 origin : [['_fastqc', 'P']]
OPERATION_9 gives  : []


OPERATION_10 string : _fastqc.{zip,html}" into trimgalore_fastqc_reports
OPERATION_10 origin : [['_fastqc', 'P']]
OPERATION_10 gives  : []


OPERATION_11 string : gtf_featureCounts.collect()
OPERATION_11 origin : [['gtf_featureCounts', 'P']]
OPERATION_11 gives  : []


OPERATION_12 string : fastqc_results.collect().ifEmpty([])
OPERATION_12 origin : [['fastqc_results', 'P']]
OPERATION_12 gives  : []


OPERATION_13 string : trimgalore_results.collect()
OPERATION_13 origin : [['trimgalore_results', 'P']]
OPERATION_13 gives  : []


