OPERATION_1 string : ch_multiqc_custom_config = Channel.fromPath(params.multiqc_config, checkIfExists: true)
OPERATION_1 origin : [['params.multiqc_config, checkIfExists: true', 'A']]
OPERATION_1 gives  : [['ch_multiqc_custom_config', 'P']]


OPERATION_2 string : ch_multiqc_custom_config = Channel.empty()
OPERATION_2 origin : []
OPERATION_2 gives  : [['ch_multiqc_custom_config', 'P']]


OPERATION_3 string : Channel.fromPath(params.hashes)
      .ifEmpty { exit 1, "params.hashes was empty - no input files supplied" }
      .splitText()
      .map{ row -> tuple("hash", row.replaceAll("\\s+", "") )}
      .transpose()
      .dump( tag: 'ch_hash_to_group' )
      .into { ch_hash_to_group_for_joining; ch_hash_to_group_for_hash2kmer }
OPERATION_3 origin : [['params.hashes', 'A']]
OPERATION_3 gives  : [['ch_hash_to_group_for_joining', 'P'], ['ch_hash_to_group_for_hash2kmer', 'P']]


OPERATION_4 string : Channel.fromPath(params.bai)
        .ifEmpty { exit 1, "params.bai was empty - no input files supplied" }
        .set { ch_bai }
OPERATION_4 origin : [['params.bai', 'A']]
OPERATION_4 gives  : [['ch_bai', 'P']]


OPERATION_5 string : Channel.fromPath(params.bam)
        .ifEmpty { exit 1, "params.bam was empty - no input files supplied" }
        .combine(ch_bai)
        .set { ch_bam_bai }
OPERATION_5 origin : [['ch_bai', 'P'], ['params.bam', 'A']]
OPERATION_5 gives  : [['ch_bam_bai', 'P']]


OPERATION_6 string : Channel.fromPath(params.bed)
        .ifEmpty { exit 1, "params.bed was empty - no input files supplied" }
        .splitText()
        .map {row -> row.split()}
        .map { row -> [ row[3], row[0], row[1], row[2] ] }                                           
        .combine(ch_bam_bai)
        .dump ( tag: 'ch_bam_bai' )
        .set {ch_bed_bam_bai}
OPERATION_6 origin : [['ch_bam_bai', 'P'], ['params.bed', 'A']]
OPERATION_6 gives  : [['ch_bed_bam_bai', 'P']]


OPERATION_7 string : Channel.fromPath(params.bam)
        .ifEmpty { exit 1, "params.bam was empty, no input file supplied" }
        .into { ch_bam_for_dedup }
OPERATION_7 origin : [['params.bam', 'A']]
OPERATION_7 gives  : [['ch_bam_for_dedup', 'P']]


OPERATION_8 string : Channel.fromPath(params.protein_fastas)
        .ifEmpty { exit 1, "params.protein_fastas was empty - no input files supplied" }
        .dump ( tag: 'ch_protein_fastas' )
        .set { ch_protein_fastas }
OPERATION_8 origin : [['params.protein_fastas', 'A']]
OPERATION_8 gives  : [['ch_protein_fastas', 'P']]


OPERATION_9 string : Channel
      .fromPath(params.csv)
      .splitCsv(header:true)
      .map{ row -> tuple(row.sample_id, tuple(file(row.fasta)))}
      .ifEmpty { exit 1, "params.csv (${params.csv}) was empty - no input files supplied" }
      .dump( tag: 'ch_protein_fastas__from_csv' )
      .set { ch_protein_fastas }
OPERATION_9 origin : [['params.csv', 'A']]
OPERATION_9 gives  : [['ch_protein_fastas', 'P']]


OPERATION_10 string : Channel
      .from(params.protein_fasta_paths)
      .map { row -> file(row[1][0], checkIfExists: true) }
      .ifEmpty { exit 1, "params.protein_fasta_paths was empty - no input files supplied" }
      .dump(tag: "protein_fasta_paths")
      .set { ch_protein_fastas }
OPERATION_10 origin : [['params.protein_fasta_paths', 'V']]
OPERATION_10 gives  : [['ch_protein_fastas', 'P']]


