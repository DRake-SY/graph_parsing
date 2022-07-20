OPERATION_1 string : ch_multiqc_custom_config = Channel.fromPath(params.multiqc_config, checkIfExists: true)
OPERATION_1 origin : [['params.multiqc_config, checkIfExists: true', 'A']]
OPERATION_1 gives  : [['ch_multiqc_custom_config', 'P']]


OPERATION_2 string : ch_multiqc_custom_config = Channel.empty()
OPERATION_2 origin : []
OPERATION_2 gives  : [['ch_multiqc_custom_config', 'P']]


OPERATION_3 string : ch_output_docs = Channel.fromPath("$baseDir/docs/output.md")
OPERATION_3 origin : [['"$baseDir/docs/output.md"', 'A']]
OPERATION_3 gives  : [['ch_output_docs', 'P']]


OPERATION_4 string : Channel.from(summary.collect{ [it.key, it.value] })
    .map { k,v -> "<dt>$k</dt><dd><samp>${v ?: '<span style=\"color:#999999;\">N/A</a>'}</samp></dd>" }
    .reduce { a, b -> return [a, b].join("\n            ") }
    .map { x -> """
    id: 'nf-core-influenzangs-summary'
    description: " - this information is collected when the pipeline is started."
    section_name: 'nf-core/influenzangs Workflow Summary'
    section_href: 'https://github.com/nf-core/influenzangs'
    plot_type: 'html'
    data: |
        <dl class=\"dl-horizontal\">
            $x
        </dl>
    """.stripIndent() }
    .set { ch_workflow_summary }
OPERATION_4 origin : [['summary.collect{ [it.key, it.value] }', 'V']]
OPERATION_4 gives  : [['ch_workflow_summary', 'P']]


OPERATION_5 string : Channel.fromFilePairs(params.reads)
     .into { raw_reads_fastqc; raw_reads_trimgalore }
OPERATION_5 origin : [['params.reads', 'A']]
OPERATION_5 gives  : [['raw_reads_fastqc', 'P'], ['raw_reads_trimgalore', 'P']]


OPERATION_6 string : Channel.fromPath(params.genome)
    .map{path -> [path.simpleName,path]}
    .into{ labelled_reference_ch; reference_tosplit_ch }
OPERATION_6 origin : [['params.genome', 'A']]
OPERATION_6 gives  : [['labelled_reference_ch', 'P'], ['reference_tosplit_ch', 'P']]


OPERATION_7 string : summary.collect { k,v -> "${k.padRight(18)}: $v" }.join("\n")
OPERATION_7 origin : [['summary', 'P']]
OPERATION_7 gives  : []


OPERATION_8 string : bwa_mem_input_ch = trimmed_samples_ch.combine(bwa_ref_ch)
OPERATION_8 origin : [['trimmed_samples_ch', 'P'], ['bwa_ref_ch', 'P']]
OPERATION_8 gives  : [['bwa_mem_input_ch', 'P']]


OPERATION_9 string : bam_no_dup_ch.combine(gatk_mutect_reference_ch, by: 0)
    .into{ GATK_input_mutect_ch; GATK_input_realign_ch }
OPERATION_9 origin : [['bam_no_dup_ch', 'P']]
OPERATION_9 gives  : [['GATK_input_mutect_ch', 'P'], ['GATK_input_realign_ch', 'P']]


OPERATION_10 string : GATK_input_recalib_ch = GATK_output_mutect_ch.combine(GATK_output_realign_ch, by:[0,1])
OPERATION_10 origin : [['GATK_output_mutect_ch', 'P']]
OPERATION_10 gives  : [['GATK_input_recalib_ch', 'P']]


OPERATION_11 string : split_reference_ch
    .flatten()
 		.map{path -> [path.simpleName,path]}
    .into{ split_ref_ch; fastasize_input_ch; ref_make_cons_ch; ref_align_1_ch; ref_align_pre_ch; ref_dummy_align_ch }
OPERATION_11 origin : [['split_reference_ch', 'P']]
OPERATION_11 gives  : [['split_ref_ch', 'P'], ['fastasize_input_ch', 'P'], ['ref_make_cons_ch', 'P'], ['ref_align_1_ch', 'P'], ['ref_align_pre_ch', 'P'], ['ref_dummy_align_ch', 'P']]


