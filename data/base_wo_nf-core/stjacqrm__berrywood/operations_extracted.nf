OPERATION_1 string : Channel
    .fromPath("${params.assemblies}/*.fasta")
    .ifEmpty { exit 1, "Cannot find any fasta assemblies in ${params.assemblies}" }
    .set { assemblies}
OPERATION_1 origin : [['"${params.assemblies}/*.fasta"', 'A']]
OPERATION_1 gives  : [['assemblies', 'P']]


OPERATION_2 string : Channel
    .fromPath("$baseDir/report/report_template.Rmd")
    .set { report }
OPERATION_2 origin : [['"$baseDir/report/report_template.Rmd"', 'A']]
OPERATION_2 gives  : [['report', 'P']]


OPERATION_3 string : Channel
    .fromPath("$baseDir/bash/create_berrywood_report.sh")
    .set { bash }
OPERATION_3 origin : [['"$baseDir/bash/create_berrywood_report.sh"', 'A']]
OPERATION_3 gives  : [['bash', 'P']]


