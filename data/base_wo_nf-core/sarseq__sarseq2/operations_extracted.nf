OPERATION_1 string : ch_bc2sample = Channel.from(file ("empty"))
OPERATION_1 origin : []
OPERATION_1 gives  : [['ch_bc2sample', 'P']]


OPERATION_2 string : parameter_summary = Channel
    .fromPath(full_initial_summary_file)
OPERATION_2 origin : [['full_initial_summary_file', 'A']]
OPERATION_2 gives  : [['parameter_summary', 'P']]


OPERATION_3 string : Channel
    .from(
    file("${params.inputdir}/*R1*", checkIfExists: true, maxDepth: 1),
    file("${params.inputdir}/*R2*", checkIfExists: true, maxDepth: 1),
    file("${params.inputdir}/*I1*", checkIfExists: true, maxDepth: 1),
    file("${params.inputdir}/*I2*", checkIfExists: true, maxDepth: 1)
    )
    .collect()
    .ifEmpty { error "Cannot find any files matching R1 R2 I1 I2 in inputdir ${params.inputdir}/" }
    .set{ch_input}
OPERATION_3 origin : []
OPERATION_3 gives  : [['ch_input', 'P']]


OPERATION_4 string : ch_dmx = Channel.fromPath("${params.redo}/*fastq")
OPERATION_4 origin : [['"${params.redo}/*fastq"', 'A']]
OPERATION_4 gives  : [['ch_dmx', 'P']]


OPERATION_5 string : ch_dmx_rmd = Channel.fromPath("${params.redo}/QC__demux.tsv")
OPERATION_5 origin : [['"${params.redo}/QC__demux.tsv"', 'A']]
OPERATION_5 gives  : [['ch_dmx_rmd', 'P']]


OPERATION_6 string : ch_lineage = Channel.from(file("empty"))
OPERATION_6 origin : []
OPERATION_6 gives  : [['ch_lineage', 'P']]


OPERATION_7 string : ch_aln2spike_multiqc_report = Channel.from(false)
OPERATION_7 origin : [['false', 'V']]
OPERATION_7 gives  : [['ch_aln2spike_multiqc_report', 'P']]


OPERATION_8 string : full_initial_summary = summary.collect { k,v -> "${k.padRight(20)}: $v" }.join("\n")
OPERATION_8 origin : [['summary', 'P']]
OPERATION_8 gives  : [['full_initial_summary', 'P']]


OPERATION_9 string : parameter_summary.into{parameter_summary1;parameter_summary2}
OPERATION_9 origin : [['parameter_summary', 'P']]
OPERATION_9 gives  : [['parameter_summary1', 'P'], ['parameter_summary2', 'P']]


OPERATION_10 string : ch_dmx.collect().flatten().map{ l ->
    [ l.getName().split("-")[1] - ".R12.fastq" ,l]
}.groupTuple().into{ch_aln2spike_set;ch_read2tile}
OPERATION_10 origin : [['ch_dmx', 'P']]
OPERATION_10 gives  : [['ch_aln2spike_set', 'P'], ['ch_read2tile', 'P']]


OPERATION_11 string : ch_r2t_fastq
    .collect()
    .flatten()
    .map{ l ->
    [  l.getName().split("-")[1] - ".R12.fastq" ,l]
}.groupTuple().set{ch_r2t_fastq_set}
OPERATION_11 origin : [['ch_r2t_fastq', 'P']]
OPERATION_11 gives  : [['ch_r2t_fastq_set', 'P']]


OPERATION_12 string : ch_aln2tile_bam_log.collect().flatten().map{ l ->
    [ l.getName() - ".bam" - ".flagstat"  ,l]
}.groupTuple().map{ l ->
    [ l[1][0],l[1][1] ]
    }.set{ch_aln2tile_bam_log_per_sample}
OPERATION_12 origin : [['ch_aln2tile_bam_log', 'P']]
OPERATION_12 gives  : [['ch_aln2tile_bam_log_per_sample', 'P']]


OPERATION_13 string : ch_aln2tile_bam_log_per_sample
                                              
    .collect()
    .flatten()
    .filter( ~/.*bam/ )
    .map{ l ->
    [ l.getName().split("-")[1] - ".bam" ,l]
}.groupTuple().set{ch_aln2tile_bam_set}
OPERATION_13 origin : [['ch_aln2tile_bam_log_per_sample', 'P']]
OPERATION_13 gives  : [['ch_aln2tile_bam_set', 'P']]


OPERATION_14 string : ch_aln2spike_bam_log.collect().flatten().map{ l ->
      [ l.getName() - ".bam" - ".flagstat"  ,l]
  }.groupTuple().map{ l ->
      [ l[1][0],l[1][1] ]
  }.set{ch_aln2spike_bam_log_per_sample}
OPERATION_14 origin : [['ch_aln2spike_bam_log', 'P']]
OPERATION_14 gives  : [['ch_aln2spike_bam_log_per_sample', 'P']]


OPERATION_15 string : ch_aln2spike_bam_log_per_sample
                                                
    .collect()
    .flatten()
    .filter( ~/.*bam/ )
    .map{ l ->
    [ l.getName().split("-")[1] - ".bam" ,l]
  }.groupTuple().set{ch_aln2spike_bam_set}
OPERATION_15 origin : [['ch_aln2spike_bam_log_per_sample', 'P']]
OPERATION_15 gives  : [['ch_aln2spike_bam_set', 'P']]


OPERATION_16 string : text=full_initial_summary
OPERATION_16 origin : [['full_initial_summary', 'P']]
OPERATION_16 gives  : [['text', 'P']]


