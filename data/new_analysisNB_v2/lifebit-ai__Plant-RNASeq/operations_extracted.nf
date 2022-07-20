OPERATION_1 string : fasta = Channel
      .fromPath(params.fasta)
      .ifEmpty { exit 1, "${params.fasta} not found"}
                                                   
      .into { fasta_real; fasta_split_chr }
OPERATION_1 origin : [['params.fasta', 'A']]
OPERATION_1 gives  : [['fasta', 'P'], ['fasta_real', 'P'], ['fasta_split_chr', 'P']]


OPERATION_2 string : Channel
            .fromPath(reads)
            .map { file -> tuple(file.baseName, file) }
            .ifEmpty { exit 1, "${reads} was empty - no input files supplied" }
            .combine(fasta_real)
            .into { read_files_fastqc; read_files_real }
OPERATION_2 origin : [['fasta_real', 'P'], ['reads', 'A']]
OPERATION_2 gives  : [['read_files_fastqc', 'P'], ['read_files_real', 'P']]


OPERATION_3 string : read_files_fastqc.subscribe{println "value: $it"}
OPERATION_3 origin : [['read_files_fastqc', 'P']]
OPERATION_3 gives  : []


OPERATION_4 string : summary.collect { k,v -> "${k.padRight(15)}: $v" }.join("\n")
OPERATION_4 origin : [['summary', 'P']]
OPERATION_4 gives  : []


OPERATION_5 string : real_output
   .flatMap { aln ->
        list_chrs = []
        aln[1].each { chrFile ->
                list_chrs << tuple(chrFile.baseName, aln[0], chrFile)
        }
        list_chrs
    }
    .set{aligned_reads_no_reads}
OPERATION_5 origin : [['real_output', 'P'], ['tuple(chrFile.baseName, aln[0], chrFile)', 'V']]
OPERATION_5 gives  : [['aligned_reads_no_reads', 'P']]


OPERATION_6 string : chrs.flatten()
    .map{ file -> tuple(file.baseName, file) }
    .set{chr}
OPERATION_6 origin : [['chrs', 'P']]
OPERATION_6 gives  : [['chr', 'P']]


OPERATION_7 string : iso.flatten()
    .map{ file -> tuple(file.baseName, file) }
    .cross(aligned_reads_no_reads)
    .map { it ->
       [it[1][0], it[1][1], it[1][2], it[0][1]]
     }
    .set{ iso_no_reads }
OPERATION_7 origin : [['iso', 'P'], ['aligned_reads_no_reads', 'P']]
OPERATION_7 gives  : [['iso_no_reads', 'P']]


