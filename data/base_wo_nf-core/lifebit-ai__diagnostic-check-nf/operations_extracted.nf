OPERATION_1 string : Channel
    .fromPath(params.input)
    .ifEmpty { exit 1, "Cannot find input file : ${params.input}" }
    .splitCsv(skip:1, by:2)
    .map { row ->
            def idPatient  = row[0][0]
            if( row[0][2] == "N") {
                idSampleNormal = row[0][1]
                bamNormal = file(row[0][3])
                baiNormal = file(row[0][4])
                idSampleTumor = row[1][1]
                bamTumor = file(row[1][3])
                baiTumor = file(row[1][4])
            } else {
                idSampleNormal = row[1][1]
                bamNormal = file(row[1][3])
                baiNormal = file(row[1][4])
                idSampleTumor = row[0][1]
                bamTumor = file(row[0][3])
                baiTumor = file(row[0][4])
            }
           [idPatient, idSampleNormal, bamNormal, baiNormal, idSampleTumor, bamTumor, baiTumor]
        }
    .into { pairBamManta; pairBamStrelka }
OPERATION_1 origin : [['params.input', 'A']]
OPERATION_1 gives  : [['pairBamManta', 'P'], ['pairBamStrelka', 'P']]


OPERATION_2 string : ch_fasta = Channel.value(file(params.genome_fasta))
OPERATION_2 origin : []
OPERATION_2 gives  : [['ch_fasta', 'P']]


OPERATION_3 string : ch_fai = Channel.value(file(params.genome_fasta_fai))
OPERATION_3 origin : []
OPERATION_3 gives  : [['ch_fai', 'P']]


