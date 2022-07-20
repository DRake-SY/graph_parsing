OPERATION_1 string : italian = Channel.from 'Ciao'
OPERATION_1 origin : []
OPERATION_1 gives  : [['italian', 'P']]


OPERATION_2 string : french = Channel.from 'Bonjour'
OPERATION_2 origin : []
OPERATION_2 gives  : [['french', 'P']]


OPERATION_3 string : english = Channel.from 'Hello'
OPERATION_3 origin : []
OPERATION_3 gives  : [['english', 'P']]


OPERATION_4 string : spanish = Channel.from 'Hola'
OPERATION_4 origin : []
OPERATION_4 gives  : [['spanish', 'P']]


OPERATION_5 string : start = Channel.fromPath 'Welcome.txt'
OPERATION_5 origin : []
OPERATION_5 gives  : [['start', 'P']]


OPERATION_6 string : english_ch.subscribe { file ->
  Files.copy(Paths.get(file.toString()), Paths.get(final_output_file))
}
OPERATION_6 origin : [['english_ch', 'P']]
OPERATION_6 gives  : []


