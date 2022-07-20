OPERATION_1 string : Channel.fromPath("$params.barcodeIDmap", type: 'file')
       .splitCsv( header: true )
       .set { barcodeIDmap }
OPERATION_1 origin : [['"$params.barcodeIDmap", type: \'file\'', 'A']]
OPERATION_1 gives  : [['barcodeIDmap', 'P']]


