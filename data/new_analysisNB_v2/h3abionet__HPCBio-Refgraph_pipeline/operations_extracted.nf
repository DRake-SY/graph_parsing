OPERATION_1 string : CRAM_Ch1 = Channel.fromFilePairs("${params.samplePath}", size: 1)
OPERATION_1 origin : [['"${params.samplePath}", size: 1', 'A']]
OPERATION_1 gives  : [['CRAM_Ch1', 'P']]


OPERATION_2 string : all_assemblies_rename_ch = megahit_rename_ch.mix(masurca_rename_ch)
OPERATION_2 origin : [['megahit_rename_ch', 'P'], ['masurca_rename_ch', 'P']]
OPERATION_2 gives  : [['all_assemblies_rename_ch', 'P']]


