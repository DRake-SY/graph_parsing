OPERATION_1 string : Channel
      .fromPath(params.input_design)
      .splitCsv(header:true, sep:';')
      .map { row -> [ row.LibName, i++, file("$params.input_dir/$row.LibFastq1", checkIfExists: true), file("$params.input_dir/$row.LibFastq2", checkIfExists: true), "$row.LibName.${params.mapper_id}.${params.genome_prefix}"+".pe" ] }
      .into { design_reads_csv; ch_Toreport_reads_nb }
OPERATION_1 origin : [['params.input_design', 'A']]
OPERATION_1 gives  : [['design_reads_csv', 'P'], ['ch_Toreport_reads_nb', 'P']]


OPERATION_2 string : Channel
      .fromPath(params.input_design)
      .splitCsv(header:true, sep:';')
      .map { row -> [ row.LibName, row.LibExp,i++, file("$params.input_dir/$row.LibBam", checkIfExists: true), file("$params.input_dir/${row.LibBam}.bai", checkIfExists: true), "$row.LibName.${params.mapper_id}.${params.genome_prefix}"+".merged" ] }
      .into { design_bam_csv; test_design }
OPERATION_2 origin : [['params.input_design', 'A']]
OPERATION_2 gives  : [['design_bam_csv', 'P'], ['test_design', 'P']]


OPERATION_3 string : ch_Toreport_trim_nb.join(trimed_reads_ch)
   .set{ch_report_trim_nb}
OPERATION_3 origin : [['ch_Toreport_trim_nb', 'P'], ['trimed_reads_ch', 'P']]
OPERATION_3 gives  : [['ch_report_trim_nb', 'P']]


OPERATION_4 string : test_design.view()
OPERATION_4 origin : [['test_design', 'P']]
OPERATION_4 gives  : []


OPERATION_5 string : design_bam_csv
      .map{ it -> [it[1],it[2], it[3] ]}
      .groupTuple(by: 0)
      .map { it-> [ it[0], it[1], it[3].flatten()]}
      .set {design_bam_merged}
OPERATION_5 origin : [['design_bam_csv', 'P']]
OPERATION_5 gives  : [['design_bam_merged', 'P']]


OPERATION_6 string : ch_Toreport_mapped_nb
   .join(mapped_reads_ch)
   .set{ch_report_mapped_nb}
OPERATION_6 origin : [['ch_Toreport_mapped_nb', 'P'], ['mapped_reads_ch', 'P']]
OPERATION_6 gives  : [['ch_report_mapped_nb', 'P']]


OPERATION_7 string : ch_Toreport_all_stats
.map{ it -> [it[1],it[0],it[2],it[3],it[4],it[5]  ] }
.map{it -> [it.join("\t")]}.collect().set{ ch_report_all_stats} //Joining stats with ";" then use collect to have a single entry channel
OPERATION_7 origin : [['ch_Toreport_all_stats', 'P']]
OPERATION_7 gives  : [['ch_report_all_stats', 'P']]


OPERATION_8 string : ch_Toreport_uniq_nb
   .join(mapped_uniq_reads_ch)
   .set{ch_report_uniq_nb}
OPERATION_8 origin : [['ch_Toreport_uniq_nb', 'P'], ['mapped_uniq_reads_ch', 'P']]
OPERATION_8 gives  : [['ch_report_uniq_nb', 'P']]


OPERATION_9 string : ch_Toreport_uniq_stats
.map{ it -> [it[1],it[0],it[2],it[3],it[4],it[5]  ] }
.map{it -> [it.join("\t")]}.collect().set{ ch_report_uniq_stats} //Joining stats with ";" then use collect to have a single entry channel
OPERATION_9 origin : [['ch_Toreport_uniq_stats', 'P']]
OPERATION_9 gives  : [['ch_report_uniq_stats', 'P']]


OPERATION_10 string : genCoved_ch.join(ch_ToAoC)
.map{ it -> [it[4], it[0], it[2][0], it[3], it[5], it[7], 'NA', it[8],  1, '', '', '', '', '', '', '']}
.map{ it -> [it.join("\t")]}
.collect()
.set {ch_report_Aoc}
OPERATION_10 origin : [['genCoved_ch', 'P'], ['ch_ToAoC', 'P']]
OPERATION_10 gives  : [['ch_report_Aoc', 'P']]


OPERATION_11 string : genCoved_uniq_ch.join(ch_ToAoC_uniq)
.map{ it -> [it[4], it[0], it[2][0], it[3], it[5], it[7], it[7], it[8], 1, '', '', '', '', '', '', '']}
.map{ it -> [it.join("\t")]}
.collect()
.set {ch_report_Aoc_uniq}
OPERATION_11 origin : [['genCoved_uniq_ch', 'P'], ['ch_ToAoC_uniq', 'P']]
OPERATION_11 gives  : [['ch_report_Aoc_uniq', 'P']]


