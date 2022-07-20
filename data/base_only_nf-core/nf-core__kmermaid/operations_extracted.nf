OPERATION_1 string : input_paths_ch = Channel.empty()
OPERATION_1 origin : []
OPERATION_1 gives  : [['input_paths_ch', 'P']]


OPERATION_2 string : sra_ch = Channel.empty()
OPERATION_2 origin : []
OPERATION_2 gives  : [['sra_ch', 'P']]


OPERATION_3 string : csv_pairs_ch = Channel.empty()
OPERATION_3 origin : []
OPERATION_3 gives  : [['csv_pairs_ch', 'P']]


OPERATION_4 string : csv_singles_ch = Channel.empty()
OPERATION_4 origin : []
OPERATION_4 gives  : [['csv_singles_ch', 'P']]


OPERATION_5 string : read_pairs_ch = Channel.empty()
OPERATION_5 origin : []
OPERATION_5 gives  : [['read_pairs_ch', 'P']]


OPERATION_6 string : read_singles_ch = Channel.empty()
OPERATION_6 origin : []
OPERATION_6 gives  : [['read_singles_ch', 'P']]


OPERATION_7 string : fastas_ch = Channel.empty()
OPERATION_7 origin : []
OPERATION_7 gives  : [['fastas_ch', 'P']]


OPERATION_8 string : tenx_tgz_ch = Channel.empty()
OPERATION_8 origin : []
OPERATION_8 gives  : [['tenx_tgz_ch', 'P']]


OPERATION_9 string : input_paths_ch = Channel
        .from(params.input_paths)
        .map { row -> if (row[1].size() == 2) [ row[0], [file(row[1][0]), file(row[1][1])]]
              else [row[0], [file(row[1][0])]]}
        .ifEmpty { exit 1, "params.input_paths (${params.input_paths}) was empty - no input files supplied" }
OPERATION_9 origin : [['params.input_paths', 'V']]
OPERATION_9 gives  : [['input_paths_ch', 'P']]


OPERATION_10 string : sra_ch = Channel
         .fromSRA( params.sra?.toString()?.tokenize(';') )
         .ifEmpty { exit 1, "params.sra ${params.sra} was not found - no input files supplied" }
OPERATION_10 origin : [['params.sra?.toString(', 'S']]
OPERATION_10 gives  : [['sra_ch', 'P']]


OPERATION_11 string : csv_pairs_ch = Channel
      .fromPath(params.csv_pairs)
      .splitCsv(header:true)
      .map{ row -> tuple(row[0], tuple(file(row[1]), file(row[2])))}
      .ifEmpty { exit 1, "params.csv_pairs (${params.csv_pairs}) was empty - no input files supplied" }
OPERATION_11 origin : [['params.csv_pairs', 'A']]
OPERATION_11 gives  : [['csv_pairs_ch', 'P']]


OPERATION_12 string : csv_singles_ch = Channel
      .fromPath(params.csv_singles)
      .splitCsv(header:true)
      .map{ row -> tuple(row[0], tuple(file(row[1])))}
      .ifEmpty { exit 1, "params.csv_singles (${params.csv_singles}) was empty - no input files supplied" }
OPERATION_12 origin : [['params.csv_singles', 'A']]
OPERATION_12 gives  : [['csv_singles_ch', 'P']]


OPERATION_13 string : read_pairs_ch = Channel
       .fromFilePairs(params.read_pairs?.toString()?.tokenize(';'), size: 2)
       .ifEmpty { exit 1, "params.read_pairs (${params.read_pairs}) was empty - no input files supplied" }
OPERATION_13 origin : [['params.read_pairs?.toString(', 'A']]
OPERATION_13 gives  : [['read_pairs_ch', 'P']]


OPERATION_14 string : read_singles_ch = Channel
       .fromFilePairs(params.read_singles?.toString()?.tokenize(';'), size: 1)
       .ifEmpty { exit 1, "params.read_singles (${params.read_singles}) was empty - no input files supplied" }
OPERATION_14 origin : [['params.read_singles?.toString(', 'A']]
OPERATION_14 gives  : [['read_singles_ch', 'P']]


OPERATION_15 string : fastas_ch = Channel
       .fromPath(params.fastas?.toString()?.tokenize(';'))
       .map{ f -> tuple(f.baseName, tuple(file(f))) }
       .dump ( tag: 'fastas_ch' )
       .ifEmpty { exit 1, "params.fastas (${params.fastas}) was empty - no input files supplied" }
OPERATION_15 origin : [['params.fastas?.toString(', 'A']]
OPERATION_15 gives  : [['fastas_ch', 'P']]


