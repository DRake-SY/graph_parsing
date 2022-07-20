OPERATION_1 string : Channel.from(params.sampleCsv, checkIfExists: true)){
  exit 1, "Please include --sampleCsv, see --help for format"
}

if(!Channel.from(params.runID, checkIfExists: true)){
    exit 1, "Please include --runID <your_runID>"
}

if(!Channel.from(params.refDir, checkIfExists: true)){
  exit 1, "Please include --refDir <path> see github.com/brucemoran/somatic_n-of-1/ for how to run download-references.nf"
}

if(!Channel.from(params.assembly, checkIfExists: true)){
    exit 1, "Please include --assembly <GRCh3x>"
}

if(!params.email){
    exit 1, "Please include --email your@email.com"
}

         
params.outDir = "batch_${params.seqLevel}"
params.seqlevel = "${params.seqLevel}".toLowerCase()

                                             
javaTaskmem = { it.replace(" GB", "g") }

                                                         
reference = [
    grchvers: false,
    fa: false,
    fai: false,
    dict: false,
    bwa: false,
    hc_dbs: false,
    dbsnp: false,
    gridss: false,
    pcgrbase: false,
    intlist: false,
    seqlevel: false,
    bbres: false
]

reference.grchvers  = Channel.fromPath("${params.refDir}/${params.assembly}/pcgr/data/*", type
OPERATION_1 origin : []
OPERATION_1 gives  : []


OPERATION_2 string : fa = Channel.value(file(params.genomes[params.assembly].fa))
OPERATION_2 origin : []
OPERATION_2 gives  : [['fa', 'P']]


OPERATION_3 string : fai = Channel.value(file(params.genomes[params.assembly].fai))
OPERATION_3 origin : []
OPERATION_3 gives  : [['fai', 'P']]


OPERATION_4 string : dict = Channel.value(file(params.genomes[params.assembly].dict))
OPERATION_4 origin : []
OPERATION_4 gives  : [['dict', 'P']]


OPERATION_5 string : bwa = Channel.value(file(params.genomes[params.assembly].bwa))
OPERATION_5 origin : []
OPERATION_5 gives  : [['bwa', 'P']]


OPERATION_6 string : hc_dbs = Channel.value(file(params.genomes[params.assembly].hc_dbs))
OPERATION_6 origin : []
OPERATION_6 gives  : [['hc_dbs', 'P']]


OPERATION_7 string : dbsnp = Channel.value(file(params.genomes[params.assembly].dbsnp))
OPERATION_7 origin : []
OPERATION_7 gives  : [['dbsnp', 'P']]


OPERATION_8 string : gridss = Channel.value(file(params.genomes[params.assembly].gridss))
OPERATION_8 origin : []
OPERATION_8 gives  : [['gridss', 'P']]


OPERATION_9 string : pcgrbase = Channel.value(file(params.genomes[params.assembly].pcgr))
OPERATION_9 origin : []
OPERATION_9 gives  : [['pcgrbase', 'P']]


OPERATION_10 string : seqlevel = Channel.value(file(params.genomes[params.assembly]."${params.seqlevel}"))
OPERATION_10 origin : []
OPERATION_10 gives  : [['seqlevel', 'P']]


OPERATION_11 string : cosmic = Channel.value(file(params.genomes[params.assembly].cosmic))
OPERATION_11 origin : []
OPERATION_11 gives  : [['cosmic', 'P']]


OPERATION_12 string : intlist = Channel.fromPath("${params.refDir}/${params.assembly}/${params.seqlevel}/wgs.bed.interval_list").getVal()
OPERATION_12 origin : [['"${params.refDir}/${params.assembly}/${params.seqlevel}/wgs.bed.interval_list"', 'A']]
OPERATION_12 gives  : [['intlist', 'P']]


OPERATION_13 string : intlist = Channel.fromPath("${params.refDir}/${params.assembly}/${params.seqlevel}/${params.exomeTag}.bed.interval_list").getVal()
OPERATION_13 origin : [['"${params.refDir}/${params.assembly}/${params.seqlevel}/${params.exomeTag}.bed.interval_list"', 'A']]
OPERATION_13 gives  : [['intlist', 'P']]


OPERATION_14 string : Channel.fromPath("$params.sampleCsv", type: 'file')
       .splitCsv( header: true )
       .map { row -> [row.caseID, row.soma_sampleID, file(row.soma_read1), file(row.soma_read2), row.germ_sampleID, file(row.germ_read1), file(row.germ_read2)] }
       .set { split_soma_germ }
OPERATION_14 origin : [['"$params.sampleCsv", type: \'file\'', 'A']]
OPERATION_14 gives  : [['split_soma_germ', 'P']]


OPERATION_15 string : splitcsv2.splitCsv( header: true )
         .map { row -> [row.caseID, row.type, row.sampleID, file(row.read1), file(row.read2)] }
         .set { bbduking }
OPERATION_15 origin : [['splitcsv2', 'P']]
OPERATION_15 gives  : [['bbduking', 'P']]


OPERATION_16 string : hcbedding = hc_bedding.flatten()
OPERATION_16 origin : [['hc_bedding', 'P']]
OPERATION_16 gives  : [['hcbedding', 'P']]


OPERATION_17 string : hc_germ
  .map { it -> [it[0],it[1],it[2],it[3],it[4]] }
  .combine(hcbedding)
  .set { hcgermbedding }
OPERATION_17 origin : [['hc_germ', 'P'], ['hcbedding', 'P']]
OPERATION_17 gives  : [['hcgermbedding', 'P']]


OPERATION_18 string : hc_gt
  .groupTuple()
  .map { it -> tuple(it[0], it[1][0], it[2][0..-1].flatten()) }
  .set { hc_fm }
OPERATION_18 origin : [['hc_gt', 'P']]
OPERATION_18 gives  : [['hc_fm', 'P']]


OPERATION_19 string : germfiltering
    .branch(germfilter)
    .set { somagerm }
OPERATION_19 origin : [['germfiltering', 'P']]
OPERATION_19 gives  : [['somagerm', 'P']]


OPERATION_20 string : somafiltered
    .map { [it[0], it[2..-1]] }
    .tap { somatap }
OPERATION_20 origin : [['somafiltered', 'P']]
OPERATION_20 gives  : [['somatap', 'P']]


OPERATION_21 string : germfiltered
    .map { [it[0], it[2..-1]] }
    .tap { germtap }
OPERATION_21 origin : [['germfiltered', 'P']]
OPERATION_21 gives  : [['germtap', 'P']]


OPERATION_22 string : somatap.join(germtap).tap{ somagermtap }
OPERATION_22 origin : [['somatap', 'P'], ['germtap', 'P']]
OPERATION_22 gives  : [['somagermtap', 'P']]


OPERATION_23 string : somagermtap
    .map { it -> tuple(it[0],
                       it[1][0],
                       it[1][1..2],
                       it[2][0],
                       it[2][1..2]).flatten() }
    .into { mutect2somaticing; mutect2_contam; facetsomaing; mantastrelka2ing; lanceting }
OPERATION_23 origin : [['somagermtap', 'P']]
OPERATION_23 gives  : [['mutect2somaticing', 'P'], ['mutect2_contam', 'P'], ['facetsomaing', 'P'], ['mantastrelka2ing', 'P'], ['lanceting', 'P']]


OPERATION_24 string : mutect2bedding = mutect2_bedding.flatten()
OPERATION_24 origin : [['mutect2_bedding', 'P']]
OPERATION_24 gives  : [['mutect2bedding', 'P']]


OPERATION_25 string : mutect2somaticing
  .map { it -> [it[0],it[1],it[2],it[3],it[4],it[5],it[6]]}
  .combine(mutect2bedding)
  .set { mutect2somaticbedding }
OPERATION_25 origin : [['mutect2somaticing', 'P'], ['mutect2bedding', 'P']]
OPERATION_25 gives  : [['mutect2somaticbedding', 'P']]


OPERATION_26 string : mutect2_gt
  .groupTuple()
  .map { it -> tuple(it[0], it[1][0], it[2][0..-1].flatten()) }
  .set { mutect2_fm }
OPERATION_26 origin : [['mutect2_gt', 'P']]
OPERATION_26 gives  : [['mutect2_fm', 'P']]


OPERATION_27 string : mutect2_st
  .groupTuple()
  .map { it -> tuple(it[0], it[1][0], it[2][0..-1].flatten()) }
  .set { mutect2_sm }
OPERATION_27 origin : [['mutect2_st', 'P']]
OPERATION_27 gives  : [['mutect2_sm', 'P']]


OPERATION_28 string : mutect2_f1r2.groupTuple()
            .map { it -> [it[0], it[1][0], it[2..-1].flatten()] }
            .set { mutect2_f1r2_set }PROCESS DEF mutct2_f1r2_comb
OPERATION_28 origin : [['mutect2_f1r2', 'P']]
OPERATION_28 gives  : [['mutect2_f1r2_set', 'P']]


OPERATION_29 string : mutect2_contam
  .join(mutect2_merge)    
  .join(mutect2_stats)    
  .join(mutect2_f1r2_comb)    
  .groupTuple()
  .map { it -> [it[0], it[1][0], it[2][0], it[3][0], it[4][0], it[5][0], it[6][0], it[8][0], it[10][0], it[12][0]].flatten() }
  .set { mutect2_contam_merge }
OPERATION_29 origin : [['mutect2_contam', 'P'], ['mutect2_merge', 'P'], ['mutect2_stats', 'P'], ['mutect2_f1r2_comb', 'P']]
OPERATION_29 gives  : [['mutect2_contam_merge', 'P']]


OPERATION_30 string : lancetbedding = lancet_bedding.flatten()
OPERATION_30 origin : [['lancet_bedding', 'P']]
OPERATION_30 gives  : [['lancetbedding', 'P']]


OPERATION_31 string : lanceting
  .map { it -> [it[0],it[1],it[2],it[3],it[4],it[5],it[6]]}
  .combine(lancetbedding)
  .set { lancetsbedding }
OPERATION_31 origin : [['lanceting', 'P'], ['lancetbedding', 'P']]
OPERATION_31 gives  : [['lancetsbedding', 'P']]


OPERATION_32 string : lancet_gt
  .groupTuple()
  .map { it -> tuple(it[0], it[1][0], it[2][0..-1].flatten()) }
  .set { lancet_fm }
OPERATION_32 origin : [['lancet_gt', 'P']]
OPERATION_32 gives  : [['lancet_fm', 'P']]


OPERATION_33 string : lancet_veping
  .join( mutect2_veping )
  .join( strelka2_veping )
  .groupTuple()
  .map { it -> [it[0], it[1][0], it[2][0], it[3][0]].flatten() }
  .set { case_veping }
OPERATION_33 origin : [['lancet_veping', 'P'], ['mutect2_veping', 'P'], ['strelka2_veping', 'P']]
OPERATION_33 gives  : [['case_veping', 'P']]


OPERATION_34 string : runGRanges
  .join(mutect2_rawVcf)
  .join(strelka2_rawVcf)
  .join(lancet_rawVcf)
  .groupTuple()
  .map { it -> [it[0], it[1][0], it[1][1], it[1][2], it[2], it[3], it[4]] }
  .set { cons_vcfs }
OPERATION_34 origin : [['runGRanges', 'P'], ['mutect2_rawVcf', 'P'], ['strelka2_rawVcf', 'P'], ['lancet_rawVcf', 'P']]
OPERATION_34 gives  : [['cons_vcfs', 'P']]


OPERATION_35 string : snvpass_pcgr
  .join(facets_pcgr)
  .set { pcgr_inputs }
OPERATION_35 origin : [['snvpass_pcgr', 'P'], ['facets_pcgr', 'P']]
OPERATION_35 gives  : [['pcgr_inputs', 'P']]


