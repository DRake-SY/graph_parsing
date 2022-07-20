OPERATION_1 string : cont_fasta_ch = Channel.from(
    file(cont_fasta), file(cont_fasta + ".amb"), file(cont_fasta + ".ann"),
    file(cont_fasta + ".bwt"), file(cont_fasta + ".pac"),
    file(cont_fasta + ".sa")).toList()
OPERATION_1 origin : []
OPERATION_1 gives  : [['cont_fasta_ch', 'P']]


OPERATION_2 string : Channel
    .from(sample_keys)
    .map { sk -> tuple(sk, GetReadUnitKeys(sk).collect{GetReadPair(sk, it)}.flatten()) }
    .set { fastq_ch }
OPERATION_2 origin : [['sample_keys', 'V']]
OPERATION_2 gives  : [['fastq_ch', 'P']]


OPERATION_3 string : sample_keys.join(", ")
OPERATION_3 origin : [['sample_keys', 'P']]
OPERATION_3 gives  : []