OPERATION_12 string : split_bam_ch
 		.flatten()
 		.map{file -> [file.getFileName().toString().split("\\.")[1], file.getFileName().toString().split("\\.")[0], file]}
 		.combine(split_ref_ch, by:0)
    .into{ mpileup_input_ch; cov_input_nosize_ch; bam_choose_consensus_ch; bcftools_bam_ch }
OPERATION_12 origin : [['split_bam_ch', 'P']]
OPERATION_12 gives  : [['mpileup_input_ch', 'P'], ['cov_input_nosize_ch', 'P'], ['bam_choose_consensus_ch', 'P'], ['bcftools_bam_ch', 'P']]


OPERATION_13 string : cov_input_ch = cov_input_nosize_ch
 		.combine(split_fasta_size_ch, by:0)
OPERATION_13 origin : [['cov_input_nosize_ch', 'P']]
OPERATION_13 gives  : [['cov_input_ch', 'P']]


OPERATION_14 string : ref_align_2_ch = ref_align_pre_ch
    .join(fasta_size_align_ch, by:0)
    .map{refseg, fastafile, fastasizes-> [refseg.split("_")[1], fastafile, fastasizes]}
OPERATION_14 origin : [['ref_align_pre_ch', 'P']]
OPERATION_14 gives  : [['ref_align_2_ch', 'P']]


OPERATION_15 string : reference_to_align_ch = ref_align_1_ch
    .map{refseg, fastafile -> [refseg.split("_")[1], fastafile]}
    .combine(ref_align_2_ch, by:0)
    .filter { it[1] != it[2]}
OPERATION_15 origin : [['ref_align_1_ch', 'P']]
OPERATION_15 gives  : [['reference_to_align_ch', 'P']]


OPERATION_16 string : aligned_references_ch = dummy_align_out_ch
  .map{covfile, refseg -> [covfile, refseg.split("_")[1]]}
  .concat(aligned_references_true_ch)
OPERATION_16 origin : [['dummy_align_out_ch', 'P'], ['aligned_references_true_ch', 'P']]
OPERATION_16 gives  : [['aligned_references_ch', 'P']]


OPERATION_17 string : grouped_bam_choose_ch = bam_choose_consensus_ch
    .map{refseg,id,bam,refsegfasta -> [id,refseg.split("_")[1],bam,refsegfasta]}
    .groupTuple(by:[0,1])
OPERATION_17 origin : [['bam_choose_consensus_ch', 'P']]
OPERATION_17 gives  : [['grouped_bam_choose_ch', 'P']]


OPERATION_18 string : grouped_cov_summary_choose_ch = cov_summary_choose_consensus_ch
    .map{id,refseg,covsum -> [id,refseg.split("_")[1],covsum]}
    .groupTuple(by:[0,1])
OPERATION_18 origin : [['cov_summary_choose_consensus_ch', 'P']]
OPERATION_18 gives  : [['grouped_cov_summary_choose_ch', 'P']]


OPERATION_19 string : grouped_cov_choose_ch = cov_choose_consensus_ch
    .map{id,refseg,covsum -> [id,refseg.split("_")[1],covsum]}
    .groupTuple(by:[0,1])
OPERATION_19 origin : [['cov_choose_consensus_ch', 'P']]
OPERATION_19 gives  : [['grouped_cov_choose_ch', 'P']]


OPERATION_20 string : grouped_aligned_references_ch = aligned_references_ch
      .groupTuple(by: 1)
OPERATION_20 origin : [['aligned_references_ch', 'P']]
OPERATION_20 gives  : [['grouped_aligned_references_ch', 'P']]


OPERATION_21 string : choose_consensus_input_ch = grouped_bam_choose_ch
    .combine(grouped_cov_summary_choose_ch, by:[0,1])
    .combine(grouped_cov_choose_ch, by:[0,1])
    .combine(grouped_aligned_references_ch, by: 1)
OPERATION_21 origin : [['grouped_bam_choose_ch', 'P']]
OPERATION_21 gives  : [['choose_consensus_input_ch', 'P']]


OPERATION_22 string : finalchosen_ch
    .splitCsv()
    .flatten()
    .map{text -> [text.split("\\.")[0], text.split("\\.")[1], text.split("\\.")[2]]}
    .into{ consensus_keys_ch ; chosen_drop_filter_ch}
OPERATION_22 origin : [['finalchosen_ch', 'P']]
OPERATION_22 gives  : [['consensus_keys_ch', 'P'], ['chosen_drop_filter_ch', 'P']]


