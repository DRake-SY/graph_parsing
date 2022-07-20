OPERATION_1 string : Channel
        .fromPath(params.input, checkIfExists: true)                                           
        .map { file -> tuple(file.name.replaceAll(".bam",''), file) }                                      
        .into { bam_files_check; 
                bam_files_flagstats;
                bam_files_idxstats;
                bam_files_stats;
                bam_files_fastqc }
OPERATION_1 origin : [['params.input, checkIfExists: true', 'A']]
OPERATION_1 gives  : [['bam_files_check', 'P'], ['bam_files_flagstats', 'P'], ['bam_files_idxstats', 'P'], ['bam_files_stats', 'P'], ['bam_files_fastqc', 'P']]


OPERATION_2 string : Channel
        .fromPath(params.input, checkIfExists: true)                                           
        .map { file -> tuple(file.name.replaceAll(".bam",''), file) }                                      
        .into { bam_chr;
                bam_files_flagstats;
                bam_files_idxstats;
                bam_files_stats;
                bam_files_fastqc}
OPERATION_2 origin : [['params.input, checkIfExists: true', 'A']]
OPERATION_2 gives  : [['bam_chr', 'P'], ['bam_files_flagstats', 'P'], ['bam_files_idxstats', 'P'], ['bam_files_stats', 'P'], ['bam_files_fastqc', 'P']]


OPERATION_3 string : summary.collect { k,v -> "${k.padRight(26)}: $v" }.join("\n")
OPERATION_3 origin : [['summary', 'P']]
OPERATION_3 gives  : []


OPERATION_4 string : unmap_unmap_bam.join(map_unmap_bam, remainder: true)
               .join(unmap_map_bam, remainder: true)
               .set{ all_unmapped_bam }
OPERATION_4 origin : [['unmap_unmap_bam', 'P']]
OPERATION_4 gives  : [['all_unmapped_bam', 'P']]


OPERATION_5 string : reads_mapped.join(reads_unmapped, remainder: true)
            .map{
              row -> tuple(row[0], row[1][0], row[1][1], row[2][0], row[2][1])
            }
            .set{ all_fastq }
OPERATION_5 origin : [['reads_mapped', 'P']]
OPERATION_5 gives  : [['all_fastq', 'P']]


