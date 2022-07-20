OPERATION_1 string : inasv_table_ch = Channel.fromPath(params.inasv_table, checkIfExists:true)
                           .set { tsv_only }
OPERATION_1 origin : [['params.inasv_table, checkIfExists:true', 'A']]
OPERATION_1 gives  : [['inasv_table_ch', 'P'], ['tsv_only', 'P']]


OPERATION_2 string : newick_ch = Channel.fromPath(params.innewick, checkIfExists:true)
                         .set { newick_only }
OPERATION_2 origin : [['params.innewick, checkIfExists:true', 'A']]
OPERATION_2 gives  : [['newick_ch', 'P'], ['newick_only', 'P']]


OPERATION_3 string : inasv_table_ch = Channel.empty()
OPERATION_3 origin : []
OPERATION_3 gives  : [['inasv_table_ch', 'P']]


OPERATION_4 string : newick_ch = Channel.empty()
OPERATION_4 origin : []
OPERATION_4 gives  : [['newick_ch', 'P']]


OPERATION_5 string : dada2merge_tabledir_ch = Channel.fromPath(params.merge_tabledir, checkIfExists:true)
OPERATION_5 origin : [['params.merge_tabledir, checkIfExists:true', 'A']]
OPERATION_5 gives  : [['dada2merge_tabledir_ch', 'P']]


OPERATION_6 string : dada2merge_repseqsdir_ch = Channel.fromPath(params.merge_repseqsdir, checkIfExists:true)
OPERATION_6 origin : [['params.merge_repseqsdir, checkIfExists:true', 'A']]
OPERATION_6 gives  : [['dada2merge_repseqsdir_ch', 'P']]


OPERATION_7 string : dada2merge_tabledir_ch = Channel.empty()
OPERATION_7 origin : []
OPERATION_7 gives  : [['dada2merge_tabledir_ch', 'P']]


OPERATION_8 string : dada2merge_repseqsdir_ch = Channel.empty()
OPERATION_8 origin : []
OPERATION_8 gives  : [['dada2merge_repseqsdir_ch', 'P']]


OPERATION_9 string : Channel.from(summary.collect{ [it.key, it.value] })
    .map { k,v -> "<dt>$k</dt><dd><samp>${v ?: '<span style=\"color:#999999;\">N/A</a>'}</samp></dd>" }
    .reduce { a, b -> return [a, b].join("\n            ") }
    .map { x -> """
    id: 'samba-summary'
    description: " - this information is collected when the pipeline is started."
    section_name: 'samba Workflow Summary'
    section_href: 'https://github.com/ifremer-bioinformatics/samba'
    plot_type: 'html'
    data: |
        <dl class=\"dl-horizontal\">
            $x
        </dl>
    """.stripIndent() }
    .set { ch_workflow_summary }
OPERATION_9 origin : [['summary.collect{ [it.key, it.value] }', 'V']]
OPERATION_9 gives  : [['ch_workflow_summary', 'P']]


OPERATION_10 string : data_ready = Channel.value("none")
OPERATION_10 origin : [['"none"', 'V']]
OPERATION_10 gives  : [['data_ready', 'P']]


OPERATION_11 string : Channel.fromPath(params.input_metadata, checkIfExists:true)
                .into { metadata4dada2 ; metadata4dbotu3 ; metadata_filtering_tax ; metadata4stats ; metadata4integrity ; metadata4picrust2 ; metadata4ancom }
OPERATION_11 origin : [['params.input_metadata, checkIfExists:true', 'A']]
OPERATION_11 gives  : [['metadata4dada2', 'P'], ['metadata4dbotu3', 'P'], ['metadata_filtering_tax', 'P'], ['metadata4stats', 'P'], ['metadata4integrity', 'P'], ['metadata4picrust2', 'P'], ['metadata4ancom', 'P']]


OPERATION_12 string : Channel.fromPath(params.input_manifest, checkIfExists:true)
                .into { manifest ; manifest4integrity }
