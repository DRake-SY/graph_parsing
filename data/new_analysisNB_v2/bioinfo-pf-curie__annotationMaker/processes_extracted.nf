Name : getFasta
Inputs : [[0, 'chFastaLink']]
Outputs : [[0, 'chFastaURL']]
Emits : []


Name : getTranscriptome
Inputs : [[0, 'chTrsLink']]
Outputs : [[0, 'chTrsURL']]
Emits : []


Name : getAnnotation
Inputs : [[0, 'chGffLink'], [0, 'chGtfLink']]
Outputs : [[0, 'chAnnotURL']]
Emits : []


Name : convertGFFtoGTF
Inputs : [[0, 'chGff']]
Outputs : [[0, 'chGtfHisat2Splicesites'], [0, 'chGtfHisat2Index'], [0, 'chGtf'], [0, 'chGtfBed12'], [0, 'chGtfGene'], [0, 'chGtfCellranger']]
Emits : []


Name : indexFasta
Inputs : [[0, 'chFasta']]
Outputs : [[0, 'chFastaDict'], [0, 'chFastaSize'], [0, 'chFastaEffgsize']]
Emits : []


Name : makeDict
Inputs : [[0, 'chFastaDict']]
Outputs : [[0, 'chDict']]
Emits : []


Name : makeChromSizes
Inputs : [[0, 'chFastaSize']]
Outputs : [[0, '']]
Emits : []


Name : effectiveGenomeSize
Inputs : [[0, 'chFastaEffgsize']]
Outputs : [[0, 'chEffSize']]
Emits : []


Name : makeBwaIndex
Inputs : [[0, 'chFastaBwa']]
Outputs : [[0, 'chBwaIdx']]
Emits : []


Name : makeStarIndex
Inputs : [[0, 'chFastaStar'], [1, 'chChromSizeStar']]
Outputs : [[0, 'chStarIdx']]
Emits : []


Name : makeBowtie2Index
Inputs : [[0, 'chFastaBowtie2']]
Outputs : [[0, 'chBowtie2Idx']]
Emits : []


Name : makeHisat2Splicesites
Inputs : [[0, 'chGtfHisat2Splicesites']]
Outputs : [[0, 'indexingSplicesites']]
Emits : []


Name : makeHisat2Index
Inputs : [[0, 'chFastaHisat2'], [1, 'indexingSplicesites'], [2, 'chGtfHisat2Index']]
Outputs : [[0, 'chHisat2Idx']]
Emits : []


Name : cellRangerFilterGtf
Inputs : [[0, 'chGtfCellranger']]
Outputs : [[0, 'chFilteredGtfCellranger']]
Emits : []


Name : makeCellRangerIndex
Inputs : [[0, 'chFastaCellranger'], [1, 'chFilteredGtfCellranger']]
Outputs : [[0, 'chCellrangerIdx']]
Emits : []


Name : makeKallistoIndex
Inputs : [[0, 'chTranscriptsKallisto']]
Outputs : [[0, 'chKallistoIdx']]
Emits : []


Name : makeSalmonIndex
Inputs : [[0, 'chFastaSalmon'], [1, 'chTranscriptsSalmon']]
Outputs : [[0, 'chSalmonIdx']]
Emits : []


Name : reduceGtf
Inputs : [[0, 'chGtf']]
Outputs : [[0, '']]
Emits : []


Name : gtf2bed12
Inputs : [[0, 'chGtfBed12'], [0, 'chGtfReducedBed12']]
Outputs : [[0, 'chBed12']]
Emits : []


Name : gtf2genes
Inputs : [[0, 'chGtfGene'], [0, 'chGtfReducedGene']]
Outputs : [[0, 'chGeneBed']]
Emits : []


