Name : trimming
Inputs : [[0, 'ch_trimming']]
Outputs : [[0, 'ch_fastq1'], [0, 'ch_fastq2']]
Emits : []


Name : merge
Inputs : [[0, 'ch_fastq_r1'], [1, 'ch_fastq_r2']]
Outputs : [[0, 'ch_fq_merged'], [0, 'ch_fq_merged2bam']]
Emits : []


Name : spades
Inputs : [[0, 'ch_fq_merged']]
Outputs : [[0, 'spades_output'], [1, 'spades2blastn_tx'], [1, 'spades2blastn2parser'], [1, 'spades2qc']]
Emits : []


Name : blastnt_known
Inputs : [[0, 'spades2blastn_tx'], [1, 'tx_fasta']]
Outputs : [[0, 'blastn_known'], [0, 'blastn2qc']]
Emits : []


Name : blastnt_parse
Inputs : [[0, 'spades2blastn2parser'], [1, 'blastn_known']]
Outputs : [[0, 'tx_unknown1'], [0, 'tx_unknown2']]
Emits : []


Name : transdec_longorf
Inputs : [[0, 'tx_unknown1']]
Outputs : [[0, 'longorf_dir'], [1, 'longestorf_tx'], [1, 'tdlong2qc']]
Emits : []


Name : blastp
Inputs : [[0, 'prot_fasta'], [1, 'longestorf_tx']]
Outputs : [[0, 'blastp'], [0, 'blastp2qc']]
Emits : []


Name : transdec_predict
Inputs : [[0, 'tx_unknown2'], [1, 'longorf_dir'], [2, 'blastp']]
Outputs : [[1, 'transdecoder_bed'], [1, 'tdpredict2qc'], [2, 'transdecoder_prot']]
Emits : []


Name : pasa
Inputs : [[0, 'transdecoder_prot'], [1, 'fasta']]
Outputs : [[0, 'pasa_gff3']]
Emits : []


Name : annotation
Inputs : [[0, 'transdecoder_bed'], [1, 'pasa_gff3'], [2, 'prot_fasta_ann']]
Outputs : [[0, 'pasa2unify'], [0, 'pasa2qc']]
Emits : []


Name : makeHisatSplicesites
Inputs : [[0, 'gtf_makeHisatSplicesites']]
Outputs : [[0, 'indexing_splicesites'], [0, 'alignment_splicesites']]
Emits : []


Name : makeHISATindex
Inputs : [[0, 'ch_fasta_for_hisat_index'], [1, 'indexing_splicesites'], [2, 'gtf_makeHISATindex']]
Outputs : [[0, 'hs2_indices']]
Emits : []


Name : hisat2Align
Inputs : [[0, 'ch_fq_merged2bam'], [1, 'hs2_indices'], [2, 'alignment_splicesites'], [3, 'ch_where_hisat2']]
Outputs : [[0, 'hisat2_bam'], [1, 'alignment_logs']]
Emits : []


Name : hisat2_sortOutput
Inputs : [[0, 'hisat2_bam']]
Outputs : [[0, 'bam_stringtieFPKM'], [1, 'bam_index']]
Emits : []


Name : stringtieFPKM
Inputs : [[0, 'bam_stringtieFPKM'], [1, 'gtf_stringtieFPKM']]
Outputs : [[1, 'stringtieGTF']]
Emits : []


Name : unify
Inputs : [[0, 'gtf_unify'], [1, 'stringtieGTF'], [2, 'pasa2unify'], [3, 'ucsc2unify']]
Outputs : []
Emits : []


Name : qc
Inputs : [[0, 'spades2qc'], [1, 'blastn2qc'], [2, 'tdlong2qc'], [3, 'blastp2qc'], [4, 'tdpredict2qc'], [5, 'pasa2qc'], [6, 'prot_fasta_qc']]
Outputs : [[0, 'qc']]
Emits : []


Name : multiqc
Inputs : [[0, 'ch_multiqc_config'], [1, 'summary'], [2, 'alignment_logs']]
Outputs : [[0, 'multiqc_report']]
Emits : []


Name : output_documentation
Inputs : [[0, 'ch_output_docs']]
Outputs : []
Emits : []


