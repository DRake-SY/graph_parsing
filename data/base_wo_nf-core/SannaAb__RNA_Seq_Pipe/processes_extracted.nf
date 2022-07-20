Name : run_fastqc
Inputs : [[0, 'fastqin']]
Outputs : [[0, 'fastqcout']]
Emits : []


Name : run_adapterfilt
Inputs : [[0, 'read_pairs']]
Outputs : [[0, 'Adaptertrimmed'], [1, 'qualfiltreports']]
Emits : []


Name : run_Alignment
Inputs : [[0, 'Adaptertrimmed']]
Outputs : [[0, 'Alignmentout'], [0, 'Alignmentout2'], [0, 'Alignmentout3'], [1, 'alstats']]
Emits : []


Name : run_qualAlignment
Inputs : [[0, 'Alignmentout']]
Outputs : [[0, 'alstats2']]
Emits : []


Name : run_quantification
Inputs : [[0, 'Alignmentout2']]
Outputs : [[0, 'quantification'], [1, 'quantsummary']]
Emits : []


Name : run_Normalization
Inputs : [[0, 'quantification']]
Outputs : [[0, 'Normalized']]
Emits : []


