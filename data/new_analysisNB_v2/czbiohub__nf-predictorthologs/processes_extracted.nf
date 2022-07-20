Name : get_software_versions
Inputs : []
Outputs : [[0, 'ch_software_versions_yaml']]
Emits : []


Name : sambamba_dedup
Inputs : [[0, 'ch_bam_for_dedup']]
Outputs : [[0, 'ch_dedup_bam_for_index'], [0, 'ch_dedup_bam_for_samtools_fastq']]
Emits : []


Name : sambamba_index
Inputs : [[0, 'ch_dedup_bam_for_index']]
Outputs : [[0, 'ch_dedup_bai']]
Emits : []


Name : samtools_fastq_no_intersect
Inputs : [[0, 'ch_dedup_bam_for_samtools_fastq']]
Outputs : [[0, 'ch_intersected']]
Emits : []


Name : samtools_view_fastq
Inputs : [[0, 'ch_bed_bam_bai']]
Outputs : [[0, 'ch_intersected']]
Emits : []


Name : fastqc
Inputs : [[0, 'ch_read_files_fastqc']]
Outputs : [[0, 'ch_fastqc_results']]
Emits : []


Name : fastp
Inputs : [[0, 'ch_read_files_trimming']]
Outputs : [[0, 'ch_reads_trimmed'], [1, 'ch_fastp_results'], [2, 'ch_fastp_html']]
Emits : []


Name : make_protein_index
Inputs : [[0, 'ch_proteome_translate_fasta'], [1, 'ch_translate_molecule_ksize']]
Outputs : [[0, 'ch_sencha_bloom_filters']]
Emits : []


Name : translate
Inputs : [[1, 'bloom_id'], [1, 'alphabet'], [1, 'ksize'], [1, 'bloom_filter'], [2, 'ch_sencha_bloom_filters_grouptuple']]
Outputs : [[0, 'ch_noncoding_nucleotides_potentially_empty'], [1, 'ch_translated_proteins_potentially_empty'], [2, 'ch_coding_nucleotides'], [3, 'ch_coding_scores_csv'], [4, 'ch_coding_scores_json']]
Emits : []


Name : diff_hash
Inputs : [[0, 'ch_groups_with_all_signatures_for_diff_hash'], [1, 'ch_csv']]
Outputs : [[2, 'ch_informative_hashes_files']]
Emits : []


Name : sigs_with_hash
Inputs : [[0, 'ch_informative_hashes_flattened'], [1, 'ch_all_signatures_flattened_for_finding_matches']]
Outputs : []
Emits : []


Name : download_refseq
Inputs : []
Outputs : [[0, '']]
Emits : []


Name : hash2kmer
Inputs : [[0, 'ch_hashes_with_fastas_for_hash2kmer']]
Outputs : [[0, 'kmers'], [1, 'ch_seqs_from_hash2kmer'], [1, 'ch_seqs_from_hash2kmer_to_print'], [1, 'ch_seqs_from_hash2kmer_for_bam_of_hashes'], [2, 'ch_seqs_with_hashes_for_filter_unaligned_reads'], [2, 'ch_seqs_with_hashes_for_bam_of_hashes']]
Emits : []


Name : diamond_prepare_taxa
Inputs : [[0, 'ch_diamond_taxdmp_zip']]
Outputs : [[0, 'ch_diamond_taxonnodes'], [1, 'ch_diamond_taxonnames']]
Emits : []


Name : diamond_makedb
Inputs : [[0, 'ch_diamond_reference_fasta'], [1, 'ch_diamond_taxonnodes'], [2, 'ch_diamond_taxonnames'], [3, 'ch_diamond_taxonmap_gz']]
Outputs : [[0, 'ch_diamond_db']]
Emits : []


Name : diamond_blastp
Inputs : [[0, 'ch_diamond_db'], [1, 'ch_protein_seq_for_diamond']]
Outputs : [[0, 'ch_diamond_blastp_output']]
Emits : []


Name : hash2sig
Inputs : [[0, 'ch_hashes_for_hash2sig']]
Outputs : [[0, 'ch_hash_sigs_from_hash2sig_to_print'], [0, 'ch_hash_sigs_from_hash2sig_to_join']]
Emits : []


Name : sourmash_db_compute
Inputs : [[0, 'ch_sourmash_reference_fasta']]
Outputs : [[0, 'output_log'], [1, 'ch_proteome_sig_for_sourmash_index']]
Emits : []


Name : sourmash_db_index
Inputs : [[0, 'ch_proteome_sig_for_sourmash_index']]
Outputs : [[0, 'ch_sourmash_index']]
Emits : []


Name : is_hash_in_unaligned
Inputs : [[0, 'ch_group_to_hash_sig_with_group_unaligned_sigs']]
Outputs : [[0, 'ch_hash_sigs_in_unaligned']]
Emits : []


Name : sourmash_db_search
Inputs : [[0, 'ch_sourmash_index'], [1, 'ch_group_hash_sigs_to_query']]
Outputs : []
Emits : []


Name : gunzip_infernal_cm
Inputs : [[0, 'ch_infernal_db_gz']]
Outputs : [[0, 'ch_infernal_cm']]
Emits : []


Name : prepare_infernal_db
Inputs : [[0, 'ch_infernal_cm']]
Outputs : [[0, 'ch_infernal_db']]
Emits : []


Name : search_noncoding
Inputs : [[0, 'ch_infernal_db'], [1, 'ch_rfam_clan_info'], [2, 'ch_noncoding_nucleotides']]
Outputs : [[0, 'ch_infernal_results']]
Emits : []


Name : multiqc
Inputs : [[0, 'ch_multiqc_config'], [1, 'ch_multiqc_custom_config'], [2, 'ch_fastqc_results'], [3, 'ch_software_versions_yaml'], [4, 'ch_fastp_results'], [5, 'summary']]
Outputs : [[0, 'ch_multiqc_report']]
Emits : []


Name : output_documentation
Inputs : [[0, 'ch_output_docs']]
Outputs : []
Emits : []


