Name : downloadSRA
Inputs : [[0, 'SRAID']]
Outputs : [[0, 'sraFiles']]
Emits : []


Name : fastqDump
Inputs : [[0, 'sraFiles']]
Outputs : [[0, 'fastq']]
Emits : []


Name : downloadGenomeAnnotation
Inputs : []
Outputs : [[0, 'gtf']]
Emits : []


Name : downloadHumanGenome
Inputs : [[0, 'ID']]
Outputs : [[0, 'fasta']]
Emits : []


Name : createGenomeIndex
Inputs : [[0, 'fasta']]
Outputs : [[0, 'index_chan']]
Emits : []


Name : mapping
Inputs : [[0, 'fastq'], [1, 'index_chan']]
Outputs : [[0, 'bam_chan'], [0, 'bam_chan2']]
Emits : []


Name : samtools
Inputs : [[0, 'bam_chan']]
Outputs : [[0, 'end']]
Emits : []


Name : featureCounts
Inputs : [[0, 'bam_chan2'], [1, 'gtf']]
Outputs : [[0, 'read_count']]
Emits : []


Name : Deseq2
Inputs : [[0, 'read_count'], [1, 'description']]
Outputs : [[0, 'fin']]
Emits : []


