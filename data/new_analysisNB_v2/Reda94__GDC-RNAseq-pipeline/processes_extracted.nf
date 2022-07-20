Name : alignmentFirstPass
Inputs : [[0, 'fastq_files']]
Outputs : [[0, 'firstpass_results']]
Emits : []


Name : intermediateIdx
Inputs : [[0, 'firstpass_results']]
Outputs : [[0, 'inter_idx_results']]
Emits : []


Name : alignmentSecondPass
Inputs : [[0, 'inter_idx_results']]
Outputs : [[0, 'final_bam'], [1, 'final_bam_idx'], [2, 'fb_log_final_out'], [3, 'fb_out'], [4, 'fb_sj_out_tab'], [5, 'fb_log_out'], [6, 'rseqc_input']]
Emits : []


Name : rawReadCount
Inputs : [[0, 'final_bam']]
Outputs : [[0, 'raw_counts_results']]
Emits : []


Name : FPKM_TPM
Inputs : [[0, 'raw_counts_results']]
Outputs : [[0, 'FPKM_TPM_results']]
Emits : []


Name : RNASeQC
Inputs : [[0, 'rseqc_input']]
Outputs : [[0, 'qc_results']]
Emits : []


