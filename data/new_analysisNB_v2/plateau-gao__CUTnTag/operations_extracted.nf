OPERATION_1 string : Channel
    .fromPath(params.input)
    .splitCsv(header:true)
    .map {row -> tuple(row.group, row.cond, row.SampleId, file("${params.data}/${row.SampleId}_${row.read1}"), file("${params.data}/${row.SampleId}_${row.read2}"))}
    .into {fastqc_ch; align_ch}
OPERATION_1 origin : [['params.input', 'A']]
OPERATION_1 gives  : [['fastqc_ch', 'P'], ['align_ch', 'P']]


OPERATION_2 string : Channel.fromPath(params.ref_hg38).set{ref_hg38_ch}
OPERATION_2 origin : [['params.ref_hg38', 'A']]
OPERATION_2 gives  : [['ref_hg38_ch', 'P']]


OPERATION_3 string : Channel.fromPath(params.ref_ecoli).set{ref_ecoli_ch}
OPERATION_3 origin : [['params.ref_ecoli', 'A']]
OPERATION_3 gives  : [['ref_ecoli_ch', 'P']]


OPERATION_4 string : seacr_4_summit_ch = Channel.empty()}
} else {seacr_4_summit_ch = seacr_noctrl4hp_ch}


if (params.workflow.heatmap_on_trans) {
    Channel.fromPath(params.gene_for_heatmap).set{ref_heatmap_ch}
    
    bw4trans_ch
        .map {group, cond, id, path -> [path]}
        .collect()
        .set {bw4trans_collect_ch}

   PROCESS DEF trans_heatmap
}

