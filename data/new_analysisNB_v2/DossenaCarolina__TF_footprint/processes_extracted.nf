Name : CREATE_CONSENSUS_BED
Inputs : [[0, 'in_consensus']]
Outputs : [[0, 'in_obtain_fasta_sequences']]
Emits : []


Name : MERGE_REP_BAM
Inputs : [[0, 'bam_mrep']]
Outputs : [[0, 'bam_to_shift']]
Emits : []


Name : SHIFT_BAM
Inputs : [[0, 'bam_to_shift']]
Outputs : [[0, 'in_centipede']]
Emits : []


Name : OBTAIN_SEQUENCES
Inputs : [[0, 'in_obtain_fasta_sequences']]
Outputs : [[0, 'in_sequence_pwm_match']]
Emits : []


Name : MOTIF_MATCH
Inputs : [[0, 'in_fimo'], [1, 'ch_bed_fasta']]
Outputs : [[0, 'sites']]
Emits : []


Name : RUN_CENTIPEDE
Inputs : [[0, 'ch_in_centipede']]
Outputs : [[0, 'results']]
Emits : []


