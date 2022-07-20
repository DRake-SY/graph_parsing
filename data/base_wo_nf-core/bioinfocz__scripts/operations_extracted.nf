OPERATION_1 string : samples = Channel
                    .fromPath(p.sample_file)
                    .splitText()
                    .map({it.trim()})
OPERATION_1 origin : [['p.sample_file', 'A']]
OPERATION_1 gives  : [['samples', 'P']]


OPERATION_2 string : samples = Channel
                .fromPath(p.sample_file)
                .splitCsv(sep: p.field_sep, header: true)
                .map({it[p.sra_col]})
OPERATION_2 origin : [['p.sample_file', 'A']]
OPERATION_2 gives  : [['samples', 'P']]


OPERATION_3 string : download_info.subscribe({println "Downloaded: $it"})
OPERATION_3 origin : [['download_info', 'P']]
OPERATION_3 gives  : []


OPERATION_4 string : fastq_dump_echo.subscribe({println "fastq-dump:\n$it"})
OPERATION_4 origin : [['fastq_dump_echo', 'P']]
OPERATION_4 gives  : []


OPERATION_5 string : print_help_stdout.subscribe({println it})
OPERATION_5 origin : [['print_help_stdout', 'P']]
OPERATION_5 gives  : []


