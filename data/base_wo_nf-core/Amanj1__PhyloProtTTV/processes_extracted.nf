Name : filter_contigs
Inputs : [[0, 'contig_files']]
Outputs : [[0, 'filt_contigs']]
Emits : []


Name : add_outgroup_to_seq
Inputs : [[0, 'combine_filt_contigs_outgroup']]
Outputs : [[0, 'filt_contigs_and_outgrp']]
Emits : []


Name : mafft
Inputs : [[0, 'filt_contigs_and_outgrp']]
Outputs : [[0, 'mafft_out']]
Emits : []


Name : trimAl
Inputs : [[0, 'mafft_out']]
Outputs : [[0, 'trim_out']]
Emits : []


Name : RAxML
Inputs : [[0, 'trim_out']]
Outputs : [[0, 'raxml_out']]
Emits : []


