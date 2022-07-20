OPERATION_1 string : Channel
    .fromPath(params.samples)
    .splitText()
    .map { it -> it.trim() }
    .set { samples_ch }
OPERATION_1 origin : [['params.samples', 'A']]
OPERATION_1 gives  : [['samples_ch', 'P']]


OPERATION_2 string : Channel
    .fromPath(params.scaffolds)
    .splitText()
    .map { it -> it.trim() } 
    .into { scaffolds_bamcaller_ch
            scaffolds_multihet_ch
            }
OPERATION_2 origin : [['params.scaffolds', 'A']]
OPERATION_2 gives  : []


OPERATION_3 string : Channel
    .fromFilePairs(params.bam)
    .set { bamfiles_ch }
OPERATION_3 origin : [['params.bam', 'A']]
OPERATION_3 gives  : [['bamfiles_ch', 'P']]


OPERATION_4 string : Channel
    .fromPath(params.mask_genome)
    .map { file ->
        def scaffold = (file.toString() =~ /(NC|NW)_\d+\.1/)[0][0]
        return tuple(scaffold, file) }
    .combine(samples_ch)
    .map { it -> [ it[2], it[0], it[1] ] }
    .set { mask_genome_ch }
OPERATION_4 origin : [['samples_ch', 'P'], ['params.mask_genome', 'A']]
OPERATION_4 gives  : [['mask_genome_ch', 'P']]


OPERATION_5 string : mask_indiv
    .join(vcf_bamcalled, by: [0,1])
    .join(mask_genome_ch, by: [0,1])
    .map { it -> [ it[0], it[1], it[2], it[4], it[3] ] }
    .set { multihet_in }
OPERATION_5 origin : [['mask_indiv', 'P']]
OPERATION_5 gives  : [['multihet_in', 'P']]


