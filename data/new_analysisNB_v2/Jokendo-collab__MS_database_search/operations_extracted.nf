OPERATION_1 string : mgf_files, mgf_files_msgf = Channel.fromPath("${params.raw_dir}/*.mgf").into(2)
OPERATION_1 origin : [['"${params.raw_dir}/*.mgf"', 'A']]
OPERATION_1 gives  : [['mgf_files', 'P'], ['mgf_files_msgf', 'P']]


OPERATION_2 string : mgf_keys1, mgf_keys2 = Channel.fromPath("${params.raw_dir}/*.mgf").map { file ->
		(whole_name, index) = (file =~ /.*\/(.*)\.mgf/)[0]
		[index, file]
	}.into(2)
OPERATION_2 origin : [['"${params.raw_dir}/*.mgf"', 'A']]
OPERATION_2 gives  : [['mgf_keys1', 'P'], ['mgf_keys2', 'P']]


OPERATION_3 string : annotated_mgf = Channel.create()
OPERATION_3 origin : []
OPERATION_3 gives  : [['annotated_mgf', 'P']]


OPERATION_4 string : xtandem_combined = xtandem_result.map { file ->
		(whole_name, index) = (file =~ /.*\/(.*)\.mgf\.xml\.mzid/)[0]
		[index, file]
	}.combine(mgf_keys1, by: 0)
OPERATION_4 origin : [['xtandem_result', 'P']]
OPERATION_4 gives  : [['xtandem_combined', 'P']]


OPERATION_5 string : msgf_combined = msgf_result.map { file ->
		(whole_name, index) = (file =~ /.*\/(.*)\.mzid/)[0]
		[index, file]
	}.combine(mgf_keys2, by: 0)
OPERATION_5 origin : [['msgf_result', 'P']]
OPERATION_5 gives  : [['msgf_combined', 'P']]


OPERATION_6 string : msgf_annotated.toList()
OPERATION_6 origin : [['msgf_annotated', 'P']]
OPERATION_6 gives  : []


OPERATION_7 string : xtandem_annotated.toList()
OPERATION_7 origin : [['xtandem_annotated', 'P']]
OPERATION_7 gives  : []


OPERATION_8 string : annotated_mgf.close()
OPERATION_8 origin : [['annotated_mgf', 'P']]
OPERATION_8 gives  : []


