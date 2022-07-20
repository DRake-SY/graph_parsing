OPERATION_1 string : mutationBamsChannel = Channel
     .fromPath("${snvToSamplesMappingFile}")
    .splitCsv(header: true, sep: "\t", by: 1)
    .map { item ->
        variant = item["key"]
            .replaceAll(/:/, "_")
            .replaceAll(/>/, "_")
        bams = item["samples_to_use"]
            .split(",")
            .collect { sample_id ->
                file("data/bams/${sample_id}.bam")
            }
        return [variant, bams]
    }
OPERATION_1 origin : [['"${snvToSamplesMappingFile}"', 'A']]
OPERATION_1 gives  : [['mutationBamsChannel', 'P']]


OPERATION_2 string : vcfChannel = Channel
    .fromPath("${snvToSamplesMappingFile}")
    .splitCsv(header: true, sep: "\t", by: 1)
    .map { item ->
        variant = item["key"]
            .replaceAll(/:/, "_")
            .replaceAll(/>/, "_")
        vcf = variant + ".vcf"
        return [variant, vcf]
    }
OPERATION_2 origin : [['"${snvToSamplesMappingFile}"', 'A']]
OPERATION_2 gives  : [['vcfChannel', 'P']]


OPERATION_3 string : mutationBamsChannel.into { mutationBamsChannel1; mutationBamsChannel2 }
OPERATION_3 origin : [['mutationBamsChannel', 'P']]
OPERATION_3 gives  : [['mutationBamsChannel1', 'P'], ['mutationBamsChannel2', 'P']]


OPERATION_4 string : mutationBamsChannel1
    .count()
    .view { num -> "Number of elements in mutationBamsChannel: $num" }
OPERATION_4 origin : [['mutationBamsChannel1', 'P']]
OPERATION_4 gives  : []


OPERATION_5 string : vcfChannel.into { vcfChannel1; vcfChannel2 }
OPERATION_5 origin : [['vcfChannel', 'P']]
OPERATION_5 gives  : [['vcfChannel1', 'P'], ['vcfChannel2', 'P']]


OPERATION_6 string : vcfChannel1 
    .count()
    .view { num -> "Number of elements in vcfChannel: $num" }
OPERATION_6 origin : [['vcfChannel1', 'P']]
OPERATION_6 gives  : []


OPERATION_7 string : joinedChannel = mutationBamsChannel2
    .join(vcfChannel2, by: 0)
    .count()
    .view { num -> "Number of elements after joining the mutationBamsChannel and vcfChannel: $num" }
OPERATION_7 origin : [['mutationBamsChannel2', 'P']]
OPERATION_7 gives  : [['joinedChannel', 'P']]


