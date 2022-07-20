OPERATION_1 string : Channel
        .fromPath(params.gtf)
        .ifEmpty { exit 1, "GTF annotation file not found: ${params.gtf}" }
        .into { gtfFile }
OPERATION_1 origin : [['params.gtf', 'A']]
OPERATION_1 gives  : [['gtfFile', 'P']]


OPERATION_2 string : Channel
        .fromPath(params.gff)
        .ifEmpty { exit 1, "GFF annotation file not found: ${params.gff}" }
        .into { gffFile }
OPERATION_2 origin : [['params.gff', 'A']]
OPERATION_2 gives  : [['gffFile', 'P']]


OPERATION_3 string : Channel
        .fromPath(params.phenotype_info)
        .ifEmpty { exit 1, "Phenotype file not found: ${params.phenotype_info}" }
        .into { phenotype_file }
OPERATION_3 origin : [['params.phenotype_info', 'A']]
OPERATION_3 gives  : [['phenotype_file', 'P']]


OPERATION_4 string : sample_sheet = Channel.fromPath(params.reads)
OPERATION_4 origin : [['params.reads', 'A']]
OPERATION_4 gives  : [['sample_sheet', 'P']]


OPERATION_5 string : sample_sheet_QC = Channel.fromPath(params.reads)
OPERATION_5 origin : [['params.reads', 'A']]
OPERATION_5 gives  : [['sample_sheet_QC', 'P']]


OPERATION_6 string : reads_ch = Channel.fromFilePairs(params.reads)
OPERATION_6 origin : [['params.reads', 'A']]
OPERATION_6 gives  : [['reads_ch', 'P']]


OPERATION_7 string : sample_sheet
  .splitCsv(header:true)
  .map{ row-> tuple(row.number, file(row.R1), file(row.R2)) }
  .set { newSampleChannel }
OPERATION_7 origin : [['sample_sheet', 'P']]
OPERATION_7 gives  : [['newSampleChannel', 'P']]


OPERATION_8 string : sample_sheet_QC
  .splitCsv(header:true)
  .map{ row-> tuple(row.number, file(row.R1), file(row.R2)) }
  .set { newSampleChannelFastQC }
OPERATION_8 origin : [['sample_sheet_QC', 'P']]
OPERATION_8 gives  : [['newSampleChannelFastQC', 'P']]


