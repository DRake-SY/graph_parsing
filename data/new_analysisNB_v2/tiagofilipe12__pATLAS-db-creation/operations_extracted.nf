OPERATION_1 string : IN_db_name = Channel.value(params.db_name)
OPERATION_1 origin : [['params.db_name', 'V']]
OPERATION_1 gives  : [['IN_db_name', 'P']]


OPERATION_2 string : IN_sequences_removal = Channel.value("--search-sequences-to-remove")
OPERATION_2 origin : [['"--search-sequences-to-remove"', 'V']]
OPERATION_2 gives  : [['IN_sequences_removal', 'P']]


OPERATION_3 string : IN_sequences_removal = Channel.value("")
OPERATION_3 origin : [['""', 'V']]
OPERATION_3 gives  : [['IN_sequences_removal', 'P']]


