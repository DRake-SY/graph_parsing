Name : nlp_standard_preprocessing
Inputs : [[0, 'abstract_input_ch']]
Outputs : [[0, 'nlp_standard_preprocessing_output_folder_ch']]
Emits : []


Name : debbie_umls_annotation
Inputs : [[0, 'nlp_standard_preprocessing_output_folder_ch']]
Outputs : [[0, 'umls_output_folder_ch']]
Emits : []


Name : debbie_dictionary_annotation
Inputs : [[0, 'umls_output_folder_ch']]
Outputs : [[0, 'debbie_dictionaries_output_folder_ch']]
Emits : []