OPERATION_12 origin : [['params.input_manifest, checkIfExists:true', 'A']]
OPERATION_12 gives  : [['manifest', 'P'], ['manifest4integrity', 'P']]


OPERATION_13 string : Channel.empty().into { manifest ; manifest4integrity }
OPERATION_13 origin : []
OPERATION_13 gives  : [['manifest', 'P'], ['manifest4integrity', 'P']]


OPERATION_14 string : Channel.fromPath(params.input_metadata, checkIfExists:true)
    .set { metadata_merge_ch }
OPERATION_14 origin : [['params.input_metadata, checkIfExists:true', 'A']]
OPERATION_14 gives  : [['metadata_merge_ch', 'P']]


OPERATION_15 string : Channel.fromPath(params.input_manifest, checkIfExists:true).into { manifest_lr ; manifest_lr2fasta }
OPERATION_15 origin : [['params.input_manifest, checkIfExists:true', 'A']]
OPERATION_15 gives  : [['manifest_lr', 'P'], ['manifest_lr2fasta', 'P']]


OPERATION_16 string : Channel
     .from(params.picrust_var)
     .splitCsv(sep : ',', strip : true)
     .flatten()
     .set { var_picrust2 }
OPERATION_16 origin : [['params.picrust_var', 'V']]
OPERATION_16 gives  : [['var_picrust2', 'P']]


OPERATION_17 string : Channel
     .from(params.ancom_var)
     .splitCsv(sep : ',', strip : true)
     .flatten()
     .set { ancom_var_list }
OPERATION_17 origin : [['params.ancom_var', 'V']]
OPERATION_17 gives  : [['ancom_var_list', 'P']]


OPERATION_18 string : Channel
  .from(params.alpha_div_group)
  .splitCsv(sep : ',', strip : true)
  .flatten()
  .set { alpha_list_var }
OPERATION_18 origin : [['params.alpha_div_group', 'V']]
OPERATION_18 gives  : [['alpha_list_var', 'P']]


OPERATION_19 string : Channel
  .from(params.beta_div_var)
  .splitCsv(sep : ',', strip : true)
  .flatten()
  .into { beta_var_nn ; beta_var_rare ; beta_var_deseq ; beta_var_css }
OPERATION_19 origin : [['params.beta_div_var', 'V']]
OPERATION_19 gives  : [['beta_var_nn', 'P'], ['beta_var_rare', 'P'], ['beta_var_deseq', 'P'], ['beta_var_css', 'P']]


OPERATION_20 string : Channel
  .from(params.desc_comp_crit)
  .splitCsv(sep : ',', strip : true)
  .flatten()
  .set { desc_comp_list }
OPERATION_20 origin : [['params.desc_comp_crit', 'V']]
OPERATION_20 gives  : [['desc_comp_list', 'P']]


OPERATION_21 string : SAMBAtemplate_ch = Channel.fromPath(params.SAMBAtemplate, checkIfExists:true)
OPERATION_21 origin : [['params.SAMBAtemplate, checkIfExists:true', 'A']]
OPERATION_21 gives  : [['SAMBAtemplate_ch', 'P']]


OPERATION_22 string : SAMBAtemplate_ch = Channel.empty()
OPERATION_22 origin : []
OPERATION_22 gives  : [['SAMBAtemplate_ch', 'P']]


OPERATION_23 string : SAMBAcss_ch = Channel.fromPath(params.SAMBAcss, checkIfExists:true)
OPERATION_23 origin : [['params.SAMBAcss, checkIfExists:true', 'A']]
OPERATION_23 gives  : [['SAMBAcss_ch', 'P']]


OPERATION_24 string : SAMBAcss_ch = Channel.empty()
OPERATION_24 origin : []
OPERATION_24 gives  : [['SAMBAcss_ch', 'P']]


OPERATION_25 string : SAMBAwf_ch = Channel.fromPath(params.SAMBAwf, checkIfExists:true)
OPERATION_25 origin : [['params.SAMBAwf, checkIfExists:true', 'A']]
OPERATION_25 gives  : [['SAMBAwf_ch', 'P']]


