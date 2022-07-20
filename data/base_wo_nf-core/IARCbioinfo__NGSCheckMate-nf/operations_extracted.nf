OPERATION_1 string : bam_ch = Channel.fromFilePairs("${params.input_folder}/*{$params.ext,$params.index_ext}")
                         .map { row -> tuple(row[0],"",row[1][0], row[1][1]) }
OPERATION_1 origin : [['"${params.input_folder}/*{$params.ext,$params.index_ext}"', 'A']]
OPERATION_1 gives  : [['bam_ch', 'P']]


OPERATION_2 string : bam_ch = Channel.fromPath("${params.input_file}")
			            .splitCsv(header: true, sep: '\t', strip: true)
			            .map { row -> [row.ID , row.suffix , file(row.bam), file(row.bam+params.index_ext) ] }
OPERATION_2 origin : [['"${params.input_file}"', 'A']]
OPERATION_2 gives  : [['bam_ch', 'P']]


OPERATION_3 string : bam_ch = Channel.fromPath(params.input)
			                .map { input -> tuple(input.baseName, "", input, input.parent / input.baseName + params.index_ext) }
OPERATION_3 origin : [['params.input', 'A']]
OPERATION_3 gives  : [['bam_ch', 'P']]


OPERATION_4 string : ncm_graphfiles = Channel.fromPath("$baseDir/bin/graph/*")
OPERATION_4 origin : [['"$baseDir/bin/graph/*"', 'A']]
OPERATION_4 gives  : [['ncm_graphfiles', 'P']]


OPERATION_5 string : vcf_ch4print = Channel.empty()
OPERATION_5 origin : []
OPERATION_5 gives  : [['vcf_ch4print', 'P']]


OPERATION_6 string : vcf_ch2 = Channel.empty()
OPERATION_6 origin : []
OPERATION_6 gives  : [['vcf_ch2', 'P']]


OPERATION_7 string : vcf_ch.into{ vcf_ch2; vcf_ch4print}
OPERATION_7 origin : [['vcf_ch', 'P']]
OPERATION_7 gives  : [['vcf_ch2', 'P'], ['vcf_ch4print', 'P']]


OPERATION_8 string : vcf_ch4print.collect()
            .subscribe{ row -> println "${row}" }
OPERATION_8 origin : [['vcf_ch4print', 'P']]
OPERATION_8 gives  : []


