OPERATION_1 string : Channel.fromPath("${params.s3_location}/**.${params.file_suffix}")
       .map { it -> [ file(it).name.minus(".${params.file_suffix}"), "s3:/"+it] }
       .set { ch_files }
OPERATION_1 origin : [['"${params.s3_location}/**.${params.file_suffix}"', 'A']]
OPERATION_1 gives  : [['ch_files', 'P']]


OPERATION_2 string : Channel.fromPath("${params.s3_location}/**.${params.index_suffix}")
       .map { it -> [ file(it).name.minus(".${params.index_suffix}").minus(".${params.file_suffix}"), "s3:/"+it] }
       .set { ch_indexes }
OPERATION_2 origin : [['"${params.s3_location}/**.${params.index_suffix}"', 'A']]
OPERATION_2 gives  : [['ch_indexes', 'P']]


OPERATION_3 string : ch_files_and_indexes = ch_files.join(ch_indexes, by:0, remainder:params.keep_missing)
                    .map {it -> [it[0], it - it[0]] }                                                    
OPERATION_3 origin : [['ch_files', 'P']]
OPERATION_3 gives  : [['ch_files_and_indexes', 'P']]


OPERATION_4 string : ch_main_files_only
        .splitCsv(sep: ',', skip: 1)
        .map { name, main_file -> [ name, file(main_file) ] }
        .set { ch_main_files }
OPERATION_4 origin : [['ch_main_files_only', 'P']]
OPERATION_4 gives  : [['ch_main_files', 'P']]


OPERATION_5 string : ch_indices_only
        .splitCsv(sep: ',', skip: 1)
        .map { name, main_file -> [name, file(main_file) ] }
        .set { ch_indices }
OPERATION_5 origin : [['ch_indices_only', 'P']]
OPERATION_5 gives  : [['ch_indices', 'P']]


OPERATION_6 string : ch_complete_file_sets
        .splitCsv(sep: ',', skip: 1)
        .map { name, main_file, index_file -> [ name, file(main_file), file(index_file) ] }
        .set { ch_complete_sets }
OPERATION_6 origin : [['ch_complete_file_sets', 'P']]
OPERATION_6 gives  : [['ch_complete_sets', 'P']]


OPERATION_7 string : ch_main_files_lists
        .concat(ch_indices_only_lists)
        .concat(ch_completed_file_sets_list)
        .set { ch_checksums }
OPERATION_7 origin : [['ch_main_files_lists', 'P'], ['ch_indices_only_lists', 'P'], ['ch_completed_file_sets_list', 'P']]
OPERATION_7 gives  : [['ch_checksums', 'P']]