OPERATION_26 string : SAMBAwf_ch = Channel.empty()
OPERATION_26 origin : []
OPERATION_26 gives  : [['SAMBAwf_ch', 'P']]


OPERATION_27 string : betastats_reportok = Channel.empty()
OPERATION_27 origin : []
OPERATION_27 gives  : [['betastats_reportok', 'P']]


OPERATION_28 string : SAMBAreport_okstats_alpha = Channel.from('report_without_stats_alpha_ok')
OPERATION_28 origin : [["'report_without_stats_alpha_ok'", 'V']]
OPERATION_28 gives  : [['SAMBAreport_okstats_alpha', 'P']]


OPERATION_29 string : SAMBAreport_okstats_beta = Channel.from('report_without_stats_beta_ok')
OPERATION_29 origin : [["'report_without_stats_beta_ok'", 'V']]
OPERATION_29 gives  : [['SAMBAreport_okstats_beta', 'P']]


OPERATION_30 string : SAMBAreport_okdesc_comp = Channel.from('report_without_desc_comp_ok')
OPERATION_30 origin : [["'report_without_desc_comp_ok'", 'V']]
OPERATION_30 gives  : [['SAMBAreport_okdesc_comp', 'P']]


OPERATION_31 string : SAMBAreport_okpicrust2 = Channel.from('report_without_picrust2_ok')
OPERATION_31 origin : [["'report_without_picrust2_ok'", 'V']]
OPERATION_31 gives  : [['SAMBAreport_okpicrust2', 'P']]


OPERATION_32 string : SAMBAreport_okancom = Channel.from('report_without_ancom_ok')
OPERATION_32 origin : [["'report_without_ancom_ok'", 'V']]
OPERATION_32 gives  : [['SAMBAreport_okancom', 'P']]


OPERATION_33 string : summary.collect { k,v -> "${k.padRight(18)}: $v" }.join("\n")
OPERATION_33 origin : [['summary', 'P']]
OPERATION_33 gives  : []


OPERATION_34 string : testmetadata.set { metadata4stats }
OPERATION_34 origin : [['testmetadata', 'P']]
OPERATION_34 gives  : [['metadata4stats', 'P']]


OPERATION_35 string : testmanifest.into { manifest ; manifest4integrity }
OPERATION_35 origin : [['testmanifest', 'P']]
OPERATION_35 gives  : [['manifest', 'P'], ['manifest4integrity', 'P']]


OPERATION_36 string : testmetadata.into { metadata4dada2 ; metadata4dbotu3 ; metadata_filtering_tax ; metadata4stats ; metadata4integrity ; metadata4picrust2 ; metadata4ancom }
OPERATION_36 origin : [['testmetadata', 'P']]
OPERATION_36 gives  : [['metadata4dada2', 'P'], ['metadata4dbotu3', 'P'], ['metadata_filtering_tax', 'P'], ['metadata4stats', 'P'], ['metadata4integrity', 'P'], ['metadata4picrust2', 'P'], ['metadata4ancom', 'P']]


OPERATION_37 string : data_ready.into { ready_integrity ; ready_import ; ready_lr}
OPERATION_37 origin : [['data_ready', 'P']]
OPERATION_37 gives  : [['ready_integrity', 'P'], ['ready_import', 'P'], ['ready_lr', 'P']]


OPERATION_38 string : metadata_sort.into { metadata4dada2 ; metadata4dbotu3 ; metadata4stats ; metadata4picrust2 ; metadata4ancom }
OPERATION_38 origin : [['metadata_sort', 'P']]
OPERATION_38 gives  : [['metadata4dada2', 'P'], ['metadata4dbotu3', 'P'], ['metadata4stats', 'P'], ['metadata4picrust2', 'P'], ['metadata4ancom', 'P']]