OPERATION_11 string : Channel
        .fromPath(params.csv)
        .splitCsv(header:true)
        .map{ row -> tuple(row.sample_id, tuple(file(row.read1)))}
        .ifEmpty { exit 1, "params.csv (${params.csv}) was empty - no input files supplied" }
        .dump(tag: "reads_single_end")
        .into { ch_read_files_fastqc; ch_read_files_trimming; ch_read_files_translate }
OPERATION_11 origin : [['params.csv', 'A']]
OPERATION_11 gives  : [['ch_read_files_fastqc', 'P'], ['ch_read_files_trimming', 'P'], ['ch_read_files_translate', 'P']]


OPERATION_12 string : Channel
        .fromPath(params.csv)
        .splitCsv(header:true)
        .map{ row -> tuple(row.sample_id, tuple(file(row.read1), file(row.read2)))}
        .ifEmpty { exit 1, "params.csv (${params.csv}) was empty - no input files supplied" }
        .dump(tag: "reads_paired_end")
        .into { ch_read_files_fastqc; ch_read_files_trimming; ch_read_files_translate }
OPERATION_12 origin : [['params.csv', 'A']]
OPERATION_12 gives  : [['ch_read_files_fastqc', 'P'], ['ch_read_files_trimming', 'P'], ['ch_read_files_translate', 'P']]


OPERATION_13 string : Channel
        .from(params.readPaths)
        .map { row -> [ row[0], [ file(row[1][0], checkIfExists: true) ] ] }
        .ifEmpty { exit 1, "params.readPaths was empty - no input files supplied" }
        .dump(tag: "reads_single_end")
        .into { ch_read_files_fastqc; ch_read_files_trimming; ch_read_files_translate }
OPERATION_13 origin : [['params.readPaths', 'V']]
OPERATION_13 gives  : [['ch_read_files_fastqc', 'P'], ['ch_read_files_trimming', 'P'], ['ch_read_files_translate', 'P']]


OPERATION_14 string : Channel
        .from(params.readPaths)
        .map { row -> [ row[0], [ file(row[1][0], checkIfExists: true), file(row[1][1], checkIfExists: true) ] ] }
        .ifEmpty { exit 1, "params.readPaths was empty - no input files supplied" }
        .dump(tag: "reads_paired_end")
        .into { ch_read_files_fastqc; ch_read_files_trimming; ch_read_files_translate }
OPERATION_14 origin : [['params.readPaths', 'V']]
OPERATION_14 gives  : [['ch_read_files_fastqc', 'P'], ['ch_read_files_trimming', 'P'], ['ch_read_files_translate', 'P']]


OPERATION_15 string : Channel
      .fromFilePairs(params.reads, size: params.single_end ? 1 : 2)
      .ifEmpty { exit 1, "Cannot find any reads matching: ${params.reads}\nNB: Path needs to be enclosed in quotes!\nIf this is single-end data, please specify --single_end on the command line." }
      .dump(tag: "read_paths")
      .into { ch_read_files_fastqc; ch_read_files_trimming }
OPERATION_15 origin : [['params.reads, size: params.single_end ? 1 : 2', 'A']]
OPERATION_15 gives  : [['ch_read_files_fastqc', 'P'], ['ch_read_files_trimming', 'P']]


OPERATION_16 string : Channel.fromPath(params.hashes)
      .ifEmpty { exit 1, "params.hashes was empty - no input files supplied" }
      .splitText()
      .map{ row -> tuple(row.replaceAll("\\s+", ""), "hash" )}
      .transpose()
      .into { ch_hash_to_group_for_joining_after_hash2kmer;
        ch_hash_to_group_for_joining_after_hash2sig;
        ch_hash_to_group_for_hash2kmer;
        ch_hash_to_group_for_hash2sig
       }
OPERATION_16 origin : [['params.hashes', 'A']]
OPERATION_16 gives  : [['ch_hash_to_group_for_joining_after_hash2kmer', 'P'], ['ch_hash_to_group_for_joining_after_hash2sig', 'P'], ['ch_hash_to_group_for_hash2kmer', 'P'], ['ch_hash_to_group_for_hash2sig', 'P']]


OPERATION_17 string : Channel
      .fromPath ( params.csv )
      .splitCsv ( header:true )
      .branch { row ->
        aligned: row.is_aligned == "aligned"
        unaligned: row.is_aligned == "unaligned"
      }
      .set { ch_csv_is_aligned }
