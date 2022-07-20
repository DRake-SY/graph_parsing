OPERATION_1 string : Channel.fromPath("${params.s3_location}/**.{${params.file_suffix},${params.index_suffix}}")
       .map { it -> [ file(it).name.minus(".${params.index_suffix}").minus(".${params.file_suffix}"), "s3:/"+it] }
       .groupTuple(by:0)
       .set { ch_files }
OPERATION_1 origin : [['"${params.s3_location}/**.{${params.file_suffix},${params.index_suffix}}"', 'A']]
OPERATION_1 gives  : [['ch_files', 'P']]


OPERATION_2 string : ch_main_files_only
        .splitCsv(sep: ',', skip: 1)
        .map { name, main_file -> [ name, file(main_file) ] }
        .set { ch_main_files }
OPERATION_2 origin : [['ch_main_files_only', 'P']]
OPERATION_2 gives  : [['ch_main_files', 'P']]


OPERATION_3 string : ch_indices_only
        .splitCsv(sep: ',', skip: 1)
        .map { name, main_file -> [name, file(main_file) ] }
        .set { ch_indices }
OPERATION_3 origin : [['ch_indices_only', 'P']]
OPERATION_3 gives  : [['ch_indices', 'P']]


OPERATION_4 string : ch_complete_file_sets
        .splitCsv(sep: ',', skip: 1)
        .map { name, main_file, index_file -> [ name, file(main_file), file(index_file) ] }
        .set { ch_complete_sets }
OPERATION_4 origin : [['ch_complete_file_sets', 'P']]
OPERATION_4 gives  : [['ch_complete_sets', 'P']]


OPERATION_5 string : ch_main_files_lists
        .concat(ch_indices_only_lists)
        .concat(ch_completed_file_sets_list)
        .set { ch_checksums }
OPERATION_5 origin : [['ch_main_files_lists', 'P'], ['ch_indices_only_lists', 'P'], ['ch_completed_file_sets_list', 'P']]
OPERATION_5 gives  : [['ch_checksums', 'P']]


