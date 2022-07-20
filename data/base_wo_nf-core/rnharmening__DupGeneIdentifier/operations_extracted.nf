OPERATION_1 string : Channel.fromFilePairs( params.blastFile, size: 1)
        .ifEmpty { exit 1, "Cannot find any fasta files matching: ${params.blastFile}\n" +\
            "NB: Path needs to be enclosed in quotes!\nNB: Path requires exactly one * wildcard!\n"}
        .into { file_for_db; file_for_blast }
OPERATION_1 origin : [['params.blastFile, size: 1', 'A']]
OPERATION_1 gives  : [['file_for_db', 'P'], ['file_for_blast', 'P']]