OPERATION_16 string : fastas_ch = Channel
       .from(params.fasta_paths)
       .map { row -> if (row[1].size() == 2) [ row[0], [file(row[1][0]), file(row[1][1])]]
             else [row[0], [file(row[1][0])]]}
       .dump ( tag: 'fastas_ch' )
       .ifEmpty { exit 1, "params.fasta_paths (${params.fastas}) was empty - no input files supplied" }
OPERATION_16 origin : [['params.fasta_paths', 'V']]
OPERATION_16 gives  : [['fastas_ch', 'P']]


OPERATION_17 string : Channel.fromPath(params.bam, checkIfExists: true)
        .map{ f -> tuple(f.baseName, tuple(file(f))) }
       .ifEmpty { exit 1, "Bam file not found: ${params.bam}" }
       .dump( tag: 'bam' )
       .into{ tenx_bam_for_unaligned_fastq_ch; tenx_bam_for_aligned_fastq_ch}
OPERATION_17 origin : [['params.bam, checkIfExists: true', 'A']]
OPERATION_17 gives  : [['tenx_bam_for_unaligned_fastq_ch', 'P'], ['tenx_bam_for_aligned_fastq_ch', 'P']]


OPERATION_18 string : Channel.fromPath(params.barcodes_file, checkIfExists: true)
        .ifEmpty { exit 1, "Barcodes file not found: ${params.barcodes_file}" }
        .set{barcodes_ch}
OPERATION_18 origin : [['params.barcodes_file, checkIfExists: true', 'A']]
OPERATION_18 gives  : [['barcodes_ch', 'P']]


OPERATION_19 string : Channel.from(false)
        .set{barcodes_ch}
OPERATION_19 origin : [['false', 'V']]
OPERATION_19 gives  : [['barcodes_ch', 'P']]


OPERATION_20 string : Channel.fromPath(params.rename_10x_barcodes, checkIfExists: true)
        .ifEmpty { exit 1, "Barcodes file not found: ${params.rename_10x_barcodes}" }
        .set{rename_10x_barcodes_ch}
OPERATION_20 origin : [['params.rename_10x_barcodes, checkIfExists: true', 'A']]
OPERATION_20 gives  : [['rename_10x_barcodes_ch', 'P']]


OPERATION_21 string : Channel.from(false)
        .set{rename_10x_barcodes_ch}
OPERATION_21 origin : [['false', 'V']]
OPERATION_21 gives  : [['rename_10x_barcodes_ch', 'P']]


OPERATION_22 string : Channel.fromPath(params.tenx_tgz, checkIfExists: true)
       .dump(tag: 'tenx_tgz_before_mri_filter')
       .filter{ ~/.+[^mri]\.tgz/ }
       .ifEmpty { exit 1, "10X .tgz file not found: ${params.tenx_tgz}" }
       .dump(tag: 'tenx_tgz_after_mri_filter')
       .set{ tenx_tgz_ch }
OPERATION_22 origin : [['params.tenx_tgz, checkIfExists: true', 'A']]
OPERATION_22 gives  : [['tenx_tgz_ch', 'P']]


OPERATION_23 string : Channel.fromPath(params.protein_fastas?.toString()?.tokenize(';'))
      .map{ f -> tuple(f.baseName, tuple(file(f))) }
      .ifEmpty { exit 1, "params.protein_fastas was empty - no input files supplied" }
      .set { ch_protein_fastas }
OPERATION_23 origin : [['params.protein_fastas?.toString(', 'A']]
OPERATION_23 gives  : [['ch_protein_fastas', 'P']]


OPERATION_24 string : Channel
    .from(params.protein_fasta_paths)
    .map { row -> [ row[0], [ file(row[1][0], checkIfExists: true)] ] }
    .ifEmpty { exit 1, "params.protein_fasta_paths was empty - no input files supplied" }
    .dump(tag: "protein_fasta_paths")
    .set { ch_protein_fastas }
OPERATION_24 origin : [['params.protein_fasta_paths', 'V']]
OPERATION_24 gives  : [['ch_protein_fastas', 'P']]


OPERATION_25 string : ch_protein_fastas = Channel.empty()
OPERATION_25 origin : []
OPERATION_25 gives  : [['ch_protein_fastas', 'P']]


OPERATION_26 string : Channel.fromPath(params.reference_proteome_fasta, checkIfExists: true)
     .ifEmpty { exit 1, "Reference proteome file not found: ${params.reference_proteome_fasta}" }
     .set{ ch_reference_proteome_fasta }
OPERATION_26 origin : [['params.reference_proteome_fasta, checkIfExists: true', 'A']]
OPERATION_26 gives  : [['ch_reference_proteome_fasta', 'P']]


