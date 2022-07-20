Name : seq_to_6frames_prot
Inputs : [[0, 'contig_files']]
Outputs : [[0, 'nucl_seq_to_prot']]
Emits : []


Name : frame_prot_blastp
Inputs : [[0, 'nucl_seq_to_prot']]
Outputs : [[0, 'blastp_res']]
Emits : []


Name : selection_blastp_res
Inputs : [[0, 'blastp_res']]
Outputs : [[0, 'blastp_sel']]
Emits : []


Name : prot_frame_selection_blastp
Inputs : [[0, 'blastp_sel']]
Outputs : [[0, 'prot_frame_sel_blastp']]
Emits : []


Name : sort_prot_frame_sel_results
Inputs : [[0, 'prot_frame_sel_blastp']]
Outputs : [[0, 'prot_fram_sel_sorted']]
Emits : []


Name : delete_pos_overlap
Inputs : [[0, 'prot_fram_sel_sorted']]
Outputs : [[0, 'overlap_rm']]
Emits : []


Name : extract_frame_prot_seq
Inputs : [[0, 'overlap_rm']]
Outputs : [[0, 'ext_prot_seq']]
Emits : []


Name : cut_pos_multiORFs_using_extProt
Inputs : [[0, 'ext_prot_seq']]
Outputs : [[0, 'multiORF']]
Emits : []


Name : divide_by_ORFs
Inputs : [[0, 'multiORF']]
Outputs : [[0, 'div_ORF']]
Emits : []