OPERATION_17 origin : [['params.csv', 'A']]
OPERATION_17 gives  : [['ch_csv_is_aligned', 'P']]


OPERATION_18 string : Channel
      .fromPath(params.csv)
      .splitCsv(header:true)
      .filter{ row -> row.is_aligned == 'unaligned' }
      .ifEmpty { exit 1, "is_aligned column can contain only aligned/unaligned values"}
      .dump( tag: 'csv_unaligned' )
      .map{ row -> tuple(row.group, file(row.sig, checkIfExists: true)) }
      .ifEmpty { exit 1, "params.csv (${params.csv}) 'group' or 'sig' column was empty" }
      .groupTuple()
      .dump( tag: 'ch_per_group_unaligned_sig' )
      .set{ ch_per_group_unaligned_sig }
OPERATION_18 origin : [['params.csv', 'A']]
OPERATION_18 gives  : [['ch_per_group_unaligned_sig', 'P']]


OPERATION_19 string : ch_csv = Channel.fromPath(params.csv)
OPERATION_19 origin : [['params.csv', 'A']]
OPERATION_19 gives  : [['ch_csv', 'P']]


OPERATION_20 string : Channel
      .fromPath(params.csv)
      .splitCsv(header:true)
      .map{ row -> file(row.sig, checkIfExists: true) }
      .ifEmpty { exit 1, "params.csv (${params.csv}) 'sig' column was empty" }
      .collect()
      .map{ it -> [it] }                                                                                
                                                          
                                                                                                                                
                                                                                                                                
                                                                                                                         
                                                                                                                                
                                                                                                                                    
                                                                                                                        
                                                                                                                                         
                                                                                                                                 
                                                                                                                        
                                                                                                                         
      .dump( tag: "ch_all_signatures_flat_list_for_diff_hash" )
      .into{ ch_all_signatures_flat_list_for_diff_hash }
OPERATION_20 origin : [['params.csv', 'A']]
OPERATION_20 gives  : [['ch_all_signatures_flat_list_for_diff_hash', 'P']]


OPERATION_21 string : Channel
      .fromPath(params.csv)
      .splitCsv(header:true)
      .map{ row -> file(row.sig, checkIfExists: true) }
      .ifEmpty { exit 1, "params.csv (${params.csv}) 'sig' column was empty" }
      .collect()
      .into{ ch_all_signatures_flattened_for_finding_matches }
OPERATION_21 origin : [['params.csv', 'A']]
OPERATION_21 gives  : [['ch_all_signatures_flattened_for_finding_matches', 'P']]


OPERATION_22 string : Channel
      .fromPath(params.csv)
      .splitCsv(header:true)
      .map{ row -> tuple(row.group, file(row.fasta, checkIfExists: true)) }
      .ifEmpty { exit 1, "params.csv (${params.csv}) 'fasta' column was empty" }
      .groupTuple()
      .dump( tag: 'ch_group_to_fasta' )
      .set{ ch_group_to_fasta }
OPERATION_22 origin : [['params.csv', 'A']]
OPERATION_22 gives  : [['ch_group_to_fasta', 'P']]


OPERATION_23 string : Channel
      .fromPath(params.csv)
      .splitCsv(header:true)
      .map{ row -> tuple(row.group) }
      .unique()
      .ifEmpty { exit 1, "params.csv (${params.csv}) 'group' column was empty" }
      .dump(tag: 'csv_unique_groups')
                                                              
                                                      
      .combine( ch_all_signatures_flat_list_for_diff_hash )
      .dump(tag: 'ch_groups_with_all_signatures_for_diff_hash')
                                                            
                                       
                                                                                                                                 
                                                                                                                                 
                                                                                                                          
                                                                                                                                 
                                                                                                                                     
                                                                                                                         
                                                                                                                                          
                                                                                                                                  
                                                                                                                         
                                                                                                                          
                                                            
                             
                                                                                                                               
                                                                                                                               
                                                                                                                        
                                                                                                                               
                                                                                                                                   
                                                                                                                       
                                                                                                                                        
                                                                                                                                
                                                                                                                       
                                                                                                                        
      .into { ch_groups_with_all_signatures_for_diff_hash }