OPERATION_27 string : ch_read_files_trimming_to_check_size = Channel.empty()
OPERATION_27 origin : []
OPERATION_27 gives  : [['ch_read_files_trimming_to_check_size', 'P']]


OPERATION_28 string : ch_read_files_trimming_to_check_size = Channel.empty()
OPERATION_28 origin : []
OPERATION_28 gives  : [['ch_read_files_trimming_to_check_size', 'P']]


OPERATION_29 string : Channel
    .from( rRNA_database.readLines() )
    .map { row -> file(row) }
    .set { sortmerna_fasta }
OPERATION_29 origin : []
OPERATION_29 gives  : [['sortmerna_fasta', 'P']]


OPERATION_30 string : Channel.from(params.ksizes?.toString().tokenize(','))
  .into { ch_ksizes_for_compare_peptide; ch_ksizes_for_compare_nucleotide }
OPERATION_30 origin : []
OPERATION_30 gives  : [['ch_ksizes_for_compare_peptide', 'P'], ['ch_ksizes_for_compare_nucleotide', 'P']]


OPERATION_31 string : Channel.from( molecules )
  .set { ch_molecules }
OPERATION_31 origin : [['molecules', 'V']]
OPERATION_31 gives  : [['ch_molecules', 'P']]


OPERATION_32 string : Channel.from( peptide_molecules )
  .into { ch_peptide_molecules; ch_peptide_molecules_for_compare }
OPERATION_32 origin : [['peptide_molecules', 'V']]
OPERATION_32 gives  : [['ch_peptide_molecules', 'P'], ['ch_peptide_molecules_for_compare', 'P']]


OPERATION_33 string : ch_multiqc_custom_config = Channel.fromPath(params.multiqc_config, checkIfExists: true)
OPERATION_33 origin : [['params.multiqc_config, checkIfExists: true', 'A']]
OPERATION_33 gives  : [['ch_multiqc_custom_config', 'P']]


OPERATION_34 string : ch_multiqc_custom_config = Channel.empty()
OPERATION_34 origin : []
OPERATION_34 gives  : [['ch_multiqc_custom_config', 'P']]


OPERATION_35 string : Channel.from(summary.collect{ [it.key, it.value] })
    .map { k,v -> "<dt>$k</dt><dd><samp>${v ?: '<span style=\"color:#999999;\">N/A</a>'}</samp></dd>" }
    .reduce { a, b -> return [a, b].join("\n            ") }
    .map { x -> """
    id: 'nf-core-kmermaid-summary'
    description: " - this information is collected when the pipeline is started."
    section_name: 'nf-core/kmermaid Workflow Summary'
    section_href: 'https://github.com/nf-core/kmermaid'
    plot_type: 'html'
    data: |
        <dl class=\"dl-horizontal\">
            $x
        </dl>
    """.stripIndent() }
    .set { ch_workflow_summary }
OPERATION_35 origin : [['summary.collect{ [it.key, it.value] }', 'V']]
OPERATION_35 gives  : [['ch_workflow_summary', 'P']]


OPERATION_36 string : ch_fastp_results = Channel.from(false)
OPERATION_36 origin : [['false', 'V']]
OPERATION_36 gives  : [['ch_fastp_results', 'P']]


OPERATION_37 string : sortmerna_logs = Channel.empty()
OPERATION_37 origin : []
OPERATION_37 gives  : [['sortmerna_logs', 'P']]


OPERATION_38 string : sourmash_sketches_nucleotide = Channel.empty()
OPERATION_38 origin : []
OPERATION_38 gives  : [['sourmash_sketches_nucleotide', 'P']]


OPERATION_39 string : ch_sourmash_sig_describe_nucleotides = Channel.empty()
OPERATION_39 origin : []
OPERATION_39 gives  : [['ch_sourmash_sig_describe_nucleotides', 'P']]


OPERATION_40 string : sourmash_sketches_nucleotide = Channel.empty()
OPERATION_40 origin : []
OPERATION_40 gives  : [['sourmash_sketches_nucleotide', 'P']]


OPERATION_41 string : ch_fastp_results = Channel.from(false)
OPERATION_41 origin : [['false', 'V']]
OPERATION_41 gives  : [['ch_fastp_results', 'P']]


OPERATION_42 string : sortmerna_logs = Channel.from(false)
OPERATION_42 origin : [['false', 'V']]
OPERATION_42 gives  : [['sortmerna_logs', 'P']]


OPERATION_43 string : ch_sourmash_sig_describe_nucleotides = Channel.empty()
OPERATION_43 origin : []
OPERATION_43 gives  : [['ch_sourmash_sig_describe_nucleotides', 'P']]


