Name : midas
Inputs : [[0, 'fastq_ch']]
Outputs : [[0, 'species_ch'], [1, 'gene_ch'], [2, 'snps_ch']]
Emits : []


Name : midas_merge_species
Inputs : [[0, 'species_ch']]
Outputs : []
Emits : []


Name : midas_merge_genes
Inputs : [[0, 'gene_ch']]
Outputs : []
Emits : []


Name : midas_merge_snps
Inputs : [[0, 'snps_ch']]
Outputs : []
Emits : []


