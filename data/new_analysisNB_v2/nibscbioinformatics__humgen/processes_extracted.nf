Name : get_software_versions
Inputs : []
Outputs : [[0, 'ch_software_versions_yaml']]
Emits : []


Name : BuildBWAindexes
Inputs : [[0, 'ch_fasta']]
Outputs : [[0, 'bwaIndexes']]
Emits : []


Name : BuildDict
Inputs : [[0, 'ch_fasta']]
Outputs : [[0, 'dictBuilt']]
Emits : []


Name : BuildFastaFai
Inputs : [[0, 'ch_fasta']]
Outputs : [[0, 'fastaFaiBuilt']]
Emits : []


Name : BuildDbsnpIndex
Inputs : [[0, 'ch_dbsnp']]
Outputs : [[0, 'dbsnpIndexBuilt']]
Emits : []


Name : BuildGermlineResourceIndex
Inputs : [[0, 'ch_germlineResource']]
Outputs : [[0, 'germlineResourceIndexBuilt']]
Emits : []


Name : BuildKnownIndelsIndex
Inputs : [[0, 'ch_knownIndels']]
Outputs : [[0, 'knownIndelsIndexBuilt']]
Emits : []


Name : BuildPonIndex
Inputs : [[0, 'ch_pon']]
Outputs : [[0, 'ponIndexBuilt']]
Emits : []


Name : fastqc
Inputs : [[0, 'ch_read_files_fastqc']]
Outputs : [[0, 'ch_fastqc_results']]
Emits : []


Name : multiqc
Inputs : [[0, 'ch_multiqc_config'], [1, 'ch_multiqc_custom_config'], [2, 'ch_fastqc_results'], [3, 'ch_software_versions_yaml'], [4, 'ch_workflow_summary']]
Outputs : [[0, 'ch_multiqc_report']]
Emits : []


Name : output_documentation
Inputs : [[0, 'ch_output_docs']]
Outputs : []
Emits : []


Name : doalignment
Inputs : [[0, 'ch_read_files_trimming'], [1, 'ch_fasta'], [2, 'ch_fastaFai']]
Outputs : [[0, 'samfile']]
Emits : []


Name : sorttobam
Inputs : [[0, 'samfile']]
Outputs : [[0, 'sortedbam']]
Emits : []


Name : markduplicates
Inputs : [[0, 'sortedbam']]
Outputs : [[0, '']]
Emits : []


Name : baserecalibrationtable
Inputs : [[0, 'markedbamfortable'], [1, 'ch_dbsnp'], [2, 'ch_dbsnpIndex'], [3, 'ch_fasta'], [4, 'ch_fastaFai'], [5, 'ch_knownIndels'], [6, 'ch_knownIndelsIndex']]
Outputs : [[0, 'recaltable']]
Emits : []


Name : applybaserecalibration
Inputs : [[0, 'forrecal']]
Outputs : [[0, '']]
Emits : []


Name : indexrecalibrated
Inputs : [[0, 'recalibratedforindex']]
Outputs : [[0, 'indexedbam']]
Emits : []


Name : haplotypecall
Inputs : [[0, 'forcaller1'], [1, 'ch_dbsnp'], [2, 'ch_dbsnpIndex'], [3, 'ch_fasta'], [4, 'ch_fastaFai']]
Outputs : [[0, 'calledhaps']]
Emits : []


Name : mutectcall
Inputs : [[0, 'forcaller2'], [1, 'ch_fasta'], [2, 'ch_fastaFai'], [3, 'ch_germlineResource'], [4, 'ch_germlineResourceIndex'], [5, 'ch_normPanel'], [6, 'ch_normPanelIndex']]
Outputs : [[0, 'calledmuts']]
Emits : []


Name : mutectfilter
Inputs : [[0, 'calledmuts'], [1, 'ch_fasta'], [2, 'ch_fastaFai']]
Outputs : [[0, 'filteredmuts']]
Emits : []


Name : snpindelsplit
Inputs : [[0, 'rawvars']]
Outputs : [[0, 'splitupvars']]
Emits : []


Name : hardfilter
Inputs : [[0, 'splitupvars'], [1, 'ch_fasta'], [2, 'ch_fastaFai']]
Outputs : [[0, 'filteredvars']]
Emits : []


Name : remergevars
Inputs : [[0, 'filteredvars']]
Outputs : [[0, '']]
Emits : []


Name : variantevaluation
Inputs : [[0, 'germsomvars1'], [1, 'ch_dbsnp'], [2, 'ch_dbsnpIndex'], [3, 'ch_fasta'], [4, 'ch_fastaFai']]
Outputs : [[0, 'variantevaluations']]
Emits : []


Name : effectprediction
Inputs : [[0, 'germsomvars2']]
Outputs : [[0, 'annotatedvars']]
Emits : []


