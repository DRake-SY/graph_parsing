OPERATION_1 string : Channel
        .fromFilePairs(params.readsTest)
        .ifEmpty{ exit 1, "params.readTest was empty - no input files supplied" }
        .into{ reads_ch; reads_qc_ch; reads_processing }
OPERATION_1 origin : [['params.readsTest', 'A']]
OPERATION_1 gives  : [['reads_ch', 'P'], ['reads_qc_ch', 'P'], ['reads_processing', 'P']]


OPERATION_2 string : Channel
        .fromFilePairs("${params.reads}", checkIfExists: true)
        .into{ reads_ch; reads_qc_ch; reads_processing }
OPERATION_2 origin : [['"${params.reads}", checkIfExists: true', 'A']]
OPERATION_2 gives  : [['reads_ch', 'P'], ['reads_qc_ch', 'P'], ['reads_processing', 'P']]


OPERATION_3 string : fastp_results = Channel.empty()
OPERATION_3 origin : []
OPERATION_3 gives  : [['fastp_results', 'P']]


OPERATION_4 string : asv_entropy = Channel.empty()
OPERATION_4 origin : []
OPERATION_4 gives  : [['asv_entropy', 'P']]


OPERATION_5 string : asv_entro_csv = Channel.empty()
OPERATION_5 origin : []
OPERATION_5 gives  : [['asv_entro_csv', 'P']]


OPERATION_6 string : amino_entro_csv = Channel.empty()
OPERATION_6 origin : []
OPERATION_6 gives  : [['amino_entro_csv', 'P']]


OPERATION_7 string : amino_entropy = Channel.empty()
OPERATION_7 origin : []
OPERATION_7 gives  : [['amino_entropy', 'P']]


OPERATION_8 string : report_dc_in = Channel.create()
OPERATION_8 origin : []
OPERATION_8 gives  : [['report_dc_in', 'P']]


OPERATION_9 string : taxplot_asv = Channel.value('skipping')
OPERATION_9 origin : [["'skipping'", 'V']]
OPERATION_9 gives  : [['taxplot_asv', 'P']]


OPERATION_10 string : tax_table_asv = Channel.value('skipping')
OPERATION_10 origin : [["'skipping'", 'V']]
OPERATION_10 gives  : [['tax_table_asv', 'P']]


OPERATION_11 string : tax_nodCol_asv = Channel.value('skipping')
OPERATION_11 origin : [["'skipping'", 'V']]
OPERATION_11 gives  : [['tax_nodCol_asv', 'P']]


OPERATION_12 string : nucl_phyl_plot_asv = Channel.value('skipping')
OPERATION_12 origin : [["'skipping'", 'V']]
OPERATION_12 gives  : [['nucl_phyl_plot_asv', 'P']]


OPERATION_13 string : asvphy_med = Channel.value('skipping')
OPERATION_13 origin : [["'skipping'", 'V']]
OPERATION_13 gives  : [['asvphy_med', 'P']]


OPERATION_14 string : asv_treeclust = Channel.value('skipping')
OPERATION_14 origin : [["'skipping'", 'V']]
OPERATION_14 gives  : [['asv_treeclust', 'P']]


OPERATION_15 string : asv_phylogroupcsv = Channel.value('skipping')
OPERATION_15 origin : [["'skipping'", 'V']]
OPERATION_15 gives  : [['asv_phylogroupcsv', 'P']]


OPERATION_16 string : asv_phylogroupingcsv = Channel.value('skipping')
OPERATION_16 origin : [["'skipping'", 'V']]
OPERATION_16 gives  : [['asv_phylogroupingcsv', 'P']]


OPERATION_17 string : asvgroupscsv = Channel.value('skipping')
OPERATION_17 origin : [["'skipping'", 'V']]
OPERATION_17 gives  : [['asvgroupscsv', 'P']]


OPERATION_18 string : asv_group_rep_tree = Channel.value('skipping')
OPERATION_18 origin : [["'skipping'", 'V']]
OPERATION_18 gives  : [['asv_group_rep_tree', 'P']]


OPERATION_19 string : asvgroupcounts = Channel.value('skipping')
OPERATION_19 origin : [["'skipping'", 'V']]
OPERATION_19 gives  : [['asvgroupcounts', 'P']]


