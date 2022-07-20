Name : downloadFastas
Inputs : []
Outputs : [[0, 'downloadedFastas']]
Emits : []


Name : runMASHix
Inputs : [[0, 'downloadedFastas'], [1, 'IN_db_name'], [2, 'IN_sequences_removal']]
Outputs : [[0, ''], [1, 'patlasJson'], [2, 'taxaTree'], [3, 'sqlFileMashix'], [4, 'lenghtJson'], [5, 'mashIndex'], [6, 'actualRemovedSequences']]
Emits : []


Name : samtoolsIndex
Inputs : [[0, 'masterFasta_samtools']]
Outputs : [[0, 'samtoolsIndexChannel']]
Emits : []


Name : abricate
Inputs : [[0, 'masterFasta_abricate'], [1, 'params']]
Outputs : [[0, 'abricateOutputs']]
Emits : []


Name : abricate_plasmidfinder_db
Inputs : [[0, 'masterFasta_abricatepf']]
Outputs : [[0, 'abricateOutputsPlasmidFinder']]
Emits : []


Name : diamond
Inputs : [[0, 'masterFasta_diamond'], [1, 'params']]
Outputs : [[0, 'diamondOutputs']]
Emits : []


Name : abricate2db
Inputs : [[0, 'abricateOutputs'], [1, 'diamondOutputs'], [2, 'abricateOutputsPlasmidFinder'], [3, 'sqlFileMashix'], [4, 'IN_db_name']]
Outputs : [[0, 'FinalDbSql'], [1, 'dropdownJsons']]
Emits : []


Name : bowtieIndex
Inputs : [[0, 'masterFasta_bowtie2']]
Outputs : [[0, 'bowtieIndexChannel']]
Emits : []


