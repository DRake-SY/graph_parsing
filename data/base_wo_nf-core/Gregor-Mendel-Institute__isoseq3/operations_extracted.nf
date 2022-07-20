OPERATION_1 string : Channel
    .fromFilePairs(params.input + '*.{bam,bam.pbi}') { file -> file.name.replaceAll(/.bam|.pbi$/,'') }
    .ifEmpty { error "Cannot find matching bam and pbi files: $params.input. Make sure your bam files are pb indexed." }
    .set { ccs_in }
OPERATION_1 origin : [["params.input + '*.{bam,bam.pbi}'", 'A']]
OPERATION_1 gives  : [['ccs_in', 'P']]


OPERATION_2 string : Channel
    .fromPath(params.input + '*.bam')
    .ifEmpty { error "Cannot find matching bam files: $params.input." }
    .tap { bam_files }
    .map{ file -> tuple(file.name.replaceAll(/.bam$/,''), file) }
    .tap { bam_names }
OPERATION_2 origin : [["params.input + '*.bam'", 'A']]
OPERATION_2 gives  : [['bam_files', 'P'], ['bam_names', 'P']]


OPERATION_3 string : Channel
    .fromPath(params.primers)
    .ifEmpty { error "Cannot find primer file: $params.primers" }
    .into { primers_remove; primers_refine }
OPERATION_3 origin : [['params.primers', 'A']]
OPERATION_3 gives  : [['primers_remove', 'P'], ['primers_refine', 'P']]


OPERATION_4 string : Channel
    .fromPath(params.ref_fasta)
    .ifEmpty { error "Cannot find primer file: $params.primers" }
    .set {ref_fasta}
OPERATION_4 origin : [['params.ref_fasta', 'A']]
OPERATION_4 gives  : [['ref_fasta', 'P']]


OPERATION_5 string : Channel
    .fromPath(params.input + '*.bam.pbi')
    .ifEmpty { error "Cannot find matching bam.pbi files: $params.input." }
    .into { pbi_merge_trans; pbi_merge_sub; pbi_polish }
OPERATION_5 origin : [["params.input + '*.bam.pbi'", 'A']]
OPERATION_5 gives  : [['pbi_merge_trans', 'P'], ['pbi_merge_sub', 'P'], ['pbi_polish', 'P']]


