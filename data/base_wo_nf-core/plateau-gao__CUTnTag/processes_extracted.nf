Name : workflow_record
Inputs : []
Outputs : []
Emits : []


Name : fastqc
Inputs : [[0, 'fastqc_ch']]
Outputs : []
Emits : []


Name : trim
Inputs : [[0, 'align_ch']]
Outputs : [[0, '']]
Emits : []


Name : build_index_hg38
Inputs : [[0, 'ref_hg38_ch']]
Outputs : [[0, 'index_hg38_ch']]
Emits : []


Name : build_index_ecoli
Inputs : [[0, 'ref_ecoli_ch']]
Outputs : [[0, 'index_ecoli_ch']]
Emits : []


Name : align_hg38
Inputs : [[0, 'align_hg38_ch']]
Outputs : [[0, ''], [1, 'bowtie2_report_hg38_ch']]
Emits : []


Name : align_ecoli
Inputs : [[0, 'align_ecoli_ch']]
Outputs : [[0, 'id'], [1, 'bowtie2_report_spikeIn_ch'], [2, '']]
Emits : []


Name : picard_rmDup
Inputs : [[0, 'sam_hg38_picard_ch']]
Outputs : [[0, 'id'], [1, 'id'], [3, 'rmdup_sam_ch'], [4, 'rmdup_report_ch']]
Emits : []


Name : assess_frag_size_distribution
Inputs : [[0, 'sam4assess_frag']]
Outputs : [[0, 'fragmentLen_ch']]
Emits : []


Name : quality_filter
Inputs : [[0, 'sam4filter_ch']]
Outputs : [[0, 'sam2bam_ch']]
Emits : []


Name : sam2bam
Inputs : [[0, 'sam2bam_ch']]
Outputs : [[0, ''], [1, 'sort_bam_ch']]
Emits : []


Name : bam2bed
Inputs : [[0, 'bam2bed_ch']]
Outputs : [[0, 'bed_ch'], [1, 'clean_bed_ch'], [2, '']]
Emits : []


Name : bed2bedgraph
Inputs : [[0, 'bed2bedgraph_ch']]
Outputs : [[0, 'bedgraph_ch']]
Emits : []


Name : bam2bigwig
Inputs : [[0, 'exp_bam_ch']]
Outputs : [[0, '']]
Emits : []


Name : assess_reproducibility
Inputs : [[0, 'fragBed_assess_ch']]
Outputs : [[0, 'fragcount_bed_ch']]
Emits : []


Name : align_summary_R
Inputs : [[0, 'bowtie2_report_hg38_ch'], [1, 'bowtie2_report_spikeIn_ch'], [2, 'rmdup_report_ch'], [3, 'fragmentLen_ch'], [4, 'fragcount_bed_ch'], [5, 'seqDepth_file_ch']]
Outputs : [[0, '']]
Emits : []


Name : seacr_with_ctrl
Inputs : [[0, 'seacr_ch']]
Outputs : [[0, ''], [1, 'seacr_top4report_ch']]
Emits : []


Name : seacr_with_ctrl_R
Inputs : [[0, 'seacr_ctrl4r_ch'], [1, 'seacr_top4r_ch'], [2, 'seacr_bam_ch'], [3, 'alignsummary4Seacr_ch']]
Outputs : []
Emits : []


Name : macs2
Inputs : [[0, 'macs2_ch']]
Outputs : [[0, 'exp_id'], [1, 'exp_id'], [2, 'exp_id'], [3, 'macs2_4hp_ch'], [4, 'macs2_4report_ch']]
Emits : []


Name : macs2_R
Inputs : [[0, 'macs2_4r_ch'], [1, 'macs2_bam_ch'], [2, 'alignsummary4Macs2_ch']]
Outputs : []
Emits : []


Name : seacr_without_ctrl
Inputs : [[0, 'bedgraph_ch']]
Outputs : [[0, ''], [1, 'seacr_top4report_ch']]
Emits : []


Name : seacr_without_ctrl_report
Inputs : [[0, 'seacr_noctrl4r_ch'], [1, 'seacr_top4r_ch'], [2, 'seacr_bam_ch'], [3, 'alignsummary4Seacr_ch']]
Outputs : []
Emits : []


Name : trans_heatmap
Inputs : [[0, 'ref_heatmap_ch'], [1, 'bw4trans_collect_ch']]
Outputs : []
Emits : []


Name : seacr_summitregion
Inputs : [[0, 'seacr_ctrl4hp_ch']]
Outputs : [[0, 'seacr_summit_ch']]
Emits : []


Name : seacr_withCtrl_heatmap
Inputs : [[0, 'bw_seacr_ch']]
Outputs : [[0, 'id'], [1, 'id']]
Emits : []


Name : macs2_heatmap
Inputs : [[0, 'bw_macs2_ch']]
Outputs : [[0, 'id'], [1, 'id']]
Emits : []


Name : seacr_noCtrl_summitregion
Inputs : [[0, 'seacr_noctrl4hp_ch']]
Outputs : [[0, 'seacr_summit_ch']]
Emits : []


Name : seacr_noCtrl_heatmap
Inputs : [[0, 'bw_seacr_ch']]
Outputs : [[0, 'id'], [1, 'id']]
Emits : []


