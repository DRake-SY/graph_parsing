OPERATION_1 string : Channel.fromPath(params.i1, type: 'file')
.buffer(size:1)
.set{
    input1;
}
OPERATION_1 origin : [["params.i1, type: 'file'", 'A']]
OPERATION_1 gives  : []


OPERATION_2 string : Channel.fromPath(params.i2, type: 'file')
.buffer(size:1)
.set{
    input2;
}
OPERATION_2 origin : [["params.i2, type: 'file'", 'A']]
OPERATION_2 gives  : []


