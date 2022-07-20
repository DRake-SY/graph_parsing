OPERATION_1 string : ch_multiqc_custom_config = Channel.fromPath(params.multiqc_config, checkIfExists: true)
OPERATION_1 origin : [['params.multiqc_config, checkIfExists: true', 'A']]
OPERATION_1 gives  : [['ch_multiqc_custom_config', 'P']]


OPERATION_2 string : ch_multiqc_custom_config = Channel.empty()
OPERATION_2 origin : []
OPERATION_2 gives  : [['ch_multiqc_custom_config', 'P']]


OPERATION_3 string : Channel
            .from(params.input_paths)
            .map { row -> [ row[0], [ file(row[1][0], checkIfExists: true) ] ] }
            .ifEmpty { exit 1, "params.input_paths was empty - no input files supplied" }
            .into { ch_read_files_fastqc; trimming_reads; raw_read_count; scatter_plots_set  }
OPERATION_3 origin : [['params.input_paths', 'V']]
OPERATION_3 gives  : [['ch_read_files_fastqc', 'P'], ['trimming_reads', 'P'], ['raw_read_count', 'P'], ['scatter_plots_set', 'P']]


OPERATION_4 string : Channel
            .from(params.input_paths)
            .map { row -> [ row[0], [ file(row[1][0], checkIfExists: true), file(row[1][1], checkIfExists: true) ] ] }
            .ifEmpty { exit 1, "params.input_paths was empty - no input files supplied" }
            .into { ch_read_files_fastqc; trimming_reads; raw_read_count;scatter_plots_set }
OPERATION_4 origin : [['params.input_paths', 'V']]
OPERATION_4 gives  : [['ch_read_files_fastqc', 'P'], ['trimming_reads', 'P'], ['raw_read_count', 'P'], ['scatter_plots_set', 'P']]


OPERATION_5 string : Channel
        .fromFilePairs(params.input, size: params.single_end ? 1 : 2)
        .ifEmpty { exit 1, "Cannot find any reads matching: ${params.input}\nNB: Path needs to be enclosed in quotes!\nIf this is single-end data, please specify --single_end on the command line." }
        .into { ch_read_files_fastqc; trimming_reads; raw_read_count; scatter_plots_set}
OPERATION_5 origin : [['params.input, size: params.single_end ? 1 : 2', 'A']]
OPERATION_5 gives  : [['ch_read_files_fastqc', 'P'], ['trimming_reads', 'P'], ['raw_read_count', 'P'], ['scatter_plots_set', 'P']]


OPERATION_6 string : Channel
    .value( ch_fasta_pathogen)
    .collect()
    .set { genome_fasta_pathogen_to_unzip}
OPERATION_6 origin : [['ch_fasta_pathogen', 'V']]
OPERATION_6 gives  : [['genome_fasta_pathogen_to_unzip', 'P']]


OPERATION_7 string : Channel
    .value( ch_fasta_host )
    .set { genome_fasta_host_to_unzip}
OPERATION_7 origin : [['ch_fasta_host', 'V']]
OPERATION_7 gives  : [['genome_fasta_host_to_unzip', 'P']]


OPERATION_8 string : Channel
	    .value(ch_gff_host_tRNA)
	    .set {host_gff_trna_file_to_unzip}
OPERATION_8 origin : [['ch_gff_host_tRNA', 'V']]
OPERATION_8 gives  : [['host_gff_trna_file_to_unzip', 'P']]


OPERATION_9 string : Channel
	    .value(ch_gff_host_genome)
	    .set {host_gff_trna_to_unzip}
OPERATION_9 origin : [['ch_gff_host_genome', 'V']]
OPERATION_9 gives  : [['host_gff_trna_to_unzip', 'P']]


OPERATION_10 string : Channel
	    .value(ch_gff_host_genome)
	    .set {host_gff_to_unzip}
OPERATION_10 origin : [['ch_gff_host_genome', 'V']]
OPERATION_10 gives  : [['host_gff_to_unzip', 'P']]


OPERATION_11 string : Channel
    .value(ch_gff_pathogen)
    .set {pathogen_gff_to_unzip}
