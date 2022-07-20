OPERATION_1 string : ch_utils = Channel.fromPath("${projectDir}/utils",  type: 'dir', followLinks: false)
OPERATION_1 origin : [['"${projectDir}/utils",  type: \'dir\', followLinks: false', 'A']]
OPERATION_1 gives  : [['ch_utils', 'P']]


OPERATION_2 string : ch_src = Channel.fromPath("${projectDir}/src",  type: 'dir', followLinks: false)
OPERATION_2 origin : [['"${projectDir}/src",  type: \'dir\', followLinks: false', 'A']]
OPERATION_2 gives  : [['ch_src', 'P']]


OPERATION_3 string : processAInput = Channel.from([1] * numberRepetitionsForProcessA)
OPERATION_3 origin : []
OPERATION_3 gives  : [['processAInput', 'P']]


OPERATION_4 string : processAInputFiles = Channel.fromPath("${params.dataLocation}/*${params.fileSuffix}").take( numberRepetitionsForProcessA )
OPERATION_4 origin : [['"${params.dataLocation}/*${params.fileSuffix}"', 'A']]
OPERATION_4 gives  : [['processAInputFiles', 'P']]


