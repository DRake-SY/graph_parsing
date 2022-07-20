Name : filter
Inputs : [[0, 'vcf_ch']]
Outputs : [[0, 'filter_ch']]
Emits : []


Name : drop_ind
Inputs : [[0, 'filter_ch']]
Outputs : [[0, 'vcfind_ch']]
Emits : []


Name : beagle
Inputs : [[0, 'vcfind_ch'], [1, 'scaf_ch']]
Outputs : [[0, 'beagle_ch']]
Emits : []


Name : combine_beagle
Inputs : [[0, 'beagle_ch']]
Outputs : [[0, 'fullbeagle_ch']]
Emits : []


Name : thin
Inputs : [[0, 'fullbeagle_ch']]
Outputs : [[0, 'thinned_ch']]
Emits : []


Name : ngs_admix
Inputs : [[0, 'thinned_ch']]
Outputs : [[0, 'admix_ch']]
Emits : []


