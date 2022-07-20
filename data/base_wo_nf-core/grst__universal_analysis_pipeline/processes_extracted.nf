Name : generate_data
Inputs : []
Outputs : [[0, 'generate_data_csv'], [1, 'generate_data_html']]
Emits : []


Name : visualize_data
Inputs : [[1, 'generate_data_csv']]
Outputs : [[0, 'visualize_data_html']]
Emits : []


Name : deploy
Inputs : [[0, 'generate_data_html'], [0, 'visualize_data_html']]
Outputs : []
Emits : []


