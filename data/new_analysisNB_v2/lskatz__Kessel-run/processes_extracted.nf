Name : assembly
Inputs : [[0, 'fastqChannel']]
Outputs : [[0, 'asmChannel']]
Emits : []


Name : prepDatabase
Inputs : [[0, 'in_db']]
Outputs : [[0, 'dbChannel']]
Emits : []


Name : callAlleles
Inputs : [[0, 'asmChannel'], [1, 'dbChannel']]
Outputs : [[0, 'alleleCalls'], [1, 'modifiedDbChannel']]
Emits : []


Name : markNewAlleles
Inputs : [[0, 'modifiedDbChannel']]
Outputs : [[0, 'newAllelesChannel']]
Emits : []


Name : saveCalls
Inputs : [[0, 'alleleCalls']]
Outputs : [[0, 'results_alleles']]
Emits : []


