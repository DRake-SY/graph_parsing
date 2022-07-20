OPERATION_1 string : vcfs = Channel.fromPath( params.table_folder+'*.vcf')
                 .ifEmpty { error "empty table folder, please verify your input." }
OPERATION_1 origin : [["params.table_folder+'*.vcf'", 'A']]
OPERATION_1 gives  : [['vcfs', 'P']]


OPERATION_2 string : output_avinput.subscribe { println "avinput: ${params.out_folder}/${it.baseName}.avinput" }
OPERATION_2 origin : [['output_avinput', 'P']]
OPERATION_2 gives  : []


OPERATION_3 string : output_annovar.subscribe { println "annotation: ${params.out_folder}/${it.baseName}.txt" }
OPERATION_3 origin : [['output_annovar', 'P']]
OPERATION_3 gives  : []


