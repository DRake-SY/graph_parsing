Name : fastqc_fastq
Inputs : [[0, 'read_files_fastqc']]
Outputs : [[0, 'fastqc_report'], [1, 'name']]
Emits : []


Name : multiqc
Inputs : [[0, 'fastqc_report']]
Outputs : [[0, 'multiqc_report']]
Emits : []


Name : trim_galore
Inputs : [[0, 'read_files_trimG']]
Outputs : [[0, 'fastq_files_trim'], [1, 'unpaired'], [2, 'trimgalore_results'], [3, 'trimgalore_fastqc_reports']]
Emits : []


Name : multiqc_trim
Inputs : [[0, 'trimgalore_fastqc_reports']]
Outputs : [[0, 'multiqc_trimgalore_report']]
Emits : []


Name : Merging
Inputs : [[0, 'fastq_files_trim']]
Outputs : [[0, 'merged_read_pair'], [1, 'unmergedForward'], [2, 'unmergedReverse']]
Emits : []


Name : Fusion
Inputs : [[0, 'merged_read_pair'], [1, 'unmergedForward'], [2, 'unmergedReverse']]
Outputs : [[0, 'fusionfasta']]
Emits : []


Name : vparseDerepWorkAround
Inputs : [[0, 'fusionfasta']]
Outputs : [[0, 'derep_fasta']]
Emits : []


Name : ChimericRemov
Inputs : [[0, 'derep_fasta']]
Outputs : [[0, 'no_chimfasta']]
Emits : []


Name : Clustering
Inputs : [[0, 'no_chimfasta']]
Outputs : [[0, 'clusteredfasta']]
Emits : []


Name : Blast
Inputs : [[0, 'clusteredfasta']]
Outputs : [[0, 'blast']]
Emits : []


