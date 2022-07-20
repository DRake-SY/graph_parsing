OPERATION_1 string : Channel
    .fromFilePairs( params.reads )
    .ifEmpty { error "Cannot find any reads matching: ${params.reads}"  }
    .tap { read_pairs_ch }
    .subscribe({ num_samples += 1 })
OPERATION_1 origin : [['params.reads', 'A']]
OPERATION_1 gives  : [['read_pairs_ch', 'P']]


OPERATION_2 string : recalibrated_bam_ch = Channel.create()PROCESS DEF haplotypeCaller
OPERATION_2 origin : []
OPERATION_2 gives  : [['recalibrated_bam_ch', 'P']]


OPERATION_3 string : filtered_snps_ch_1.filter({it[1] == 1}).tap{filtered_snps_for_recal}.tap{snps_1_qc_ch}
OPERATION_3 origin : [['filtered_snps_ch_1', 'P']]
OPERATION_3 gives  : [['filtered_snps_for_recal', 'P'], ['snps_1_qc_ch', 'P']]


OPERATION_4 string : filtered_snps_ch_2.filter({it[1] == 2}).tap{snps_2_qc_ch}.tap{filtered_snps_for_snpeff}
OPERATION_4 origin : [['filtered_snps_ch_2', 'P']]
OPERATION_4 gives  : [['snps_2_qc_ch', 'P'], ['filtered_snps_for_snpeff', 'P']]


OPERATION_5 string : qc_output.collectFile(name: "${workflow.runName}_report.csv", keepHeader: true, storeDir: "${params.out}/reports")
OPERATION_5 origin : [['qc_output', 'P']]
OPERATION_5 gives  : []


