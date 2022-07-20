OPERATION_1 string : ch_fasta = Channel.value(file(params.fasta))
OPERATION_1 origin : []
OPERATION_1 gives  : [['ch_fasta', 'P']]


OPERATION_2 string : ch_fastq1 = Channel.value(file(params.fastq1))
OPERATION_2 origin : []
OPERATION_2 gives  : [['ch_fastq1', 'P']]


OPERATION_3 string : ch_fastq2 = Channel.value(file(params.fastq2))
OPERATION_3 origin : []
OPERATION_3 gives  : [['ch_fastq2', 'P']]


OPERATION_4 string : ch_pbsvTandem = Channel.value(file(params.pbsv_tandemrepeats))
OPERATION_4 origin : []
OPERATION_4 gives  : [['ch_pbsvTandem', 'P']]


OPERATION_5 string : ch_bwa = Channel.value(file(params.bwa))
OPERATION_5 origin : []
OPERATION_5 gives  : [['ch_bwa', 'P']]


OPERATION_6 string : ch_bam_und = Channel.value(file(params.bam))
OPERATION_6 origin : []
OPERATION_6 gives  : [['ch_bam_und', 'P']]


OPERATION_7 string : vcf_pbsv_path.concat(
	vcf_sniffles_path
	)
	.collectFile(name: "sample.vcfs.txt", sort: false)
	.set { sample_vcfs_paths }
OPERATION_7 origin : [['vcf_pbsv_path', 'P'], ['vcf_sniffles_path', 'P']]
OPERATION_7 gives  : [['sample_vcfs_paths', 'P']]


OPERATION_8 string : ch_sample_name_bam_bai.into {
  		in_brkdncr
  		in_delly
  		in_lumpy
  		in_manta
	}
OPERATION_8 origin : [['ch_sample_name_bam_bai', 'P']]
OPERATION_8 gives  : []


OPERATION_9 string : vcf_breakdancer.concat(
	vcf_delly,
	vcf_lumpy,
	vcf_manta
	)
	.collectFile(name: "sample.vcfs.txt", sort: false)
	.set { sample_vcfs_paths }
OPERATION_9 origin : [['vcf_breakdancer', 'P'], ['vcf_delly', 'P'], ['vcf_lumpy', 'P'], ['vcf_manta', 'P']]
OPERATION_9 gives  : [['sample_vcfs_paths', 'P']]


OPERATION_10 string : vcf_merged.into{vcf_merged_1; vcf_merged_2; vcf_merged_3}
OPERATION_10 origin : [['vcf_merged', 'P']]
OPERATION_10 gives  : [['vcf_merged_1', 'P'], ['vcf_merged_2', 'P'], ['vcf_merged_3', 'P']]


OPERATION_11 string : ch_summary.into{ch_summary_1; ch_summary_2}
OPERATION_11 origin : [['ch_summary', 'P']]
OPERATION_11 gives  : [['ch_summary_1', 'P'], ['ch_summary_2', 'P']]


OPERATION_12 string : ch_ins.into{ch_ins_1; ch_ins_2}
OPERATION_12 origin : [['ch_ins', 'P']]
OPERATION_12 gives  : [['ch_ins_1', 'P'], ['ch_ins_2', 'P']]


OPERATION_13 string : ch_inv.into{ch_inv_1; ch_inv_2}
OPERATION_13 origin : [['ch_inv', 'P']]
OPERATION_13 gives  : [['ch_inv_1', 'P'], ['ch_inv_2', 'P']]


OPERATION_14 string : ch_del.into{ch_del_1; ch_del_2}
OPERATION_14 origin : [['ch_del', 'P']]
OPERATION_14 gives  : [['ch_del_1', 'P'], ['ch_del_2', 'P']]


OPERATION_15 string : ch_dup.into{ch_dup_1; ch_dup_2}
OPERATION_15 origin : [['ch_dup', 'P']]
OPERATION_15 gives  : [['ch_dup_1', 'P'], ['ch_dup_2', 'P']]


OPERATION_16 string : ch_tra.into{ch_tra_1; ch_tra_2}
OPERATION_16 origin : [['ch_tra', 'P']]
OPERATION_16 gives  : [['ch_tra_1', 'P'], ['ch_tra_2', 'P']]


OPERATION_17 string : ch_ins_exons.into{ch_ins_exons_1; ch_ins_exons_2}
OPERATION_17 origin : [['ch_ins_exons', 'P']]
OPERATION_17 gives  : [['ch_ins_exons_1', 'P'], ['ch_ins_exons_2', 'P']]


OPERATION_18 string : ch_del_exons.into{ch_del_exons_1; ch_del_exons_2}
OPERATION_18 origin : [['ch_del_exons', 'P']]
OPERATION_18 gives  : [['ch_del_exons_1', 'P'], ['ch_del_exons_2', 'P']]


OPERATION_19 string : ch_inv_exons.into{ch_inv_exons_1; ch_inv_exons_2}
OPERATION_19 origin : [['ch_inv_exons', 'P']]
OPERATION_19 gives  : [['ch_inv_exons_1', 'P'], ['ch_inv_exons_2', 'P']]


OPERATION_20 string : ch_dup_exons.into{ch_dup_exons_1; ch_dup_exons_2}
OPERATION_20 origin : [['ch_dup_exons', 'P']]
OPERATION_20 gives  : [['ch_dup_exons_1', 'P'], ['ch_dup_exons_2', 'P']]


OPERATION_21 string : ch_tra_exons.into{ch_tra_exons_1; ch_tra_exons_2}
OPERATION_21 origin : [['ch_tra_exons', 'P']]
OPERATION_21 gives  : [['ch_tra_exons_1', 'P'], ['ch_tra_exons_2', 'P']]


OPERATION_22 string : pbmm2_bam = pbmm2_bam_css
OPERATION_22 origin : [['pbmm2_bam_css', 'P']]
OPERATION_22 gives  : [['pbmm2_bam', 'P']]


OPERATION_23 string : pbmm2_bam = pbmm2_bam_clr
OPERATION_23 origin : [['pbmm2_bam_clr', 'P']]
OPERATION_23 gives  : [['pbmm2_bam', 'P']]


OPERATION_24 string : pbsv_svsig = pbsv_svsig_tandem
OPERATION_24 origin : [['pbsv_svsig_tandem', 'P']]
OPERATION_24 gives  : [['pbsv_svsig', 'P']]


OPERATION_25 string : pbsv_svsig = pbsv_svsig_no_tandem
OPERATION_25 origin : [['pbsv_svsig_no_tandem', 'P']]
OPERATION_25 gives  : [['pbsv_svsig', 'P']]


OPERATION_26 string : ch_bwa  = bwa_built
OPERATION_26 origin : [['bwa_built', 'P']]
OPERATION_26 gives  : [['ch_bwa', 'P']]


OPERATION_27 string : ch_bam_und = ch_bam_map
OPERATION_27 origin : [['ch_bam_map', 'P']]
OPERATION_27 gives  : [['ch_bam_und', 'P']]


