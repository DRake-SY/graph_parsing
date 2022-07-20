Name : fastqc
Inputs : [[0, 'raw_reads_fastqc']]
Outputs : [[0, 'fastqc_results'], [1, 'fastqc_stdout']]
Emits : []


Name : trimming
Inputs : [[0, 'raw_reads_trimming']]
Outputs : [[0, 'trimmed_paired_reads'], [0, 'trimmed_paired_reads_bwa'], [0, 'trimmed_paired_reads_bwa_virus'], [1, 'trimmed_unpaired_reads'], [2, 'trimmomatic_fastqc_reports'], [3, 'trimmomatic_results']]
Emits : []


Name : mapping_host
Inputs : [[0, 'trimmed_paired_reads_bwa'], [1, 'host_fasta_file'], [2, 'host_index_files']]
Outputs : [[0, 'mapping_host_sorted_bam'], [1, 'mapping_host_bai'], [2, 'mapping_host_flagstat'], [3, 'mapping_host_picardstats']]
Emits : []


Name : mapping_virus
Inputs : [[0, 'trimmed_paired_reads_bwa_virus'], [1, 'viral_fasta_file'], [2, 'viral_index_files']]
Outputs : [[0, 'mapping_virus_sorted_bam'], [0, 'mapping_virus_sorted_bam_variant_calling'], [0, 'mapping_virus_sorted_bam_consensus'], [1, 'mapping_virus_bai'], [1, 'mapping_virus_bai_variant_calling'], [1, 'mapping_virus_bai_consensus'], [2, 'mapping_virus_flagstat'], [3, 'mapping_virus_picardstats']]
Emits : []


Name : ivar_trimming
Inputs : [[0, 'mapping_virus_sorted_bam_variant_calling'], [1, 'amplicons_bed_file'], [2, 'viral_fasta_file'], [3, 'viral_index_files_ivar']]
Outputs : [[0, 'ivar_sorted_bam'], [0, 'sorted_bam_variant_calling'], [0, 'sorted_bam_consensus'], [1, 'ivar_bai'], [1, 'bam_bai_variant_calling'], [1, 'bai_consensus'], [2, 'ivar_flagstat'], [3, 'ivar_picardstats']]
Emits : []


Name : variant_calling
Inputs : [[0, 'sorted_bam_variant_calling'], [1, 'bam_bai_variant_calling'], [2, 'viral_fasta_file'], [3, 'viral_index_files_variant_calling']]
Outputs : [[0, 'variant_calling_pileup'], [1, 'majority_allele_vcf'], [1, 'majority_allele_vcf_annotation'], [1, 'majority_allele_vcf_consensus'], [2, 'lowfreq_variants_vcf'], [2, 'lowfreq_variants_vcf_annotation']]
Emits : []


Name : variant_calling_annotation
Inputs : [[0, 'majority_allele_vcf_annotation'], [1, 'lowfreq_variants_vcf_annotation']]
Outputs : [[0, 'majority_annotated_variants'], [1, 'majority_snpeff_genes'], [2, 'majority_snpeff_summary'], [3, 'lowfreq_annotated_variants'], [4, 'lowfreq_snpeff_genes'], [5, 'lowfreq_snpeff_summary'], [6, 'snpsift_majority_table'], [7, 'snpsift_lowfreq_table']]
Emits : []


Name : genome_consensus
Inputs : [[0, 'majority_allele_vcf_consensus'], [1, 'viral_fasta_file'], [2, 'sorted_bam_consensus'], [3, 'bai_consensus']]
Outputs : [[0, 'consensus_fasta'], [1, 'masked_fasta']]
Emits : []


Name : multiqc
Inputs : [[0, 'multiqc_config'], [1, 'fastqc_results'], [2, 'trimmomatic_results'], [3, 'trimmomatic_fastqc_reports'], [4, 'mapping_host_flagstat'], [5, 'mapping_host_picardstats'], [6, 'mapping_virus_flagstat'], [7, 'mapping_virus_picardstats'], [8, 'ivar_flagstat'], [9, 'ivar_picardstats'], [10, 'majority_snpeff_summary'], [11, 'lowfreq_snpeff_summary']]
Outputs : [[0, 'multiqc_report'], [1, 'multiqc_data'], [2, 'multiqc_prefix']]
Emits : []


Name : output_documentation
Inputs : [[0, 'ch_output_docs']]
Outputs : []
Emits : []