if (params.workflow.heatmap_on_peak) {
    if (params.use_ctrl) {
OPERATION_4 origin : [['params.gene_for_heatmap', 'A']]
OPERATION_4 gives  : [['seacr_4_summit_ch', 'P'], ['ref_heatmap_ch', 'P'], ['bw4trans_collect_ch', 'P']]


OPERATION_5 string : align_ch.into {hg38_ch; ecoli_ch}}

if (params.workflow.bowtie2_build_hg38) {
OPERATION_5 origin : [['align_ch', 'P']]
OPERATION_5 gives  : [['hg38_ch', 'P'], ['ecoli_ch', 'P']]


OPERATION_6 string : ref_hg38_ch.set{index_hg38_ch}}

if (params.workflow.bowtie2_build_ecoli) {
OPERATION_6 origin : [['ref_hg38_ch', 'P']]
OPERATION_6 gives  : [['index_hg38_ch', 'P']]


OPERATION_7 string : ref_ecoli_ch.set{index_ecoli_ch}}

  
                                                                                       
                                         
                                                                                       
  

hg38_ch
    .combine(index_hg38_ch.collect())
    .map {group, cond, id, read1,read2, bt1, bt2, bt3, bt4, bt5, bt6 ->
OPERATION_7 origin : [['ref_ecoli_ch', 'P']]
OPERATION_7 gives  : [['index_ecoli_ch', 'P']]


OPERATION_8 string : ecoli_ch
    .combine(index_ecoli_ch.collect())
    .map {group, cond, id, read1,read2, bt1, bt2, bt3, bt4, bt5, bt6 ->
        [group, cond, id, read1, read2, [bt1,bt2,bt3,bt4,bt5,bt6]]
    }
    .set {align_ecoli_ch}
OPERATION_8 origin : [['ecoli_ch', 'P']]
OPERATION_8 gives  : [['align_ecoli_ch', 'P']]


OPERATION_9 string : rmdup_sam_ch.into{sam4filter_ch; sam4assess_frag}
OPERATION_9 origin : [['rmdup_sam_ch', 'P']]
OPERATION_9 gives  : [['sam4filter_ch', 'P'], ['sam4assess_frag', 'P']]


OPERATION_10 string : sam_hg38_nopicard_ch.into{sam4filter_ch; sam4assess_frag}}

  
                                                                                       
                               
                                                                                       
  
PROCESS DEF assess_frag_size_distribution

  
                                                                                       
                               
                                                                                       
  

if (params.args.filter_miniQualityScore > 0) {params.workflow.map_quality_filter = true}

if (params.workflow.map_quality_filter) {
OPERATION_10 origin : [['sam_hg38_nopicard_ch', 'P']]
OPERATION_10 gives  : [['sam4filter_ch', 'P'], ['sam4assess_frag', 'P']]


OPERATION_11 string : sam4filter_ch.set{sam2bam_ch}}

  
                                                                                       
                          
                                                                                       
  
PROCESS DEF sam2bam

PROCESS DEF bam2bed

seqdepth_4_bedgraph_ch
    .join(fragBed_convert_ch, by:[0,1,2])
    .set{bed2bedgraph_ch}
    PROCESS DEF bed2bedgraph

if (params.workflow.heatmap_on_peak || params.workflow.heatmap_on_trans) {params.workflow.bam2bigwig = true}

if (params.workflow.bam2bigwig) {
OPERATION_11 origin : [['sam4filter_ch', 'P']]
OPERATION_11 gives  : [['sam2bam_ch', 'P'], ['bed2bedgraph_ch', 'P']]


OPERATION_12 string : sort_bam_ch
        .filter {group, cond, id, path -> cond == 'exp'}
        .set{exp_bam_ch}
OPERATION_12 origin : [['sort_bam_ch', 'P']]
OPERATION_12 gives  : [['exp_bam_ch', 'P']]


OPERATION_13 string : seqdepth_4_R_ch
    .map{group, cond, id, seqdepth -> [seqdepth]}
    .set{seqDepth_file_ch}
OPERATION_13 origin : [['seqdepth_4_R_ch', 'P']]
OPERATION_13 gives  : [['seqDepth_file_ch', 'P']]


OPERATION_14 string : bedgraph_ch
            .branch {group, cond, id, path ->
                ctrl: cond == "ctrl"
                exp: cond == "exp"
            }
            .set {branch_bedgraph_ch}
OPERATION_14 origin : [['bedgraph_ch', 'P']]
OPERATION_14 gives  : [['branch_bedgraph_ch', 'P']]


OPERATION_15 string : branch_bedgraph_ch.ctrl().combine(branch_bedgraph_ch.exp, by: 0)
            .set {seacr_ch}
OPERATION_15 origin : [['branch_bedgraph_ch', 'P']]
OPERATION_15 gives  : [['seacr_ch', 'P']]


OPERATION_16 string : seacr_ctrl4report_ch
            .map{group, id, file -> [file]}
            .set{seacr_ctrl4r_ch}
OPERATION_16 origin : [['seacr_ctrl4report_ch', 'P']]
OPERATION_16 gives  : [['seacr_ctrl4r_ch', 'P']]


OPERATION_17 string : seacr_top4report_ch
            .map{group, id, file -> [file]}
            .set{seacr_top4r_ch}
OPERATION_17 origin : [['seacr_top4report_ch', 'P']]
OPERATION_17 gives  : [['seacr_top4r_ch', 'P']]


OPERATION_18 string : bam4seacr_report_ch
            .map{group,cond, id, bam -> [bam]}
            .set{seacr_bam_ch}
OPERATION_18 origin : [['bam4seacr_report_ch', 'P']]
OPERATION_18 gives  : [['seacr_bam_ch', 'P']]


OPERATION_19 string : bam4macs2_ch
            .branch {group, cond, id, path ->
                ctrl: cond == "ctrl"
                exp: cond == "exp"
            }
            .set {branch_macs2_ch}
OPERATION_19 origin : [['bam4macs2_ch', 'P']]
OPERATION_19 gives  : [['branch_macs2_ch', 'P']]


OPERATION_20 string : branch_macs2_ch.ctrl().combine(branch_macs2_ch.exp, by:0)
            .set {macs2_ch}
OPERATION_20 origin : [['branch_macs2_ch', 'P']]
OPERATION_20 gives  : [['macs2_ch', 'P']]


OPERATION_21 string : macs2_4report_ch
            .map{group, id, file -> file}
            .set{macs2_4r_ch}
OPERATION_21 origin : [['macs2_4report_ch', 'P']]
OPERATION_21 gives  : [['macs2_4r_ch', 'P']]


OPERATION_22 string : bam4macs2_report_ch
            .map{group,cond, id, bam -> bam}
            .set{macs2_bam_ch}
OPERATION_22 origin : [['bam4macs2_report_ch', 'P']]
OPERATION_22 gives  : [['macs2_bam_ch', 'P']]


OPERATION_23 string : seacr_noctrl4report_ch
        .map{group, id, file -> [file]}
        .set{seacr_noctrl4r_ch}
OPERATION_23 origin : [['seacr_noctrl4report_ch', 'P']]
OPERATION_23 gives  : [['seacr_noctrl4r_ch', 'P']]


OPERATION_24 string : seacr_top4report_ch
        .map{group, id, file -> [file]}
        .set{seacr_top4r_ch}
OPERATION_24 origin : [['seacr_top4report_ch', 'P']]
OPERATION_24 gives  : [['seacr_top4r_ch', 'P']]


OPERATION_25 string : bam4seacr_report_ch
        .map{group,cond, id, bam -> [bam]}
        .set{seacr_bam_ch}
OPERATION_25 origin : [['bam4seacr_report_ch', 'P']]
OPERATION_25 gives  : [['seacr_bam_ch', 'P']]


OPERATION_26 string : seacr_summit_ch
                .join(bw4seacr_ch, by:[0,1])
                .set {bw_seacr_ch}
OPERATION_26 origin : [['seacr_summit_ch', 'P']]
OPERATION_26 gives  : [['bw_seacr_ch', 'P']]


OPERATION_27 string : macs2_4hp_ch
                .join(bw4macs2_ch, by:[0,1])
                .set {bw_macs2_ch}
OPERATION_27 origin : [['macs2_4hp_ch', 'P']]
OPERATION_27 gives  : [['bw_macs2_ch', 'P']]


OPERATION_28 string : seacr_summit_ch
            .join(bw4seacr_ch, by:[0,1])
            .set {bw_seacr_ch}
OPERATION_28 origin : [['seacr_summit_ch', 'P']]
OPERATION_28 gives  : [['bw_seacr_ch', 'P']]


OPERATION_29 string : seacr_4_summit_ch = seacr_ctrl4hp_ch
OPERATION_29 origin : [['seacr_ctrl4hp_ch', 'P']]
OPERATION_29 gives  : [['seacr_4_summit_ch', 'P']]