OPERATION_23 string : chosen_drop_filter_ch
    .map{ id, refseg, state -> [id, refseg] }
    .into{varscan_keys_ch; bcftools_keys_ch; bamdepth_keys_ch}
OPERATION_23 origin : [['chosen_drop_filter_ch', 'P']]
OPERATION_23 gives  : [['varscan_keys_ch', 'P'], ['bcftools_keys_ch', 'P'], ['bamdepth_keys_ch', 'P']]


OPERATION_24 string : make_consensus_input_ch = consensus_keys_ch
    .combine(mpileup_make_consensus_ch, by: [0,1])
    .map{ id,refseg, state, mpileupfile -> [refseg,id,state,mpileupfile] }
    .combine(ref_make_cons_ch, by:0 )
OPERATION_24 origin : [['consensus_keys_ch', 'P']]
OPERATION_24 gives  : [['make_consensus_input_ch', 'P']]


OPERATION_25 string : grouped_consensus_to_concat_ch = consensus_to_concat_ch
    .filter { it[1] == "PASS" }
    .map{ id,state,file -> [id,file] }
    .groupTuple()
OPERATION_25 origin : [['consensus_to_concat_ch', 'P']]
OPERATION_25 gives  : [['grouped_consensus_to_concat_ch', 'P']]


OPERATION_26 string : chosen_varscan_ch = varscan_keys_ch.combine(mpileup_varscan_ch, by:[0,1])
OPERATION_26 origin : [['varscan_keys_ch', 'P']]
OPERATION_26 gives  : [['chosen_varscan_ch', 'P']]


OPERATION_27 string : chosen_bcftools_ch = bcftools_keys_ch
    .map{id,refseg -> [refseg,id]}
    .combine(bcftools_bam_ch, by:[0,1])
OPERATION_27 origin : [['bcftools_keys_ch', 'P']]
OPERATION_27 gives  : [['chosen_bcftools_ch', 'P']]


OPERATION_28 string : varscan_combine_ch = vcf_varscan_ch
    .groupTuple()
    .map { id, file -> [id, file.flatten(), "varscan"]}
OPERATION_28 origin : [['vcf_varscan_ch', 'P']]
OPERATION_28 gives  : [['varscan_combine_ch', 'P']]


OPERATION_29 string : varscan_bcftools_ch = vcf_bcftools_ch
    .groupTuple()
    .map{ id, file -> [id, file.flatten(), "bcftools"]}
OPERATION_29 origin : [['vcf_bcftools_ch', 'P']]
OPERATION_29 gives  : [['varscan_bcftools_ch', 'P']]


OPERATION_30 string : vcf_concat_input_ch = varscan_combine_ch
    .concat(varscan_bcftools_ch)
OPERATION_30 origin : [['varscan_combine_ch', 'P'], ['varscan_bcftools_ch', 'P']]
OPERATION_30 gives  : [['vcf_concat_input_ch', 'P']]


OPERATION_31 string : groupedplotchosen_ch = plotchosen_ch
    .map{file->[file.getFileName().toString().split("\\.")[1],file]}
    .groupTuple()
OPERATION_31 origin : [['plotchosen_ch', 'P']]
OPERATION_31 gives  : [['groupedplotchosen_ch', 'P']]


OPERATION_32 string : Rplotin_ch = cov_summary_plot_ch
    .map{id,refseg,covsum -> [refseg.split("_")[1],covsum]}
    .groupTuple()
    .combine(groupedplotchosen_ch, by: 0)
OPERATION_32 origin : [['cov_summary_plot_ch', 'P']]
OPERATION_32 gives  : [['Rplotin_ch', 'P']]


OPERATION_33 string : count_input_ch = bwa_count_ch
		.combine(gatk_count_ch,by:[0,1])
		.groupTuple( by:0,sort:true )
		.combine(sample_count_ch, by:0)
OPERATION_33 origin : [['bwa_count_ch', 'P']]
OPERATION_33 gives  : [['count_input_ch', 'P']]


OPERATION_34 string : depth_input_ch = bamdepth_keys_ch
    .combine(cov_graph_ch, by:[0,1])
OPERATION_34 origin : [['bamdepth_keys_ch', 'P']]
OPERATION_34 gives  : [['depth_input_ch', 'P']]


