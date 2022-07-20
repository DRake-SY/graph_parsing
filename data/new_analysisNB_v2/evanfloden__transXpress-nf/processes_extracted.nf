Name : fastqc
Inputs : [[0, 'read_pairs_ch']]
Outputs : [[0, 'fastqc_ch']]
Emits : []


Name : trimmomatic
Inputs : [[0, 'read_pairs_ch2']]
Outputs : [[0, 'sample_id'], [2, 'filteredPairedReads_ch1'], [2, 'filteredPairedReads_ch2']]
Emits : []


Name : rnaSPAdes_yaml
Inputs : [[0, 'rnaSPAdes_samples_ch']]
Outputs : [[0, 'rnaSPAdes_yaml_ch']]
Emits : []


Name : rnaSPAdes
Inputs : [[0, 'filteredPairedReads_ch2'], [1, 'rnaSPAdes_yaml_ch']]
Outputs : [[2, 'rnaSPAdes_ch']]
Emits : []


