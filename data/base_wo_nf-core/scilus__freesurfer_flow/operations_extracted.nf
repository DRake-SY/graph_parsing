OPERATION_1 string : in_files = Channel.fromPath("$root_fs_input/**/*t1.nii.gz")
    .map{ch1 -> [ch1.parent.name, ch1]}
OPERATION_1 origin : [['"$root_fs_input/**/*t1.nii.gz"', 'A']]
OPERATION_1 gives  : [['in_files', 'P']]


OPERATION_2 string : in_files = Channel.empty()
OPERATION_2 origin : []
OPERATION_2 gives  : [['in_files', 'P']]


OPERATION_3 string : in_folders = Channel.fromPath("$root_fs_output/*/", type: 'dir')
    .map{ch1 -> [ch1.name, ch1]}
OPERATION_3 origin : [['"$root_fs_output/*/", type: \'dir\'', 'A']]
OPERATION_3 gives  : [['in_folders', 'P']]


OPERATION_4 string : in_folders = Channel.empty()
OPERATION_4 origin : []
OPERATION_4 gives  : [['in_folders', 'P']]


OPERATION_5 string : scales = Channel.from(1,2,3,4,5)
OPERATION_5 origin : [['1,2,3,4,5', 'V']]
OPERATION_5 gives  : [['scales', 'P']]


OPERATION_6 string : in_folders
    .concat(folders_for_atlases)
    .into{all_folders_for_atlases_FS_BN_GL;all_folders_for_atlases_lausanne;all_folders_for_atlases_lobes}
OPERATION_6 origin : [['in_folders', 'P'], ['folders_for_atlases', 'P']]
OPERATION_6 gives  : [['all_folders_for_atlases_FS_BN_GL', 'P'], ['all_folders_for_atlases_lausanne', 'P'], ['all_folders_for_atlases_lobes', 'P']]