OPERATION_23 origin : [['ch_all_signatures_flat_list_for_diff_hash', 'P'], ['params.csv', 'A']]
OPERATION_23 gives  : [['ch_groups_with_all_signatures_for_diff_hash', 'P']]


OPERATION_24 string : Channel.fromPath(params.proteome_translate_fasta, checkIfExists: true)
       .ifEmpty { exit 1, "Peptide fasta file not found: ${params.proteome_translate_fasta}" }
       .set{ ch_proteome_translate_fasta }
OPERATION_24 origin : [['params.proteome_translate_fasta, checkIfExists: true', 'A']]
OPERATION_24 gives  : [['ch_proteome_translate_fasta', 'P']]


OPERATION_25 string : Channel.fromPath(params.proteome_search_fasta, checkIfExists: true)
     .ifEmpty { exit 1, "Reference proteome fasta file not found: ${params.proteome_search_fasta}" }
     .into{ ch_diamond_reference_fasta; ch_sourmash_reference_fasta }
OPERATION_25 origin : [['params.proteome_search_fasta, checkIfExists: true', 'A']]
OPERATION_25 gives  : [['ch_diamond_reference_fasta', 'P'], ['ch_sourmash_reference_fasta', 'P']]


OPERATION_26 string : Channel.fromPath(params.taxonmap_gz, checkIfExists: true)
     .ifEmpty { exit 1, "Diamond Taxon map file not found: ${params.taxonmap_gz}" }
     .set{ ch_diamond_taxonmap_gz }
OPERATION_26 origin : [['params.taxonmap_gz, checkIfExists: true', 'A']]
OPERATION_26 gives  : [['ch_diamond_taxonmap_gz', 'P']]


OPERATION_27 string : Channel.fromPath(params.taxdmp_zip, checkIfExists: true)
     .ifEmpty { exit 1, "Diamond taxon dump file not found: ${params.taxdmp_zip}" }
     .set{ ch_diamond_taxdmp_zip }
OPERATION_27 origin : [['params.taxdmp_zip, checkIfExists: true', 'A']]
OPERATION_27 gives  : [['ch_diamond_taxdmp_zip', 'P']]


OPERATION_28 string : Channel.fromPath(params.diamond_database, checkIfExists: true)
       .ifEmpty { exit 1, "Diamond database file not found: ${params.diamond_database}" }
       .set{ ch_diamond_db }
OPERATION_28 origin : [['params.diamond_database, checkIfExists: true', 'A']]
OPERATION_28 gives  : [['ch_diamond_db', 'P']]


OPERATION_29 string : Channel.fromPath(params.sourmash_index, checkIfExists: true)
       .ifEmpty { exit 1, "Sourmash SBT Index file not found: ${params.sourmash_index}" }
       .set{ ch_sourmash_index }
OPERATION_29 origin : [['params.sourmash_index, checkIfExists: true', 'A']]
OPERATION_29 gives  : [['ch_sourmash_index', 'P']]


OPERATION_30 string : Channel.fromPath(params.infernal_db, checkIfExists: true)
         .ifEmpty { exit 1, "Infernal database file not found: ${params.infernal_db}" }
         .set{ ch_infernal_db_gz }
OPERATION_30 origin : [['params.infernal_db, checkIfExists: true', 'A']]
OPERATION_30 gives  : [['ch_infernal_db_gz', 'P']]


OPERATION_31 string : Channel.fromPath(params.infernal_db, checkIfExists: true)
         .ifEmpty { exit 1, "Infernal database file not found: ${params.infernal_db}" }
         .set{ ch_infernal_db }
OPERATION_31 origin : [['params.infernal_db, checkIfExists: true', 'A']]
OPERATION_31 gives  : [['ch_infernal_db', 'P']]


OPERATION_32 string : Channel.fromPath(params.rfam_clan_info, checkIfExists: true)
       .ifEmpty { exit 1, "Rfam Clan Information file not found: ${params.rfam_clan_info}" }
       .set{ ch_rfam_clan_info }
OPERATION_32 origin : [['params.rfam_clan_info, checkIfExists: true', 'A']]
OPERATION_32 gives  : [['ch_rfam_clan_info', 'P']]


OPERATION_33 string : Channel.from(params.translate_peptide_ksize) { 
ch_peptide_ksize  = 
 } else { 
ch_peptide_ksize  = 
 }
