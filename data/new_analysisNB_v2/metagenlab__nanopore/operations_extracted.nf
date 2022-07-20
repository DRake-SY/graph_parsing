OPERATION_1 string : input_files_ch = Channel.watchPath("$params.fast5").
OPERATION_1 origin : [['"$params.fast5"', 'A']]
OPERATION_1 gives  : [['input_files_ch', 'P']]


OPERATION_2 string : fast5_ch = Channel.empty()
OPERATION_2 origin : []
OPERATION_2 gives  : [['fast5_ch', 'P']]


OPERATION_3 string : fastq_ch = Channel.fromPath("$params.samples")
  .splitCsv(header:true)
  .map{ row-> tuple(row.sampleId, file(row.fastq))}
OPERATION_3 origin : [['"$params.samples"', 'A']]
OPERATION_3 gives  : [['fastq_ch', 'P']]


OPERATION_4 string : references_ch = Channel.fromPath("$params.samples")
  .splitCsv(header:true)
  .map{ row-> tuple(row.sampleId, file(row.reference))}
OPERATION_4 origin : [['"$params.samples"', 'A']]
OPERATION_4 gives  : [['references_ch', 'P']]


OPERATION_5 string : references_ch = Channel.empty()
OPERATION_5 origin : []
OPERATION_5 gives  : [['references_ch', 'P']]


OPERATION_6 string : summaries_ch = Channel.fromPath("$params.samples")
  .splitCsv(header:true)
  .map{ row-> tuple(row.sampleId, file(row.summary))}
OPERATION_6 origin : [['"$params.samples"', 'A']]
OPERATION_6 gives  : [['summaries_ch', 'P']]


OPERATION_7 string : summaries_ch = Channel.empty()
OPERATION_7 origin : []
OPERATION_7 gives  : [['summaries_ch', 'P']]


OPERATION_8 string : illumina_fastq_ch = Channel.fromPath("$params.samples")
  .splitCsv(header:true)
  .map{ row-> tuple(row.sampleId, file(row.r1), file(row.r2))}
OPERATION_8 origin : [['"$params.samples"', 'A']]
OPERATION_8 gives  : [['illumina_fastq_ch', 'P']]


OPERATION_9 string : illumina_fastq_ch = Channel.empty()
OPERATION_9 origin : []
OPERATION_9 gives  : [['illumina_fastq_ch', 'P']]


OPERATION_10 string : guppy_fastqs_ch = Channel.empty()
OPERATION_10 origin : []
OPERATION_10 gives  : [['guppy_fastqs_ch', 'P']]


OPERATION_11 string : basecall_summary_ch.collectFile(name: "${params.runid}_summary.txt", keepHeader:true, 
  skip:1, storeDir:"$params.outdir/basecall").set{merged_summary_ch}
OPERATION_11 origin : [['basecall_summary_ch', 'P']]
OPERATION_11 gives  : [['merged_summary_ch', 'P']]


OPERATION_12 string : passed_fastq_ch.mix(failed_fastq_ch)
OPERATION_12 origin : [['passed_fastq_ch', 'P'], ['failed_fastq_ch', 'P']]
OPERATION_12 gives  : []


OPERATION_13 string : guppy_fastqs_ch.into{basecalled_fastq_ch; collect_fastq_ch}
OPERATION_13 origin : [['guppy_fastqs_ch', 'P']]
OPERATION_13 gives  : [['basecalled_fastq_ch', 'P'], ['collect_fastq_ch', 'P']]


OPERATION_14 string : collect_fastq_ch.collectFile(name: "${params.runid}.fastq", storeDir:"$params.outdir/basecall").set{merged_fastq_ch}
OPERATION_14 origin : [['collect_fastq_ch', 'P']]
OPERATION_14 gives  : [['merged_fastq_ch', 'P']]


OPERATION_15 string : raw_fastqs_ch = basecalled_fastq_ch.mix(fastq_ch)
OPERATION_15 origin : [['basecalled_fastq_ch', 'P'], ['fastq_ch', 'P']]
OPERATION_15 gives  : [['raw_fastqs_ch', 'P']]


OPERATION_16 string : raw_fastqs_ch.into{filter_fastqs_ch; fastqs_ch}
OPERATION_16 origin : [['raw_fastqs_ch', 'P']]
OPERATION_16 gives  : [['filter_fastqs_ch', 'P'], ['fastqs_ch', 'P']]


OPERATION_17 string : all_fastqs_ch = quality_fastqs_ch.mix(fastqs_ch)
OPERATION_17 origin : [['quality_fastqs_ch', 'P'], ['fastqs_ch', 'P']]
OPERATION_17 gives  : [['all_fastqs_ch', 'P']]


OPERATION_18 string : all_fastqs_ch.into{fastq_qc_ch; fastq_tax_ch; fastq_assembly_ch; fastq_hybrid_assembly_ch; fastq_mapping_reads_ch; fastq_mapping_assembly_ch ; fastq_resistance_ch}
OPERATION_18 origin : [['all_fastqs_ch', 'P']]
OPERATION_18 gives  : [['fastq_qc_ch', 'P'], ['fastq_tax_ch', 'P'], ['fastq_assembly_ch', 'P'], ['fastq_hybrid_assembly_ch', 'P'], ['fastq_mapping_reads_ch', 'P'], ['fastq_mapping_assembly_ch', 'P'], ['fastq_resistance_ch', 'P']]


OPERATION_19 string : summaries_ch.into{summary_qc_ch; summary_aln_ch}
OPERATION_19 origin : [['summaries_ch', 'P']]
OPERATION_19 gives  : [['summary_qc_ch', 'P'], ['summary_aln_ch', 'P']]


OPERATION_20 string : centrifuge_reports_ch.collectFile(name:"${params.runid}_centrifuge_report.txt", keepHeader:true, 
  skip:1, storeDir:"$params.outdir/taxonomy")
OPERATION_20 origin : [['centrifuge_reports_ch', 'P']]
OPERATION_20 gives  : []


OPERATION_21 string : hybrid_fasta_ch.mix(fasta_ch).set{assembled_fasta_ch}
OPERATION_21 origin : [['hybrid_fasta_ch', 'P'], ['fasta_ch', 'P']]
OPERATION_21 gives  : [['assembled_fasta_ch', 'P']]


OPERATION_22 string : assembled_fasta_ch.into{assemblies_resistance_ch; assemblies_map_ch; assemblies_prokka_ch}
OPERATION_22 origin : [['assembled_fasta_ch', 'P']]
OPERATION_22 gives  : [['assemblies_resistance_ch', 'P'], ['assemblies_map_ch', 'P'], ['assemblies_prokka_ch', 'P']]


OPERATION_23 string : cov_bam_ch.into{pyco_bam_ch; bed_bam_ch}
OPERATION_23 origin : [['cov_bam_ch', 'P']]
OPERATION_23 gives  : [['pyco_bam_ch', 'P'], ['bed_bam_ch', 'P']]


OPERATION_24 string : cov_bam_ch = bam_ref_ch
OPERATION_24 origin : [['bam_ref_ch', 'P']]
OPERATION_24 gives  : [['cov_bam_ch', 'P']]