OPERATION_20 string : taxplot2 = Channel.value('skipping')
OPERATION_20 origin : [["'skipping'", 'V']]
OPERATION_20 gives  : [['taxplot2', 'P']]


OPERATION_21 string : tax_table_amino = Channel.value('skipping')
OPERATION_21 origin : [["'skipping'", 'V']]
OPERATION_21 gives  : [['tax_table_amino', 'P']]


OPERATION_22 string : tax_nodCol_amino = Channel.value('skipping')
OPERATION_22 origin : [["'skipping'", 'V']]
OPERATION_22 gives  : [['tax_nodCol_amino', 'P']]


OPERATION_23 string : amino_rax_plot = Channel.value('skipping')
OPERATION_23 origin : [["'skipping'", 'V']]
OPERATION_23 gives  : [['amino_rax_plot', 'P']]


OPERATION_24 string : amino_rephy = Channel.value('skipping')
OPERATION_24 origin : [["'skipping'", 'V']]
OPERATION_24 gives  : [['amino_rephy', 'P']]


OPERATION_25 string : amino_treeclust = Channel.value('skipping')
OPERATION_25 origin : [["'skipping'", 'V']]
OPERATION_25 gives  : [['amino_treeclust', 'P']]


OPERATION_26 string : amino_phylogroupcsv = Channel.value('skipping')
OPERATION_26 origin : [["'skipping'", 'V']]
OPERATION_26 gives  : [['amino_phylogroupcsv', 'P']]


OPERATION_27 string : amino_phylogroupingcsv = Channel.value('skipping')
OPERATION_27 origin : [["'skipping'", 'V']]
OPERATION_27 gives  : [['amino_phylogroupingcsv', 'P']]


OPERATION_28 string : atygroupscsv = Channel.value('skipping')
OPERATION_28 origin : [["'skipping'", 'V']]
OPERATION_28 gives  : [['atygroupscsv', 'P']]


OPERATION_29 string : amino_group_rep_tree = Channel.value('skipping')
OPERATION_29 origin : [["'skipping'", 'V']]
OPERATION_29 gives  : [['amino_group_rep_tree', 'P']]


OPERATION_30 string : amino_groupcounts = Channel.value('skipping')
OPERATION_30 origin : [["'skipping'", 'V']]
OPERATION_30 gives  : [['amino_groupcounts', 'P']]


OPERATION_31 string : report_asv = Channel.create()
OPERATION_31 origin : []
OPERATION_31 gives  : [['report_asv', 'P']]


OPERATION_32 string : report_ncasv = Channel.create()
OPERATION_32 origin : []
OPERATION_32 gives  : [['report_ncasv', 'P']]


OPERATION_33 string : report_ncasv = Channel.empty()
OPERATION_33 origin : []
OPERATION_33 gives  : [['report_ncasv', 'P']]


OPERATION_34 string : report_pcasv_aa = Channel.create()
OPERATION_34 origin : []
OPERATION_34 gives  : [['report_pcasv_aa', 'P']]


OPERATION_35 string : report_pcasv_nucl = Channel.create()
OPERATION_35 origin : []
OPERATION_35 gives  : [['report_pcasv_nucl', 'P']]


OPERATION_36 string : report_pcasv_aa = Channel.empty()
OPERATION_36 origin : []
OPERATION_36 gives  : [['report_pcasv_aa', 'P']]


OPERATION_37 string : report_pcasv_nucl = Channel.empty()
OPERATION_37 origin : []
OPERATION_37 gives  : [['report_pcasv_nucl', 'P']]


OPERATION_38 string : report_aminotypes = Channel.create()
OPERATION_38 origin : []
OPERATION_38 gives  : [['report_aminotypes', 'P']]


OPERATION_39 string : report_aminotypes = Channel.empty()
OPERATION_39 origin : []
OPERATION_39 gives  : [['report_aminotypes', 'P']]


OPERATION_40 string : report_all_ch = Channel.create()
OPERATION_40 origin : []
OPERATION_40 gives  : [['report_all_ch', 'P']]


OPERATION_41 string : reads_ch
                .set{ reads_fastp_ch }
OPERATION_41 origin : [['reads_ch', 'P']]
OPERATION_41 gives  : [['reads_fastp_ch', 'P']]


