Name : gunzipFasta
Inputs : [[0, 'fastaGunzipChannel']]
Outputs : [[0, 'fastaMapChannel'], [0, 'fastaSnpChannel'], [0, 'fastaCountChannel'], [0, 'fastaRatesChannel'], [0, 'fastaUtrRatesChannel'], [0, 'fastaReadPosChannel'], [0, 'fastaUtrPosChannel']]
Emits : []


Name : gtf2bed
Inputs : [[0, 'gtfChannel']]
Outputs : [[0, 'utrFilterChannel'], [0, 'utrCountChannel'], [0, 'utrratesChannel'], [0, 'utrposChannel']]
Emits : []


Name : get_software_versions
Inputs : []
Outputs : [[0, 'ch_software_versions_yaml']]
Emits : []


Name : checkDesign
Inputs : [[0, 'checkChannel']]
Outputs : [[0, 'rawFileChannel'], [0, 'deseq2ConditionChannel'], [0, 'splitChannel'], [0, 'vcfSampleChannel']]
Emits : []


Name : trim
Inputs : [[0, 'rawFiles']]
Outputs : [[0, 'trimmedFiles'], [1, 'trimgaloreQC'], [2, 'trimgaloreFastQC']]
Emits : []


Name : map
Inputs : [[0, 'trimmedFiles'], [1, 'fastaMapChannel']]
Outputs : [[0, 'slamdunkMap']]
Emits : []


Name : filter
Inputs : [[0, 'slamdunkMap'], [1, 'utrFilterChannel']]
Outputs : [[0, 'slamdunkFilter'], [0, 'slamdunkCount'], [0, 'slamdunkFilterSummary']]
Emits : []


Name : snp
Inputs : [[0, 'slamdunkFilter'], [1, 'fastaSnpChannel']]
Outputs : [[0, 'slamdunkSnp']]
Emits : []


Name : count
Inputs : [[0, 'slamdunkResultsChannel'], [1, 'utrCountChannel'], [2, 'fastaCountChannel']]
Outputs : [[0, 'slamdunkCountOut'], [0, 'slamdunkCountAlleyoop']]
Emits : []


Name : collapse
Inputs : [[0, 'slamdunkCountOut']]
Outputs : [[0, 'slamdunkCollapseOut']]
Emits : []


Name : rates
Inputs : [[0, 'slamdunkForRatesChannel'], [1, 'fastaRatesChannel']]
Outputs : [[0, 'alleyoopRatesOut']]
Emits : []


Name : utrrates
Inputs : [[0, 'slamdunkForUtrRatesChannel'], [1, 'fastaUtrRatesChannel'], [2, 'utrratesChannel']]
Outputs : [[0, 'alleyoopUtrRatesOut']]
Emits : []


Name : tcperreadpos
Inputs : [[0, 'slamdunkForTcPerReadPosChannel'], [1, 'fastaReadPosChannel']]
Outputs : [[0, 'alleyoopTcPerReadPosOut']]
Emits : []


Name : tcperutrpos
Inputs : [[0, 'slamdunkForTcPerUtrPosChannel'], [1, 'fastaUtrPosChannel'], [2, 'utrposChannel']]
Outputs : [[0, 'alleyoopTcPerUtrPosOut']]
Emits : []


Name : summary
Inputs : [[0, 'slamdunkFilterSummaryCollected'], [1, 'slamdunkCountAlleyoopCollected']]
Outputs : [[0, 'summaryQC']]
Emits : []


Name : deseq2
Inputs : [[0, 'deseq2ConditionChannel'], [1, 'deseq2FileChannel']]
Outputs : [[0, 'deseq2out']]
Emits : []


Name : multiqc
Inputs : [[0, 'ch_multiqc_config'], [1, 'ch_multiqc_custom_config'], [2, 'alleyoopRatesOut'], [3, 'alleyoopUtrRatesOut'], [4, 'alleyoopTcPerReadPosOut'], [5, 'alleyoopTcPerUtrPosOut'], [6, 'summaryQC'], [7, 'trimgaloreQC'], [8, 'trimgaloreFastQC'], [9, 'ch_software_versions_yaml'], [10, 'ch_workflow_summary']]
Outputs : [[0, 'ch_multiqc_report']]
Emits : []


Name : output_documentation
Inputs : [[0, 'ch_output_docs'], [1, 'ch_output_docs_images']]
Outputs : []
Emits : []


