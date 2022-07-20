Name : index_genome
Inputs : [[0, 'genomeFasta'], [1, 'genomeAnnotations']]
Outputs : [[0, 'genome_euk_tRNA'], [0, 'genome_mit_tRNA'], [0, 'genome_prepare'], [0, 'genome_annotations'], [2, 'geome_fai'], [3, 'genome_fasta']]
Emits : []


Name : eukaryotic_tRNAscan
Inputs : [[0, 'genome_euk_tRNA']]
Outputs : [[0, 'eukar_tRNAs_bed']]
Emits : []


Name : mitochondrial_tRNAscan
Inputs : [[0, 'genome_euk_tRNA']]
Outputs : [[0, 'mito_tRNAs_bed']]
Emits : []


Name : create_genomes
Inputs : [[0, 'eukar_tRNAs_bed'], [1, 'mito_tRNAs_bed'], [2, 'genome_prepare'], [3, 'genomeAnnotations']]
Outputs : [[11, 'star_genome'], [12, 'gatk_splitCigar'], [12, 'gatk_bqsr1'], [12, 'gatk_bqsr2'], [12, 'gatk_hap1'], [12, 'gatk_hap2'], [12, 'gatk_annot']]
Emits : []


Name : star_reference
Inputs : [[0, 'star_genome']]
Outputs : [[1, 'starIndex']]
Emits : []


Name : extract_annotations
Inputs : [[0, 'genome_annotations'], [1, 'genomeAnnotations']]
Outputs : [[0, 'annotations'], [3, 'annotationFeather'], [4, 'annotationPickle']]
Emits : []


Name : depletion_reference
Inputs : [[0, 'depleteFasta']]
Outputs : [[1, 'depletionIndex']]
Emits : []


Name : raw_fastqc
Inputs : [[0, 'raw_reads_fastqc']]
Outputs : [[0, 'multiqc_fastqc']]
Emits : []


Name : trim
Inputs : [[0, 'raw_reads_trim']]
Outputs : [[0, 'trimmed_fastq'], [0, 'trimmed_reads_fastqc'], [1, 'multiqc_cutadapt']]
Emits : []


Name : trimmed_fastqc
Inputs : [[0, 'trimmed_reads_fastqc']]
Outputs : [[0, 'multiqc_trimmed_fastqc']]
Emits : []


Name : bwa_depletion
Inputs : [[0, 'depletionIndex'], [1, 'trimmed_fastq']]
Outputs : [[0, 'depleted_reads_first'], [0, 'depleted_reads_second'], [0, 'depleted_reads_fastqc']]
Emits : []


Name : depleted_fastqc
Inputs : [[0, 'depleted_reads_fastqc']]
Outputs : [[0, 'multiqc_depleted_fastqc']]
Emits : []


Name : STAR
Inputs : [[0, 'starIndex'], [1, 'depleted_reads_first']]
Outputs : [[0, 'multiqc_star'], [1, 'aligned_genome'], [2, 'aligned_transcriptome']]
Emits : []


Name : STARsolo_first
Inputs : [[0, 'whitelist'], [1, 'starIndex'], [2, 'depleted_reads_first']]
Outputs : [[0, 'sjtab_first']]
Emits : []


Name : STARsolo_second
Inputs : [[0, 'whitelist'], [1, 'starIndex'], [2, 'depleted_reads_second'], [3, 'sjtab_first']]
Outputs : [[1, 'multiqc_star'], [2, 'aligned_genome'], [3, 'aligned_transcriptome']]
Emits : []


Name : dedup_genome
Inputs : [[0, 'aligned_genome']]
Outputs : [[0, 'deduplicated_genome'], [1, 'multiqc_deduplicate_genome']]
Emits : []


Name : sort_dedup_genome
Inputs : [[0, 'deduplicated_genome']]
Outputs : [[0, 'sorted_deduplicated_genome']]
Emits : []


Name : merge_genome
Inputs : [[0, 'sorted_deduplicated_genome']]
Outputs : [[0, 'merged_genome']]
Emits : []


Name : scatter_splitCigar
Inputs : [[0, 'merged_genome']]
Outputs : [[0, 'splitCigar_scatter']]
Emits : []


Name : splitCigar
Inputs : [[0, 'splitCigar_scatter'], [1, 'gatk_splitCigar']]
Outputs : [[0, 'splitCigar_gather']]
Emits : []


Name : gather_splitCigar
Inputs : [[0, 'splitCigar_gather']]
Outputs : [[0, 'gathered_splitCigar1'], [0, 'gathered_splitCigar2']]
Emits : []


Name : scatter_intervals
Inputs : [[0, 'intervalList']]
Outputs : [[0, 'intervals_hap1'], [0, 'intervals_hap2']]
Emits : []


Name : index_knownVariants
Inputs : [[0, 'knownVariants']]
Outputs : [[0, 'knownVar_bqsr1'], [0, 'knownVar_bqsr2'], [0, 'knownVar_annot']]
Emits : []


Name : bqsr_first
Inputs : [[0, 'gathered_splitCigar1'], [1, 'gatk_bqsr1'], [2, 'knownVar_bqsr1']]
Outputs : [[0, 'recalibrated_first']]
Emits : []


Name : haplotype_first
Inputs : [[0, 'recalibrated_first'], [1, 'gatk_hap1'], [2, 'intervals_hap1']]
Outputs : [[0, 'hap_first']]
Emits : []


Name : merge_first
Inputs : [[0, 'hap_first']]
Outputs : [[1, 'hap_first_merged']]
Emits : []


Name : bqsr_second
Inputs : [[0, 'gathered_splitCigar2'], [1, 'gatk_bqsr2'], [2, 'hap_first_merged'], [3, 'knownVar_bqsr2']]
Outputs : [[0, 'recalibrated_second']]
Emits : []


Name : haplotype_second
Inputs : [[0, 'recalibrated_second'], [1, 'gatk_hap2'], [2, 'intervals_hap2']]
Outputs : [[0, 'hap_second']]
Emits : []


Name : merge_second
Inputs : [[0, 'hap_second']]
Outputs : [[1, 'hap_second_merged']]
Emits : []


Name : select_annotate_variants
Inputs : [[0, 'hap_second_merged'], [1, 'exonsIntervals'], [2, 'intronsIntervals'], [3, 'gatk_annot'], [4, 'exonsBed'], [5, 'knownVar_annot']]
Outputs : []
Emits : []


Name : multiQC
Inputs : [[0, 'multiqc_fastqc'], [1, 'multiqc_trimmed_fastqc'], [2, 'multiqc_depleted_fastqc'], [3, 'multiqc_cutadapt'], [4, 'multiqc_star'], [5, 'multiqc_deduplicate_genome']]
Outputs : []
Emits : []


