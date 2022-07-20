OPERATION_1 string : Channel.fromPath( file(params.ref_fa) )
.into{ ref_fa;
    ref_fa2
}
OPERATION_1 origin : [['file(params.ref_fa', 'A']]
OPERATION_1 gives  : [['ref_fa', 'P'], ['ref_fa2', 'P']]


OPERATION_2 string : Channel.fromPath( file(params.ref_fai) )
.into{ ref_fai;
ref_fai2
}
OPERATION_2 origin : [['file(params.ref_fai', 'A']]
OPERATION_2 gives  : [['ref_fai', 'P'], ['ref_fai2', 'P']]


OPERATION_3 string : Channel.fromPath( file(params.ref_dict) )
.into{ ref_dict;
    ref_dict2
}
OPERATION_3 origin : [['file(params.ref_dict', 'A']]
OPERATION_3 gives  : [['ref_dict', 'P'], ['ref_dict2', 'P']]


OPERATION_4 string : Channel.fromPath("variants/**.vcf").map { item ->
    def sampleID = "${item.getName()}".replaceFirst(/.vcf$/, "")
    return([sampleID, item])
}.set { input_vcfs }
OPERATION_4 origin : [['"variants/**.vcf"', 'A']]
OPERATION_4 gives  : [['input_vcfs', 'P']]


OPERATION_5 string : vep_ref_dir.map{ item ->
    def assembly = "GRCh37"
    return([item, assembly])
}.set{ vep_ref_dir_assembly }
OPERATION_5 origin : [['vep_ref_dir', 'P']]
OPERATION_5 gives  : [['vep_ref_dir_assembly', 'P']]


OPERATION_6 string : vep_tsvs.collectFile(name: "annotations.tsv", keepHeader: true, storeDir: "${params.outputDir}")
OPERATION_6 origin : [['vep_tsvs', 'P']]
OPERATION_6 gives  : []