OPERATION_39 string : manifest_sort.set { manifest }
OPERATION_39 origin : [['manifest_sort', 'P']]
OPERATION_39 gives  : [['manifest', 'P']]


OPERATION_40 string : output_ch.into { taxonomy_output ; decontam_output }
OPERATION_40 origin : [['output_ch', 'P']]
OPERATION_40 gives  : [['taxonomy_output', 'P'], ['decontam_output', 'P']]


OPERATION_41 string : longreadsmanifest = testmanifest.splitCsv(header: true, sep:'\t')
                                     .map { row -> tuple( row."sample-id", file(row."absolute-filepath")) }
OPERATION_41 origin : [['testmanifest', 'P']]
OPERATION_41 gives  : [['longreadsmanifest', 'P']]


OPERATION_42 string : longreadstofasta = testmanifest.splitCsv(header: true, sep:'\t')
                                    .map { row -> file(row."absolute-filepath") }
OPERATION_42 origin : [['testmanifest', 'P']]
OPERATION_42 gives  : [['longreadstofasta', 'P']]


OPERATION_43 string : longreadsmanifest = manifest_lr.splitCsv(header: true, sep:'\t')
                                 .map { row -> tuple( row."sample-id", file(row."absolute-filepath")) }
OPERATION_43 origin : [['manifest_lr', 'P']]
OPERATION_43 gives  : [['longreadsmanifest', 'P']]


OPERATION_44 string : longreadstofasta = manifest_lr2fasta.splitCsv(header: true, sep:'\t')
                                .map { row -> file(row."absolute-filepath") }
OPERATION_44 origin : [['manifest_lr2fasta', 'P']]
OPERATION_44 gives  : [['longreadstofasta', 'P']]


OPERATION_45 string : lr_sequences.collectFile(name : 'lr_sequences.fasta', newLine : false, storeDir : "${params.outdir}/${params.lr_mapping_dirname}")
               .subscribe {       println "Fasta sequences are saved to file : $it"       }
OPERATION_45 origin : [['lr_sequences', 'P']]
OPERATION_45 gives  : []


OPERATION_46 string : betastats_reportok = process_beta_report.concat( process_beta_report_CSS, process_beta_report_DESeq2, process_beta_report_rarefied )
OPERATION_46 origin : [['process_beta_report', 'P'], ['process_beta_report_CSS', 'P'], ['process_beta_report_DESeq2', 'P'], ['process_beta_report_rarefied', 'P']]
OPERATION_46 gives  : [['betastats_reportok', 'P']]


OPERATION_47 string : dada2_input  = trimmed_data
OPERATION_47 origin : [['trimmed_data', 'P']]
OPERATION_47 gives  : [['dada2_input', 'P']]


OPERATION_48 string : dada2_input  = imported_data
OPERATION_48 origin : [['imported_data', 'P']]
OPERATION_48 gives  : [['dada2_input', 'P']]


OPERATION_49 string : outputA  = dada2merge_output
OPERATION_49 origin : [['dada2merge_output', 'P']]
OPERATION_49 gives  : [['outputA', 'P']]


OPERATION_50 string : outputA  = dada2_output
OPERATION_50 origin : [['dada2_output', 'P']]
OPERATION_50 gives  : [['outputA', 'P']]


OPERATION_51 string : output_ch  = dbotu3_output
OPERATION_51 origin : [['dbotu3_output', 'P']]
OPERATION_51 gives  : [['output_ch', 'P']]


OPERATION_52 string : output_ch  = outputA
OPERATION_52 origin : [['outputA', 'P']]
OPERATION_52 gives  : [['output_ch', 'P']]


OPERATION_53 string : seqs_taxoA  = merge_seqs_taxo
OPERATION_53 origin : [['merge_seqs_taxo', 'P']]
OPERATION_53 gives  : [['seqs_taxoA', 'P']]


OPERATION_54 string : seqs_taxoA  = dada2_seqs_taxo
OPERATION_54 origin : [['dada2_seqs_taxo', 'P']]
OPERATION_54 gives  : [['seqs_taxoA', 'P']]