OPERATION_11 origin : [['ch_gff_pathogen', 'V']]
OPERATION_11 gives  : [['pathogen_gff_to_unzip', 'P']]


OPERATION_12 string : Channel
    .value(ch_transcriptome_host)
    .into {host_transcriptome_to_combine; transcriptome_host_to_split_q_table_salmon; transcriptome_host_to_split_table_salmon; transcriptome_host_to_split_q_table_salmon_alignment_based; transcriptome_host_to_split_table_salmon_alignment; transcriptome_fasta_host_ref_names}
OPERATION_12 origin : [['ch_transcriptome_host', 'V']]
OPERATION_12 gives  : [['host_transcriptome_to_combine', 'P'], ['transcriptome_host_to_split_q_table_salmon', 'P'], ['transcriptome_host_to_split_table_salmon', 'P'], ['transcriptome_host_to_split_q_table_salmon_alignment_based', 'P'], ['transcriptome_host_to_split_table_salmon_alignment', 'P'], ['transcriptome_fasta_host_ref_names', 'P']]


OPERATION_13 string : Channel
    .value(ch_transcriptome_pathogen)
    .into {pathogen_transcriptome_to_combine; transcriptome_pathogen_to_split_table_salmon; transcriptome_pathogen_to_split_table_salmon_alignment; transcriptome_pathogen_to_split_q_table_salmon; transcriptome_pathogen_to_split_q_table_salmon_alignment_based;transcriptome_fasta_pathogen_ref_names}
OPERATION_13 origin : [['ch_transcriptome_pathogen', 'V']]
OPERATION_13 gives  : [['pathogen_transcriptome_to_combine', 'P'], ['transcriptome_pathogen_to_split_table_salmon', 'P'], ['transcriptome_pathogen_to_split_table_salmon_alignment', 'P'], ['transcriptome_pathogen_to_split_q_table_salmon', 'P'], ['transcriptome_pathogen_to_split_q_table_salmon_alignment_based', 'P'], ['transcriptome_fasta_pathogen_ref_names', 'P']]


OPERATION_14 string : Channel
		    .value( params.a )
		    .set { adapter_sequence_3 }
OPERATION_14 origin : [['params.a', 'V']]
OPERATION_14 gives  : [['adapter_sequence_3', 'P']]


OPERATION_15 string : Channel
		    .from (params.a, params.A)
		    .collect()
		    .set { adapter_sequence_3 }
OPERATION_15 origin : [['params.a, params.A', 'V']]
OPERATION_15 gives  : [['adapter_sequence_3', 'P']]


OPERATION_16 string : Channel
	 .value(params.quality_cutoff)
	 .set { quality_cutoff}
OPERATION_16 origin : [['params.quality_cutoff', 'V']]
OPERATION_16 gives  : [['quality_cutoff', 'P']]


OPERATION_17 string : Channel
	    .value( adapter_database )
	    .set { adapter_database }
OPERATION_17 origin : [['adapter_database', 'V']]
OPERATION_17 gives  : [['adapter_database', 'P']]


OPERATION_18 string : Channel
	    .value(params.kmer_length)
	    .set {kmer_length_salmon_index}
OPERATION_18 origin : [['params.kmer_length', 'V']]
OPERATION_18 gives  : [['kmer_length_salmon_index', 'P']]


OPERATION_19 string : Channel
	    .value(params.gene_attribute_gff_to_create_transcriptome_host)
	    .into {host_gff_attribute_salmon_alignment_tRNA; gene_attribute_gff_to_create_transcriptome_host_salmon; host_atr_collect_data_salmon; combine_annot_quant_pathogen; combine_annot_quant_host; atr_scatter_plot_pathogen; atr_scatter_plot_host; attribute_quant_stats_salmon; host_annotations_RNA_class_stats_pathogen; attribute_host_RNA_class_stats; host_atr_collect_data_salmon_alignment_mode; combine_annot_quant_pathogen_salmon_alignment_based; combine_annot_quant_host_salmon_alignment_based; atr_scatter_plot_pathogen_alignment; atr_scatter_plot_host_alignment; attribute_quant_stats_salmon_alignment;host_annotations_RNA_class_stats_pathogen_alignment; attribute_host_RNA_class_stats_alignment}
