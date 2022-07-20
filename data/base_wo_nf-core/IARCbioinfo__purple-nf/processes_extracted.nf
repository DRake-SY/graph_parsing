Name : HQ_VCF
Inputs : [[0, 'svcfs']]
Outputs : [[0, 'hc_vcfs']]
Emits : []


Name : COBALT
Inputs : [[0, 'tn_pairs_cobalt'], [1, 'ref_fasta'], [2, 'ref_fai']]
Outputs : [[0, 'cobalt']]
Emits : []


Name : AMBER
Inputs : [[0, 'tn_pairs_amber'], [1, 'ref_fasta'], [2, 'ref_fai']]
Outputs : [[0, 'amber']]
Emits : []


Name : PURPLE
Inputs : [[0, 'amber_cobalt_vcf'], [1, 'ref_fasta'], [2, 'ref_fai'], [3, 'ref_dict']]
Outputs : [[0, 'purple'], [1, 'stats_purple']]
Emits : []


