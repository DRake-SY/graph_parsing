OPERATION_1 string : Channel
  .fromPath(sheet_nf)
  .splitCsv(header:true)
  .map { row -> tuple( row.Sample_ID, row.fastq_1, row.fastq_2, row.Sample_Species ) }
  .tap{ infoall }
  .set { fastq_ch }
OPERATION_1 origin : [['sheet_nf', 'A']]
OPERATION_1 gives  : [['fastq_ch', 'P'], ['infoall', 'P']]


OPERATION_2 string : Channel
  .fromPath(sheet_nf)
  .splitCsv(header:true)
  .map { row -> tuple( row.Sample_ID, row.bam, row.Sample_Strandness, row.Sample_Species, row.Sample_RIN, row.Sample_Concentration ) }
  .tap { infobam }
  .into { bam_checkbam_ch; bam_qualimap_ch; bam_rseqc_ch; bam_bladderreport_ch; bam_rnaseqmetrics_ch }
OPERATION_2 origin : [['sheet_nf', 'A']]
OPERATION_2 gives  : [['bam_checkbam_ch', 'P'], ['bam_qualimap_ch', 'P'], ['bam_rseqc_ch', 'P'], ['bam_bladderreport_ch', 'P'], ['bam_rnaseqmetrics_ch', 'P'], ['infobam', 'P']]


OPERATION_3 string : Channel
    .fromPath(sheet_nf)
    .splitCsv(header:true)
    .map { row -> tuple( row.bam ) }
    .tap{ infoallfcounts }
    .set { bam_featurecounts_ch }
OPERATION_3 origin : [['sheet_nf', 'A']]
OPERATION_3 gives  : [['bam_featurecounts_ch', 'P'], ['infoallfcounts', 'P']]


OPERATION_4 string : infoall.subscribe { println "Info: $it" }
OPERATION_4 origin : [['infoall', 'P']]
OPERATION_4 gives  : []


