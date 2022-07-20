OPERATION_1 string : Channel
    .fromPath(params.input_files)
    .splitCsv(header: ['name', 'bam'], sep: "\t")
    .map{ row-> tuple(row.name, file(row.bam)) }
    .set { input_files }
OPERATION_1 origin : [['params.input_files', 'A']]
OPERATION_1 gives  : [['input_files', 'P']]


OPERATION_2 string : input_files.into { input_files_for_fastq; input_files_for_fasta }
OPERATION_2 origin : [['input_files', 'P']]
OPERATION_2 gives  : [['input_files_for_fastq', 'P'], ['input_files_for_fasta', 'P']]


OPERATION_3 string : fastqs.join(fastas).map {it.join("\t")}.collectFile(name: "${params.output}/output_files.txt", newLine: true)
OPERATION_3 origin : [['fastqs', 'P'], ['fastas', 'P']]
OPERATION_3 gives  : []


