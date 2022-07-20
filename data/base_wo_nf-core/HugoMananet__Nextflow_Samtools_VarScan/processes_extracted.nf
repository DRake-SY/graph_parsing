Name : samtools_mpileup
Inputs : [[0, 'bamfile'], [1, 'ref'], [2, 'ref_index'], [3, 'ref_dict']]
Outputs : [[0, 'pileup']]
Emits : []


Name : varscan_mpileup2cns
Inputs : [[0, 'pileup']]
Outputs : [[0, 'output_vcf_varscan']]
Emits : []


