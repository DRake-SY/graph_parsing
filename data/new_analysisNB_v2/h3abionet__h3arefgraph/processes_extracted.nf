Name : get_software_versions
Inputs : []
Outputs : [[0, 'software_versions_yaml']]
Emits : []


Name : fastqc
Inputs : [[0, 'read_files_fastqc']]
Outputs : [[0, 'fastqc_results']]
Emits : []


Name : multiqc
Inputs : [[0, 'ch_multiqc_config'], [1, 'fastqc_results'], [2, 'software_versions_yaml'], [3, 'summary']]
Outputs : [[0, 'multiqc_report']]
Emits : []


Name : createGraphReference_vg
Inputs : [[0, 'newFastaChannel']]
Outputs : [[0, 'referenceGenome']]
Emits : []


Name : createGraphReference_GenGraph
Inputs : [[0, 'newFastaChannel']]
Outputs : [[0, 'referenceGenome']]
Emits : []


Name : convertingToVGforMapping
Inputs : [[0, 'referenceGenome']]
Outputs : [[0, 'convertedReferenceGenome']]
Emits : []


Name : mappingReads
Inputs : [[0, 'convertedReferenceGenome'], [1, 'reads']]
Outputs : [[0, 'mappedReads']]
Emits : []


Name : variantCalling
Inputs : [[0, 'mappedReads']]
Outputs : [[0, 'variantGraph']]
Emits : []


Name : convertingToGenGraphInput
Inputs : [[0, 'variantGraph']]
Outputs : [[0, 'formattedVariantGraph']]
Emits : []


Name : generatingReport
Inputs : [[0, 'formattedVariantGraph']]
Outputs : [[0, 'finalReportOutput']]
Emits : []


Name : output_documentation
Inputs : [[0, 'ch_output_docs']]
Outputs : []
Emits : []


