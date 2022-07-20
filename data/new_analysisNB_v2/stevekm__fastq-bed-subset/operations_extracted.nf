OPERATION_1 string : Channel.fromPath( params.samplesheet )
        .splitCsv(header: true, sep: '\t')
        .map{row ->
            def sampleID = row['Sample']
            def reads1 = row['R1'].tokenize( ',' ).collect { file(it) }                                       
            def reads2 = row['R2'].tokenize( ',' ).collect { file(it) }
            def bam = file(row['Bam'])
            return [ sampleID, reads1, reads2, bam ]
        }
        .tap { samples_R1_R2 }
OPERATION_1 origin : [['params.samplesheet', 'A']]
OPERATION_1 gives  : [['samples_R1_R2', 'P']]


OPERATION_2 string : Channel.fromPath( params.targets )
    .splitCsv(header: false, sep: '\t')
    .map { row ->
        def chrom = row[0]
        def start = row[1]
        def stop = row[2]
        def numReads
        if ( row.size() >= 4 ) {
            numReads = row[3]
        } else {
            numReads = "${params.maxReads}"
        }

        return([ chrom, start, stop, numReads])
    }.set{ targets }
OPERATION_2 origin : [['params.targets', 'A']]
OPERATION_2 gives  : [['targets', 'P']]


OPERATION_3 string : samples_fastq_merged.combine(targets).set{ samples_fastq_merged_targets }
OPERATION_3 origin : [['samples_fastq_merged', 'P'], ['targets', 'P']]
OPERATION_3 gives  : [['samples_fastq_merged_targets', 'P']]


OPERATION_4 string : samples_qnames.map { sampleID, fastq_R1, fastq_R2, chrom, start, stop, numReads, qnames_txt ->
                                                                     
    return([ sampleID, chrom, start, stop, numReads, qnames_txt, [ ['R1', fastq_R1], ['R2', fastq_R2] ] ])
    }
    .transpose()
    .map { sampleID, chrom, start, stop, numReads, qnames_txt, fastq_list ->
        def fastq_label = fastq_list[0]
        def fastq = fastq_list[1]
        return([ sampleID, chrom, start, stop, numReads, qnames_txt, fastq_label, fastq ])
    }
    .set { samples_qnames_per_fastq }
OPERATION_4 origin : [['samples_qnames', 'P']]
OPERATION_4 gives  : [['samples_qnames_per_fastq', 'P']]


OPERATION_5 string : subset_fastqs.groupTuple(by: [0,1]).set { grouped_fastqs }PROCESS DEF merge_subsetted_fastq
OPERATION_5 origin : [['subset_fastqs', 'P']]
OPERATION_5 gives  : [['grouped_fastqs', 'P']]


OPERATION_6 string : merged_subset_fastqs.subscribe { println "${it}" }
OPERATION_6 origin : [['merged_subset_fastqs', 'P']]
OPERATION_6 gives  : []


