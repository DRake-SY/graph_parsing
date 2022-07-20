OPERATION_1 string : Channel
    .fromPath(params.input_tsv)
    .splitCsv(header:true, sep:'\t')
    .map{ row-> tuple(file(row.strelka_snvs), file(row.strelka_indels), file(row.mutect), row.tumor_id , row.normal_id , row.set_name) }
    .set { samples_ch }
OPERATION_1 origin : [['params.input_tsv', 'A']]
OPERATION_1 gives  : [['samples_ch', 'P']]


OPERATION_2 string : samples_ch.into {samples_ch1; samples_ch2; samples_ch3; samples_ch4 }
OPERATION_2 origin : [['samples_ch', 'P']]
OPERATION_2 gives  : [['samples_ch1', 'P'], ['samples_ch2', 'P'], ['samples_ch3', 'P'], ['samples_ch4', 'P']]