OPERATION_44 string : ch_fastp_results = Channel.from(false)
OPERATION_44 origin : [['false', 'V']]
OPERATION_44 gives  : [['ch_fastp_results', 'P']]


OPERATION_45 string : sortmerna_logs = Channel.from(false)
OPERATION_45 origin : [['false', 'V']]
OPERATION_45 gives  : [['sortmerna_logs', 'P']]


OPERATION_46 string : sortmerna_logs = Channel.empty()
OPERATION_46 origin : []
OPERATION_46 gives  : [['sortmerna_logs', 'P']]


OPERATION_47 string : ch_fastp_results = Channel.from(false)
OPERATION_47 origin : [['false', 'V']]
OPERATION_47 gives  : [['ch_fastp_results', 'P']]


OPERATION_48 string : sourmash_sketches_peptide = Channel.empty()
OPERATION_48 origin : []
OPERATION_48 gives  : [['sourmash_sketches_peptide', 'P']]


OPERATION_49 string : ch_sourmash_sig_describe_peptides = Channel.empty()
OPERATION_49 origin : []
OPERATION_49 gives  : [['ch_sourmash_sig_describe_peptides', 'P']]


OPERATION_50 string : ch_sourmash_sig_describe_merged = Channel.empty()
OPERATION_50 origin : []
OPERATION_50 gives  : [['ch_sourmash_sig_describe_merged', 'P']]


OPERATION_51 string : Channel.from("dna")  
    .combine( ch_ksizes_for_compare_nucleotide )
    .mix ( ch_sourmash_compare_params_peptide )
    .set { ch_sourmash_compare_params_both }
OPERATION_51 origin : [['ch_ksizes_for_compare_nucleotide', 'P'], ['ch_sourmash_compare_params_peptide', 'P'], ['"dna"', 'V']]
OPERATION_51 gives  : [['ch_sourmash_compare_params_both', 'P']]


OPERATION_52 string : sra_ch.concat(csv_pairs_ch, csv_singles_ch, read_pairs_ch,
        read_singles_ch, fastas_ch, input_paths_ch)
        .set{ subsample_reads_ch_unchecked }
OPERATION_52 origin : [['sra_ch', 'P'], ['csv_pairs_ch', 'P'], ['csv_singles_ch', 'P'], ['read_pairs_ch', 'P'], ['read_singles_ch', 'P'], ['fastas_ch', 'P'], ['input_paths_ch', 'P']]
OPERATION_52 gives  : [['subsample_reads_ch_unchecked', 'P']]


OPERATION_53 string : sra_ch.concat(
          csv_pairs_ch, csv_singles_ch, read_pairs_ch,
          read_singles_ch, input_paths_ch)
                                                                         
        .set{ ch_read_files_trimming_unchecked }
OPERATION_53 origin : [['sra_ch', 'P'], ['csv_pairs_ch', 'P'], ['csv_singles_ch', 'P'], ['read_pairs_ch', 'P'], ['read_singles_ch', 'P'], ['input_paths_ch', 'P']]
OPERATION_53 gives  : [['ch_read_files_trimming_unchecked', 'P']]


OPERATION_54 string : sra_ch.concat(
          csv_pairs_ch, csv_singles_ch, read_pairs_ch,
          read_singles_ch, fastas_ch, input_paths_ch)
       .set{ reads_ch_unchecked }
OPERATION_54 origin : [['sra_ch', 'P'], ['csv_pairs_ch', 'P'], ['csv_singles_ch', 'P'], ['read_pairs_ch', 'P'], ['read_singles_ch', 'P'], ['fastas_ch', 'P'], ['input_paths_ch', 'P']]
OPERATION_54 gives  : [['reads_ch_unchecked', 'P']]


OPERATION_55 string : sra_ch.concat(
            csv_pairs_ch, csv_singles_ch, read_pairs_ch,
            read_singles_ch, input_paths_ch)
          .dump ( tag: 'ch_read_files_trimming_unchecked__with_fastas' )
          .into { ch_read_files_trimming_to_trim; ch_read_files_trimming_to_check_size }
OPERATION_55 origin : [['sra_ch', 'P'], ['csv_pairs_ch', 'P'], ['csv_singles_ch', 'P'], ['read_pairs_ch', 'P'], ['read_singles_ch', 'P'], ['input_paths_ch', 'P']]
OPERATION_55 gives  : [['ch_read_files_trimming_to_trim', 'P'], ['ch_read_files_trimming_to_check_size', 'P']]


OPERATION_56 string : sra_ch.concat(
            csv_pairs_ch, csv_singles_ch, read_pairs_ch,
            read_singles_ch, input_paths_ch)
          .dump ( tag: 'ch_read_files_trimming_unchecked__no_fastas' )
          .set{ ch_read_files_trimming_unchecked }
