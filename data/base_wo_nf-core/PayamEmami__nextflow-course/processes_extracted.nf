Name : process_masstrace_detection_pos_xcms
Inputs : [[0, 'mzMLFiles']]
Outputs : [[0, 'collect_rdata_pos_xcms'], [1, 'rt_rdata_pos_xcms']]
Emits : []


Name : process_collect_rdata_pos_xcms
Inputs : [[0, 'collect_rdata_pos_xcms']]
Outputs : [[0, 'align_rdata_pos_xcms']]
Emits : []


Name : process_align_peaks_pos_xcms
Inputs : [[0, 'align_rdata_pos_xcms'], [1, 'rt_rdata_pos_xcms']]
Outputs : [[0, 'group_peaks_pos_N1_xcms']]
Emits : []


Name : process_group_peaks_pos_N1_xcms
Inputs : [[0, 'group_peaks_pos_N1_xcms']]
Outputs : [[0, 'finished']]
Emits : []


