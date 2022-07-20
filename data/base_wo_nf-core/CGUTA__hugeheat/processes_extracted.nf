Name : compile
Inputs : [[0, '"https://github']]
Outputs : [[0, 'binary']]
Emits : []


Name : box_sampling_into_long
Inputs : [[0, 'raw_file'], [1, 'binary']]
Outputs : [[0, 'to_normalize']]
Emits : []


Name : normalization_colorization
Inputs : [[0, 'to_normalize']]
Outputs : [[0, 'to_heat']]
Emits : []


Name : compile_display
Inputs : [[0, '"https://github']]
Outputs : [[0, 'binary_display']]
Emits : []


Name : render_to_png
Inputs : [[0, 'to_heat'], [1, 'binary_display']]
Outputs : [[0, 'out']]
Emits : []