OPERATION_33 origin : [['params.translate_peptide_ksize', 'V']]
OPERATION_33 gives  : []


OPERATION_34 string : Channel.from(params.translate_peptide_molecule) { 
ch_peptide_molecule  = 
 } else { 
ch_peptide_molecule  = 
 }
OPERATION_34 origin : [['params.translate_peptide_molecule', 'V']]
OPERATION_34 gives  : []


OPERATION_35 string : ch_fastqc_results = Channel.empty()
OPERATION_35 origin : []
OPERATION_35 gives  : [['ch_fastqc_results', 'P']]


OPERATION_36 string : ch_fastp_results = Channel.empty()
OPERATION_36 origin : []
OPERATION_36 gives  : [['ch_fastp_results', 'P']]


OPERATION_37 string : ch_fastp_results = Channel.empty()
OPERATION_37 origin : []
OPERATION_37 gives  : [['ch_fastp_results', 'P']]


OPERATION_38 string : ch_hash_to_group_for_hash2kmer
    .map{ it -> it[1] }
    .into{ ch_hashes_for_hash2kmer; ch_hashes_for_hash2sig }
OPERATION_38 origin : [['ch_hash_to_group_for_hash2kmer', 'P']]
OPERATION_38 gives  : [['ch_hashes_for_hash2kmer', 'P'], ['ch_hashes_for_hash2sig', 'P']]


OPERATION_39 string : ch_protein_fastas
                                  
      .map { it -> tuple(false, 
                         file(it, checkIfExists: true).getBaseName(), 
                         file(it, checkIfExists: true))
            }
                                         
      .filter { it -> it[2].size() > 0 }
      .dump ( tag: 'ch_protein_fastas__ch_protein_seq_for_diamond' )
      .set { ch_protein_seq_for_diamond }
OPERATION_39 origin : [['ch_protein_fastas', 'P']]
OPERATION_39 gives  : [['ch_protein_seq_for_diamond', 'P']]


OPERATION_40 string : ch_hash_to_group_for_hash2kmer
    .map{ it -> it[0] }
    .set{ ch_hashes_for_hash2kmer }
OPERATION_40 origin : [['ch_hash_to_group_for_hash2kmer', 'P']]
OPERATION_40 gives  : [['ch_hashes_for_hash2kmer', 'P']]


OPERATION_41 string : ch_csv_is_aligned.unaligned().dump( tag: 'ch_csv_is_aligned.unaligned' )
      .map{ row -> tuple(row.group, row.sample_id, row.sig, row.fasta) }
      .dump( tag: 'ch_unaligned_sig_fasta' )
      .into { ch_unaligned_sig_fasta }
OPERATION_41 origin : [['ch_csv_is_aligned', 'P']]
OPERATION_41 gives  : [['ch_unaligned_sig_fasta', 'P']]


OPERATION_42 string : ch_peptide_molecule
  .combine(ch_peptide_ksize)
  .dump ( tag: 'ch_translate_molecule_ksize' )
  .set { ch_translate_molecule_ksize }
OPERATION_42 origin : [['ch_peptide_molecule', 'P'], ['ch_peptide_ksize', 'P']]
OPERATION_42 gives  : [['ch_translate_molecule_ksize', 'P']]


OPERATION_43 string : summary.collect { k,v -> "${k.padRight(25)}: $v" }.join("\n")
OPERATION_43 origin : [['summary', 'P']]
OPERATION_43 gives  : []


OPERATION_44 string : ch_intersected
                                              
      .filter{ it[1].size() > 20 }
      .into { ch_read_files_fastqc; ch_read_files_trimming }
OPERATION_44 origin : [['ch_intersected', 'P']]
OPERATION_44 gives  : [['ch_read_files_fastqc', 'P'], ['ch_read_files_trimming', 'P']]


OPERATION_45 string : ch_intersected
                                            
    .filter{ it[1].size() > 20 }
    .into { ch_read_files_fastqc; ch_read_files_trimming }
OPERATION_45 origin : [['ch_intersected', 'P']]
OPERATION_45 gives  : [['ch_read_files_fastqc', 'P'], ['ch_read_files_trimming', 'P']]