OPERATION_19 origin : [['params.gene_attribute_gff_to_create_transcriptome_host', 'V']]
OPERATION_19 gives  : [['host_gff_attribute_salmon_alignment_tRNA', 'P'], ['gene_attribute_gff_to_create_transcriptome_host_salmon', 'P'], ['host_atr_collect_data_salmon', 'P'], ['combine_annot_quant_pathogen', 'P'], ['combine_annot_quant_host', 'P'], ['atr_scatter_plot_pathogen', 'P'], ['atr_scatter_plot_host', 'P'], ['attribute_quant_stats_salmon', 'P'], ['host_annotations_RNA_class_stats_pathogen', 'P'], ['attribute_host_RNA_class_stats', 'P'], ['host_atr_collect_data_salmon_alignment_mode', 'P'], ['combine_annot_quant_pathogen_salmon_alignment_based', 'P'], ['combine_annot_quant_host_salmon_alignment_based', 'P'], ['atr_scatter_plot_pathogen_alignment', 'P'], ['atr_scatter_plot_host_alignment', 'P'], ['attribute_quant_stats_salmon_alignment', 'P'], ['host_annotations_RNA_class_stats_pathogen_alignment', 'P'], ['attribute_host_RNA_class_stats_alignment', 'P']]


OPERATION_20 string : Channel
	    .value(params.gene_feature_gff_to_create_transcriptome_host)
	    .collect()
	    .into { gene_feature_gff_host_salmon_alignment; gene_feature_gff_to_create_transcriptome_host_salmon}
OPERATION_20 origin : [['params.gene_feature_gff_to_create_transcriptome_host', 'V']]
OPERATION_20 gives  : [['gene_feature_gff_host_salmon_alignment', 'P'], ['gene_feature_gff_to_create_transcriptome_host_salmon', 'P']]


OPERATION_21 string : Channel
	    .value(params.gene_attribute_gff_to_create_transcriptome_pathogen)
	    .into {pathogen_gff_attribute_salmon_alignment; gene_attribute_gff_to_create_transcriptome_pathogen_salmon}
OPERATION_21 origin : [['params.gene_attribute_gff_to_create_transcriptome_pathogen', 'V']]
OPERATION_21 gives  : [['pathogen_gff_attribute_salmon_alignment', 'P'], ['gene_attribute_gff_to_create_transcriptome_pathogen_salmon', 'P']]


OPERATION_22 string : Channel
	    .value(params.gene_feature_gff_to_create_transcriptome_pathogen)
	    .collect()
	    .into {gene_feature_to_quantify_pathogen_salmon_alignment; gene_feature_to_extract_annotations_pathogen; gene_feature_gff_to_create_transcriptome_pathogen_salmon}
OPERATION_22 origin : [['params.gene_feature_gff_to_create_transcriptome_pathogen', 'V']]
OPERATION_22 gives  : [['gene_feature_to_quantify_pathogen_salmon_alignment', 'P'], ['gene_feature_to_extract_annotations_pathogen', 'P'], ['gene_feature_gff_to_create_transcriptome_pathogen_salmon', 'P']]


OPERATION_23 string : Channel
	    .value(params.libtype)
	    .into {libtype_salmon; libtype_salmon_alignment_mode}
OPERATION_23 origin : [['params.libtype', 'V']]
OPERATION_23 gives  : [['libtype_salmon', 'P'], ['libtype_salmon_alignment_mode', 'P']]


OPERATION_24 string : Channel
	    .value(params.gene_feature_gff_to_quantify_host)
	    .collect()
	    .into {gene_feature_to_quantify_host; gene_feature_to_extract_annotations_host_htseq}
OPERATION_24 origin : [['params.gene_feature_gff_to_quantify_host', 'V']]
OPERATION_24 gives  : [['gene_feature_to_quantify_host', 'P'], ['gene_feature_to_extract_annotations_host_htseq', 'P']]


OPERATION_25 string : Channel
	    .value(params.gene_feature_gff_to_quantify_pathogen)
	    .collect()
	    .into {gene_feature_to_quantify_pathogen; gene_feature_to_extract_annotations_pathongen_htseq}
