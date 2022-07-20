Name : generate_md5
Inputs : [[0, 'md5_channel']]
Outputs : [[0, 'nowhere_channel_']]
Emits : []


Name : validate_bam
Inputs : [[0, 'validate_bam_channel'], [1, 'ref_validate_bam_channel']]
Outputs : [[0, 'multiqc_channel_validate_bam']]
Emits : []


Name : samtools_flagstat
Inputs : [[0, 'samtools_flagstat_channel'], [1, 'ref_samtools_flagstat_channel']]
Outputs : [[0, 'multiqc_channel_samtools_flagstat']]
Emits : []


Name : qualimap_bamqc
Inputs : [[0, 'qualimap_bamqc_channel'], [1, 'ref_qualimap_bamqc_channel']]
Outputs : [[0, 'inliner_channel'], [1, 'multiqc_channel_qualimap_bamqc']]
Emits : []


Name : inliner
Inputs : [[0, 'inliner_channel']]
Outputs : [[0, 'qualimap_bamqc_results']]
Emits : []


Name : multiqc
Inputs : [[0, 'multiqc_channel_validate_bam'], [1, 'multiqc_channel_samtools_flagstat'], [2, 'multiqc_channel_qualimap_bamqc']]
Outputs : [[0, 'multiqc_report']]
Emits : []


