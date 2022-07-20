OPERATION_1 string : mapped_bams = mapped_bam_for_sam2tab.join(mapped_rRNA_sam).join(mapped_smallRNA_sam)
OPERATION_1 origin : [['mapped_bam_for_sam2tab', 'P'], ['mapped_rRNA_sam', 'P'], ['mapped_smallRNA_sam', 'P']]
OPERATION_1 gives  : [['mapped_bams', 'P']]


OPERATION_2 string : ch_for_genome_SHAPE_single_DMSO = genome_sam2tab1.filter{it[1] =~/__DMSO__/}.map{
    [process_sample_name(it[0], "single"), it[1], it[2], it[3]] }
OPERATION_2 origin : [['genome_sam2tab1', 'P']]
OPERATION_2 gives  : [['ch_for_genome_SHAPE_single_DMSO', 'P']]


OPERATION_3 string : ch_for_genome_SHAPE_single_NAIN3 = genome_sam2tab2.filter{it[1] =~/__NAIN3__/}.map{
    [process_sample_name(it[0], "single"), it[1], it[2], it[3]] }
OPERATION_3 origin : [['genome_sam2tab2', 'P']]
OPERATION_3 gives  : [['ch_for_genome_SHAPE_single_NAIN3', 'P']]


OPERATION_4 string : ch_for_genome_SHAPE_single = ch_for_genome_SHAPE_single_DMSO.join(ch_for_genome_SHAPE_single_NAIN3)
OPERATION_4 origin : [['ch_for_genome_SHAPE_single_DMSO', 'P'], ['ch_for_genome_SHAPE_single_NAIN3', 'P']]
OPERATION_4 gives  : [['ch_for_genome_SHAPE_single', 'P']]


OPERATION_5 string : dmso_isoform_fpkm_single = isoform_fpkm2.filter{it[1] =~/__DMSO__/}.map{
    [process_sample_name(it[0], "single"), it[1]] }
OPERATION_5 origin : [['isoform_fpkm2', 'P']]
OPERATION_5 gives  : [['dmso_isoform_fpkm_single', 'P']]


OPERATION_6 string : single_gTab_rpkm = single_gTab.join(dmso_isoform_fpkm_single)
OPERATION_6 origin : [['single_gTab', 'P'], ['dmso_isoform_fpkm_single', 'P']]
OPERATION_6 gives  : [['single_gTab_rpkm', 'P']]


OPERATION_7 string : ch_for_merge_coverage = single_coverage.collect().map{ wrap_items(it[0], sep=":") }
OPERATION_7 origin : [['single_coverage', 'P']]
OPERATION_7 gives  : [['ch_for_merge_coverage', 'P']]


OPERATION_8 string : ch_for_genome_SHAPE_DMSO = genome_sam2tab3.filter{it[1] =~/__DMSO__/}.map{
    [process_sample_name(it[0], "sampleName"), it[1], it[2], it[3]] }. groupTuple().map{
        [ it[0], wrap_items(it[1],sep=","), wrap_items(it[2],sep=","), wrap_items(it[3],sep=",") ]
    }
OPERATION_8 origin : [['genome_sam2tab3', 'P']]
OPERATION_8 gives  : [['ch_for_genome_SHAPE_DMSO', 'P']]


OPERATION_9 string : ch_for_genome_SHAPE_NAIN3 = genome_sam2tab4.filter{it[1] =~/__NAIN3__/}.map{
    [process_sample_name(it[0], "sampleName"), it[1], it[2], it[3]] }. groupTuple().map{
        [ it[0], wrap_items(it[1],sep=","), wrap_items(it[2],sep=","), wrap_items(it[3],sep=",") ]
    }
OPERATION_9 origin : [['genome_sam2tab4', 'P']]
OPERATION_9 gives  : [['ch_for_genome_SHAPE_NAIN3', 'P']]


OPERATION_10 string : ch_for_genome_SHAPE = ch_for_genome_SHAPE_DMSO.join(ch_for_genome_SHAPE_NAIN3)
OPERATION_10 origin : [['ch_for_genome_SHAPE_DMSO', 'P'], ['ch_for_genome_SHAPE_NAIN3', 'P']]
OPERATION_10 gives  : [['ch_for_genome_SHAPE', 'P']]


OPERATION_11 string : dmso_isoform_fpkm = isoform_fpkm.filter{it[1] =~/__DMSO__/}.map{
    [process_sample_name(it[0], "sampleName"), it[1] ]}.groupTuple().map{
        [ it[0], wrap_items(it[1],sep=",") ]
    }
OPERATION_11 origin : [['isoform_fpkm', 'P']]
OPERATION_11 gives  : [['dmso_isoform_fpkm', 'P']]


OPERATION_12 string : ch_for_SHAPE = merged_gTab.join(dmso_isoform_fpkm)
OPERATION_12 origin : [['merged_gTab', 'P'], ['dmso_isoform_fpkm', 'P']]
OPERATION_12 gives  : [['ch_for_SHAPE', 'P']]


