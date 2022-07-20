OPERATION_1 string : Channel
    .fromPath(params.design)
    .splitCsv(header: true)
    .map { sample ->
    println([sample.name,sample.id,sample.bam])
    [sample.name,sample.id,file(sample.bam)] }
    .into { rep_to_group; 
	    in_bed_create }
OPERATION_1 origin : [['params.design', 'A']]
OPERATION_1 gives  : [['rep_to_group', 'P'], ['in_bed_create', 'P']]


OPERATION_2 string : Channel
    .fromPath(params.tf_list)
    .splitCsv()
                               
    .set { ch_tf_list }
OPERATION_2 origin : [['params.tf_list', 'A']]
OPERATION_2 gives  : [['ch_tf_list', 'P']]


OPERATION_3 string : Channel
    .fromPath(params.jaspar_motifs)
    .splitCsv(header: true)
    .map { tf ->
                                               
    [tf.id,tf.name,file(tf.path),tf.length] }   
    .combine(ch_tf_list)
    .filter { it[1] == it[4] }
    .map {it -> it[0..-2] }
    .set { in_fimo }
OPERATION_3 origin : [['ch_tf_list', 'P'], ['params.jaspar_motifs', 'A']]
OPERATION_3 gives  : [['in_fimo', 'P']]


OPERATION_4 string : Channel
    .fromPath(params.jaspar_motifs)
    .splitCsv(header: true)
    .map { tf ->
                                               
    [tf.id,tf.name,file(tf.path),tf.length] }
    .filter { it[1] ==~ /${params.tf}/ }
    .set { in_fimo }
OPERATION_4 origin : [['params.jaspar_motifs', 'A']]
OPERATION_4 gives  : [['in_fimo', 'P']]


OPERATION_5 string : in_bed_create
.collect { it[1] }
.set { in_consensus }
OPERATION_5 origin : [['in_bed_create', 'P']]
OPERATION_5 gives  : [['in_consensus', 'P']]


OPERATION_6 string : rep_to_group
    .groupTuple(by: 0)
    .map { it ->  [ it[0], it[1].flatten(), it[2].flatten()] }
    .set { bam_mrep }
OPERATION_6 origin : [['rep_to_group', 'P']]
OPERATION_6 gives  : [['bam_mrep', 'P']]


OPERATION_7 string : ch_bed_fasta = in_sequence_pwm_match.first()
OPERATION_7 origin : [['in_sequence_pwm_match', 'P']]
OPERATION_7 gives  : [['ch_bed_fasta', 'P']]


OPERATION_8 string : sites
.combine(in_centipede) 
.set { ch_in_centipede }
OPERATION_8 origin : [['sites', 'P'], ['in_centipede', 'P']]
OPERATION_8 gives  : [['ch_in_centipede', 'P']]


