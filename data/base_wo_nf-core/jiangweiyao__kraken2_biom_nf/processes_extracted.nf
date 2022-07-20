Name : fastqc
Inputs : [[0, 'fastq_files']]
Outputs : [[0, 'qc_files'], [0, 'qc_files1']]
Emits : []


Name : multiqc
Inputs : [[0, 'qc_files']]
Outputs : [[0, 'multiqc_output']]
Emits : []


Name : kraken_fastq
Inputs : [[0, 'fastq_files2']]
Outputs : [[0, 'kraken_fastq_out']]
Emits : []


Name : kraken_biom
Inputs : [[0, 'kraken_fastq_out']]
Outputs : [[0, 'kraken_biom_output']]
Emits : []


Name : biom_convert
Inputs : [[0, 'kraken_biom_output']]
Outputs : [[0, 'biom_convert_output']]
Emits : []