OPERATION_55 string : seqs_taxo  = dbotu3_seqs_taxo
OPERATION_55 origin : [['dbotu3_seqs_taxo', 'P']]
OPERATION_55 gives  : [['seqs_taxo', 'P']]


OPERATION_56 string : seqs_taxo  = seqs_taxoA
OPERATION_56 origin : [['seqs_taxoA', 'P']]
OPERATION_56 gives  : [['seqs_taxo', 'P']]


OPERATION_57 string : asv_table  = dbotu3_table_filtering_tax
OPERATION_57 origin : [['dbotu3_table_filtering_tax', 'P']]
OPERATION_57 gives  : [['asv_table', 'P']]


OPERATION_58 string : asv_table  = dada2_table_filtering_tax
OPERATION_58 origin : [['dada2_table_filtering_tax', 'P']]
OPERATION_58 gives  : [['asv_table', 'P']]


OPERATION_59 string : asv_seq  = dbotu3_seqs_filtering_tax
OPERATION_59 origin : [['dbotu3_seqs_filtering_tax', 'P']]
OPERATION_59 gives  : [['asv_seq', 'P']]


OPERATION_60 string : asv_seq  = dada2_seqs_filtering_tax
OPERATION_60 origin : [['dada2_seqs_filtering_tax', 'P']]
OPERATION_60 gives  : [['asv_seq', 'P']]


OPERATION_61 string : microDecon_table  = tax_filtered_table_tsv
OPERATION_61 origin : [['tax_filtered_table_tsv', 'P']]
OPERATION_61 gives  : [['microDecon_table', 'P']]


OPERATION_62 string : microDecon_table  = biom_tsv_decontam
OPERATION_62 origin : [['biom_tsv_decontam', 'P']]
OPERATION_62 gives  : [['microDecon_table', 'P']]


OPERATION_63 string : seqs_phyloA  = merge_seqs_phylo
OPERATION_63 origin : [['merge_seqs_phylo', 'P']]
OPERATION_63 gives  : [['seqs_phyloA', 'P']]


OPERATION_64 string : seqs_phyloA  = dada2_seqs_phylo
OPERATION_64 origin : [['dada2_seqs_phylo', 'P']]
OPERATION_64 gives  : [['seqs_phyloA', 'P']]


OPERATION_65 string : seqs_phyloB  = dbotu3_seqs_phylo
OPERATION_65 origin : [['dbotu3_seqs_phylo', 'P']]
OPERATION_65 gives  : [['seqs_phyloB', 'P']]


OPERATION_66 string : seqs_phyloB  = seqs_phyloA
OPERATION_66 origin : [['seqs_phyloA', 'P']]
OPERATION_66 gives  : [['seqs_phyloB', 'P']]


OPERATION_67 string : seqs_phyloC  = tax_filtered_seq
OPERATION_67 origin : [['tax_filtered_seq', 'P']]
OPERATION_67 gives  : [['seqs_phyloC', 'P']]


OPERATION_68 string : seqs_phyloC  = seqs_phyloB
OPERATION_68 origin : [['seqs_phyloB', 'P']]
OPERATION_68 gives  : [['seqs_phyloC', 'P']]


OPERATION_69 string : seqs_phylo  = decontam_seqs_phylo
OPERATION_69 origin : [['decontam_seqs_phylo', 'P']]
OPERATION_69 gives  : [['seqs_phylo', 'P']]


OPERATION_70 string : seqs_phylo  = seqs_phyloC
OPERATION_70 origin : [['seqs_phyloC', 'P']]
OPERATION_70 gives  : [['seqs_phylo', 'P']]


OPERATION_71 string : table_picrust2A  = merge_table_picrust2
OPERATION_71 origin : [['merge_table_picrust2', 'P']]
OPERATION_71 gives  : [['table_picrust2A', 'P']]


