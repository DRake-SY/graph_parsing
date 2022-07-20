Name : index
Inputs : [[0, 'genomeFile'], [1, 'annotationFile']]
Outputs : [[0, 'STARgenomeIndex'], [1, 'genomeLengths']]
Emits : []


Name : mapping
Inputs : [[0, 'STARgenomeIndex'], [1, 'read_files']]
Outputs : [[0, 'STARmappedReads']]
Emits : []


Name : cufflinks
Inputs : [[0, 'annotationFile'], [1, 'STARmappedReads']]
Outputs : [[0, 'cufflinksTranscripts_to_pp']]
Emits : []


Name : cufflinks_postprocess
Inputs : [[0, 'cufflinksTranscripts_to_pp'], [1, 'genomeLengths']]
Outputs : [[0, 'cufflinksTranscripts_postprocess'], [0, 'cufflinksTranscripts_postprocess_fn']]
Emits : []


Name : cuffmerge
Inputs : [[0, 'annotationFile'], [1, 'genomeFile'], [2, 'GTFfilenames'], [3, 'cufflinksTranscripts_postprocess']]
Outputs : [[0, 'cuffmergeTranscripts']]
Emits : []


Name : FEELnc_filter
Inputs : [[0, 'annotationFile'], [1, 'cuffmergeTranscripts']]
Outputs : [[0, 'FEELnc_filtered']]
Emits : []


Name : FEELnc_codpot
Inputs : [[0, 'annotationFile'], [1, 'genomeFile'], [2, 'FEELnc_filtered']]
Outputs : [[0, 'FEELnc_codpot_out']]
Emits : []


Name : FEELnc_classifier
Inputs : [[0, 'annotationFile'], [1, 'FEELnc_codpot_out']]
Outputs : [[0, 'lncRNA_classes']]
Emits : []


