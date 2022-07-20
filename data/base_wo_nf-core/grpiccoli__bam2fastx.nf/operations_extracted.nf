OPERATION_1 string : Channel.fromPath("$params.i_bam", type: 'file')
.buffer(size:1)
.set{
    refbam;
}
OPERATION_1 origin : [['"$params.i_bam", type: \'file\'', 'A']]
OPERATION_1 gives  : []


