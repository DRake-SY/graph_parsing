OPERATION_1 string : Channel
    .fromPath(params.input)
    .splitCsv(header:true, sep:'\t', quote:'"')
    .map{ row-> tuple(row.sample_id, file(row.read_1), file(row.read_2)) }
    .set { samples_tetyper_ch; }
OPERATION_1 origin : [['params.input', 'A']]
OPERATION_1 gives  : []


OPERATION_2 string : Channel
    .fromPath(params.ref)
    .first()
    .set { ref_ch }
OPERATION_2 origin : [['params.ref', 'A']]
OPERATION_2 gives  : [['ref_ch', 'P']]


OPERATION_3 string : Channel
    .fromPath(params.snp_profiles)
    .first()
    .set { snp_profiles_ch }
OPERATION_3 origin : [['params.snp_profiles', 'A']]
OPERATION_3 gives  : [['snp_profiles_ch', 'P']]


OPERATION_4 string : Channel
    .fromPath(params.struct_profiles)
    .first()
    .set { struct_profiles_ch }
OPERATION_4 origin : [['params.struct_profiles', 'A']]
OPERATION_4 gives  : [['struct_profiles_ch', 'P']]


OPERATION_5 string : tetyper_summary_ch.collectFile(name: "summary.txt", storeDir: "${params.outdir}", keepHeader: true, sort: true)
OPERATION_5 origin : [['tetyper_summary_ch', 'P']]
OPERATION_5 gives  : []


