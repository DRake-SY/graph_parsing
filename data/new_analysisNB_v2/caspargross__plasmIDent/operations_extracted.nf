OPERATION_1 string : bam_cov = Channel.create()
OPERATION_1 origin : []
OPERATION_1 gives  : [['bam_cov', 'P']]


OPERATION_2 string : bam_ovlp = Channel.create()
OPERATION_2 origin : []
OPERATION_2 gives  : [['bam_ovlp', 'P']]


OPERATION_3 string : circos_data_cov = Channel.create()
OPERATION_3 origin : []
OPERATION_3 gives  : [['circos_data_cov', 'P']]


OPERATION_4 string : table_data_cov = Channel.create()
OPERATION_4 origin : []
OPERATION_4 gives  : [['table_data_cov', 'P']]


OPERATION_5 string : samples_filtered.into{samples_rgi; samples_glimmer; samples_map; samples_split}
OPERATION_5 origin : [['samples_filtered', 'P']]
OPERATION_5 gives  : [['samples_rgi', 'P'], ['samples_glimmer', 'P'], ['samples_map', 'P'], ['samples_split', 'P']]


OPERATION_6 string : samples_split
    .map{[
        it[0],
        it[1],
        it[2]
        ]}
    .splitFasta(record: [id: true, seqString: true])
    .map{
        def id = it[0]
        def lr = it[2]
                                                           
        def contigName = it[1]['id']
        def length = it[1]['seqString'].length()
        def sequence = it[1]['seqString']
        [id, lr, contigName, length, sequence]
       }
    .filter{it[3] < params.maxLength}
    .filter{it[3] > params.minLength}
           
    .into{contigs; contigs_2; contigs_3}
OPERATION_6 origin : [['samples_split', 'P']]
OPERATION_6 gives  : [['contigs', 'P'], ['contigs_2', 'P'], ['contigs_3', 'P']]


OPERATION_7 string : assembly_padded.into{map_padded; gc_padded}
OPERATION_7 origin : [['assembly_padded', 'P']]
OPERATION_7 gives  : [['map_padded', 'P'], ['gc_padded', 'P']]


OPERATION_8 string : samples_map
           
    .map{[it[0], 
        it[1], 
        it[2], 
        'normal']}
    .mix(map_padded
        .map{[it[0], 
            it[1], 
            it[2][0],
            it[3]]})
    .set{to_mapping}
OPERATION_8 origin : [['samples_map', 'P']]
OPERATION_8 gives  : [['to_mapping', 'P']]


OPERATION_9 string : bam_lr.into{bam_cov; bam_ovlp}
OPERATION_9 origin : [['bam_lr', 'P']]
OPERATION_9 gives  : [['bam_cov', 'P'], ['bam_ovlp', 'P']]


OPERATION_10 string : from_rgi.into{rgi_txt; table_data_rgi}
OPERATION_10 origin : [['from_rgi', 'P']]
OPERATION_10 gives  : [['rgi_txt', 'P'], ['table_data_rgi', 'P']]


OPERATION_11 string : cov_formated.choice(circos_data_cov, table_data_cov) { it[2]  = 0
 } else { 
cov_formated.choice(circos_data_cov, table_data_cov) { it[2]  = 1 }
 }
OPERATION_11 origin : [['cov_formated', 'P']]
OPERATION_11 gives  : [['circos_data_cov', 'P'], ['table_data_cov', 'P'], ['circos_data_cov', 'P'], ['table_data_cov', 'P']]


OPERATION_12 string : circos_data_gc
   .join(circos_data_cov)
       .join(circos_data_rgi)
           .join(circos_data_genes)
           .set{circos_data}
OPERATION_12 origin : [['circos_data_gc', 'P'], ['circos_data_cov', 'P'], ['circos_data_rgi', 'P'], ['circos_data_genes', 'P']]
OPERATION_12 gives  : [['circos_data', 'P']]


OPERATION_13 string : combined_data = circos_reads.combine(circos_data, by: 0)
OPERATION_13 origin : [['circos_reads', 'P']]
OPERATION_13 gives  : [['combined_data', 'P']]


OPERATION_14 string : table_data_gc
    .join(table_data_cov)
        .join(table_data_rgi)
        .set{table_data}
OPERATION_14 origin : [['table_data_gc', 'P'], ['table_data_cov', 'P'], ['table_data_rgi', 'P']]
OPERATION_14 gives  : [['table_data', 'P']]


