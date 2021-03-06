OPERATION_1 string : ch_vcf = Channel.value(file(params.dbsnp_vcf_ref)).ifEmpty{exit 1, "VCF file not found: ${params.dbsnp_vcf_ref}"}
OPERATION_1 origin : []
OPERATION_1 gives  : [['ch_vcf', 'P']]


OPERATION_2 string : stats_summary.collectFile(name: 'facets_stats_default_summary.txt', storeDir: params.output_folder, seed: 'Sample \t purity \t ploidy \t dipLogR \t loglik', newLine: true, skip: 1)
OPERATION_2 origin : [['stats_summary', 'P']]
OPERATION_2 gives  : []


OPERATION_3 string : stats_summary_cval500.collectFile(name: 'facets_stats_cval500_summary.txt', storeDir: params.output_folder, seed: 'Sample \t purity \t ploidy \t dipLogR \t loglik', newLine: true, skip: 1)
OPERATION_3 origin : [['stats_summary_cval500', 'P']]
OPERATION_3 gives  : []


OPERATION_4 string : stats_summary_cval1000.collectFile(name: 'facets_stats_cval1000_summary.txt', storeDir: params.output_folder, seed: 'Sample \t purity \t ploidy \t dipLogR \t loglik', newLine: true, skip: 1)
OPERATION_4 origin : [['stats_summary_cval1000', 'P']]
OPERATION_4 gives  : []


OPERATION_5 string : stats_summary_cval1500.collectFile(name: 'facets_stats_cval1500_summary.txt', storeDir: params.output_folder, seed: 'Sample \t purity \t ploidy \t dipLogR \t loglik', newLine: true, skip: 1)
OPERATION_5 origin : [['stats_summary_cval1500', 'P']]
OPERATION_5 gives  : []


