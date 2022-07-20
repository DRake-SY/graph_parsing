OPERATION_1 string : Channel
        .from(params.readsTest)
        .map{ row -> [ row[0], [ file(row[1][0],checkIfExists: true),file(row[2][0],checkIfExists: true) ] ] }
        .ifEmpty{ exit 1, "params.readsTest was empty - no input files supplied" }
        .into{ reads_ch; reads_qc_ch; report_reads }
OPERATION_1 origin : [['params.readsTest', 'V']]
OPERATION_1 gives  : [['reads_ch', 'P'], ['reads_qc_ch', 'P'], ['report_reads', 'P']]


OPERATION_2 string : Channel
            .fromFilePairs("${params.reads}", checkIfExists: true)
            .into{ reads_ch; reads_qc_ch; report_reads }
OPERATION_2 origin : [['"${params.reads}", checkIfExists: true', 'A']]
OPERATION_2 gives  : [['reads_ch', 'P'], ['reads_qc_ch', 'P'], ['report_reads', 'P']]


OPERATION_3 string : skip_filter_ch = Channel.create()
OPERATION_3 origin : []
OPERATION_3 gives  : [['skip_filter_ch', 'P']]


OPERATION_4 string : skip_filter_only_ch = Channel.create()
OPERATION_4 origin : []
OPERATION_4 gives  : [['skip_filter_only_ch', 'P']]


OPERATION_5 string : skip_norm_ch = Channel.create()
OPERATION_5 origin : []
OPERATION_5 gives  : [['skip_norm_ch', 'P']]


OPERATION_6 string : skip_busco_dist = Channel.create()
OPERATION_6 origin : []
OPERATION_6 gives  : [['skip_busco_dist', 'P']]


OPERATION_7 string : fastp_results = Channel.empty()
OPERATION_7 origin : []
OPERATION_7 gives  : [['fastp_results', 'P']]


OPERATION_8 string : evigene_ch = Channel.create()
OPERATION_8 origin : []
OPERATION_8 gives  : [['evigene_ch', 'P']]


OPERATION_9 string : Channel
                .fromFilePairs("${launchDir}/onlyEvi/*.{fa,fasta}", size: -1, checkIfExists: true)
                .set{ evigene_ch }
OPERATION_9 origin : [['"${launchDir}/onlyEvi/*.{fa,fasta}", size: -1, checkIfExists: true', 'A']]
OPERATION_9 gives  : [['evigene_ch', 'P']]


OPERATION_10 string : rna_quast = Channel.create()
OPERATION_10 origin : []
OPERATION_10 gives  : [['rna_quast', 'P']]


OPERATION_11 string : rna_quast = Channel.create()
OPERATION_11 origin : []
OPERATION_11 gives  : [['rna_quast', 'P']]


OPERATION_12 string : mapping_evi_in = Channel.create()
OPERATION_12 origin : []
OPERATION_12 gives  : [['mapping_evi_in', 'P']]


OPERATION_13 string : mapping_trinity_in = Channel.create()
OPERATION_13 origin : []
OPERATION_13 gives  : [['mapping_trinity_in', 'P']]


OPERATION_14 string : busco4_all = Channel.create()
OPERATION_14 origin : []
OPERATION_14 gives  : [['busco4_all', 'P']]


OPERATION_15 string : busco4_dist_ch = Channel.create()
OPERATION_15 origin : []
OPERATION_15 gives  : [['busco4_dist_ch', 'P']]


OPERATION_16 string : busco4_sum = Channel.create()
OPERATION_16 origin : []
OPERATION_16 gives  : [['busco4_sum', 'P']]


OPERATION_17 string : busco4_comp = Channel.create()
OPERATION_17 origin : []
OPERATION_17 gives  : [['busco4_comp', 'P']]


OPERATION_18 string : Channel
                .fromFilePairs("${launchDir}/onlyAnn/*.{fa,fasta}", size: -1, checkIfExists: true)
                .into{ annotation_ch_transdecoder; annotation_ch_transdecoderB; evigene_ch_rnammer_ann; evigene_ch_trinotate; evi_dist_ann}
