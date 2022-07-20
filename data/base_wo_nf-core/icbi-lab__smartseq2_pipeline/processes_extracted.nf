Name : makeSTARindex
Inputs : [[0, 'fasta_star_idx'], [1, 'gtf_star_idx']]
Outputs : [[0, 'star_index']]
Emits : []


Name : make_rsem_reference
Inputs : [[0, 'fasta_rsem_ref'], [1, 'gtf_rsem_ref']]
Outputs : [[0, 'rsem_ref']]
Emits : []


Name : fastqc
Inputs : [[0, 'read_files_fastqc']]
Outputs : [[0, 'fastqc_files']]
Emits : []


Name : STAR
Inputs : [[0, 'read_files_star'], [1, 'star_index']]
Outputs : [[0, 'bam_sort_filesgz'], [1, 'bam_trans_filesgz'], [2, 'bam_mqc']]
Emits : []


Name : featureCounts
Inputs : [[0, 'bam_sort_filesgz'], [1, 'gtf_feature_counts']]
Outputs : [[0, 'count_files1'], [1, 'count_files2'], [2, 'count_mqc']]
Emits : []


Name : summarize_FC
Inputs : [[0, 'count_files1']]
Outputs : [[0, 'result_files_fc']]
Emits : []


Name : make_matrices_fc
Inputs : [[0, 'result_files_fc'], [1, 'count_files2']]
Outputs : [[0, 'fc_cr']]
Emits : []


Name : rsem
Inputs : [[0, 'bam_trans_filesgz'], [1, 'rsem_ref']]
Outputs : [[0, 'tpm_files1'], [1, 'tpm_files2'], [2, 'rsem_mqc']]
Emits : []


Name : summmarize_TPM
Inputs : [[0, 'tpm_files1']]
Outputs : [[0, 'result_files_tpm']]
Emits : []


Name : make_matrices_tpm
Inputs : [[0, 'result_files_tpm'], [1, 'tpm_files2']]
Outputs : [[0, 'tpm_cr']]
Emits : []


Name : multiqc
Inputs : [[0, 'fastqc_files'], [1, 'bam_mqc'], [2, 'count_mqc'], [3, 'rsem_mqc']]
Outputs : [[0, 'multiqc_report']]
Emits : []


Name : TraCeR
Inputs : [[0, 'read_files_tracer']]
Outputs : [[0, 'tcr_files']]
Emits : []


Name : TCR_summary
Inputs : [[0, 'tcr_files']]
Outputs : []
Emits : []


Name : BraCeR
Inputs : [[0, 'read_files_bracer']]
Outputs : [[0, 'bcr_files']]
Emits : []


Name : BCR_summary
Inputs : [[0, 'bcr_files']]
Outputs : []
Emits : []


Name : output_documentation
Inputs : [[0, 'ch_output_docs']]
Outputs : []
Emits : []


