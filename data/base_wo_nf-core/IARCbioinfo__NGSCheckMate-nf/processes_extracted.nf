Name : BCFTOOLS_calling
Inputs : [[0, 'ref'], [1, 'ref_fai'], [2, 'bam_ch'], [3, 'bed']]
Outputs : [[0, 'vcf_ch'], [1, 'vcfgz_ch'], [2, 'plot_inputs']]
Emits : []


Name : NCM_run
Inputs : [[0, 'vcf_ch2'], [1, 'ref']]
Outputs : [[0, 'ncm_ch'], [1, 'vcflist']]
Emits : []


Name : NCM_graphs
Inputs : [[0, 'ncm_ch'], [1, 'plot_inputs'], [2, 'ncm_graphfiles']]
Outputs : [[0, 'graphs']]
Emits : []


