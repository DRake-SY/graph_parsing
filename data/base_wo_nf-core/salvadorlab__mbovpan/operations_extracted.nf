OPERATION_1 string : reads = Channel.fromFilePairs("$input*{1,2}*.fastq*").ifEmpty { error "Cannot find the read files" }
OPERATION_1 origin : [['"$input*{1,2}*.fastq*"', 'A']]
OPERATION_1 gives  : [['reads', 'P']]


OPERATION_2 string : bam = Channel.create()
OPERATION_2 origin : []
OPERATION_2 gives  : [['bam', 'P']]


OPERATION_3 string : assembly = Channel.create()
OPERATION_3 origin : []
OPERATION_3 gives  : [['assembly', 'P']]


OPERATION_4 string : reads.into {
    reads_process
    reads_trim
}
OPERATION_4 origin : [['reads', 'P']]
OPERATION_4 gives  : []


OPERATION_5 string : fastp_ch.into {
        fastp_reads1
        fastp_reads2
        fastp_reads3
        fastp_reads4
    }
OPERATION_5 origin : [['fastp_ch', 'P']]
OPERATION_5 gives  : []


OPERATION_6 string : nodup_ch.into {
        nodup1_ch
        nodup2_ch
    }
OPERATION_6 origin : [['nodup_ch', 'P']]
OPERATION_6 gives  : []


OPERATION_7 string : filter_ch.into {
        filter1_ch
        filter2_ch
    }
OPERATION_7 origin : [['filter_ch', 'P']]
OPERATION_7 gives  : []


OPERATION_8 string : stats_ch = fastp_reads4.merge(nodup2_ch).merge(filter2_ch).view()
OPERATION_8 origin : [['fastp_reads4', 'P'], ['nodup2_ch', 'P'], ['filter2_ch', 'P']]
OPERATION_8 gives  : [['stats_ch', 'P']]


OPERATION_9 string : assembly_ch.into {
    assembly_ch1
    assembly_ch2
}
OPERATION_9 origin : [['assembly_ch', 'P']]
OPERATION_9 gives  : []


OPERATION_10 string : bam = map_ch
OPERATION_10 origin : [['map_ch', 'P']]
OPERATION_10 gives  : [['bam', 'P']]


OPERATION_11 string : assembly_ch = shortassembly_ch
OPERATION_11 origin : [['shortassembly_ch', 'P']]
OPERATION_11 gives  : [['assembly_ch', 'P']]


