Name : validate_reads
Inputs : [[0, 'samples_ch']]
Outputs : [[0, 'samples_to_qual'], [1, 'samples_to_filt'], [2, 'samples_to_validate'], [3, 'samples_to_index']]
Emits : []


Name : fastqc
Inputs : [[0, 'samples_to_qual']]
Outputs : [[0, 'fastqc_files_ch'], [0, 'fastqc_files2_ch']]
Emits : []


Name : multiqc
Inputs : [[0, 'fastqc_files_ch']]
Outputs : [[0, 'multiqc_report']]
Emits : []


Name : summarise_index
Inputs : [[0, 'samples_to_index']]
Outputs : [[0, 'index_count'], [1, 'undetermined_counts']]
Emits : []


Name : index_calc
Inputs : [[0, 'index_count'], [1, 'undetermined_counts']]
Outputs : []
Emits : []


Name : nfilter
Inputs : [[0, 'samples_to_filt']]
Outputs : [[0, 'filt_step2'], [1, 'filt_step3Trimming'], [2, 'forprimers'], [3, 'revprimers'], [4, 'rcfor'], [5, 'rcrev']]
Emits : []


Name : cutadapt
Inputs : [[0, 'filt_step2'], [1, 'forprimers'], [2, 'revprimers'], [3, 'rcfor'], [4, 'rcrev']]
Outputs : [[0, 'filt_step3'], [1, 'cutadaptToMultiQC'], [2, 'demux_to_validate']]
Emits : []


Name : filter_and_trim
Inputs : [[0, 'filt_step3'], [0, 'filt_step3Trimming']]
Outputs : [[0, 'filteredReadsforQC'], [0, 'filteredReads'], [1, 'filtReadsErr'], [2, 'filtReads'], [3, 'trimTracking']]
Emits : []


Name : fastqc_filtered
Inputs : [[0, 'filteredReadsforQC']]
Outputs : [[0, 'fastqc_files_post']]
Emits : []


Name : multiqc_filtered
Inputs : [[0, 'fastqc_files2_ch'], [1, 'fastqc_files_post'], [2, 'cutadaptToMultiQC']]
Outputs : [[0, 'multiqc_report_post']]
Emits : []


Name : merge_trimmed_table
Inputs : [[0, 'trimTracking']]
Outputs : [[0, 'trimmed_read_tracking']]
Emits : []


Name : dada2_learn_errors
Inputs : [[0, 'filtReadsErrKey']]
Outputs : [[0, 'errorsFor'], [1, 'errorsRev']]
Emits : []


Name : dada2_pooled
Inputs : [[0, 'filtReadsKey'], [1, 'errorsFor'], [2, 'errorsRev']]
Outputs : [[0, 'seqTable'], [0, 'rawSeqTableToRename'], [1, 'merged_read_tracking'], [2, 'dada_for_read_tracking'], [3, 'dada_rev_read_tracking']]
Emits : []


Name : dada2_persample
Inputs : [[0, 'filteredReads'], [1, 'errorsFor'], [2, 'errorsRev']]
Outputs : [[0, 'seqTable'], [1, 'merged_read_tracking'], [2, 'dada_for_read_tracking'], [3, 'dada_rev_read_tracking']]
Emits : []


Name : merge_dada_rds
Inputs : [[0, 'dadaFor'], [1, 'dadaRev']]
Outputs : [[0, 'dada_for_read_tracking'], [1, 'dada_rev_read_tracking']]
Emits : []


Name : make_seqtab
Inputs : [[0, 'mergedReads']]
Outputs : [[0, 'seqTable'], [0, 'rawSeqTableToRename'], [1, 'merged_read_tracking']]
Emits : []


Name : asv_filter
Inputs : [[0, 'seqTable'], [1, 'phmm_ch']]
Outputs : [[0, 'seqtab_to_tax'], [0, 'seqtab_to_exact'], [0, 'seqtab_to_blast'], [0, 'seqtab_to_rename'], [0, 'seqtab_to_output'], [0, 'seqtab_read_tracking'], [3, 'asv_read_tracking']]
Emits : []


Name : assign_tax_rdp
Inputs : [[0, 'seqtab_to_tax'], [1, 'ref_file']]
Outputs : [[0, 'tax_to_combine'], [1, 'bootstrapFinal']]
Emits : []


Name : assign_tax_idtaxa
Inputs : [[0, 'seqtab_to_tax'], [1, 'ref_file']]
Outputs : [[0, 'tax_to_combine'], [1, 'bootstrapFinal']]
Emits : []


Name : assign_tax_exact
Inputs : [[0, 'seqtab_to_exact'], [1, 'species_file']]
Outputs : [[0, 'exact_to_combine']]
Emits : []


Name : assign_tax_blast
Inputs : [[0, 'seqtab_to_blast'], [1, 'blast_file']]
Outputs : [[0, 'blast_to_combine']]
Emits : []


Name : combine_tax
Inputs : [[0, 'tax_to_combine'], [1, 'exact_to_combine'], [2, 'blast_to_combine']]
Outputs : [[0, 'taxtab_to_output']]
Emits : []


Name : output_asvs
Inputs : [[0, 'seqtab_to_rename'], [1, 'rawSeqTableToRename']]
Outputs : [[0, 'seqsToAln']]
Emits : []


Name : align_seqs_decipher
Inputs : [[0, 'seqsToAln']]
Outputs : [[0, 'alnFile'], [0, 'aln_to_output']]
Emits : []


Name : make_tree_phangorn
Inputs : [[0, 'alnFile']]
Outputs : [[0, 'treeRDS'], [1, 'treeFile'], [2, 'treeGTRFile']]
Emits : []


Name : make_tree_fasttree
Inputs : [[0, 'alnFile']]
Outputs : [[0, 'treeGTRFile']]
Emits : []


Name : root_tree
Inputs : [[0, 'treeGTRFile']]
Outputs : [[0, 'tree_to_output']]
Emits : []


Name : track_reads
Inputs : [[0, 'trimmed_read_tracking'], [1, 'merged_read_tracking'], [2, 'dada_for_read_tracking'], [3, 'dada_rev_read_tracking'], [4, 'seqtab_read_tracking'], [5, 'asv_read_tracking']]
Outputs : []
Emits : []


Name : create_samdf
Inputs : [[0, 'samplesheet_ch'], [1, 'runparams_ch'], [2, 'samples_to_validate'], [3, 'demux_to_validate']]
Outputs : [[0, 'samdf_to_output']]
Emits : []


Name : make_phyloseq
Inputs : [[0, 'seqtab_to_output'], [1, 'samdf_to_output'], [2, 'taxtab_to_output'], [3, 'bootstrapFinal'], [4, 'tree_to_output'], [5, 'aln_to_output']]
Outputs : [[0, 'ps_to_filter'], [0, 'ps_to_export']]
Emits : []


Name : filter_phyloseq
Inputs : [[0, 'ps_to_filter']]
Outputs : [[0, 'tax_check_ala'], [0, 'tax_check_afd'], [0, 'ps_to_export2']]
Emits : []


Name : output_unfiltered
Inputs : [[0, 'ps_to_export']]
Outputs : []
Emits : []


Name : output_filtered
Inputs : [[0, 'ps_to_export2']]
Outputs : []
Emits : []


Name : check_ala
Inputs : [[0, 'tax_check_ala']]
Outputs : []
Emits : []


Name : check_afd
Inputs : [[0, 'tax_check_afd']]
Outputs : []
Emits : []


