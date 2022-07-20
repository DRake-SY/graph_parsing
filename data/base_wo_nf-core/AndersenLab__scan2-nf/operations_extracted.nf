OPERATION_1 string : seeds = Channel
			.from(1..100000)
			.randomSample(nperms)
OPERATION_1 origin : [['1..100000', 'V']]
OPERATION_1 gives  : [['seeds', 'P']]


OPERATION_2 string : riails = Channel.fromPath("${params.in}")
OPERATION_2 origin : [['"${params.in}"', 'A']]
OPERATION_2 gives  : [['riails', 'P']]


OPERATION_3 string : crossobj_split = seeds.combine(crossobj)
OPERATION_3 origin : [['seeds', 'P'], ['crossobj', 'P']]
OPERATION_3 gives  : [['crossobj_split', 'P']]