OPERATION_42 string : reads_fastp_ch
                .set{ reads_bbduk_ch }
OPERATION_42 origin : [['reads_fastp_ch', 'P']]
OPERATION_42 gives  : [['reads_bbduk_ch', 'P']]


OPERATION_43 string : reads_ch
            .set{ reads_bbduk_ch }
OPERATION_43 origin : [['reads_ch', 'P']]
OPERATION_43 gives  : [['reads_bbduk_ch', 'P']]


OPERATION_44 string : reads_bbduk_ch
          .set{ reads_vsearch1_ch }
OPERATION_44 origin : [['reads_bbduk_ch', 'P']]
OPERATION_44 gives  : [['reads_vsearch1_ch', 'P']]


OPERATION_45 string : asvforfilt
            .into{ reads_vsearch5_ch; asv_med; nucl2aa; asvsforAminotyping; asvfastaforcounts; asvaminocheck }
OPERATION_45 origin : [['asvforfilt', 'P']]
OPERATION_45 gives  : [['reads_vsearch5_ch', 'P'], ['asv_med', 'P'], ['nucl2aa', 'P'], ['asvsforAminotyping', 'P'], ['asvfastaforcounts', 'P'], ['asvaminocheck', 'P']]


OPERATION_46 string : fastp_csv_dc.mix( reads_per_sample_preFilt, reads_per_sample_postFilt, prefilt_basefreq, postFilt_basefreq, prefilt_qualityscore, postFilt_qualityscore, prefilt_gccontent, postFilt_gccontent, prefilt_averagequality, postFilt_averagequality, prefilt_length, postFilt_length, number_per_percent_nucl_plot, number_per_percent_prot_plot, amino_entro_csv, amino_entropy, asv_entro_csv, asv_entropy, asvpdm, aminopdm).into(report_dc_in)
OPERATION_46 origin : [['fastp_csv_dc', 'P'], ['reads_per_sample_preFilt', 'P'], ['reads_per_sample_postFilt', 'P'], ['prefilt_basefreq', 'P'], ['postFilt_basefreq', 'P'], ['prefilt_qualityscore', 'P'], ['postFilt_qualityscore', 'P'], ['prefilt_gccontent', 'P'], ['postFilt_gccontent', 'P'], ['prefilt_averagequality', 'P'], ['postFilt_averagequality', 'P'], ['prefilt_length', 'P'], ['postFilt_length', 'P'], ['number_per_percent_nucl_plot', 'P'], ['number_per_percent_prot_plot', 'P'], ['amino_entro_csv', 'P'], ['amino_entropy', 'P'], ['asv_entro_csv', 'P'], ['asv_entropy', 'P'], ['asvpdm', 'P'], ['aminopdm', 'P']]
OPERATION_46 gives  : []


OPERATION_47 string : reads_vsearch5_ch
    	       .into{ asv_file_for_ncasvs; nuclFastas_forDiamond_asv_ch; nuclFastas_forCounts_asv_ch; nuclFastas_forphylogeny_asv; nuclFastas_forMatrix_asv_ch; asv_for_med }
OPERATION_47 origin : [['reads_vsearch5_ch', 'P']]
OPERATION_47 gives  : [['asv_file_for_ncasvs', 'P'], ['nuclFastas_forDiamond_asv_ch', 'P'], ['nuclFastas_forCounts_asv_ch', 'P'], ['nuclFastas_forphylogeny_asv', 'P'], ['nuclFastas_forMatrix_asv_ch', 'P'], ['asv_for_med', 'P']]


OPERATION_48 string : reads_vsearch5_ch
    	       .into{ nuclFastas_forDiamond_asv_ch; nuclFastas_forCounts_asv_ch; nuclFastas_forphylogeny_asv; nuclFastas_forMatrix_asv_ch; asv_for_med }
OPERATION_48 origin : [['reads_vsearch5_ch', 'P']]
OPERATION_48 gives  : [['nuclFastas_forDiamond_asv_ch', 'P'], ['nuclFastas_forCounts_asv_ch', 'P'], ['nuclFastas_forphylogeny_asv', 'P'], ['nuclFastas_forMatrix_asv_ch', 'P'], ['asv_for_med', 'P']]


