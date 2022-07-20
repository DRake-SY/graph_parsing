Name : align_fq
Inputs : [[0, 'ch_sample_fastqs'], [1, 'ref_transcripts']]
Outputs : [[0, 'ch_aligned_sam']]
Emits : []


Name : aligns_to_bams
Inputs : [[0, 'ch_aligned_sam']]
Outputs : [[0, 'ch_bams']]
Emits : []


Name : bams_to_emase_to_merge
Inputs : [[0, 'ch_bams'], [1, 'params']]
Outputs : [[1, 'ch_aln_merged']]
Emits : []


Name : quantify
Inputs : [[0, 'ch_aln_merged'], [1, 'params']]
Outputs : [[2, 'ch_genoprobs'], [3, 'ch_genes_tpm']]
Emits : []


Name : exportgeno
Inputs : [[0, 'ref_GenomeGrid'], [1, 'ch_genoprobs']]
Outputs : [[1, 'export_out']]
Emits : []


Name : star
Inputs : [[0, 'ref_StarGenomeDir'], [1, 'ref_StarIdx'], [2, 'ch_fastq_star']]
Outputs : [[1, 'ch_star_bam']]
Emits : []


Name : picard
Inputs : [[0, 'ch_star_bam'], [1, 'ref_StarIdxGenome'], [2, 'ref_PicardMetricsFlat']]
Outputs : [[1, 'ch_picard_bam'], [2, 'ch_picard_log']]
Emits : []


Name : qc_metrics
Inputs : [[0, 'ch_picard_log']]
Outputs : []
Emits : []


