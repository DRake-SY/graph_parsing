Name : fastqc_pre_fastp
Inputs : [[0, 'reads_pair_fastqc_pre']]
Outputs : []
Emits : []


Name : fastp
Inputs : [[0, 'reads_pair_fastp']]
Outputs : [[0, 'fastp_out_ch_fastqc'], [1, 'fastp_out_ch_map'], [2, 'fastp_out_ch_spades']]
Emits : []


Name : fastqc_post_fastp
Inputs : [[0, 'fastp_out_ch_fastqc']]
Outputs : []
Emits : []


Name : bwa_index
Inputs : [[0, 'fasta_ref']]
Outputs : [[0, 'bwa_index_ch']]
Emits : []


Name : bwa_mem
Inputs : [[0, 'fastp_out_ch_map'], [1, 'bwa_index_ch'], [2, 'fasta_ref']]
Outputs : [[0, 'bwa_mem_out_ch']]
Emits : []


Name : samtools_get_bam
Inputs : [[0, 'bwa_mem_out_ch']]
Outputs : [[0, 'bam_out_ch']]
Emits : []


Name : samtools_get_flagstat
Inputs : [[0, 'bam_out_ch']]
Outputs : []
Emits : []


Name : rna_spades_assembly
Inputs : [[0, 'fastp_out_ch_spades']]
Outputs : [[0, 'spades_out_ch']]
Emits : []


Name : rna_quast
Inputs : [[0, 'spades_out_ch'], [1, 'gff_ref'], [2, 'fasta_ref']]
Outputs : []
Emits : []


