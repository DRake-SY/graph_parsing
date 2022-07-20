OPERATION_1 string : svcfs = channel.empty()
OPERATION_1 origin : []
OPERATION_1 gives  : [['svcfs', 'P']]


OPERATION_2 string : ref_fasta = Channel.value(file(params.ref)).ifEmpty{exit 1, "reference file not found: ${params.ref}"}
OPERATION_2 origin : []
OPERATION_2 gives  : [['ref_fasta', 'P']]


OPERATION_3 string : ref_dict = Channel.value(file(params.ref_dict)).ifEmpty{exit 1, "Dict reference file not found: ${params.ref_dict}"}
OPERATION_3 origin : []
OPERATION_3 gives  : [['ref_dict', 'P']]


OPERATION_4 string : ref_fai = Channel.value(file(params.ref+'.fai')).ifEmpty{exit 1, "index file not found: ${params.ref}.fai"}
OPERATION_4 origin : []
OPERATION_4 gives  : [['ref_fai', 'P']]


OPERATION_5 string : tn_pairs.into { tn_pairs_cobalt; tn_pairs_amber}
OPERATION_5 origin : [['tn_pairs', 'P']]
OPERATION_5 gives  : [['tn_pairs_cobalt', 'P'], ['tn_pairs_amber', 'P']]


OPERATION_6 string : amber_cobalt = amber.join(cobalt, remainder: true)
OPERATION_6 origin : [['amber', 'P']]
OPERATION_6 gives  : [['amber_cobalt', 'P']]


OPERATION_7 string : amber_cobalt_vcf = amber_cobalt.join(hc_vcfs,remainder:true)
OPERATION_7 origin : [['amber_cobalt', 'P']]
OPERATION_7 gives  : [['amber_cobalt_vcf', 'P']]


OPERATION_8 string : amber_cobalt_vcf = amber_cobalt.spread([vcf_dump])
OPERATION_8 origin : [['amber_cobalt', 'P'], ['[vcf_dump]', 'V']]
OPERATION_8 gives  : [['amber_cobalt_vcf', 'P']]


OPERATION_9 string : stats_purple.collectFile(name: 'purple_summary.txt', storeDir: params.output_folder, seed: 'tumor_id\tpurity\tnormFactor\tscore\tdiploidProportion\tploidy\tgender\tstatus\tpolyclonalProportion\tminPurity\tmaxPurity\tminPloidy\tmaxPloidy\tminDiploidProportion\tmaxDiploidProportion\tversion\tsomaticPenalty\twholeGenomeDuplication\tmsIndelsPerMb\tmsStatus\ttml\ttmlStatus\ttmbPerMb\ttmbStatus\tsvTumorMutationalBurden\n', newLine: false, skip: 1)
OPERATION_9 origin : [['stats_purple', 'P']]
OPERATION_9 gives  : []


