Name : bam2fastq
Inputs : [[0, 'bam_channel']]
Outputs : [[0, 'fastq1'], [1, 'fastq2']]
Emits : []


Name : razarEnd1
Inputs : [[0, 'fastq1'], [1, 'params']]
Outputs : [[0, 'razarFilteredEnd1']]
Emits : []


Name : razarEnd2
Inputs : [[0, 'fastq2'], [1, 'params']]
Outputs : [[0, 'razarFilteredEnd2']]
Emits : []


Name : optitype
Inputs : [[0, 'fastqFiltered']]
Outputs : [[0, 'optioutput']]
Emits : []


