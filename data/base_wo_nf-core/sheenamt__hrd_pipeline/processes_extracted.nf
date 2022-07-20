Name : alignment
Inputs : [[0, 'ref_fasta'], [1, 'ref_index'], [2, 'fastqs']]
Outputs : [[0, 'raw_bams']]
Emits : []


Name : picard_remove_duplicates
Inputs : [[0, 'raw_bams']]
Outputs : [[0, 'rmdup_bams']]
Emits : []


Name : gatk_bqsr
Inputs : [[0, 'ref_fasta'], [1, 'ref_index'], [2, 'gatk_mills'], [3, 'gatk_mills_index'], [4, 'gatk_1kg'], [5, 'gatk_1kg_index'], [6, 'rmdup_bams']]
Outputs : [[0, 'bqsr_bams']]
Emits : []


Name : samtools_final_bam
Inputs : [[0, 'bqsr_bams']]
Outputs : [[0, 'final_bams']]
Emits : []


Name : samtools_mpileup
Inputs : [[0, 'ref_fasta'], [1, 'final_bams']]
Outputs : [[0, 'mpileups']]
Emits : []


Name : sequenza_pileup2seqz
Inputs : [[0, 'gc_window'], [1, 'paired_mpileups']]
Outputs : [[0, 'sequenza_seqz']]
Emits : []


Name : sequenza_seqz_binning
Inputs : [[0, 'sequenza_seqz']]
Outputs : [[0, 'binned_seqz']]
Emits : []


Name : sequenza_R
Inputs : [[0, 'binned_seqz']]
Outputs : [[0, 'sequenza_R_files']]
Emits : []


Name : loh_score
Inputs : [[0, 'centromere_file'], [1, 'sequenza_R_files']]
Outputs : [[0, 'scoring_output']]
Emits : []