OPERATION_72 string : table_picrust2A  = dada2_table_picrust2
OPERATION_72 origin : [['dada2_table_picrust2', 'P']]
OPERATION_72 gives  : [['table_picrust2A', 'P']]


OPERATION_73 string : table_picrust2B  = dbotu3_table_picrust2
OPERATION_73 origin : [['dbotu3_table_picrust2', 'P']]
OPERATION_73 gives  : [['table_picrust2B', 'P']]


OPERATION_74 string : table_picrust2B  = table_picrust2A
OPERATION_74 origin : [['table_picrust2A', 'P']]
OPERATION_74 gives  : [['table_picrust2B', 'P']]


OPERATION_75 string : table_picrust2C  = tax_filtered_table_picrust2
OPERATION_75 origin : [['tax_filtered_table_picrust2', 'P']]
OPERATION_75 gives  : [['table_picrust2C', 'P']]


OPERATION_76 string : table_picrust2C  = table_picrust2B
OPERATION_76 origin : [['table_picrust2B', 'P']]
OPERATION_76 gives  : [['table_picrust2C', 'P']]


OPERATION_77 string : table_picrust2  = decontam_table_picrust2
OPERATION_77 origin : [['decontam_table_picrust2', 'P']]
OPERATION_77 gives  : [['table_picrust2', 'P']]


OPERATION_78 string : table_picrust2  = table_picrust2C
OPERATION_78 origin : [['table_picrust2C', 'P']]
OPERATION_78 gives  : [['table_picrust2', 'P']]


OPERATION_79 string : seqs_picrust2A  = merge_seqs_picrust2
OPERATION_79 origin : [['merge_seqs_picrust2', 'P']]
OPERATION_79 gives  : [['seqs_picrust2A', 'P']]


OPERATION_80 string : seqs_picrust2A  = dada2_seqs_picrust2
OPERATION_80 origin : [['dada2_seqs_picrust2', 'P']]
OPERATION_80 gives  : [['seqs_picrust2A', 'P']]


OPERATION_81 string : seqs_picrust2B  = dbotu3_seqs_picrust2
OPERATION_81 origin : [['dbotu3_seqs_picrust2', 'P']]
OPERATION_81 gives  : [['seqs_picrust2B', 'P']]


OPERATION_82 string : seqs_picrust2B  = seqs_picrust2A
OPERATION_82 origin : [['seqs_picrust2A', 'P']]
OPERATION_82 gives  : [['seqs_picrust2B', 'P']]


OPERATION_83 string : seqs_picrust2C  = tax_filtered_seq_picrust2
OPERATION_83 origin : [['tax_filtered_seq_picrust2', 'P']]
OPERATION_83 gives  : [['seqs_picrust2C', 'P']]


OPERATION_84 string : seqs_picrust2C  = seqs_picrust2B
OPERATION_84 origin : [['seqs_picrust2B', 'P']]
OPERATION_84 gives  : [['seqs_picrust2C', 'P']]


OPERATION_85 string : seqs_picrust2  = decontam_seqs_picrust2
OPERATION_85 origin : [['decontam_seqs_picrust2', 'P']]
OPERATION_85 gives  : [['seqs_picrust2', 'P']]


OPERATION_86 string : seqs_picrust2  = seqs_picrust2C
OPERATION_86 origin : [['seqs_picrust2C', 'P']]
OPERATION_86 gives  : [['seqs_picrust2', 'P']]


OPERATION_87 string : table_ancomA  = merge_table_ancom
OPERATION_87 origin : [['merge_table_ancom', 'P']]
OPERATION_87 gives  : [['table_ancomA', 'P']]


OPERATION_88 string : table_ancomA  = dada2_table_ancom
OPERATION_88 origin : [['dada2_table_ancom', 'P']]
OPERATION_88 gives  : [['table_ancomA', 'P']]


OPERATION_89 string : table_ancomB  = dbotu3_table_ancom
OPERATION_89 origin : [['dbotu3_table_ancom', 'P']]
OPERATION_89 gives  : [['table_ancomB', 'P']]