OPERATION_18 origin : [['"${launchDir}/onlyAnn/*.{fa,fasta}", size: -1, checkIfExists: true', 'A']]
OPERATION_18 gives  : [['annotation_ch_transdecoder', 'P'], ['annotation_ch_transdecoderB', 'P'], ['evigene_ch_rnammer_ann', 'P'], ['evigene_ch_trinotate', 'P'], ['evi_dist_ann', 'P']]


OPERATION_19 string : transdecoder_predict_ch = Channel.create()
OPERATION_19 origin : []
OPERATION_19 gives  : [['transdecoder_predict_ch', 'P']]


OPERATION_20 string : trinotate_ch = Channel.create()
OPERATION_20 origin : []
OPERATION_20 gives  : [['trinotate_ch', 'P']]


OPERATION_21 string : transcriptome_sequences1 = Channel.create()
OPERATION_21 origin : []
OPERATION_21 gives  : [['transcriptome_sequences1', 'P']]


OPERATION_22 string : transcriptome_sequences2 = Channel.create()
OPERATION_22 origin : []
OPERATION_22 gives  : [['transcriptome_sequences2', 'P']]


OPERATION_23 string : report_ch = Channel.create()
OPERATION_23 origin : []
OPERATION_23 gives  : [['report_ch', 'P']]


OPERATION_24 string : report_reads.into( skip_filter_ch, skip_filter_only_ch, skip_norm_ch, skip_busco_dist )
OPERATION_24 origin : [['report_reads', 'P']]
OPERATION_24 gives  : []


OPERATION_25 string : reads_ch
                .set{ reads_rna_ch }
OPERATION_25 origin : [['reads_ch', 'P']]
OPERATION_25 gives  : [['reads_rna_ch', 'P']]


OPERATION_26 string : reads_rna_ch
                .into{ reads_rna_ass; skip_rna_ch }
OPERATION_26 origin : [['reads_rna_ch', 'P']]
OPERATION_26 gives  : [['reads_rna_ass', 'P'], ['skip_rna_ch', 'P']]


OPERATION_27 string : assemblies_ch_trinity.mix( assemblies_ch_transabyss, assemblies_ch_spades, assemblies_ch_velvet, assemblies_ch_soap ).groupTuple(by:0,size:5).into(evigene_ch)
OPERATION_27 origin : [['assemblies_ch_trinity', 'P'], ['assemblies_ch_transabyss', 'P'], ['assemblies_ch_spades', 'P'], ['assemblies_ch_velvet', 'P'], ['assemblies_ch_soap', 'P']]
OPERATION_27 gives  : []


OPERATION_28 string : reads_rna_quast.join( evigene_ch_rna_quast ).into( rna_quast )
OPERATION_28 origin : [['reads_rna_quast', 'P'], ['evigene_ch_rna_quast', 'P']]
OPERATION_28 gives  : []


OPERATION_29 string : evigene_ch_rna_quast.into(rna_quast)
OPERATION_29 origin : [['evigene_ch_rna_quast', 'P']]
OPERATION_29 gives  : []


OPERATION_30 string : mapping_evi.mix( mapping_reads_evi ).groupTuple(by:0,size:2).into(mapping_evi_in)
OPERATION_30 origin : [['mapping_evi', 'P'], ['mapping_reads_evi', 'P']]
OPERATION_30 gives  : []


OPERATION_31 string : mapping_trinity.mix( mapping_reads_trinity ).groupTuple(by:0,size:2).into(mapping_trinity_in)
OPERATION_31 origin : [['mapping_trinity', 'P'], ['mapping_reads_trinity', 'P']]
OPERATION_31 gives  : []


OPERATION_32 string : assemblies_ch_soap_busco4.mix( assemblies_ch_velvet_busco4, assemblies_ch_spades_busco4, assemblies_ch_transabyss_busco4, assemblies_ch_trinity_busco4 ).groupTuple(by:0,size:5).into(busco4_all)
OPERATION_32 origin : [['assemblies_ch_soap_busco4', 'P'], ['assemblies_ch_velvet_busco4', 'P'], ['assemblies_ch_spades_busco4', 'P'], ['assemblies_ch_transabyss_busco4', 'P'], ['assemblies_ch_trinity_busco4', 'P']]
OPERATION_32 gives  : []


