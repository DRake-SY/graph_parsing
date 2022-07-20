OPERATION_1 string : Channel
  .fromPath( "${params.input_dir}/*.vcf.gz" )
   .set{feature_files_inputs}
OPERATION_1 origin : [['"${params.input_dir}/*.vcf.gz"', 'A']]
OPERATION_1 gives  : [['feature_files_inputs', 'P']]


OPERATION_2 string : Channel
  .fromPath("mkmodules/mk-add-header/*")
    .toList()
    .set{mkfiles_pre1}
OPERATION_2 origin : [['"mkmodules/mk-add-header/*"', 'A']]
OPERATION_2 gives  : [['mkfiles_pre1', 'P']]


OPERATION_3 string : Channel
  .fromPath("mkmodules/mk-filter-vcfs/*")
    .toList()
              
    .set{mkfiles_pre2}
OPERATION_3 origin : [['"mkmodules/mk-filter-vcfs/*"', 'A']]
OPERATION_3 gives  : [['mkfiles_pre2', 'P']]


OPERATION_4 string : Channel
  .fromPath("mkmodules/mk-concatenate/*")
    .toList()
              
    .set{mkfiles_001}
OPERATION_4 origin : [['"mkmodules/mk-concatenate/*"', 'A']]
OPERATION_4 gives  : [['mkfiles_001', 'P']]


OPERATION_5 string : Channel
  .fromPath("mkmodules/mk-normalize-and-compress/*")
    .toList()
              
    .set{mkfiles_pst1}
OPERATION_5 origin : [['"mkmodules/mk-normalize-and-compress/*"', 'A']]
OPERATION_5 gives  : [['mkfiles_pst1', 'P']]


OPERATION_6 string : results_pre1_add_header
            
  .toList()
            
  .set{inputs_for_pre2}
OPERATION_6 origin : [['results_pre1_add_header', 'P']]
OPERATION_6 gives  : [['inputs_for_pre2', 'P']]


OPERATION_7 string : results_001_concatenate_vcfs
            
  .toList()
            
  .set{inputs_for_pst1}
OPERATION_7 origin : [['results_001_concatenate_vcfs', 'P']]
OPERATION_7 gives  : [['inputs_for_pst1', 'P']]