OPERATION_49 string : asv_counts_plots.mix(taxplot_asv, asv_heatmap, nucl_phyl_plot_asv, asvgroupscsv, asvgroupcounts, asv_group_rep_tree, tax_table_asv, tax_nodCol_asv, asv_phylogroupcsv, asv_phylogroupingcsv).flatten().buffer(size:11).dump(tag:'asv').into(report_asv)
OPERATION_49 origin : [['asv_counts_plots', 'P'], ['taxplot_asv', 'P'], ['asv_heatmap', 'P'], ['nucl_phyl_plot_asv', 'P'], ['asvgroupscsv', 'P'], ['asvgroupcounts', 'P'], ['asv_group_rep_tree', 'P'], ['tax_table_asv', 'P'], ['tax_nodCol_asv', 'P'], ['asv_phylogroupcsv', 'P'], ['asv_phylogroupingcsv', 'P']]
OPERATION_49 gives  : []


OPERATION_50 string : notu_counts_plots.mix(taxplot_ncasv, notu_heatmap, nucl_phyl_plot_ncasv, tax_table_ncasv, tax_nodCol_ncasv).groupTuple(by:0, size:6).dump(tag:'ncasv').into(report_ncasv)
OPERATION_50 origin : [['notu_counts_plots', 'P'], ['taxplot_ncasv', 'P'], ['notu_heatmap', 'P'], ['nucl_phyl_plot_ncasv', 'P'], ['tax_table_ncasv', 'P'], ['tax_nodCol_ncasv', 'P']]
OPERATION_50 gives  : []


OPERATION_51 string : potu_Acounts.mix(taxplot4, potu_aa_heatmap, potu_Atree_plot, tax_table_pcasvaa, tax_nodCol_pcasvaa).groupTuple(by:0, size:6).dump(tag:'pcasv1').into(report_pcasv_aa)
OPERATION_51 origin : [['potu_Acounts', 'P'], ['taxplot4', 'P'], ['potu_aa_heatmap', 'P'], ['potu_Atree_plot', 'P'], ['tax_table_pcasvaa', 'P'], ['tax_nodCol_pcasvaa', 'P']]
OPERATION_51 gives  : []


OPERATION_52 string : potu_Ncounts_for_report.mix(taxplot3, potu_nucl_heatmap, potu_Ntree_plot, tax_table_pcasvnt, tax_nodCol_pcasvnt).groupTuple(by:0, size:6).dump(tag:'pcasv2').into(report_pcasv_nucl)
OPERATION_52 origin : [['potu_Ncounts_for_report', 'P'], ['taxplot3', 'P'], ['potu_nucl_heatmap', 'P'], ['potu_Ntree_plot', 'P'], ['tax_table_pcasvnt', 'P'], ['tax_nodCol_pcasvnt', 'P']]
OPERATION_52 gives  : []


OPERATION_53 string : aminocounts_plot.mix(taxplot2, aminotype_heatmap, amino_rax_plot, atygroupscsv, amino_group_rep_tree, amino_groupcounts, tax_table_amino, tax_nodCol_amino, amino_phylogroupcsv, amino_phylogroupingcsv).flatten().buffer(size:11).dump(tag:'amino').into(report_aminotypes)
OPERATION_53 origin : [['aminocounts_plot', 'P'], ['taxplot2', 'P'], ['aminotype_heatmap', 'P'], ['amino_rax_plot', 'P'], ['atygroupscsv', 'P'], ['amino_group_rep_tree', 'P'], ['amino_groupcounts', 'P'], ['tax_table_amino', 'P'], ['tax_nodCol_amino', 'P'], ['amino_phylogroupcsv', 'P'], ['amino_phylogroupingcsv', 'P']]
OPERATION_53 gives  : []


OPERATION_54 string : report_asv.mix(report_ncasv, report_pcasv_aa, report_pcasv_nucl, report_aminotypes).map{it.flatten()}.dump(tag:'report').into(report_all_ch)
OPERATION_54 origin : [['report_asv', 'P'], ['report_ncasv', 'P'], ['report_pcasv_aa', 'P'], ['report_pcasv_nucl', 'P'], ['report_aminotypes', 'P']]
OPERATION_54 gives  : []