OPERATION_25 origin : [['params.gene_feature_gff_to_quantify_pathogen', 'V']]
OPERATION_25 gives  : [['gene_feature_to_quantify_pathogen', 'P'], ['gene_feature_to_extract_annotations_pathongen_htseq', 'P']]


OPERATION_26 string : Channel
	    .value(params.pathogen_gff_attribute)
	    .into { pathogen_gff_attribute; pathogen_gff_attribute_to_extract_annotations_htseq}
OPERATION_26 origin : [['params.pathogen_gff_attribute', 'V']]
OPERATION_26 gives  : [['pathogen_gff_attribute', 'P'], ['pathogen_gff_attribute_to_extract_annotations_htseq', 'P']]


OPERATION_27 string : Channel
	    .value(params.stranded)
	    .set { stranded_htseq_unique}
OPERATION_27 origin : [['params.stranded', 'V']]
OPERATION_27 gives  : [['stranded_htseq_unique', 'P']]


OPERATION_28 string : Channel
	    .value(params.host_gff_attribute)
	    .into { host_gff_attribute_to_pathogen; host_gff_attribute_htseq; host_gff_attribute_htseq_combine; host_gff_attribute_to_extract_annotations_htseq; host_gff_attribute_mapping_stats_htseq; host_gff_attribute_RNA_class_pathogen_htseq; host_gff_attribute_RNA_class_host_htseq; combine_annot_quant_pathogen_host_gff_attribute; host_gff_attribute_htseq_TPM; atr_scatter_plot_pathogen_htseq_u_m; atr_scatter_plot_host_htseq_u_m}
OPERATION_28 origin : [['params.host_gff_attribute', 'V']]
OPERATION_28 gives  : [['host_gff_attribute_to_pathogen', 'P'], ['host_gff_attribute_htseq', 'P'], ['host_gff_attribute_htseq_combine', 'P'], ['host_gff_attribute_to_extract_annotations_htseq', 'P'], ['host_gff_attribute_mapping_stats_htseq', 'P'], ['host_gff_attribute_RNA_class_pathogen_htseq', 'P'], ['host_gff_attribute_RNA_class_host_htseq', 'P'], ['combine_annot_quant_pathogen_host_gff_attribute', 'P'], ['host_gff_attribute_htseq_TPM', 'P'], ['atr_scatter_plot_pathogen_htseq_u_m', 'P'], ['atr_scatter_plot_host_htseq_u_m', 'P']]


OPERATION_29 string : Channel
    .value(ch_RNA_classes)
    .into { RNA_classes_to_replace; RNA_classes_to_replace_alignment; RNA_classes_to_replace_htseq_uniquely_mapped}
OPERATION_29 origin : [['ch_RNA_classes', 'V']]
OPERATION_29 gives  : [['RNA_classes_to_replace', 'P'], ['RNA_classes_to_replace_alignment', 'P'], ['RNA_classes_to_replace_htseq_uniquely_mapped', 'P']]


OPERATION_30 string : Channel.from(summary.collect{ [it.key, it.value] })
    .map { k,v -> "<dt>$k</dt><dd><samp>${v ?: '<span style=\"color:#999999;\">N/A</a>'}</samp></dd>" }
    .reduce { a, b -> return [a, b].join("\n            ") }
    .map { x -> """
    id: 'nf-core-dualrnaseq-summary'
    description: " - this information is collected when the pipeline is started."
    section_name: 'nf-core/dualrnaseq Workflow Summary'
    section_href: 'https://github.com/nf-core/dualrnaseq'
    plot_type: 'html'
    data: |
        <dl class=\"dl-horizontal\">
            $x
        </dl>
    """.stripIndent() }
    .set { ch_workflow_summary }
OPERATION_30 origin : [['summary.collect{ [it.key, it.value] }', 'V']]
OPERATION_30 gives  : [['ch_workflow_summary', 'P']]


OPERATION_31 string : Channel.empty()
      .set {ch_fastqc_results}
OPERATION_31 origin : []
OPERATION_31 gives  : [['ch_fastqc_results', 'P']]


OPERATION_32 string : Channel.empty()
      .set {ch_fastqc_trimmed_results}
OPERATION_32 origin : []
OPERATION_32 gives  : [['ch_fastqc_trimmed_results', 'P']]


