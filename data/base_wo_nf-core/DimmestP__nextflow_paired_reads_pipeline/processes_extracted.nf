Name : combineLanesAcrossSamples
Inputs : [[0, 'multi_lane_input_fq']]
Outputs : [[0, 'input_fq']]
Emits : []


Name : runFastQC
Inputs : [[0, 'input_fq_qc']]
Outputs : [[0, 'fastqc_files']]
Emits : []


Name : removeUMIs
Inputs : [[0, 'input_fq_umi']]
Outputs : [[0, 'input_fq_cut']]
Emits : []


Name : cutAdapters
Inputs : [[0, 'input_fq_cut']]
Outputs : [[0, 'cut_fq']]
Emits : []


Name : alignHisat2
Inputs : [[0, 'reads_genome_tuple']]
Outputs : [[0, 'unaligned_fq'], [1, 'alignment_logs'], [2, 'aligned_sam']]
Emits : []


Name : samViewSort
Inputs : [[0, 'aligned_sam']]
Outputs : [[0, 'sample_id'], [1, 'aligned_sorted_bam']]
Emits : []


Name : deduplicateUMI
Inputs : [[0, 'aligned_sorted_bam']]
Outputs : [[0, 'deduplicated_bam']]
Emits : []


Name : makeBedgraphs
Inputs : [[0, 'bedgraph_bam']]
Outputs : [[1, 'bedgraph']]
Emits : []


Name : renameBamSample
Inputs : [[0, 'htscount_bam']]
Outputs : [[0, 'sampleid_aln_bam']]
Emits : []


Name : countAllmRNA
Inputs : [[0, 'gff_bam_tuple']]
Outputs : [[0, 'counts'], [1, 'counts_summary'], [2, 'feature_assigned_bam']]
Emits : []


Name : runMultiQC
Inputs : [[0, 'fastqc_files'], [1, 'alignment_logs']]
Outputs : []
Emits : []


