OPERATION_1 string : Channel.fromPath("${params.preselection}", checkIfExists: true)
            .ifEmpty { exit 1, "Please provide a file containing keywords to search the SRA database" }
            .set { keyword_channel }
OPERATION_1 origin : [['"${params.preselection}", checkIfExists: true', 'A']]
OPERATION_1 gives  : [['keyword_channel', 'P']]


OPERATION_2 string : Channel.fromPath("${params.blacklist}", checkIfExists: true)
            .ifEmpty { exit 1, "No file with keywords to exclude samples from the output was specified" }
            .set { blacklist_file }
OPERATION_2 origin : [['"${params.blacklist}", checkIfExists: true', 'A']]
OPERATION_2 gives  : [['blacklist_file', 'P']]


OPERATION_3 string : Channel.fromPath("${params.classes_keywords}", checkIfExists: true)
            .ifEmpty { exit 1, "Please provide the path to the file containing the classes and keywords" }
            .set { classes_keywords_file }
OPERATION_3 origin : [['"${params.classes_keywords}", checkIfExists: true', 'A']]
OPERATION_3 gives  : [['classes_keywords_file', 'P']]


OPERATION_4 string : summary.collect { k, v -> "${k.padRight(18)}: $v" }.join("\n")
OPERATION_4 origin : [['summary', 'P']]
OPERATION_4 gives  : []


