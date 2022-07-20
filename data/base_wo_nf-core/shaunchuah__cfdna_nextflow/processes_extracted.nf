Name : fastp
Inputs : [[0, 'fastp_reads']]
Outputs : [[0, 'kraken2_direct_ch'], [0, 'reads_for_GRCh38'], [0, 'reads_for_mito'], [1, 'multiqc_ch']]
Emits : []


Name : multiqc
Inputs : [[0, 'multiqc_ch']]
Outputs : []
Emits : []


Name : kraken2_bracken_direct
Inputs : [[0, 'kraken2_direct_ch'], [1, 'kraken2_db_ch']]
Outputs : [[0, 'sample_id'], [1, 'sample_id'], [2, 'sample_id'], [3, 'kraken_biom_ch']]
Emits : []


Name : convert_to_biom
Inputs : [[0, 'kraken_biom_ch']]
Outputs : []
Emits : []


Name : bowtie2_grch38
Inputs : [[0, 'reads_for_GRCh38'], [1, 'bowtie2_db_ch']]
Outputs : [[0, 'deeptools_ch'], [0, 'chr_counts_ch'], [0, 'unmapped_ch']]
Emits : []


Name : bowtie2_mito
Inputs : [[0, 'reads_for_mito'], [1, 'bowtie2_mitodb_ch']]
Outputs : [[0, 'sample_id']]
Emits : []


Name : chr_counts
Inputs : [[0, 'chr_counts_ch']]
Outputs : []
Emits : []


Name : get_unmapped_reads
Inputs : [[0, 'unmapped_ch']]
Outputs : [[0, 'kraken2_unmapped_ch']]
Emits : []


Name : kraken2_bracken_unmapped
Inputs : [[0, 'kraken2_unmapped_ch'], [1, 'kraken2_db_ch']]
Outputs : [[0, 'sample_id'], [1, 'sample_id'], [2, 'sample_id'], [3, 'unmapped_kraken_biom_ch']]
Emits : []


Name : unmapped_convert_to_biom
Inputs : [[0, 'unmapped_kraken_biom_ch']]
Outputs : []
Emits : []


