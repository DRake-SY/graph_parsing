OPERATION_1 string : Channel.fromPath("${params.bam_folder}/*.bam").map{ file -> tuple(file.name, file) }.set{bamChannel}
OPERATION_1 origin : [['"${params.bam_folder}/*.bam"', 'A']]
OPERATION_1 gives  : [['bamChannel', 'P']]


OPERATION_2 string : fastaChannel.map{file -> tuple (1,file[0],file[1],file[2],file[3],file[4])}
            .set{all_fa};
OPERATION_2 origin : [['fastaChannel', 'P']]
OPERATION_2 gives  : [['all_fa', 'P']]


OPERATION_3 string : completeChannel.map { file -> tuple(1,file[0],file[1]) }
               .set{all_bam};
OPERATION_3 origin : [['completeChannel', 'P']]
OPERATION_3 gives  : [['all_bam', 'P']]


OPERATION_4 string : all_fa.cross(all_bam)
      .set{all_fa_bam};
OPERATION_4 origin : [['all_fa', 'P'], ['all_bam', 'P']]
OPERATION_4 gives  : [['all_fa_bam', 'P']]


OPERATION_5 string : out.println("Congrats! The job was successful. Please find your results in $baseDir/${params.resultdir}");
OPERATION_5 origin : [['out', 'P']]
OPERATION_5 gives  : []


OPERATION_6 string : out.println("Job was not successful. Please look at the .nextflow.log file for more information on errors.");
OPERATION_6 origin : [['out', 'P']]
OPERATION_6 gives  : []


