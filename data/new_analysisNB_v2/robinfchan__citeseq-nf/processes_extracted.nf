Name : unzip_10x_barcodes
Inputs : [[0, 'barcode_whitelist_gzipped']]
Outputs : [[0, 'barcode_whitelist_csc_unzip']]
Emits : []


Name : fasta_gtf_rec_matching
Inputs : [[0, 'genome_fasta_matching'], [1, 'gtf_matching']]
Outputs : [[0, '']]
Emits : []


Name : extract_transcriptome
Inputs : [[0, 'genome_fasta_extract_transcriptome'], [1, 'gtf_extract_transcriptome_trimmed']]
Outputs : [[0, 'transcriptome_fasta_alevin_extracted']]
Emits : []


Name : build_salmon_index
Inputs : [[0, 'transcriptome_fasta_alevin'], [0, 'transcriptome_fasta_alevin_extracted']]
Outputs : [[0, 'salmon_index_alevin']]
Emits : []


Name : build_txp2gene
Inputs : [[0, 'gtf_alevin'], [0, 'gtf_alevin_trimmed']]
Outputs : [[0, 'txp2gene']]
Emits : []


Name : alevin
Inputs : [[0, 'read_files_alevin'], [1, 'salmon_index_alevin'], [2, 'txp2gene']]
Outputs : [[0, '']]
Emits : []


Name : cite_seq_count
Inputs : [[0, 'read_files_csc'], [1, 'adt_tags'], [2, 'barcode_whitelist_csc'], [2, 'barcode_whitelist_csc_unzip']]
Outputs : []
Emits : []