OPERATION_56 origin : [['sra_ch', 'P'], ['csv_pairs_ch', 'P'], ['csv_singles_ch', 'P'], ['read_pairs_ch', 'P'], ['read_singles_ch', 'P'], ['input_paths_ch', 'P']]
OPERATION_56 gives  : [['ch_read_files_trimming_unchecked', 'P']]


OPERATION_57 string : sra_ch.concat(
          csv_pairs_ch, csv_singles_ch, read_pairs_ch,
          read_singles_ch, input_paths_ch)
        .dump ( tag: 'ch_non_bam_reads_unchecked__concatenated' )
        .set{ ch_non_bam_reads_unchecked }
OPERATION_57 origin : [['sra_ch', 'P'], ['csv_pairs_ch', 'P'], ['csv_singles_ch', 'P'], ['read_pairs_ch', 'P'], ['read_singles_ch', 'P'], ['input_paths_ch', 'P']]
OPERATION_57 gives  : [['ch_non_bam_reads_unchecked', 'P']]


OPERATION_58 string : subsample_reads_ch_unchecked
      .ifEmpty{  exit 1, "No reads provided! Check read input files" }
      .set { subsample_ch_reads_for_ribosomal_removal }
OPERATION_58 origin : [['subsample_reads_ch_unchecked', 'P']]
OPERATION_58 gives  : [['subsample_ch_reads_for_ribosomal_removal', 'P']]


OPERATION_59 string : reads_ch_unchecked
      .ifEmpty{ exit 1, "No reads provided! Check read input files" }
      .set { ch_reads_for_ribosomal_removal }
OPERATION_59 origin : [['reads_ch_unchecked', 'P']]
OPERATION_59 gives  : [['ch_reads_for_ribosomal_removal', 'P']]


OPERATION_60 string : ch_non_bam_reads_unchecked
                                                           
      .set { ch_non_bam_reads }
OPERATION_60 origin : [['ch_non_bam_reads_unchecked', 'P']]
OPERATION_60 gives  : [['ch_non_bam_reads', 'P']]


OPERATION_61 string : ch_read_files_trimming_unchecked
        .ifEmpty{ exit 1, "No reads provided! Check read input files" }
        .into { ch_read_files_trimming_to_trim; ch_read_files_trimming_to_check_size }
OPERATION_61 origin : [['ch_read_files_trimming_unchecked', 'P']]
OPERATION_61 gives  : [['ch_read_files_trimming_to_trim', 'P'], ['ch_read_files_trimming_to_check_size', 'P']]


OPERATION_62 string : subsample_reads_ch_unchecked
      .set { subsample_ch_reads_for_ribosomal_removal }
OPERATION_62 origin : [['subsample_reads_ch_unchecked', 'P']]
OPERATION_62 gives  : [['subsample_ch_reads_for_ribosomal_removal', 'P']]


OPERATION_63 string : reads_ch_unchecked
      .set { ch_reads_for_ribosomal_removal }
OPERATION_63 origin : [['reads_ch_unchecked', 'P']]
OPERATION_63 gives  : [['ch_reads_for_ribosomal_removal', 'P']]


OPERATION_64 string : ch_read_files_trimming_unchecked
      .into { ch_read_files_trimming_to_trim; ch_read_files_trimming_to_check_size }
OPERATION_64 origin : [['ch_read_files_trimming_unchecked', 'P']]
OPERATION_64 gives  : [['ch_read_files_trimming_to_trim', 'P'], ['ch_read_files_trimming_to_check_size', 'P']]


OPERATION_65 string : ch_non_bam_reads_unchecked
      .set { ch_non_bam_reads }
OPERATION_65 origin : [['ch_non_bam_reads_unchecked', 'P']]
OPERATION_65 gives  : [['ch_non_bam_reads', 'P']]


OPERATION_66 string : peptide_molecules_comma_separated = peptide_molecules.join(",")
OPERATION_66 origin : [['peptide_molecules', 'P']]
OPERATION_66 gives  : [['peptide_molecules_comma_separated', 'P']]


OPERATION_67 string : peptide_molecule_flags = peptide_molecules.collect { it -> "--${it}" }.join ( " " )
OPERATION_67 origin : [['peptide_molecules', 'P']]
OPERATION_67 gives  : [['peptide_molecule_flags', 'P']]


OPERATION_68 string : summary.collect { k,v -> "${k.padRight(18)}: $v" }.join("\n")
OPERATION_68 origin : [['summary', 'P']]
OPERATION_68 gives  : []


