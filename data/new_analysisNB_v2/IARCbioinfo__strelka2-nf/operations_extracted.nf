OPERATION_1 string : pairs = Channel.fromPath(params.input_file).splitCsv(header: true, sep: '\t', strip: true)
			.map{ row -> [ row.sample , file(params.input_folder + "/" + row.tumor), file(params.input_folder + "/" + row.tumor+ext_ind), file(params.input_folder + "/" + row.normal), file(params.input_folder + "/" + row.normal+ext_ind), 
					file(params.input_folder + "/" + row.vcf1) , file(params.input_folder + "/" + row.vcf1 + ".tbi") ,
					file(params.input_folder + "/" + row.vcf2) , file(params.input_folder + "/" + row.vcf2 + ".tbi") ]}
OPERATION_1 origin : [['params.input_file', 'A']]
OPERATION_1 gives  : [['pairs', 'P']]


OPERATION_2 string : pairs = Channel.fromPath(params.input_file).splitCsv(header: true, sep: '\t', strip: true)
  .map{ row -> [row.sample, file(params.input_folder + row.tumor), file(params.input_folder + row.tumor+ext_ind), file(params.input_folder + row.normal), 
                file(params.input_folder + row.normal+ext_ind), file(params.input_folder + row.vcf), file(params.input_folder + row.vcf+'.tbi') ] }
OPERATION_2 origin : [['params.input_file', 'A']]
OPERATION_2 gives  : [['pairs', 'P']]


OPERATION_3 string : bamFiles = Channel.fromPath(params.input_file).splitCsv(header: true, sep: '\t', strip: true)
   .map{ row -> [row.sample, file(params.input_folder + row.bam), file(params.input_folder + row.bam+ext_ind), file(params.input_folder + row.vcf), 
   file(params.input_folder + row.vcf+'.tbi') ] }
OPERATION_3 origin : [['params.input_file', 'A']]
OPERATION_3 gives  : [['bamFiles', 'P']]


OPERATION_4 string : bamFiles = Channel.fromFilePairs( params.input_folder + "/*.{${params.ext},${params.ext}${ext_ind}}",flat: true)
                       .map{row -> [row[0],row[1],row[2],file('NO_VCF'),file('NO_VCF_TBI')]}
OPERATION_4 origin : [['params.input_folder + "/*.{${params.ext},${params.ext}${ext_ind}}",flat: true', 'A']]
OPERATION_4 gives  : [['bamFiles', 'P']]


OPERATION_5 string : pairs2genotype = pairs.groupTuple(by: 0)
			      .map { row -> tuple(row[0] , row[1], row[2] , row[3][0] , row[4][0] ,  row[5],row[6],row[7],row[8]  ) }
OPERATION_5 origin : [['pairs', 'P']]
OPERATION_5 gives  : [['pairs2genotype', 'P']]


OPERATION_6 string : passfiles.into{ vcffiles1 ; vcffiles2 }
OPERATION_6 origin : [['passfiles', 'P']]
OPERATION_6 gives  : [['vcffiles1', 'P'], ['vcffiles2', 'P']]


OPERATION_7 string : vcffiles.into{ vcffiles1 ; vcffiles2 }
OPERATION_7 origin : [['vcffiles', 'P']]
OPERATION_7 gives  : [['vcffiles1', 'P'], ['vcffiles2', 'P']]


OPERATION_8 string : vcffiles.into{ vcffiles1 ; vcffiles2 }
OPERATION_8 origin : [['vcffiles', 'P']]
OPERATION_8 gives  : [['vcffiles1', 'P'], ['vcffiles2', 'P']]


