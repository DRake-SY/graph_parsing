OPERATION_1 string : startReads = Channel.fromFilePairs(params.fastq)
OPERATION_1 origin : [['params.fastq', 'A']]
OPERATION_1 gives  : [['startReads', 'P']]


OPERATION_2 string : IN_trimmomatic_opts = Channel
                .value([params.trimSlidingWindow,
                        params.trimLeading,
                        params.trimTrailing,
                        params.trimMinLength])
OPERATION_2 origin : [['[params.trimSlidingWindow,\n                        params.trimLeading,\n                        params.trimTrailing,\n                        params.trimMinLength]', 'V']]
OPERATION_2 gives  : [['IN_trimmomatic_opts', 'P']]


OPERATION_3 string : IN_spades_opts = Channel
                .value([params.spadesMinCoverage,
                        params.spadesMinKmerCoverage])
OPERATION_3 origin : [['[params.spadesMinCoverage,\n                        params.spadesMinKmerCoverage]', 'V']]
OPERATION_3 gives  : [['IN_spades_opts', 'P']]


OPERATION_4 string : IN_spades_kmers = Channel
                .value(params.spadesKmers)
OPERATION_4 origin : [['params.spadesKmers', 'V']]
OPERATION_4 gives  : [['IN_spades_kmers', 'P']]


OPERATION_5 string : UNMMAPPED_forAssembly = Channel.create()
OPERATION_5 origin : []
OPERATION_5 gives  : [['UNMMAPPED_forAssembly', 'P']]


OPERATION_6 string : UNMMAPPED_forBowtie = Channel.create()
OPERATION_6 origin : []
OPERATION_6 gives  : [['UNMMAPPED_forBowtie', 'P']]


OPERATION_7 string : UNMAPPED_forCARDrgi = Channel.create()
OPERATION_7 origin : []
OPERATION_7 gives  : [['UNMAPPED_forCARDrgi', 'P']]


OPERATION_8 string : MAIN_spades_out_mapping = Channel.create()
OPERATION_8 origin : []
OPERATION_8 gives  : [['MAIN_spades_out_mapping', 'P']]


OPERATION_9 string : MAIN_spades_out_card_rgi = Channel.create()
OPERATION_9 origin : []
OPERATION_9 gives  : [['MAIN_spades_out_card_rgi', 'P']]


OPERATION_10 string : UNMAPPED_out.into{ UNMMAPPED_forAssembly ; UNMMAPPED_forBowtie ; UNMAPPED_forCARDrgi}
OPERATION_10 origin : [['UNMAPPED_out', 'P']]
OPERATION_10 gives  : [['UNMMAPPED_forAssembly', 'P'], ['UNMMAPPED_forBowtie', 'P'], ['UNMAPPED_forCARDrgi', 'P']]


OPERATION_11 string : MAIN_spades_out.into{MAIN_spades_out_mapping ; MAIN_spades_out_card_rgi}
OPERATION_11 origin : [['MAIN_spades_out', 'P']]
OPERATION_11 gives  : [['MAIN_spades_out_mapping', 'P'], ['MAIN_spades_out_card_rgi', 'P']]