OPERATION_33 string : Channel.empty()
  .into {collect_total_reads_raw_salmon; collect_total_reads_raw_salmon_alignment; collect_total_reads_raw_star; collect_total_reads_raw_star_for_salmon}
OPERATION_33 origin : []
OPERATION_33 gives  : [['collect_total_reads_raw_salmon', 'P'], ['collect_total_reads_raw_salmon_alignment', 'P'], ['collect_total_reads_raw_star', 'P'], ['collect_total_reads_raw_star_for_salmon', 'P']]


OPERATION_34 string : Channel.empty()
      .set {multiqc_salmon_quant}
OPERATION_34 origin : []
OPERATION_34 gives  : [['multiqc_salmon_quant', 'P']]


OPERATION_35 string : Channel.empty()
     .into {multiqc_star_for_salmon_alignment; multiqc_salmon_alignment_quant}
OPERATION_35 origin : []
OPERATION_35 gives  : [['multiqc_star_for_salmon_alignment', 'P'], ['multiqc_salmon_alignment_quant', 'P']]


OPERATION_36 string : Channel.empty()
     .set {multiqc_star_alignment}
OPERATION_36 origin : []
OPERATION_36 gives  : [['multiqc_star_alignment', 'P']]


OPERATION_37 string : Channel.empty()
     .set {multiqc_htseq_unique}
OPERATION_37 origin : []
OPERATION_37 gives  : [['multiqc_htseq_unique', 'P']]


OPERATION_38 string : configFiles.join(', ')
OPERATION_38 origin : [['configFiles', 'P']]
OPERATION_38 gives  : []


OPERATION_39 string : summary.collect { k,v -> "${k.padRight(18)}: $v" }.join("\n")
OPERATION_39 origin : [['summary', 'P']]
OPERATION_39 gives  : []


OPERATION_40 string : scatter_plots_set
			.map { tag, file -> tag }
			.set {scatter_plots}
OPERATION_40 origin : [['scatter_plots_set', 'P']]
OPERATION_40 gives  : [['scatter_plots', 'P']]


OPERATION_41 string : trimming_reads
      .into {trimming_results_to_qc; trimming_results_star_htseq; trimming_results_to_salmon; trimming_results_star_salmon}
OPERATION_41 origin : [['trimming_reads', 'P']]
OPERATION_41 gives  : [['trimming_results_to_qc', 'P'], ['trimming_results_star_htseq', 'P'], ['trimming_results_to_salmon', 'P'], ['trimming_results_star_salmon', 'P']]


OPERATION_42 string : raw_read_count
	    .map { tag, file -> file }
	    .set {raw_read_count_file}
OPERATION_42 origin : [['raw_read_count', 'P']]
OPERATION_42 gives  : [['raw_read_count_file', 'P']]


OPERATION_43 string : to_collect_total_reads
		  .into {collect_total_reads_raw_salmon; collect_total_reads_raw_salmon_alignment; collect_total_reads_raw_star; collect_total_reads_raw_star_for_salmon}
OPERATION_43 origin : [['to_collect_total_reads', 'P']]
OPERATION_43 gives  : [['collect_total_reads_raw_salmon', 'P'], ['collect_total_reads_raw_salmon_alignment', 'P'], ['collect_total_reads_raw_star', 'P'], ['collect_total_reads_raw_star_for_salmon', 'P']]


OPERATION_44 string : htseq_files_to_combine
	    .collect()
	    .set { htseq_result_quantification }
OPERATION_44 origin : [['htseq_files_to_combine', 'P']]
OPERATION_44 gives  : [['htseq_result_quantification', 'P']]


OPERATION_45 string : gff_host_genome_salmon_alignment  = gff_host_tRNA_genome_salmon_alignment
OPERATION_45 origin : [['gff_host_tRNA_genome_salmon_alignment', 'P']]
OPERATION_45 gives  : [['gff_host_genome_salmon_alignment', 'P']]


OPERATION_46 string : gff_host_genome_salmon_alignment  = combine_gff_host_genome_star_salmon
OPERATION_46 origin : [['combine_gff_host_genome_star_salmon', 'P']]
OPERATION_46 gives  : [['gff_host_genome_salmon_alignment', 'P']]