OPERATION_46 string : ch_sencha_bloom_filters
      .groupTuple(by: [0, 1, 2])
      .combine(ch_reads_trimmed)
      .dump( tag: 'ch_sencha_bloom_filters_grouptuple' )
                                                   
                                       
                       
                   
                                                                                                            
                                 
                                                   
    .set{ ch_sencha_bloom_filters_grouptuple }
OPERATION_46 origin : [['ch_sencha_bloom_filters', 'P'], ['ch_reads_trimmed', 'P']]
OPERATION_46 gives  : [['ch_sencha_bloom_filters_grouptuple', 'P']]


OPERATION_47 string : ch_translated_proteins_potentially_empty
    .filter{ it[2].size() > 0 }
    .dump(tag: "ch_translated_proteins_potentially_empty")
                                                       
                                                   
                             
                                                                                                 
    .set{ ch_protein_seq_for_diamond }
OPERATION_47 origin : [['ch_translated_proteins_potentially_empty', 'P']]
OPERATION_47 gives  : [['ch_protein_seq_for_diamond', 'P']]


OPERATION_48 string : ch_noncoding_nucleotides_potentially_empty
    .filter { it[1].size() > 0 }
    .set { ch_noncoding_nucleotides }
OPERATION_48 origin : [['ch_noncoding_nucleotides_potentially_empty', 'P']]
OPERATION_48 gives  : [['ch_noncoding_nucleotides', 'P']]


OPERATION_49 string : ch_informative_hashes_files
      .dump(tag: 'ch_informative_hashes_files')
                                
      .map{ it -> tuple(it[1].splitText(), it[0])}
                                             
      .dump(tag: 'ch_informative_hashes_files_split')
      .transpose()
                         
                         
                         
      .dump(tag: 'ch_hash_to_group')
      .into {
        ch_hash_to_group_for_finding_matches
        ch_hash_to_group_for_joining_after_hash2kmer;
        ch_hash_to_group_for_joining_after_hash2sig;
        ch_hash_to_group_for_hash2kmer;
        ch_hash_to_group_for_hash2sig }
OPERATION_49 origin : [['ch_informative_hashes_files', 'P']]
OPERATION_49 gives  : []


OPERATION_50 string : ch_hash_to_group_for_finding_matches
    .map{ it -> it[0] }
    .unique()
    .into{ ch_informative_hashes_flattened }
OPERATION_50 origin : [['ch_hash_to_group_for_finding_matches', 'P']]
OPERATION_50 gives  : [['ch_informative_hashes_flattened', 'P']]


OPERATION_51 string : ch_protein_fastas
    .map{ it -> it[1] }                                         
    .collect()                                     
    .map{ it -> [it] }                                                          
    .set{ ch_protein_fastas_flat_list }
OPERATION_51 origin : [['ch_protein_fastas', 'P']]
OPERATION_51 gives  : [['ch_protein_fastas_flat_list', 'P']]


OPERATION_52 string : ch_hashes_for_hash2kmer
      .combine( ch_protein_fastas_flat_list )
      .set { ch_hashes_with_fastas_for_hash2kmer }
OPERATION_52 origin : [['ch_hashes_for_hash2kmer', 'P'], ['ch_protein_fastas_flat_list', 'P']]
OPERATION_52 gives  : [['ch_hashes_with_fastas_for_hash2kmer', 'P']]


OPERATION_53 string : ch_hash_to_group_for_hash2kmer
    .join( ch_group_to_fasta )
    .dump( tag: 'group_to_hashes_for_hash2kmer__combine__ch_group_to_fasta' )
    .into{ ch_hashes_with_fastas_for_hash2kmer }
OPERATION_53 origin : [['ch_hash_to_group_for_hash2kmer', 'P'], ['ch_group_to_fasta', 'P']]
OPERATION_53 gives  : [['ch_hashes_with_fastas_for_hash2kmer', 'P']]


OPERATION_54 string : ch_hash_to_group_for_hash2sig
    .map{ it -> it[0] }
    .into{ ch_hashes_for_hash2sig }
OPERATION_54 origin : [['ch_hash_to_group_for_hash2sig', 'P']]
OPERATION_54 gives  : [['ch_hashes_for_hash2sig', 'P']]


OPERATION_55 string : ch_seqs_from_hash2kmer_to_print.dump(tag: 'ch_seqs_from_hash2kmer_to_print')
OPERATION_55 origin : [['ch_seqs_from_hash2kmer_to_print', 'P']]
OPERATION_55 gives  : []


