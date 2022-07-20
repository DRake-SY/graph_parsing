Name : fastqc
Inputs : [[0, 'reads_ch1']]
Outputs : [[0, 'output_R1_html'], [1, 'output_R1_zip'], [2, 'output_R2_html'], [3, 'fastqc_ch']]
Emits : []


Name : ngmerge
Inputs : [[0, 'reads_ch2']]
Outputs : [[0, 'trim_read_ch']]
Emits : []


Name : bwa
Inputs : [[0, 'trim_read_ch']]
Outputs : [[0, 'bam_ch']]
Emits : []


Name : genrich
Inputs : [[0, 'bam_ch']]
Outputs : []
Emits : []


