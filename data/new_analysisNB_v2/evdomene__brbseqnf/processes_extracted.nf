Name : index
Inputs : [[0, 'fasta_ch'], [1, 'gtf_ch']]
Outputs : [[0, 'genomeindx_ch']]
Emits : []


Name : alignment
Inputs : [[0, 'R2_ch'], [1, 'genomeindx_ch']]
Outputs : [[0, 'bam_ch']]
Emits : []


Name : CreateDGEMatrix
Inputs : [[0, 'barcodes_ch'], [1, 'R1_ch'], [1, 'bam_ch'], [2, 'gtf_ch2']]
Outputs : [[0, 'matrices_ch']]
Emits : []


Name : RenameHeaders
Inputs : [[0, 'matrices_ch']]
Outputs : [[0, 'results_ch']]
Emits : []


