Name : fastqc
Inputs : [[0, 'reads_fastqc']]
Outputs : [[0, 'fastqc_results']]
Emits : []


Name : adapter_removal_ancient_dna_PE
Inputs : [[0, 'reads_to_trim']]
Outputs : [[0, 'trimmed_reads_assembly'], [0, 'trimmed_reads_mapping'], [0, 'trimmed_reads_kraken'], [0, 'trimmed_reads_metaphlan'], [0, 'trimmed_reads_malt'], [1, 'adapter_removal_results']]
Emits : []


Name : megahit_assembly
Inputs : [[0, 'trimmed_reads_assembly']]
Outputs : [[0, 'contigs_mapping'], [0, 'contigs_filter']]
Emits : []


Name : bowtie_index_contigs
Inputs : [[0, 'contigs_mapping']]
Outputs : [[0, 'bt_index']]
Emits : []


Name : align_reads_to_contigs
Inputs : [[0, 'trimmed_reads_mapping'], [0, 'bt_index']]
Outputs : [[0, 'alignment_to_index'], [0, 'alignment_to_coverage'], [0, 'alignment_to_sam']]
Emits : []


Name : bam_index
Inputs : [[0, 'alignment_to_index']]
Outputs : [[0, 'name']]
Emits : []


Name : bam2sam
Inputs : [[0, 'alignment_to_sam']]
Outputs : [[0, 'alignment_sam']]
Emits : []


Name : bedtools_genomecov
Inputs : [[0, 'alignment_to_coverage']]
Outputs : [[0, 'bedfile']]
Emits : []


Name : filter_contigs
Inputs : [[0, 'bedfile']]
Outputs : [[0, 'contig_coverage'], [1, 'filtered_contigs_sam'], [1, 'filtered_contigs_fasta']]
Emits : []


Name : filter_fasta_coverage
Inputs : [[0, 'contigs_filter'], [0, 'filtered_contigs_fasta']]
Outputs : [[0, 'filtered_fasta_coverage']]
Emits : []


Name : filter_fasta_length
Inputs : [[0, 'filtered_fasta_coverage']]
Outputs : [[0, 'fasta2megablast']]
Emits : []


Name : kraken
Inputs : [[0, 'trimmed_reads_kraken']]
Outputs : [[0, 'kraken_output']]
Emits : []


Name : kraken_report
Inputs : [[0, 'kraken_output']]
Outputs : [[0, 'kraken_res']]
Emits : []


Name : metaphlan
Inputs : [[0, 'trimmed_reads_metaphlan']]
Outputs : [[0, 'metaphlan_res']]
Emits : []


Name : megablast
Inputs : [[0, 'fasta2megablast']]
Outputs : [[0, 'blast_output']]
Emits : []


Name : basta_from_blast
Inputs : [[0, 'blast_output']]
Outputs : [[0, 'blast_res']]
Emits : []


Name : malt
Inputs : [[0, 'trimmed_reads_malt']]
Outputs : [[0, 'malt_output'], [1, 'malt_rma']]
Emits : []


Name : malt_convert
Inputs : [[0, 'malt_output']]
Outputs : [[0, 'malt_converted']]
Emits : []


Name : basta_from_malt
Inputs : [[0, 'malt_converted']]
Outputs : [[0, 'malt_res']]
Emits : []


Name : summarize_results
Inputs : [[0, 'metaphlan_res'], [0, 'kraken_res'], [0, 'malt_res'], [0, 'blast_res']]
Outputs : [[0, 'summary_result']]
Emits : []


Name : multiqc
Inputs : [[0, 'fastqc_results'], [1, 'adapter_removal_results']]
Outputs : [[0, 'multiqc_report'], [1, 'multiqc_data']]
Emits : []


