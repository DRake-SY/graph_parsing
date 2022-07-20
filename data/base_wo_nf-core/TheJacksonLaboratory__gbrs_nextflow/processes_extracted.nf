Name : bowtie
Inputs : [[0, 'fastq_ch']]
Outputs : [[0, 'bams'], [1, 'fqall1'], [2, 'fqall2'], [3, 'log1'], [4, 'log2']]
Emits : []


Name : bamtoemase
Inputs : [[0, 'bams']]
Outputs : [[0, 'aln_compressed']]
Emits : []


Name : quantify
Inputs : [[0, 'compm1'], [1, 'params'], [2, 'params']]
Outputs : [[0, 'publish'], [1, 'genoprobs'], [2, 'genes_tpm']]
Emits : []


Name : exportgeno
Inputs : [[0, 'genoprobs']]
Outputs : [[0, 'export_out']]
Emits : []


Name : makeSTARindex
Inputs : [[0, 'star_genome'], [1, 'star_gtf']]
Outputs : [[0, 'star_index']]
Emits : []


Name : runSTAR
Inputs : [[0, 'fastq_ch_star'], [1, 'star_index']]
Outputs : [[0, 'starout']]
Emits : []


Name : RSEMprep
Inputs : [[0, 'rsem_genome'], [1, 'rsem_gtf']]
Outputs : [[0, 'rsem_index'], [1, 'rsem_index_name']]
Emits : []


Name : RSEMit
Inputs : [[0, 'starout'], [1, 'rsem_index_name'], [2, 'rsem_index']]
Outputs : [[0, 'rsem_iso_count'], [1, 'rsem_genes_count'], [2, 'rsem_genes_count2'], [2, 'RSEM_genes'], [3, 'RSEM_ids']]
Emits : []


Name : RSEM_table
Inputs : [[0, 'rsem_genes_count2']]
Outputs : [[0, 'rsem_table']]
Emits : []


Name : transcriptsToFasta
Inputs : [[0, 'genome_fa'], [1, 'genome_gtf']]
Outputs : [[0, 'ch_fasta_for_salmon_index']]
Emits : []


Name : makeSalmonIndex
Inputs : [[0, 'ch_fasta_for_salmon_index'], [1, 'genome_fa2']]
Outputs : [[0, 'salmon_index']]
Emits : []


Name : salmon
Inputs : [[0, 'fastq_ch_sal'], [1, 'salmon_index']]
Outputs : [[0, 'salmon_out']]
Emits : []


Name : transtogene
Inputs : [[0, 'trans_gtf']]
Outputs : [[0, 'isogenes']]
Emits : []


Name : compare_tpm
Inputs : [[0, 'both_out'], [1, 'isogenes']]
Outputs : [[0, 'isocorr'], [1, 'corrpdf'], [2, 'rsempdf'], [3, 'rsemsalpdf'], [4, 'genelist']]
Emits : []


Name : col_corr
Inputs : [[0, 'isocorr']]
Outputs : [[0, 'allcorr']]
Emits : []


Name : prepeQTL
Inputs : [[0, 'RSEM_genes'], [1, 'QTL_metadata'], [2, 'genopCh']]
Outputs : [[0, 'readydat'], [0, 'readydat2'], [1, 'count_tbl'], [2, 'raw_tbl']]
Emits : []


Name : rungene
Inputs : [[0, 'readydat'], [1, 'genes']]
Outputs : [[0, 'pdfs'], [1, 'id_eQTL'], [2, 'h2g_gene'], [3, 'gene_perm']]
Emits : []


Name : collect_h2g
Inputs : [[0, 'h2g_all'], [1, 'perm_all']]
Outputs : [[0, 'h2g_af'], [1, 'pall']]
Emits : []


Name : eQTL_rdata
Inputs : [[0, 'readydat2'], [1, 'id_eQTL'], [2, 'pall']]
Outputs : [[0, 'viewerdata'], [1, 'alleqtl']]
Emits : []


