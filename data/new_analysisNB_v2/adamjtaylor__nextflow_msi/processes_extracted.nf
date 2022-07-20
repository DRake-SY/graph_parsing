Name : total_spectrum
Inputs : [[0, 'ch_pairs1'], [1, 'params'], [2, 'params']]
Outputs : [[0, 'rec_imzml'], [1, 'rec_ibd'], [2, 'ch_mean_spectra']]
Emits : []


Name : peak_picking
Inputs : [[0, 'ch_mean_spectra'], [1, 'params'], [2, 'params']]
Outputs : [[0, 'ch_picked_peaks']]
Emits : []


Name : make_datacube
Inputs : [[0, 'ch_pairs2'], [1, 'ch_picked_peaks'], [2, 'params']]
Outputs : [[0, 'ch_datacube']]
Emits : []


Name : cluster_tissue_background
Inputs : [[0, 'ch_datacube'], [1, 'params']]
Outputs : [[0, 'ch_final']]
Emits : []


