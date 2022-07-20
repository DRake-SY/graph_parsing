OPERATION_1 string : Channel.fromPath("${params.input_file}")
			.splitCsv(header: true, sep: '\t', strip: true)
			.map { row -> [row.SM , "_"+row.RG , file(row.pair1), file(row.pair2) ] }
      .into{readPairs0;readPairs4group}
OPERATION_1 origin : [['"${params.input_file}"', 'A']]
OPERATION_1 gives  : [['readPairs0', 'P'], ['readPairs4group', 'P']]


OPERATION_2 string : readPairs = Channel.fromFilePairs(params.input_folder +"/*{${params.suffix1},${params.suffix2}}" +'.'+ params.fastq_ext)
			   .map { row -> [ row[0] , 1 , "" , row[1][0], row[1][1] ] }
OPERATION_2 origin : [['params.input_folder +"/*{${params.suffix1},${params.suffix2}}" +\'.\'+ params.fastq_ext', 'A']]
OPERATION_2 gives  : [['readPairs', 'P']]


OPERATION_3 string : files = Channel.fromPath( params.input_folder+'/*.bam' )
OPERATION_3 origin : [["params.input_folder+'/*.bam'", 'A']]
OPERATION_3 gives  : [['files', 'P']]


OPERATION_4 string : recal_table_files = Channel.from ( 'NOFILE1', 'NOFILE2' )
OPERATION_4 origin : [["'NOFILE1', 'NOFILE2'", 'V']]
OPERATION_4 gives  : [['recal_table_files', 'P']]


OPERATION_5 string : readPairsgrouped = readPairs4group.groupTuple(by: 0)
	                                 .map{ a -> [a[0],a[1].size(),a[1],a[2],a[3]] }
OPERATION_5 origin : [['readPairs4group', 'P']]
OPERATION_5 gives  : [['readPairsgrouped', 'P']]


OPERATION_6 string : readPairs = readPairsgrouped.map{ a -> [a[0],a[1]] }
                            .cross( readPairs0 )
                            .map{a -> [a[1][0],a[0][1],a[1][1],a[1][2],a[1][3] ] }
OPERATION_6 origin : [['readPairsgrouped', 'P'], ['readPairs0', 'P']]
OPERATION_6 gives  : [['readPairs', 'P']]


OPERATION_7 string : bam_bai_files0.into{bam_bai_2group;bam_bai_files2filter}
OPERATION_7 origin : [['bam_bai_files0', 'P']]
OPERATION_7 gives  : [['bam_bai_2group', 'P'], ['bam_bai_files2filter', 'P']]


OPERATION_8 string : bam_bai_grouped4merge = bam_bai_2group.groupTuple(by: 0)
	                                      .map{ a -> [a[0],a[2].size(),a[2],a[3],a[4]] }
OPERATION_8 origin : [['bam_bai_2group', 'P']]
OPERATION_8 gives  : [['bam_bai_grouped4merge', 'P']]


OPERATION_9 string : bam_bai_files2filter.filter { a -> a[1] > 1  }
                      .set{mult2QC}
OPERATION_9 origin : [['bam_bai_files2filter', 'P']]
OPERATION_9 gives  : [['mult2QC', 'P']]


OPERATION_10 string : final_bam_bai_files = bam_bai_files
OPERATION_10 origin : [['bam_bai_files', 'P']]
OPERATION_10 gives  : [['final_bam_bai_files', 'P']]