OPERATION_47 string : host_transcriptome_to_combine  = host_transcriptome_genome_tRNA
OPERATION_47 origin : [['host_transcriptome_genome_tRNA', 'P']]
OPERATION_47 gives  : [['host_transcriptome_to_combine', 'P']]


OPERATION_48 string : host_transcriptome_to_combine  = host_transcriptome
OPERATION_48 origin : [['host_transcriptome', 'P']]
OPERATION_48 gives  : [['host_transcriptome_to_combine', 'P']]


OPERATION_49 string : transcriptome_host_to_split_q_table_salmon  = transcriptome_host_to_split_q_table_salmon_with_tRNA
OPERATION_49 origin : [['transcriptome_host_to_split_q_table_salmon_with_tRNA', 'P']]
OPERATION_49 gives  : [['transcriptome_host_to_split_q_table_salmon', 'P']]


OPERATION_50 string : transcriptome_host_to_split_q_table_salmon  = transcriptome_host_to_split_q_table_salmon_without_tRNA
OPERATION_50 origin : [['transcriptome_host_to_split_q_table_salmon_without_tRNA', 'P']]
OPERATION_50 gives  : [['transcriptome_host_to_split_q_table_salmon', 'P']]


OPERATION_51 string : transcriptome_host_to_split_table_salmon  = transcriptome_host_to_split_table_salmon_with_tRNA
OPERATION_51 origin : [['transcriptome_host_to_split_table_salmon_with_tRNA', 'P']]
OPERATION_51 gives  : [['transcriptome_host_to_split_table_salmon', 'P']]


OPERATION_52 string : transcriptome_host_to_split_table_salmon  = transcriptome_host_to_split_table_salmon_without_tRNA
OPERATION_52 origin : [['transcriptome_host_to_split_table_salmon_without_tRNA', 'P']]
OPERATION_52 gives  : [['transcriptome_host_to_split_table_salmon', 'P']]


OPERATION_53 string : transcriptome_host_to_split_q_table_salmon_alignment_based  = transcriptome_host_to_split_q_table_salmon_alignment_based_with_tRNA
OPERATION_53 origin : [['transcriptome_host_to_split_q_table_salmon_alignment_based_with_tRNA', 'P']]
OPERATION_53 gives  : [['transcriptome_host_to_split_q_table_salmon_alignment_based', 'P']]


OPERATION_54 string : transcriptome_host_to_split_q_table_salmon_alignment_based  = transcriptome_host_to_split_q_table_salmon_alignment_based_without_tRNA
OPERATION_54 origin : [['transcriptome_host_to_split_q_table_salmon_alignment_based_without_tRNA', 'P']]
OPERATION_54 gives  : [['transcriptome_host_to_split_q_table_salmon_alignment_based', 'P']]


OPERATION_55 string : transcriptome_host_to_split_table_salmon_alignment  = transcriptome_host_to_split_table_salmon_alignment_with_tRNA
OPERATION_55 origin : [['transcriptome_host_to_split_table_salmon_alignment_with_tRNA', 'P']]
OPERATION_55 gives  : [['transcriptome_host_to_split_table_salmon_alignment', 'P']]


OPERATION_56 string : transcriptome_host_to_split_table_salmon_alignment  = transcriptome_host_to_split_table_salmon_alignment_without_tRNA
OPERATION_56 origin : [['transcriptome_host_to_split_table_salmon_alignment_without_tRNA', 'P']]
OPERATION_56 gives  : [['transcriptome_host_to_split_table_salmon_alignment', 'P']]


OPERATION_57 string : transcriptome_fasta_host_ref_names  = transcriptome_fasta_host_ref_names_with_tRNA
OPERATION_57 origin : [['transcriptome_fasta_host_ref_names_with_tRNA', 'P']]
OPERATION_57 gives  : [['transcriptome_fasta_host_ref_names', 'P']]


OPERATION_58 string : transcriptome_fasta_host_ref_names  = transcriptome_fasta_host_ref_names_without_tRNA
OPERATION_58 origin : [['transcriptome_fasta_host_ref_names_without_tRNA', 'P']]
OPERATION_58 gives  : [['transcriptome_fasta_host_ref_names', 'P']]