OPERATION_33 string : busco4_transpi_tsv.join( busco4_all_tsv ).into( busco4_dist_ch )
OPERATION_33 origin : [['busco4_transpi_tsv', 'P'], ['busco4_all_tsv', 'P']]
OPERATION_33 gives  : []


OPERATION_34 string : busco4_summary.mix(busco4_ch_trinity_sum).groupTuple(by:0,size:2).into(busco4_sum)
OPERATION_34 origin : [['busco4_summary', 'P'], ['busco4_ch_trinity_sum', 'P']]
OPERATION_34 gives  : []


OPERATION_35 string : busco4_comp_1.mix(busco4_comp_2).groupTuple(by:0,size:2).into(busco4_comp)
OPERATION_35 origin : [['busco4_comp_1', 'P'], ['busco4_comp_2', 'P']]
OPERATION_35 gives  : []


OPERATION_36 string : transdecoder_predict_diamond.mix( transdecoder_predict_hmmer, annotation_ch_transdecoderB.map{it.flatten()} ).groupTuple(by:0,size:3).into(transdecoder_predict_ch)
OPERATION_36 origin : [['transdecoder_predict_diamond', 'P']]
OPERATION_36 gives  : []


OPERATION_37 string : evigene_ch_rnammer_ann.map{it.flatten()}.set{evigene_ch_rnammer}}

        if (params.withRnammer) {
OPERATION_37 origin : [['evigene_ch_rnammer_ann', 'P']]
OPERATION_37 gives  : [['evigene_ch_rnammer', 'P']]


OPERATION_38 string : evigene_ch_trinotate.map{it.flatten()}.mix( transdecoder_ch_trinotate,trinotate_ch_diamondX,trinotate_ch_diamondP,trinotate_ch_diamondX_custom,trinotate_ch_diamondP_custom,trinotate_ch_hmmer,trinotate_ch_signalp,trinotate_ch_tmhmm,trinotate_ch_rnammer ).groupTuple(by:0,size:10).into(trinotate_ch)
OPERATION_38 origin : [['evigene_ch_trinotate', 'P'], ['transdecoder_ch_trinotate', 'P'], ['trinotate_ch_diamondX', 'P'], ['trinotate_ch_diamondP', 'P'], ['trinotate_ch_diamondX_custom', 'P'], ['trinotate_ch_diamondP_custom', 'P'], ['trinotate_ch_hmmer', 'P'], ['trinotate_ch_signalp', 'P'], ['trinotate_ch_tmhmm', 'P'], ['trinotate_ch_rnammer', 'P']]
OPERATION_38 gives  : []


OPERATION_39 string : evi_dist_ann.map{it.flatten()}.set{evi_dist}}

       PROCESS DEF get_transcript_dist

       PROCESS DEF summary_transdecoder_individual

       PROCESS DEF summary_trinotate_individual

    }

    if (params.all) {

        if (params.filterSpecies) {
OPERATION_39 origin : [['evi_dist_ann', 'P']]
OPERATION_39 gives  : [['evi_dist', 'P']]


OPERATION_40 string : evi_filt.into( transcriptome_sequences1, transcriptome_sequences2 )
OPERATION_40 origin : [['evi_filt', 'P']]
OPERATION_40 gives  : []


OPERATION_41 string : fastp_csv.mix( norm_report, remove_rrna_sum, mapping_evi_results, mapping_trinity_results, rna_quast_report, size_dist, summary_evi_csv, busco4_csv, busco4_heatmap, transdecoder_csv, go_csv, uniprot_csv, kegg_report ).groupTuple(by:0,size:14).map{ it.flatten().toList() }.into(report_ch)
OPERATION_41 origin : [['fastp_csv', 'P'], ['norm_report', 'P'], ['remove_rrna_sum', 'P'], ['mapping_evi_results', 'P'], ['mapping_trinity_results', 'P'], ['rna_quast_report', 'P'], ['size_dist', 'P'], ['summary_evi_csv', 'P'], ['busco4_csv', 'P'], ['busco4_heatmap', 'P'], ['transdecoder_csv', 'P'], ['go_csv', 'P'], ['uniprot_csv', 'P'], ['kegg_report', 'P']]
OPERATION_41 gives  : []


