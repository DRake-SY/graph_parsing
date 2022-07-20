Name : diaUmpire
Inputs : [[2, 'dda_filenames']]
Outputs : [[0, 'diaUmpireOut']]
Emits : []


Name : mgf2mzxml
Inputs : [[0, 'diaUmpireOut']]
Outputs : [[0, 'mgf2mzxmlOut']]
Emits : []


Name : msfraggerSearch
Inputs : [[1, 'mgf2mzxmlOut1']]
Outputs : [[0, 'msfraggerSearchOutPep']]
Emits : []


Name : peptideProphet
Inputs : [[0, 'msfraggerSearchOutPep'], [1, 'mgf2mzxmlOut2']]
Outputs : [[0, 'peptideProphetOut']]
Emits : []


Name : iProphet
Inputs : [[0, 'peptideProphetOut']]
Outputs : [[0, 'iProphetOut']]
Emits : []


Name : easypqpConvert
Inputs : [[0, 'iProphetOut'], [1, 'mgf2mzxmlOut3']]
Outputs : [[0, 'pepxmlConvertPsmsOut'], [1, 'pepxmlConvertPklOut']]
Emits : []


Name : easypqp
Inputs : [[0, 'pepxmlConvertPsmsOut'], [1, 'pepxmlConvertPklOut']]
Outputs : [[0, 'easypqpOut']]
Emits : []


Name : oswAssayGenerator
Inputs : [[0, 'easypqpOut']]
Outputs : [[0, 'assayGeneratorOut']]
Emits : []


Name : oswDecoyGenerator
Inputs : [[0, 'assayGeneratorOut']]
Outputs : []
Emits : []


