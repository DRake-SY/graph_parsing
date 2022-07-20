OPERATION_1 string : Channel.of( sampleID, fqR1path, fqR2path )
    .toList()
    .into { ch_sample_fastqs; ch_fastq_star }
OPERATION_1 origin : [['sampleID, fqR1path, fqR2path', 'V']]
OPERATION_1 gives  : [['ch_sample_fastqs', 'P'], ['ch_fastq_star', 'P']]


