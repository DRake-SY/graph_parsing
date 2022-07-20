OPERATION_1 string : bam_bai_files = Channel.fromFilePairs("${params.input_folder}/*.{bam,bai}") { file -> file.name.replaceAll(/.bam|.bai$/,'') }
			   .map { row -> tuple(row[1][0], row[1][1]) }
OPERATION_1 origin : [['"${params.input_folder}/*.{bam,bai}"', 'A']]
OPERATION_1 gives  : [['bam_bai_files', 'P']]


