OPERATION_1 string : Channel.fromPath(params.somatic_vcf, type: 'file')
       .set { somatic_vcf_channel }
OPERATION_1 origin : [["params.somatic_vcf, type: 'file'", 'A']]
OPERATION_1 gives  : [['somatic_vcf_channel', 'P']]


OPERATION_2 string : Channel.fromPath(params.fasta, type: 'file')
       .set { fasta_channel }
OPERATION_2 origin : [["params.fasta, type: 'file'", 'A']]
OPERATION_2 gives  : [['fasta_channel', 'P']]


OPERATION_3 string : vcf2maf_channel = somatic_vcf_channel.combine(fasta_channel)
OPERATION_3 origin : [['somatic_vcf_channel', 'P'], ['fasta_channel', 'P']]
OPERATION_3 gives  : [['vcf2maf_channel', 'P']]


