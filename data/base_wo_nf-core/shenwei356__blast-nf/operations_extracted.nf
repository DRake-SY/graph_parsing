OPERATION_1 string : Channel
    .from(args)
    .filter {file(it).exists()}
    .ifEmpty {exit 1, "query file not exist: " + args.join(", ")}
    .map {file(it)}
    .set {queryFiles}
OPERATION_1 origin : [['args', 'V']]
OPERATION_1 gives  : [['queryFiles', 'P']]


OPERATION_2 string : program. (default: blastn).
OPERATION_2 origin : [['program', 'P']]
OPERATION_2 gives  : []


OPERATION_3 string : all. (default: 0)
OPERATION_3 origin : [['all', 'P']]
OPERATION_3 gives  : []


OPERATION_4 string : directory. (default: ".")
OPERATION_4 origin : [['directory', 'P']]
OPERATION_4 gives  : []