OPERATION_90 string : table_ancomB  = table_ancomA
OPERATION_90 origin : [['table_ancomA', 'P']]
OPERATION_90 gives  : [['table_ancomB', 'P']]


OPERATION_91 string : table_ancomC  = tax_filtered_table_ancom
OPERATION_91 origin : [['tax_filtered_table_ancom', 'P']]
OPERATION_91 gives  : [['table_ancomC', 'P']]


OPERATION_92 string : table_ancomC  = table_ancomB
OPERATION_92 origin : [['table_ancomB', 'P']]
OPERATION_92 gives  : [['table_ancomC', 'P']]


OPERATION_93 string : table_ancom  = decontam_table_ancom
OPERATION_93 origin : [['decontam_table_ancom', 'P']]
OPERATION_93 gives  : [['table_ancom', 'P']]


OPERATION_94 string : table_ancom  = table_ancomC
OPERATION_94 origin : [['table_ancomC', 'P']]
OPERATION_94 gives  : [['table_ancom', 'P']]


OPERATION_95 string : tsv = lr_biom_tsv
OPERATION_95 origin : [['lr_biom_tsv', 'P']]
OPERATION_95 gives  : [['tsv', 'P']]


OPERATION_96 string : tsvA  = tax_filtered_table_tsv_stats
OPERATION_96 origin : [['tax_filtered_table_tsv_stats', 'P']]
OPERATION_96 gives  : [['tsvA', 'P']]


OPERATION_97 string : tsvA  = biom_tsv
OPERATION_97 origin : [['biom_tsv', 'P']]
OPERATION_97 gives  : [['tsvA', 'P']]


OPERATION_98 string : tsvB  = decontam_table
OPERATION_98 origin : [['decontam_table', 'P']]
OPERATION_98 gives  : [['tsvB', 'P']]


OPERATION_99 string : tsvB  = tsvA
OPERATION_99 origin : [['tsvA', 'P']]
OPERATION_99 gives  : [['tsvB', 'P']]


OPERATION_100 string : tsv  = tsv_only
OPERATION_100 origin : [['tsv_only', 'P']]
OPERATION_100 gives  : [['tsv', 'P']]


OPERATION_101 string : tsv  = tsvB
OPERATION_101 origin : [['tsvB', 'P']]
OPERATION_101 gives  : [['tsv', 'P']]


OPERATION_102 string : newick  = newick_only
OPERATION_102 origin : [['newick_only', 'P']]
OPERATION_102 gives  : [['newick', 'P']]


OPERATION_103 string : newick  = newick_phylo
OPERATION_103 origin : [['newick_phylo', 'P']]
OPERATION_103 gives  : [['newick', 'P']]


OPERATION_104 string : SAMBAreport_okstats_alpha  = process_alpha_report
OPERATION_104 origin : [['process_alpha_report', 'P']]
OPERATION_104 gives  : [['SAMBAreport_okstats_alpha', 'P']]


OPERATION_105 string : SAMBAreport_okstats_beta  = betastats_reportok
OPERATION_105 origin : [['betastats_reportok', 'P']]
OPERATION_105 gives  : [['SAMBAreport_okstats_beta', 'P']]


OPERATION_106 string : SAMBAreport_okdesc_comp  = process_desc_comp_report
OPERATION_106 origin : [['process_desc_comp_report', 'P']]
OPERATION_106 gives  : [['SAMBAreport_okdesc_comp', 'P']]


OPERATION_107 string : SAMBAreport_okpicrust2  = complete_picrust2_stats_cmd
OPERATION_107 origin : [['complete_picrust2_stats_cmd', 'P']]
OPERATION_107 gives  : [['SAMBAreport_okpicrust2', 'P']]


OPERATION_108 string : SAMBAreport_okancom  = completecmd_ancom
OPERATION_108 origin : [['completecmd_ancom', 'P']]
OPERATION_108 gives  : [['SAMBAreport_okancom', 'P']]


