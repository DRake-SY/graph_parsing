OPERATION_1 string : gzip_files_channel = Channel.fromPath(vcf_path)
OPERATION_1 origin : [['vcf_path', 'A']]
OPERATION_1 gives  : [['gzip_files_channel', 'P']]


OPERATION_2 string : vcf_files_channel = Channel.fromPath(vcf_path)
OPERATION_2 origin : [['vcf_path', 'A']]
OPERATION_2 gives  : [['vcf_files_channel', 'P']]


