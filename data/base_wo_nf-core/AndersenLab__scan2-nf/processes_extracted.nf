Name : scan2
Inputs : [[0, 'riails']]
Outputs : [[0, 'scan2_object'], [1, 'crossobj']]
Emits : []


Name : scan2000
Inputs : [[0, 'crossobj_split']]
Outputs : [[0, 'scan2000']]
Emits : []


Name : concatenate_quantiles
Inputs : [[0, 'scan2000']]
Outputs : [[0, 'perms']]
Emits : []


Name : summarize_scan2
Inputs : [[0, 'perms'], [1, 'scan2_object']]
Outputs : []
Emits : []