OPERATION_69 string : sketch_style_parsed = ch_sketch_style_unparsed
    .splitText()
    .dump ( tag: 'ch_sketch_style' )
    .map { it -> it.replaceAll('\\n', '' ) }
    .first()
    .dump ( tag: 'sketch_style_parsed' )
    .collect ()
OPERATION_69 origin : [['ch_sketch_style_unparsed', 'P']]
OPERATION_69 gives  : [['sketch_style_parsed', 'P']]


OPERATION_70 string : sketch_value_parsed = ch_sketch_value_unparsed
    .splitText()
    .map { it -> it.replaceAll('\\n', '')}
    .first()
    .dump ( tag : 'sketch_value_parsed' )
    .collect()
OPERATION_70 origin : [['ch_sketch_value_unparsed', 'P']]
OPERATION_70 gives  : [['sketch_value_parsed', 'P']]


OPERATION_71 string : tenx_reads_aligned_concatenation_ch
    .mix( tenx_reads_unaligned_ch )
    .dump(tag: "tenx_ch_reads_for_ribosomal_removal")
    .set{ tenx_ch_reads_for_ribosomal_removal }
OPERATION_71 origin : [['tenx_reads_aligned_concatenation_ch', 'P'], ['tenx_reads_unaligned_ch', 'P']]
OPERATION_71 gives  : [['tenx_ch_reads_for_ribosomal_removal', 'P']]


OPERATION_72 string : good_barcodes_unfiltered_ch.filter{ it -> it[1].size() > 0 }
      .ifEmpty{ exit 1, "No cell barcodes found with at least ${tenx_min_umi_per_cell} molecular barcodes (UMIs) per cell"}
      .set{ good_barcodes_ch }
OPERATION_72 origin : [['good_barcodes_unfiltered_ch', 'P']]
OPERATION_72 gives  : [['good_barcodes_ch', 'P']]


OPERATION_73 string : tenx_ch_reads_for_ribosomal_removal
    .combine( good_barcodes_ch, by: 0 )
    .dump( tag: 'tenx_ch_reads_for_ribosomal_removal__combine__good_barcodes_ch' )
    .map{ it -> [it[0], it[1], it[2], it[3].splitText()] }
    .transpose()
    .dump( tag: 'tenx_ch_reads_for_ribosomal_removal__combine__good_barcodes_ch__transpose' )
    .map{ it -> [it[0], it[1], it[2], it[3].replaceAll("\\s+", "") ] }
    .dump( tag: 'tenx_ch_reads_for_ribosomal_removal__combine__good_barcodes_ch__transpose__no_newlines' )
    .set{ tenx_reads_with_good_barcodes_ch }
OPERATION_73 origin : [['tenx_ch_reads_for_ribosomal_removal', 'P']]
OPERATION_73 gives  : [['tenx_reads_with_good_barcodes_ch', 'P']]


OPERATION_74 string : per_cell_fastqs_ch_possibly_empty
                                       
    .filter { it -> it[1].size() > 20 }
    .set { per_cell_fastqs_ch }
OPERATION_74 origin : [['per_cell_fastqs_ch_possibly_empty', 'P']]
OPERATION_74 gives  : [['per_cell_fastqs_ch', 'P']]


OPERATION_75 string : ch_non_bam_reads
      .concat(per_cell_fastqs_ch)
      .set { ch_reads_for_ribosomal_removal }
OPERATION_75 origin : [['ch_non_bam_reads', 'P'], ['per_cell_fastqs_ch', 'P']]
OPERATION_75 gives  : [['ch_reads_for_ribosomal_removal', 'P']]


OPERATION_76 string : ch_non_bam_reads
      .mix ( per_cell_fastqs_ch )
      .dump ( tag: 'ch_non_bam_reads__per_cell_fastqs_ch' )
      .into{ ch_read_files_trimming_to_trim; ch_read_files_trimming_to_check_size }
OPERATION_76 origin : [['ch_non_bam_reads', 'P'], ['per_cell_fastqs_ch', 'P']]
OPERATION_76 gives  : [['ch_read_files_trimming_to_trim', 'P'], ['ch_read_files_trimming_to_check_size', 'P']]


OPERATION_77 string : ch_reads_all_trimmed
    .dump ( tag: 'ch_reads_all_trimmed' )
    .branch {
                                       
      paired: it[1].size() == 2
      single: true
    }
    .set { ch_reads_trimmed_branched }
OPERATION_77 origin : [['ch_reads_all_trimmed', 'P']]
OPERATION_77 gives  : [['ch_reads_trimmed_branched', 'P']]


OPERATION_78 string : ch_reads_trimmed_branched.paired().filter{ it -> it[1][0].size() > 200 }
    .dump ( tag: 'ch_reads_trimmed_paired' )
    .set{ ch_reads_trimmed_paired }
