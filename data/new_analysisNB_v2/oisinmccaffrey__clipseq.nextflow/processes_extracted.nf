Name : generate_premap_index
Inputs : [[0, 'ch_smrna_fasta']]
Outputs : [[0, 'ch_bt2_index']]
Emits : []


Name : generate_fai
Inputs : [[0, 'ch_ref_fai']]
Outputs : [[0, '']]
Emits : []


Name : star_index
Inputs : [[0, 'ch_fasta_star'], [1, 'ch_gtf_star']]
Outputs : [[0, 'ch_star_index']]
Emits : []


Name : FastQC
Inputs : [[0, 'fastqc_reads']]
Outputs : [[0, 'fastqc_ch']]
Emits : []


Name : cutadapt
Inputs : [[0, 'trimming_reads']]
Outputs : [[0, 'mapping_reads'], [1, 'ch_cutadapt_mqc']]
Emits : []


Name : premap
Inputs : [[0, 'mapping_reads'], [1, 'ch_bt2_index']]
Outputs : [[0, 'ch_unmapped'], [1, 'key'], [2, 'ch_premap_mqc'], [2, 'ch_premap_qc']]
Emits : []


Name : align
Inputs : [[0, 'ch_unmapped'], [1, 'ch_star_index']]
Outputs : [[0, 'ch_aligned'], [0, 'ch_aligned_preseq'], [1, 'ch_align_mqc'], [1, 'ch_align_qc']]
Emits : []


Name : preseq
Inputs : [[0, 'ch_aligned_preseq']]
Outputs : [[0, 'ch_preseq_mqc']]
Emits : []


Name : dedup
Inputs : [[0, 'ch_aligned']]
Outputs : [[0, 'ch_dedup'], [0, 'ch_dedup_pureclip'], [0, 'ch_dedup_rseqc']]
Emits : []


Name : get_crosslinks
Inputs : [[0, 'ch_dedup'], [1, 'ch_fai_crosslinks']]
Outputs : [[0, 'ch_xlinks_icount'], [0, 'ch_xlinks_paraclu'], [0, 'ch_xlinks_piranha'], [1, 'ch_xlinks_bedgraphs'], [2, 'ch_xlinks_qc']]
Emits : []


Name : piranha_peak_call
Inputs : [[0, 'ch_xlinks_piranha']]
Outputs : [[0, 'ch_peaks_piranha'], [1, 'ch_piranha_qc']]
Emits : []


Name : piranha_motif_dreme
Inputs : [[0, 'ch_peaks_piranha'], [1, 'ch_fasta_dreme_piranha'], [2, 'ch_fai_piranha_motif']]
Outputs : [[0, 'ch_motif_dreme_piranha']]
Emits : []


Name : clipqc
Inputs : [[0, 'ch_premap_qc'], [1, 'ch_align_qc'], [2, 'ch_xlinks_qc'], [3, 'ch_piranha_qc']]
Outputs : [[0, 'ch_clipqc_mqc']]
Emits : []


Name : multiqc
Inputs : [[0, 'ch_multiqc_config'], [1, 'ch_multiqc_custom_config'], [2, 'fastqc_ch'], [3, 'ch_premap_mqc'], [4, 'ch_align_mqc'], [5, 'ch_preseq_mqc'], [6, 'ch_clipqc_mqc']]
Outputs : [[0, 'ch_multiqc_report']]
Emits : []


