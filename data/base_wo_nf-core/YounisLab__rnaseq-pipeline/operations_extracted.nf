OPERATION_1 string : Channel
        .fromFilePairs(params.fastq_dir +'/*_[A-Z].fastq', size: -1)
                                                                       
        .map { key, files -> [key, files, 0]}
        .ifEmpty { exit 1, "Cannot find any reads matching the glob!"}
        .set {raw_reads_fastq}
OPERATION_1 origin : [["params.fastq_dir +'/*_[A-Z].fastq', size: -1", 'A']]
OPERATION_1 gives  : [['raw_reads_fastq', 'P']]


OPERATION_2 string : Channel
        .fromPath(params.fastq_dir +'/*.fastq')
        .map {file -> [file.baseName, file, 0]}
        .ifEmpty { exit 1, "Cannot find any files in directory!"}
        .set {raw_reads_fastq}
OPERATION_2 origin : [["params.fastq_dir +'/*.fastq'", 'A']]
OPERATION_2 gives  : [['raw_reads_fastq', 'P']]


OPERATION_3 string : Channel
        .fromFilePairs(params.fastq_dir +'/*_[A-Z]_R{1,2}.fastq', size: -1)
        .map { key, files -> [key,
                              files.findAll { it.toString().endsWith('R1.fastq') },
                              files.findAll { it.toString().endsWith('R2.fastq') }] }
        .ifEmpty { exit 1, "Cannot find any reads matching the glob!"}
        .set {raw_reads_fastq}
OPERATION_3 origin : [["params.fastq_dir +'/*_[A-Z]_R{1,2}.fastq', size: -1", 'A']]
OPERATION_3 gives  : [['raw_reads_fastq', 'P']]


