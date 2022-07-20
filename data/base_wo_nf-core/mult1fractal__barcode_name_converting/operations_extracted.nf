OPERATION_1 string : csv_ch = Channel  .fromPath( params.csv, checkIfExists: true)
                        .map { file -> tuple(file.baseName, file) }
                        .view()
OPERATION_1 origin : [['params.csv, checkIfExists: true', 'A']]
OPERATION_1 gives  : [['csv_ch', 'P']]


OPERATION_2 string : where_are_the_barcodes_ch = Channel  .fromPath( params.barcode_dir, checkIfExists: true)
                                     .view()
OPERATION_2 origin : [['params.barcode_dir, checkIfExists: true', 'A']]
OPERATION_2 gives  : [['where_are_the_barcodes_ch', 'P']]


