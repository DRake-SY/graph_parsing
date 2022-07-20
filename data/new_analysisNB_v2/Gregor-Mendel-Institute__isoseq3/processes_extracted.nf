Name : ccs_calling
Inputs : [[0, 'ccs_in']]
Outputs : [[1, 'ccs_out']]
Emits : []


Name : remove_primers
Inputs : [[0, 'ccs_out'], [1, 'primers_remove']]
Outputs : [[1, 'primers_removed_out']]
Emits : []


Name : run_refine
Inputs : [[0, 'primers_removed_out'], [1, 'primers_refine']]
Outputs : [[1, 'refine_merge_out'], [2, 'refine_out']]
Emits : []


Name : merge_transcripts
Inputs : [[0, 'refine_merge_out'], [1, 'pbi_merge_trans']]
Outputs : [[0, 'cluster_in']]
Emits : []


Name : merge_subreads
Inputs : [[0, 'bam_files'], [1, 'pbi_merge_sub']]
Outputs : [[0, 'merged_subreads']]
Emits : []


Name : cluster_reads
Inputs : [[0, 'refine_out'], [0, 'cluster_in']]
Outputs : [[1, 'cluster_out']]
Emits : []


Name : polish_reads
Inputs : [[0, 'bam_names'], [0, 'cluster_out'], [0, 'merged_subreads'], [1, 'pbi_polish']]
Outputs : [[1, 'polish_out']]
Emits : []


Name : align_reads
Inputs : [[0, 'polish_out'], [1, 'ref_fasta']]
Outputs : []
Emits : []


