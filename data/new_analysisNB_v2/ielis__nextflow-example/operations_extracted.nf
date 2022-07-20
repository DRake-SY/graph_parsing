OPERATION_1 string : Channel.fromPath(params.reference)
    .ifEmpty{ exit 1, "We need a reference genome."}
    .into{ reference_genome }
OPERATION_1 origin : [['params.reference', 'A']]
OPERATION_1 gives  : [['reference_genome', 'P']]


OPERATION_2 string : Channel.fromPath(params.reference_fai)
    .ifEmpty{ exit 1, "We need a reference genome fai."}
    .into{ reference_genome_fai }
OPERATION_2 origin : [['params.reference_fai', 'A']]
OPERATION_2 gives  : [['reference_genome_fai', 'P']]


OPERATION_3 string : Channel.fromPath(params.reference_dict)
    .ifEmpty{ exit 1, "We need a reference genome dict."}
    .into{ reference_genome_dict }
OPERATION_3 origin : [['params.reference_dict', 'A']]
OPERATION_3 gives  : [['reference_genome_dict', 'P']]


OPERATION_4 string : Channel.fromPath(params.vcfs)
    .ifEmpty{ exit 1, "We need to specify vcf files." }
    .into{ all_vcfs }
OPERATION_4 origin : [['params.vcfs', 'A']]
OPERATION_4 gives  : [['all_vcfs', 'P']]


OPERATION_5 string : Channel.fromPath(params.vcfs_tbi)
      .ifEmpty{ exit 1, "We need to specify vcf files index." }
      .into{ all_vcfs_tbi }
OPERATION_5 origin : [['params.vcfs_tbi', 'A']]
OPERATION_5 gives  : [['all_vcfs_tbi', 'P']]


