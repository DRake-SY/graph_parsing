Name : install_gorep
Inputs : []
Outputs : [[0, 'dir']]
Emits : []


Name : stop_gorep
Inputs : [[0, 'dir']]
Outputs : [[0, 'stopped']]
Emits : []


Name : start_gorep
Inputs : [[0, 'dir']]
Outputs : [[0, 'started']]
Emits : []


Name : update_gorep
Inputs : [[0, 'stopped']]
Outputs : []
Emits : []


Name : cosine_query
Inputs : [[0, 'started'], [1, 'a'], [2, 'b']]
Outputs : [[0, 'query']]
Emits : []


Name : similarity_query
Inputs : [[0, 'started'], [1, 'a']]
Outputs : [[0, 'query']]
Emits : []


Name : vectorize_query
Inputs : [[0, 'started'], [1, 'a']]
Outputs : [[0, 'query']]
Emits : []


