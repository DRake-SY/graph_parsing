OPERATION_1 string : Channel
      .from(sample_keys)
      .map { sk -> tuple(sk, GetReadUnitKeys(sk).collect{GetSingleRead(sk, it)}.flatten()) }
      .set { raw_fastq_ch }
OPERATION_1 origin : [['sample_keys', 'V']]
OPERATION_1 gives  : [['raw_fastq_ch', 'P']]


OPERATION_2 string : Channel
      .from(sample_keys)
      .map { sk -> tuple(sk, GetReadUnitKeys(sk).collect{GetReadPair(sk, it)}.flatten()) }
      .set { raw_fastq_ch }
OPERATION_2 origin : [['sample_keys', 'V']]
OPERATION_2 gives  : [['raw_fastq_ch', 'P']]


OPERATION_3 string : trim_fastq
    .filter { sample_id, count, reads -> check_reads(count) }
    .set { fastq_input_ch }
OPERATION_3 origin : [['trim_fastq', 'P']]
OPERATION_3 gives  : [['fastq_input_ch', 'P']]


OPERATION_4 string : fastqc_out_ch
    .filter { sample_id, count, reads -> check_reads(count) }
    .set { fastq_input_ch }
OPERATION_4 origin : [['fastqc_out_ch', 'P']]
OPERATION_4 gives  : [['fastq_input_ch', 'P']]


OPERATION_5 string : star_aligned
  .filter { sample_id, logs, sorted_bam, transcriptome_bam -> check_log(logs) }
  .into { collectRnaSeqMetrics; bam_rseqc; bam_rsem; bam_createBigWig}
OPERATION_5 origin : [['star_aligned', 'P']]
OPERATION_5 gives  : [['collectRnaSeqMetrics', 'P'], ['bam_rseqc', 'P'], ['bam_rsem', 'P'], ['bam_createBigWig', 'P']]


OPERATION_6 string : fastqc_ch_test = trim_fastqc_results.concat(fastqc_results)
       .flatten()
       .filter{ it.toString().endsWith("fastqc.zip") || it.toString().endsWith("fastqc.html") || it.toString().endsWith("report.txt")}
OPERATION_6 origin : [['trim_fastqc_results', 'P'], ['fastqc_results', 'P']]
OPERATION_6 gives  : [['fastqc_ch_test', 'P']]


OPERATION_7 string : fastqc_ch_test = fastqc_results
       .flatten()
       .filter{ it.toString().endsWith("fastqc.zip") || it.toString().endsWith("fastqc.html") }  
OPERATION_7 origin : [['fastqc_results', 'P']]
OPERATION_7 gives  : [['fastqc_ch_test', 'P']]


