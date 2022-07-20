OPERATION_1 string : Channel
    .fromFilePairs( params.reads, flat:true )
    .ifEmpty { error "Cannot find any reads matching: ${params.reads}" }
    .set { read_pairs_ch }
OPERATION_1 origin : [['params.reads, flat:true', 'A']]
OPERATION_1 gives  : [['read_pairs_ch', 'P']]


OPERATION_2 string : Channel
    .fromPath( params.fasta )
    .ifEmpty { error "Cannot find any FASTA file matching: ${params.fasta}" }
    .into { fasta1; fasta2; fasta3; fasta4; fasta5 }
OPERATION_2 origin : [['params.fasta', 'A']]
OPERATION_2 gives  : [['fasta1', 'P'], ['fasta2', 'P'], ['fasta3', 'P'], ['fasta4', 'P'], ['fasta5', 'P']]


OPERATION_3 string : Channel
    .fromPath( params.dict )
    .ifEmpty { error "Cannot find any GATK sequence dictionary matching: ${params.dict}" }
    .into { dict1; dict2; dict3; dict4}
OPERATION_3 origin : [['params.dict', 'A']]
OPERATION_3 gives  : [['dict1', 'P'], ['dict2', 'P'], ['dict3', 'P'], ['dict4', 'P']]


OPERATION_4 string : Channel
    .fromPath( params.fai )
    .ifEmpty { error "Cannot find any samtools .fai index matching: ${params.fai}" }
    .into { fai1; fai2; fai3; fai4}
OPERATION_4 origin : [['params.fai', 'A']]
OPERATION_4 gives  : [['fai1', 'P'], ['fai2', 'P'], ['fai3', 'P'], ['fai4', 'P']]


OPERATION_5 string : Channel
    .fromPath( params.bwt )
    .ifEmpty { error "Cannot find any bwa .bwt file matching: ${params.bwt}" }
    .set { bwt }
OPERATION_5 origin : [['params.bwt', 'A']]
OPERATION_5 gives  : [['bwt', 'P']]


OPERATION_6 string : Channel
    .fromPath( params.ann )
    .ifEmpty { error "Cannot find any bwa .ann file matching: ${params.ann}" }
    .set { ann }
OPERATION_6 origin : [['params.ann', 'A']]
OPERATION_6 gives  : [['ann', 'P']]


OPERATION_7 string : Channel
    .fromPath( params.pac )
    .ifEmpty { error "Cannot find any bwa .pac file matching: ${params.pac}" }
    .set { pac }
OPERATION_7 origin : [['params.pac', 'A']]
OPERATION_7 gives  : [['pac', 'P']]


OPERATION_8 string : Channel
    .fromPath( params.sa )
    .ifEmpty { error "Cannot find any bwa .sa file matching: ${params.sa}" }
    .set { sa }
OPERATION_8 origin : [['params.sa', 'A']]
OPERATION_8 gives  : [['sa', 'P']]


OPERATION_9 string : Channel
    .fromPath( params.amb )
    .ifEmpty { error "Cannot find any bwa .amb file matching: ${params.amb}" }
    .set { amb }
OPERATION_9 origin : [['params.amb', 'A']]
OPERATION_9 gives  : [['amb', 'P']]


OPERATION_10 string : bwa_index = ann.merge(bwt, pac, sa, amb, fasta1)
OPERATION_10 origin : [['ann', 'P'], ['bwt', 'P'], ['pac', 'P'], ['sa', 'P'], ['amb', 'P'], ['fasta1', 'P']]
OPERATION_10 gives  : [['bwa_index', 'P']]


OPERATION_11 string : ref1 = trimmed_reads.combine(bwa_index)
OPERATION_11 origin : [['trimmed_reads', 'P'], ['bwa_index', 'P']]
OPERATION_11 gives  : [['ref1', 'P']]


