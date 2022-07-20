OPERATION_1 string : IN_accessions_raw = Channel.fromPath(params.accessions).ifEmpty { exit 1, "No accessions file provided with path:'${params.accessions}'" }
OPERATION_1 origin : [['params.accessions', 'A']]
OPERATION_1 gives  : [['IN_accessions_raw', 'P']]


OPERATION_2 string : IN_fastq_raw = Channel.fromFilePairs(params.fastq).ifEmpty { exit 1, "No fastq files provided with pattern:'${params.fastq}'" }
OPERATION_2 origin : [['params.fastq', 'A']]
OPERATION_2 gives  : [['IN_fastq_raw', 'P']]


OPERATION_3 string : IN_blastDB = Channel.fromPath("${params.blastdb}*")
OPERATION_3 origin : [['"${params.blastdb}*"', 'A']]
OPERATION_3 gives  : [['IN_blastDB', 'P']]


OPERATION_4 string : IN_reference = Channel.fromPath("${params.reference}")
OPERATION_4 origin : [['"${params.reference}"', 'A']]
OPERATION_4 gives  : [['IN_reference', 'P']]


OPERATION_5 string : IN_reference = Channel.fromPath("${params.reference}")
OPERATION_5 origin : [['"${params.reference}"', 'A']]
OPERATION_5 gives  : [['IN_reference', 'P']]


OPERATION_6 string : IN_hmmerDB = Channel.fromPath(params.hmmdb)
OPERATION_6 origin : [['params.hmmdb', 'A']]
OPERATION_6 gives  : [['IN_hmmerDB', 'P']]


OPERATION_7 string : IN_nf_to_seq = Channel.fromPath(params.hmm_fasta)
OPERATION_7 origin : [['params.hmm_fasta', 'A']]
OPERATION_7 gives  : [['IN_nf_to_seq', 'P']]


OPERATION_8 string : IN_threshold = Channel.value(params.hmmr_threshold)
OPERATION_8 origin : [['params.hmmr_threshold', 'V']]
OPERATION_8 gives  : [['IN_threshold', 'P']]


OPERATION_9 string : reader.close();
OPERATION_9 origin : [['reader', 'P']]
OPERATION_9 gives  : []


OPERATION_10 string : OUT_fastq_QC.into{ OUT_fastq_QC_1 ; OUT_fastq_QC_2 }
OPERATION_10 origin : [['OUT_fastq_QC', 'P']]
OPERATION_10 gives  : [['OUT_fastq_QC_1', 'P'], ['OUT_fastq_QC_2', 'P']]


OPERATION_11 string : IN_reference.into{ IN_reference_1 ; IN_reference_2 }
OPERATION_11 origin : [['IN_reference', 'P']]
OPERATION_11 gives  : [['IN_reference_1', 'P'], ['IN_reference_2', 'P']]


