Name : minimap_align
Inputs : [[0, 'datasets']]
Outputs : [[0, 'bam_sniffles'], [0, 'bam_npinv'], [0, 'bam_nanoplot'], [0, 'bam_mosdepth'], [0, 'bam_svim']]
Emits : []


Name : svim_call
Inputs : [[0, 'bam_svim']]
Outputs : [[0, 'results_svim']]
Emits : []


Name : nanoplot_plot
Inputs : [[0, 'bam_nanoplot']]
Outputs : [[0, 'results_nanoplot']]
Emits : []


Name : mosdepth_plot
Inputs : [[0, 'bam_mosdepth']]
Outputs : [[0, 'results_mosdepth']]
Emits : []


Name : sniffles_call
Inputs : [[0, 'bam_sniffles']]
Outputs : [[0, 'results_sniffles']]
Emits : []


