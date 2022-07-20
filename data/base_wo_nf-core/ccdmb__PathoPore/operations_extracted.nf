OPERATION_1 string : reads_ch = Channel.fromPath(params.reads).map{ it -> [ it.baseName, it  ] }
OPERATION_1 origin : [['params.reads', 'A']]
OPERATION_1 gives  : [['reads_ch', 'P']]


OPERATION_2 string : fast5_ch = Channel.fromPath(params.fast5).map{ it -> [ it.name, it  ] }
OPERATION_2 origin : [['params.fast5', 'A']]
OPERATION_2 gives  : [['fast5_ch', 'P']]


OPERATION_3 string : reads_ch.into { nano_reads_ch; filt_reads_ch }
OPERATION_3 origin : [['reads_ch', 'P']]
OPERATION_3 gives  : [['nano_reads_ch', 'P'], ['filt_reads_ch', 'P']]


OPERATION_4 string : filtlong_out_ch.into { filtlong_denovo_ch; map_filter_ch ; filter_index_ch; call_variants_ch; map_filter_meth_ch}
OPERATION_4 origin : [['filtlong_out_ch', 'P']]
OPERATION_4 gives  : [['filtlong_denovo_ch', 'P'], ['map_filter_ch', 'P'], ['filter_index_ch', 'P'], ['call_variants_ch', 'P'], ['map_filter_meth_ch', 'P']]


OPERATION_5 string : minialign_var_ch.into{ minialign_call_var_ch; minialign_methyl_ch }
OPERATION_5 origin : [['minialign_var_ch', 'P']]
OPERATION_5 gives  : [['minialign_call_var_ch', 'P'], ['minialign_methyl_ch', 'P']]


OPERATION_6 string : call_variants_ch.join(index_filtered_out_ch, by:0)
                .set { fastq_indexed_ch }
OPERATION_6 origin : [['call_variants_ch', 'P']]
OPERATION_6 gives  : [['fastq_indexed_ch', 'P']]


OPERATION_7 string : fastq_indexed_ch.into{ fastq_indexed_var_ch; fastq_methyl_ch }
OPERATION_7 origin : [['fastq_indexed_ch', 'P']]
OPERATION_7 gives  : [['fastq_indexed_var_ch', 'P'], ['fastq_methyl_ch', 'P']]


