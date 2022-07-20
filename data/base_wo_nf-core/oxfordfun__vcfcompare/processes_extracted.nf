Name : unzip_vcf
Inputs : [[0, 'gzip_files_channel']]
Outputs : [[0, 'vcf_files_channel']]
Emits : []


Name : process_vcf
Inputs : [[0, 'ref'], [1, 'refvcf'], [2, 'refindex'], [3, 'vcf_files_channel']]
Outputs : []
Emits : []


