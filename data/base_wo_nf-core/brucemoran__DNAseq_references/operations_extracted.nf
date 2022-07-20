OPERATION_1 string : Channel.from("Please only specify --exomebedurl or --exomebedfile!\nN.B. that subsquent runs using -resume can be used to add further -exomebedurl or --exomebedfile").println { it }
OPERATION_1 origin : []
OPERATION_1 gives  : []


OPERATION_2 string : Channel.fromPath("${params.exomebedfile}").set { exomebed_file }
OPERATION_2 origin : [['"${params.exomebedfile}"', 'A']]
OPERATION_2 gives  : [['exomebed_file', 'P']]


OPERATION_3 string : wgs_tabix.concat(exome_tabix).set { bint_tabix }PROCESS DEF tabix_files
OPERATION_3 origin : [['wgs_tabix', 'P'], ['exome_tabix', 'P']]
OPERATION_3 gives  : [['bint_tabix', 'P']]


