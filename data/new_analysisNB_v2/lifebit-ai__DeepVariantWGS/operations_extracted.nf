OPERATION_1 string : Channel.fromFilePairs("${params.bam_folder}/${params.bam_file_prefix}*.{bam,bam.bai}").set{bamChannel}
OPERATION_1 origin : [['"${params.bam_folder}/${params.bam_file_prefix}*.{bam,bam.bai}"', 'A']]
OPERATION_1 gives  : [['bamChannel', 'P']]


OPERATION_2 string : Channel.fromPath("${params.bam_folder}/${params.bam_file_prefix}*.bam").map{ file -> tuple(file.name, file) }.set{bamChannel}
OPERATION_2 origin : [['"${params.bam_folder}/${params.bam_file_prefix}*.bam"', 'A']]
OPERATION_2 gives  : [['bamChannel', 'P']]


OPERATION_3 string : out.println(" --fasta \"/path/to/your/genome\"  params is required and was not found! ");
OPERATION_3 origin : [['out', 'P']]
OPERATION_3 gives  : []


OPERATION_4 string : out.println(" or you can use standard genome versions by typing --hg19 or --h38 ");
OPERATION_4 origin : [['out', 'P']]
OPERATION_4 gives  : []


OPERATION_5 string : fastaChannel.map{file -> tuple (1,file[0],file[1],file[2],file[3],file[4])}
            .set{all_fa};
OPERATION_5 origin : [['fastaChannel', 'P']]
OPERATION_5 gives  : [['all_fa', 'P']]


OPERATION_6 string : completeChannel.map { file -> tuple(1,file[0],file[1]) }
               .set{all_bam};
OPERATION_6 origin : [['completeChannel', 'P']]
OPERATION_6 gives  : [['all_bam', 'P']]


OPERATION_7 string : all_fa.cross(all_bam)
      .set{all_fa_bam};
OPERATION_7 origin : [['all_fa', 'P'], ['all_bam', 'P']]
OPERATION_7 gives  : [['all_fa_bam', 'P']]