OPERATION_78 origin : [['ch_reads_trimmed_branched', 'P']]
OPERATION_78 gives  : [['ch_reads_trimmed_paired', 'P']]


OPERATION_79 string : ch_reads_trimmed_branched.single().filter{ it -> it[1].size() > 200 }
    .dump ( tag: 'ch_reads_trimmed_single' )
    .set{ ch_reads_trimmed_single }
OPERATION_79 origin : [['ch_reads_trimmed_branched', 'P']]
OPERATION_79 gives  : [['ch_reads_trimmed_single', 'P']]


OPERATION_80 string : ch_reads_trimmed_single
    .mix ( ch_reads_trimmed_paired )
    .set { ch_reads_trimmed }
OPERATION_80 origin : [['ch_reads_trimmed_single', 'P'], ['ch_reads_trimmed_paired', 'P']]
OPERATION_80 gives  : [['ch_reads_trimmed', 'P']]


OPERATION_81 string : ch_reads_trimmed
      .concat( fastas_ch )
      .dump ( tag: 'trimmed_reads__concat_fastas' )
      .set { subsample_ch_reads_for_ribosomal_removal }
OPERATION_81 origin : [['ch_reads_trimmed', 'P'], ['fastas_ch', 'P']]
OPERATION_81 gives  : [['subsample_ch_reads_for_ribosomal_removal', 'P']]


OPERATION_82 string : ch_reads_for_ribosomal_removal = ch_reads_trimmed.mix(fastas_ch)
OPERATION_82 origin : [['ch_reads_trimmed', 'P'], ['fastas_ch', 'P']]
OPERATION_82 gives  : [['ch_reads_for_ribosomal_removal', 'P']]


OPERATION_83 string : ch_reads_for_ribosomal_removal
        .set { ch_reads_to_translate }
OPERATION_83 origin : [['ch_reads_for_ribosomal_removal', 'P']]
OPERATION_83 gives  : [['ch_reads_to_translate', 'P']]


OPERATION_84 string : ch_translated_protein_seqs
      .mix ( ch_protein_fastas )
      .dump ( tag: 'ch_protein_seq_to_sketch_from_translate' )
      .set { ch_protein_seq_to_sketch }
OPERATION_84 origin : [['ch_translated_protein_seqs', 'P'], ['ch_protein_fastas', 'P']]
OPERATION_84 gives  : [['ch_protein_seq_to_sketch', 'P']]


OPERATION_85 string : ch_noncoding_nucleotides_nonempty = ch_noncoding_nucleotides_potentially_empty.filter{ it[1].size() > 0 }
OPERATION_85 origin : [['ch_noncoding_nucleotides_potentially_empty', 'P']]
OPERATION_85 gives  : [['ch_noncoding_nucleotides_nonempty', 'P']]


OPERATION_86 string : ch_translatable_nucleotide_seqs
      .dump( tag: 'ch_translatable_nucleotide_seqs' )
      .filter{ it[1].size() > 0 }
      .dump ( tag: 'ch_reads_to_sketch__from_translate' )
      .set { ch_reads_to_sketch }
OPERATION_86 origin : [['ch_translatable_nucleotide_seqs', 'P']]
OPERATION_86 gives  : [['ch_reads_to_sketch', 'P']]


OPERATION_87 string : ch_reads_to_translate
      .dump ( tag: 'ch_reads_to_sketch__no_translation' )
      .set{ ch_reads_to_sketch }
OPERATION_87 origin : [['ch_reads_to_translate', 'P']]
OPERATION_87 gives  : [['ch_reads_to_sketch', 'P']]


OPERATION_88 string : sourmash_sketches_all_nucleotide
      .filter{ it[3].size() > 0 }
      .dump ( tag: "sourmash_sketches_all_nucleotide" )
      .set { sourmash_sketches_nucleotide }
OPERATION_88 origin : [['sourmash_sketches_all_nucleotide', 'P']]
OPERATION_88 gives  : [['sourmash_sketches_nucleotide', 'P']]


OPERATION_89 string : ch_protein_fastas
    .set { ch_protein_seq_to_sketch }
OPERATION_89 origin : [['ch_protein_fastas', 'P']]
OPERATION_89 gives  : [['ch_protein_seq_to_sketch', 'P']]


OPERATION_90 string : ch_protein_fastas
    .set { ch_protein_seq_to_sketch }
OPERATION_90 origin : [['ch_protein_fastas', 'P']]
OPERATION_90 gives  : [['ch_protein_seq_to_sketch', 'P']]


