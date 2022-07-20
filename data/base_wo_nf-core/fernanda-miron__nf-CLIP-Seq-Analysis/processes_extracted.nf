Name : mk_alignment
Inputs : [[0, 'clip_input'], [1, 'reference_index'], [2, 'mkfiles_pre1']]
Outputs : [[0, 'results_mk_alignment']]
Emits : []


Name : mk_sam_to_bam
Inputs : [[0, 'results_mk_alignment'], [1, 'mkfiles_pre2']]
Outputs : [[0, 'results_mk_sam_to_bam_bam'], [1, 'results_mk_sam_to_bam_bai']]
Emits : []


Name : mk_peak_calling
Inputs : [[0, 'results_mk_sam_to_bam_bam'], [1, 'results_mk_sam_to_bam_bai'], [2, 'mkfiles_core1']]
Outputs : [[0, 'results_mk_peak_calling']]
Emits : []


