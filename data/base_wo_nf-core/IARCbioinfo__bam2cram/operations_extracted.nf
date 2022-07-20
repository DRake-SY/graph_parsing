OPERATION_1 string : ch_fasta = Channel.value(file(params.fasta)).ifEmpty{exit 1, "Fasta file not found: ${params.fasta}"}
OPERATION_1 origin : []
OPERATION_1 gives  : [['ch_fasta', 'P']]


OPERATION_2 string : ch_fai = Channel.value(file(params.fai)).ifEmpty{exit 1, "fai index file not found: ${params.fai}"}
OPERATION_2 origin : []
OPERATION_2 gives  : [['ch_fai', 'P']]


OPERATION_3 string : Channel.fromPath(file(params.bam_csv)).splitCsv(header: true, sep: '\t', strip: true)
                      .map{row -> [ row.label, file(row.bam), file(row.index)]}
                      .ifEmpty{exit 1, "params.bams_csv was empty - no input files supplied" }
                      .into { inputbams; bamstats; sizebams }
OPERATION_3 origin : [['file(params.bam_csv', 'A']]
OPERATION_3 gives  : [['inputbams', 'P'], ['bamstats', 'P'], ['sizebams', 'P']]


OPERATION_4 string : bams = Channel.fromPath( params.bams+'/*.bam' )
                .map {path -> [ path.name.replace(".bam",""),path]}
OPERATION_4 origin : [["params.bams+'/*.bam'", 'A']]
OPERATION_4 gives  : [['bams', 'P']]


OPERATION_5 string : bams_index = Channel.fromPath( params.bams+'/*.bam.bai')
                .map {  path -> [ path.name.replace(".bam.bai",""), path ] }
OPERATION_5 origin : [["params.bams+'/*.bam.bai'", 'A']]
OPERATION_5 gives  : [['bams_index', 'P']]


OPERATION_6 string : params.collect{ k,v -> "${k.padRight(18)}: $v"}.join("\n")
OPERATION_6 origin : [['params', 'P']]
OPERATION_6 gives  : []


OPERATION_7 string : files = bams.join(bams_index)
OPERATION_7 origin : [['bams', 'P'], ['bams_index', 'P']]
OPERATION_7 gives  : [['files', 'P']]


OPERATION_8 string : files.into {inputbams; bamstats; sizebams}
OPERATION_8 origin : [['files', 'P']]
OPERATION_8 gives  : [['inputbams', 'P'], ['bamstats', 'P'], ['sizebams', 'P']]


OPERATION_9 string : cram_bam_size = sizecrams.join(sizebams)
OPERATION_9 origin : [['sizecrams', 'P'], ['sizebams', 'P']]
OPERATION_9 gives  : [['cram_bam_size', 'P']]


OPERATION_10 string : cram_bam_qc = cram_qc.join(bam_qc)
OPERATION_10 origin : [['cram_qc', 'P'], ['bam_qc', 'P']]
OPERATION_10 gives  : [['cram_bam_qc', 'P']]


OPERATION_11 string : report_qc.collectFile(name: 'bam2cram_summary.txt', storeDir: params.output_folder, seed: 'ID\tflagstat\tstats\tBAM_size\tCRAM_size\n', newLine: false, skip: 1)
OPERATION_11 origin : [['report_qc', 'P']]
OPERATION_11 gives  : []


