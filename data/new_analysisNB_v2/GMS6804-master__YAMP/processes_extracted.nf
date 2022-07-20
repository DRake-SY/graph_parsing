Name : dedup
Inputs : [[0, 'todedup']]
Outputs : [[0, 'log2'], [1, 'totrim'], [2, 'topublishdedupe']]
Emits : []


Name : trim
Inputs : [[0, 'totrim'], [0, 'mocktrim']]
Outputs : [[0, 'log3'], [1, 'trimmedreads'], [2, 'todecontaminate'], [3, 'topublishtrim']]
Emits : []


Name : decontaminate
Inputs : [[0, 'todecontaminate'], [0, 'mockdecontaminate']]
Outputs : [[1, 'log5'], [2, 'decontaminatedreads'], [3, 'toprofiletaxa'], [4, 'toprofilefunctionreads'], [5, 'topublishdecontaminate']]
Emits : []


Name : qualityAssessment
Inputs : [[0, 'toQC']]
Outputs : [[0, 'logQC']]
Emits : []


Name : profileTaxa
Inputs : [[0, 'toprofiletaxa']]
Outputs : [[0, 'log7'], [1, 'toalphadiversity'], [2, 'toprofilefunctionbugs'], [3, 'topublishprofiletaxa']]
Emits : []


Name : alphaDiversity
Inputs : [[0, 'toalphadiversity']]
Outputs : [[0, 'log8']]
Emits : []


Name : profileFunction
Inputs : [[0, 'toprofilefunctionreads'], [1, 'toprofilefunctionbugs']]
Outputs : [[0, 'log9'], [5, 'topublishhumann2']]
Emits : []


Name : logQC
Inputs : [[0, 'logQC'], [0, 'log2'], [0, 'log3'], [0, 'log5']]
Outputs : []
Emits : []


Name : saveQCtmpfile
Inputs : [[0, 'topublishdedupe'], [0, 'topublishtrim'], [0, 'topublishdecontaminate']]
Outputs : []
Emits : []


Name : logCC
Inputs : [[0, 'log7'], [0, 'log8'], [0, 'log9']]
Outputs : []
Emits : []


Name : saveCCtmpfile
Inputs : [[0, 'topublishprofiletaxa'], [0, 'topublishhumann2']]
Outputs : []
Emits : []


