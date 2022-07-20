OPERATION_1 string : Channel.fromPath(params.manifest)
    .splitCsv(sep: '\t')
    .map { row ->
        def sample_id = row[1]
        def status = row[2].toInteger()
        def run_id = row[3]
        def r1 = file(row[4])
        def r2 = file(row[5])
        [[sample_id, status, run_id], r1, r2]
    }
                                       
    .splitFastq(by: params.chunksize, pe:true, file:true)
    .map { row ->
        def identifiers = row[0]
        def sample_id = identifiers[0]
        def status = identifiers[1]
        def run_id = identifiers[2]
        def idx = row[1].baseName.split(/\\.fastq|\\.fq/)[0].split("\\.")[-1]
        [sample_id, status, run_id, idx, row[1], row[2]]
    }
    .set { fastq_ch }
OPERATION_1 origin : [['params.manifest', 'A']]
OPERATION_1 gives  : [['fastq_ch', 'P']]


OPERATION_2 string : Channel
    .value(file("${params.fasta}.{amb,ann,bwt,pac,sa}"))
    .set { bwaidx_ch }
OPERATION_2 origin : []
OPERATION_2 gives  : [['bwaidx_ch', 'P']]


OPERATION_3 string : intervals_ch = Channel
    .from(params.intervals ? intervals : faidx)
    .splitCsv(sep: '\t')
    .map { row ->
                                 
        if (row[0][0] != "@") {
            def interval_start = row[1].toLong()
            def interval_length = row[2].toLong()
            long start
            long end
            int width = params.width

            if (!params.intervals) {
                                                            
                interval_start = 0
                interval_length = row[1].toLong()
            }

            while(interval_start < interval_length) {
                start = interval_start
                                       
                end = interval_start + width + 500
                interval_start = end - 500
                if (end > interval_length) {
                    end = interval_length
                    interval_start = end
                }
                                                  
                intervals_ch.bind( "${row[0]}:${start}-${end}" )
            }
        }
    }
OPERATION_3 origin : [['"${row[0]}:${start}-${end}"', 'V']]
OPERATION_3 gives  : [['intervals_ch', 'P']]


OPERATION_4 string : create_call_bams_ch
    .map { file -> tuple(file.getSimpleName(), file, file + ("${file}".endsWith('.cram') ? '.crai' : '.bai')) }
    .into { call_bams; genotype_bams }
OPERATION_4 origin : [['create_call_bams_ch', 'P']]
OPERATION_4 gives  : [['call_bams', 'P'], ['genotype_bams', 'P']]