OPERATION_56 string : ch_hash_to_group_for_joining_after_hash2kmer
    .join(ch_seqs_from_hash2kmer)
    .dump(tag: 'ch_hash_to_group_for_joining__ch_protein_seq_from_hash2kmer')
    .set{ ch_protein_seq_for_diamond }
OPERATION_56 origin : [['ch_hash_to_group_for_joining_after_hash2kmer', 'P'], ['ch_seqs_from_hash2kmer', 'P']]
OPERATION_56 gives  : [['ch_protein_seq_for_diamond', 'P']]


OPERATION_57 string : ch_hash_sigs_from_hash2sig_to_print.dump(tag: 'ch_hash_sigs_from_hash2sig_to_print')
OPERATION_57 origin : [['ch_hash_sigs_from_hash2sig_to_print', 'P']]
OPERATION_57 gives  : []


OPERATION_58 string : ch_hash_to_group_for_joining_after_hash2sig
      .join( ch_hash_sigs_from_hash2sig_to_join )
                                                                                                
                                                                                                      
      .dump( tag: 'ch_hash_to_group_for_joining_after_hash2sig__ch_hash_sigs_from_hash2sig_to_join' )
      .map{ it -> tuple(it[1], it[0], it[2], it[3]) }
      .dump( tag: 'ch_group_to_hash_sig' )
                                                                                                      
      .set{ ch_group_to_hash_sig }
OPERATION_58 origin : [['ch_hash_to_group_for_joining_after_hash2sig', 'P'], ['ch_hash_sigs_from_hash2sig_to_join', 'P']]
OPERATION_58 gives  : [['ch_group_to_hash_sig', 'P']]


OPERATION_59 string : ch_per_group_unaligned_sig
      .join( ch_group_to_hash_sig )
                                     
                     
                                                                                                                      
                                                                                                                      
                                                                                                                      
                                                                                                                      
                                                                                                                                
                                 
                                   
                                       
      .dump( tag: 'ch_group_to_hash_sig_with_group_unaligned_sigs' )
      .into{ ch_group_to_hash_sig_with_group_unaligned_sigs }
OPERATION_59 origin : [['ch_per_group_unaligned_sig', 'P'], ['ch_group_to_hash_sig', 'P']]
OPERATION_59 gives  : [['ch_group_to_hash_sig_with_group_unaligned_sigs', 'P']]


OPERATION_60 string : ch_hash_sigs_in_unaligned
      .dump( tag: 'ch_hash_sigs_in_unaligned' )
                                        
      .branch{
        aligned: it[4].size() == 0
        unaligned: it[4].size() > 0
      }
      .set{ ch_hashes_sigs_branched }
OPERATION_60 origin : [['ch_hash_sigs_in_unaligned', 'P']]
OPERATION_60 gives  : [['ch_hashes_sigs_branched', 'P']]


OPERATION_61 string : ch_hashes_sigs_branched
        .unaligned().map { it -> tuple(it[0], it[1], it[2], it[3]) }
        .dump ( tag: 'ch_hashes_in_group_unaligned_sigs' )
        .set { ch_group_hash_sigs_to_query }
OPERATION_61 origin : [['ch_hashes_sigs_branched', 'P']]
OPERATION_61 gives  : [['ch_group_hash_sigs_to_query', 'P']]


OPERATION_62 string : ch_hashes_sigs_branched
        .aligned().map { it -> tuple(it[0], it[1], it[2]) }
        .dump ( tag: 'ch_hashes_in_group_aligned' )
        .set { ch_hashes_in_group_aligned }
OPERATION_62 origin : [['ch_hashes_sigs_branched', 'P']]
OPERATION_62 gives  : [['ch_hashes_in_group_aligned', 'P']]


OPERATION_63 string : ch_reads_trimmed = ch_read_files_trimming
OPERATION_63 origin : [['ch_read_files_trimming', 'P']]
OPERATION_63 gives  : [['ch_reads_trimmed', 'P']]


OPERATION_64 string : ch_group_hash_sigs_to_query = ch_group_to_hash_sig
OPERATION_64 origin : [['ch_group_to_hash_sig', 'P']]
OPERATION_64 gives  : [['ch_group_hash_sigs_to_query', 'P']]


