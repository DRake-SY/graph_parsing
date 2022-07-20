Name : make_STAR_index
Inputs : [[0, 'idx_fasta'], [1, 'idx_gtf']]
Outputs : [[0, 'star_index']]
Emits : []


Name : fastqc
Inputs : [[0, 'raw_fastqc']]
Outputs : [[0, 'fastqc_results']]
Emits : []


Name : trim
Inputs : [[0, 'raw_trimgalore']]
Outputs : [[0, 'trimmed_reads'], [1, 'trimgalore_results'], [2, 'trimgalore_fastqc_reports']]
Emits : []


Name : star
Inputs : [[0, 'trimmed_reads'], [1, 'star_index'], [2, 'gen_gtf']]
Outputs : [[0, 'star_aligned'], [1, 'alignment_logs'], [3, 'star_log'], [4, 'bam_index_rseqc'], [4, 'bam_index_genebody'], [5, 'raw_counts'], [6, 'bams']]
Emits : []


Name : mixcr
Inputs : [[0, 'trimmed_reads']]
Outputs : [[0, 'mixcr_out']]
Emits : []


Name : opossum
Inputs : [[0, 'bams']]
Outputs : [[0, 'platypus_in']]
Emits : []


Name : platypus
Inputs : [[0, 'platypus_in'], [1, 'raw_fasta']]
Outputs : [[0, 'platypus_vcf'], [1, 'platypus_index']]
Emits : []


Name : common_variants
Inputs : [[0, 'platypus_vcf'], [1, 'platypus_index']]
Outputs : [[0, 'present_variants']]
Emits : []


Name : snpEff
Inputs : [[0, 'present_variants']]
Outputs : [[0, 'snp_effects']]
Emits : []


Name : create_alt
Inputs : [[0, 'snp_effects'], [1, 'alt_fasta']]
Outputs : [[0, 'alt_genome']]
Emits : []


Name : gene_fasta
Inputs : [[0, 'alt_genome'], [1, 'trans_gtf']]
Outputs : [[0, 'gene_fasta']]
Emits : []


