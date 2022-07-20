Name : gzipToArchive
Inputs : [[0, 'toArchive']]
Outputs : []
Emits : []


Name : grepErrors
Inputs : [[0, 'toFilter']]
Outputs : [[0, 'errors']]
Emits : []


Name : gzipToErrors
Inputs : [[0, 'errors']]
Outputs : [[0, 'toReport']]
Emits : []


Name : errorReport
Inputs : [[0, 'toReport']]
Outputs : []
Emits : []


