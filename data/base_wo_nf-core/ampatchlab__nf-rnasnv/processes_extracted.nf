Name : gunzip_fasta
Inputs : [[0, 'fasta_file']]
Outputs : [[0, 'gunzipped_fasta']]
Emits : []


Name : gunzip_gtf
Inputs : [[0, 'gtf_file']]
Outputs : [[0, 'gunzipped_gtf']]
Emits : []


Name : star_index
Inputs : [[0, 'ref_fasta'], [1, 'ref_gtf']]
Outputs : [[0, 'star_index']]
Emits : []


Name : samtools_faidx
Inputs : [[0, 'ref_fasta']]
Outputs : [[0, 'ref_faidx']]
Emits : []


Name : unpack_cache
Inputs : [[0, 'vep_indexed_cache_file']]
Outputs : [[0, 'indexed_vep_cache']]
Emits : []


Name : fastqc_raw
Inputs : [[0, 'fastqc_raw_rgids'], [1, 'fastqc_raw_r1_inputs'], [2, 'fastqc_raw_r2_inputs']]
Outputs : [[0, 'fastqc_raw_results']]
Emits : []


Name : cutadapt
Inputs : [[0, 'cutadapt_rgids'], [1, 'cutadapt_r1_inputs'], [2, 'cutadapt_r2_inputs']]
Outputs : [[0, 'fastqc_trimmed_inputs'], [0, 'trimmed_readgroups'], [1, 'cutadapt_logs']]
Emits : []


Name : fastqc_trimmed
Inputs : [[0, 'fastqc_trimmed_inputs']]
Outputs : [[0, 'fastqc_trimmed_results']]
Emits : []


Name : star
Inputs : [[0, 'star_inputs'], [1, 'star_index']]
Outputs : [[0, 'star_alignments'], [1, 'star_csorted_bam_files'], [1, 'star_sorted_alignments'], [2, 'star_signal_output'], [3, 'star_splice_junctions'], [4, 'star_logs']]
Emits : []


Name : samtools_index
Inputs : [[0, 'star_csorted_bam_files']]
Outputs : []
Emits : []


Name : mark_duplicates
Inputs : [[0, 'star_sorted_alignments']]
Outputs : [[0, 'duplicate_marked_alignments'], [0, 'mpileup_alignments'], [1, 'mark_duplicates_metrics']]
Emits : []


Name : strelka
Inputs : [[0, 'duplicate_marked_alignments'], [1, 'ref_fasta'], [2, 'ref_faidx']]
Outputs : [[0, 'strelka_variants']]
Emits : []


Name : subset_pass_variants
Inputs : [[0, 'strelka_variants']]
Outputs : [[0, 'pass_variants']]
Emits : []


Name : convert2bed
Inputs : [[0, 'pass_variants']]
Outputs : [[0, 'bed_regions']]
Emits : []


Name : split_regions
Inputs : [[0, 'bed_regions']]
Outputs : [[0, 'regions_files']]
Emits : []


Name : mpileup
Inputs : [[0, 'regions_files'], [1, 'ref_fasta'], [2, 'ref_faidx']]
Outputs : [[0, 'mpileup_region_variants']]
Emits : []


Name : concat
Inputs : [[0, 'mpileup_region_variants']]
Outputs : [[0, 'soft_filtered_variants'], [1, 'raw_variant_stats']]
Emits : []


Name : filter
Inputs : [[0, 'soft_filtered_variants']]
Outputs : [[0, 'filtered_variants'], [1, 'filtered_variant_stats']]
Emits : []


Name : vep
Inputs : [[0, 'filtered_variants'], [1, 'indexed_vep_cache'], [2, 'ref_fasta'], [3, 'ref_faidx']]
Outputs : [[0, 'vep_results'], [1, 'vep_stats']]
Emits : []


Name : vepvcf2csv
Inputs : [[0, 'vep_results']]
Outputs : [[0, 'sample']]
Emits : []


Name : multiqc
Inputs : [[0, 'multiqc_cfg'], [1, 'fastqc_raw_results'], [2, 'cutadapt_logs'], [3, 'fastqc_trimmed_results'], [4, 'star_logs'], [5, 'mark_duplicates_metrics'], [6, 'raw_variant_stats'], [7, 'filtered_variant_stats']]
Outputs : [[0, 'multiqc_report']]
Emits : []


