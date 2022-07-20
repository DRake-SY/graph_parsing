OPERATION_1 string : Channel.fromPath( params.bams)
         .ifEmpty { error "Cannot find any path matching: ${params.bams}" }
         .map { it -> [it.name -  ~/\.list/, it] }
         .set { input }
OPERATION_1 origin : [['params.bams', 'A']]
OPERATION_1 gives  : [['input', 'P']]


OPERATION_2 string : input.into{ bams_ch; bams_list1_ch; bams_list2_ch }
OPERATION_2 origin : [['input', 'P']]
OPERATION_2 gives  : [['bams_ch', 'P'], ['bams_list1_ch', 'P'], ['bams_list2_ch', 'P']]


OPERATION_3 string : GL_ch.into { GL_ch1; GL_ch2 }
OPERATION_3 origin : [['GL_ch', 'P']]
OPERATION_3 gives  : [['GL_ch1', 'P'], ['GL_ch2', 'P']]


OPERATION_4 string : admixture_ch.join( bams_list2_ch, by: 0 )
    .set { admix_comb }
OPERATION_4 origin : [['admixture_ch', 'P']]
OPERATION_4 gives  : [['admix_comb', 'P']]


OPERATION_5 string : covariance_ch.combine( bams_list1_ch, by: 0 )
    .set { covariance_comb }
OPERATION_5 origin : [['covariance_ch', 'P']]
OPERATION_5 gives  : [['covariance_comb', 'P']]


