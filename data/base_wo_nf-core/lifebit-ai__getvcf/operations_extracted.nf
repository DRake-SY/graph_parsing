OPERATION_1 string : ch_flat = Channel.fromFilePairs("${params.s3_folder}/*${params.regex}*.{vcf.gz,vcf.gz.csi}", flat: true)
OPERATION_1 origin : [['"${params.s3_folder}/*${params.regex}*.{vcf.gz,vcf.gz.csi}", flat: true', 'A']]
OPERATION_1 gives  : [['ch_flat', 'P']]


OPERATION_2 string : ch_print, ch_use = ch_flat.into(2)
OPERATION_2 origin : [['ch_flat', 'P']]
OPERATION_2 gives  : [['ch_print', 'P'], ['ch_use', 'P']]


