OPERATION_1 string : Channel.fromPath("${params.bam_folder}/${params.bam_file_prefix}*.bam").map{ file -> tuple(file.name, file) }.set{bamChannel}
OPERATION_1 origin : [['"${params.bam_folder}/${params.bam_file_prefix}*.bam"', 'A']]
OPERATION_1 gives  : [['bamChannel', 'P']]


OPERATION_2 string : out.println(" --fasta \"/path/to/your/genome\"  params is required and was not found! ");
OPERATION_2 origin : [['out', 'P']]
OPERATION_2 gives  : []


OPERATION_3 string : out.println(" or you can use standard genome versions by typing --hg19 or --h38 ");
OPERATION_3 origin : [['out', 'P']]
OPERATION_3 gives  : []


OPERATION_4 string : fastaChannel.map{file -> tuple (1,file[0],file[1],file[2],file[3],file[4],file[5])}
              .set{all_fa};
OPERATION_4 origin : [['fastaChannel', 'P']]
OPERATION_4 gives  : [['all_fa', 'P']]


OPERATION_5 string : completeChannel.map { file -> tuple(1,file[0],file[1]) }
                 .set{all_bam};
OPERATION_5 origin : [['completeChannel', 'P']]
OPERATION_5 gives  : [['all_bam', 'P']]


OPERATION_6 string : all_fa.cross(all_bam)
        .set{all_fa_bam};
OPERATION_6 origin : [['all_fa', 'P'], ['all_bam', 'P']]
OPERATION_6 gives  : [['all_fa_bam', 'P']]


