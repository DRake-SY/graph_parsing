OPERATION_1 string : Channel
    .fromPath("${params.inputdir}/*.bam")
    .into {  md5_channel ; validate_bam_channel ; samtools_flagstat_channel ; qualimap_bamqc_channel}
OPERATION_1 origin : [['"${params.inputdir}/*.bam"', 'A']]
OPERATION_1 gives  : [['md5_channel', 'P'], ['validate_bam_channel', 'P'], ['samtools_flagstat_channel', 'P'], ['qualimap_bamqc_channel', 'P']]


OPERATION_2 string : Channel
    .fromPath(params.ref)
    .into { ref_validate_bam_channel ; ref_samtools_flagstat_channel ; ref_qualimap_bamqc_channel}
OPERATION_2 origin : [['params.ref', 'A']]
OPERATION_2 gives  : [['ref_validate_bam_channel', 'P'], ['ref_samtools_flagstat_channel', 'P'], ['ref_qualimap_bamqc_channel', 'P']]