OPERATION_91 string : sourmash_sketches_peptide = sourmash_sketches_all_peptide.filter{ it[3].size() > 0 }
OPERATION_91 origin : [['sourmash_sketches_all_peptide', 'P']]
OPERATION_91 gives  : [['sourmash_sketches_peptide', 'P']]


OPERATION_92 string : sourmash_sketches_nucleotide
    .mix ( sourmash_sketches_peptide )
    .dump ( tag: 'ch_sourmash_sketches_mixed' )
    .set { ch_sourmash_sketches_mixed }
OPERATION_92 origin : [['sourmash_sketches_nucleotide', 'P'], ['sourmash_sketches_peptide', 'P']]
OPERATION_92 gives  : [['ch_sourmash_sketches_mixed', 'P']]


OPERATION_93 string : ch_fastq_id_to_cell_id_is_aligned
    .dump( tag: 'ch_fastq_id_to_cell_id_is_aligned' )
    .combine ( ch_sourmash_sketches_mixed, by: 0 )
    .unique()
    .dump( tag: 'fastq_id_to_cells__combine__sketches' )
                                                    
                                                                           
                                                                 
                    
                                                                     
                
              
                                                                                                                                         
                                                                                                                           
                                                                                    
                                        
                                                                                        
                                  
                             
                                                                                                                                                                  
    .groupTuple( by: [1, 3, 4, 5] )
                                                                
        
                                                                              
                                                                 
                      
                                                                   
                
                 
                                                                                                                                         
        
    .dump( tag: 'fastq_id_to_cells__combine__sketches__grouptuple' )
    .map { it -> [it[0].unique(), it[1], it[2].unique(), it[3], it[4], it[5], it[6]] }
    .dump( tag: 'fastq_id_to_cells__combine__sketches__grouptuple__unique' )
    .set { ch_sourmash_sketches_to_merge }
OPERATION_93 origin : [['ch_fastq_id_to_cell_id_is_aligned', 'P']]
OPERATION_93 gives  : [['ch_sourmash_sketches_to_merge', 'P']]


OPERATION_94 string : ch_sourmash_sketches_merged_to_view
    .dump( tag: "ch_sourmash_sketches_to_view" )
OPERATION_94 origin : [['ch_sourmash_sketches_merged_to_view', 'P']]
OPERATION_94 gives  : []


OPERATION_95 string : sourmash_sketches_nucleotide
    .mix ( sourmash_sketches_peptide )
    .dump ( tag: 'skip_merge__ch_sourmash_sketches_to_compare' )
    .set { ch_sourmash_sketches_merged }
OPERATION_95 origin : [['sourmash_sketches_nucleotide', 'P'], ['sourmash_sketches_peptide', 'P']]
OPERATION_95 gives  : [['ch_sourmash_sketches_merged', 'P']]


OPERATION_96 string : ch_peptide_molecules_for_compare
    .combine( ch_ksizes_for_compare_peptide )
    .set { ch_sourmash_compare_params_peptide }
OPERATION_96 origin : [['ch_peptide_molecules_for_compare', 'P'], ['ch_ksizes_for_compare_peptide', 'P']]
OPERATION_96 gives  : [['ch_sourmash_compare_params_peptide', 'P']]


OPERATION_97 string : ch_sourmash_sketches_merged
                                                      
                                                             
                        
                 
    .map { [tuple(it[2].split(",")), it[4]] }
    .dump(tag: 'ch_sourmash_sketches_merged__map_split' )
    .transpose()
    .dump(tag: 'ch_sourmash_sketches_merged__map_split__tranpose' )
                                                                     
    .combine( ch_sourmash_compare_params_both, by: 0)
    .dump(tag: 'ch_sourmash_sketches_merged__map_split__combine' )
    .groupTuple(by: [0, 2])
    .dump(tag: 'ch_sourmash_sketches_to_compare' )
    .set { ch_sourmash_sketches_to_compare }
OPERATION_97 origin : [['ch_sourmash_sketches_merged', 'P']]
OPERATION_97 gives  : [['ch_sourmash_sketches_to_compare', 'P']]


OPERATION_98 string : good_barcodes_ch = barcodes_ch
OPERATION_98 origin : [['barcodes_ch', 'P']]
OPERATION_98 gives  : [['good_barcodes_ch', 'P']]


OPERATION_99 string : good_barcodes_ch = tenx_bam_barcodes_ch
OPERATION_99 origin : [['tenx_bam_barcodes_ch', 'P']]
OPERATION_99 gives  : [['good_barcodes_ch', 'P']]


OPERATION_100 string : ch_reads_for_ribosomal_removal = fastas_ch
OPERATION_100 origin : [['fastas_ch', 'P']]
OPERATION_100 gives  : [['ch_reads_for_ribosomal_removal', 'P']]


