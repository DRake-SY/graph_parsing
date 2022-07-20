OPERATION_1 string : dda_filenames = Channel
    .fromPath("$params.dda_folder/*.mzXML")
    .flatMap{ it -> "${it.baseName}".replaceAll(/_Q[0-9]/,"") }
OPERATION_1 origin : [['"$params.dda_folder/*.mzXML"', 'A']]
OPERATION_1 gives  : [['dda_filenames', 'P']]


OPERATION_2 string : mgf2mzxmlOut.into{mgf2mzxmlOut1; mgf2mzxmlOut2; mgf2mzxmlOut3}
OPERATION_2 origin : [['mgf2mzxmlOut', 'P']]
OPERATION_2 gives  : [['mgf2mzxmlOut1', 'P'], ['mgf2mzxmlOut2', 'P'], ['mgf2mzxmlOut3', 'P']]


