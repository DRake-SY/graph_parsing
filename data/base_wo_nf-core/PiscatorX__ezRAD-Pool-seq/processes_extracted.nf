Name : FastQC
Inputs : [[0, 'raw_reads_FastQC']]
Outputs : [[0, 'FastQC_results']]
Emits : []


Name : Trim_Galore
Inputs : [[0, 'raw_reads_trimgalore']]
Outputs : [[0, 'reads_bwa'], [1, 'Trim_galore_FastQC']]
Emits : []


Name : BWA_MEM
Inputs : [[0, 'reads_bwa']]
Outputs : [[0, 'SAM_files']]
Emits : []


Name : samtools_index
Inputs : [[0, 'SAM_files']]
Outputs : [[0, ''], [1, ''], [2, 'index_files2']]
Emits : []


Name : bam_stats
Inputs : [[0, 'bam_stats'], [1, 'index_files']]
Outputs : [[0, 'stats'], [1, 'stat_plots']]
Emits : []


Name : AddReadGroups
Inputs : [[0, 'bam_RG']]
Outputs : [[0, '']]
Emits : []


Name : mpileup
Inputs : [[0, 'bam_mpileup1']]
Outputs : [[0, 'sample_list'], [1, '']]
Emits : []


Name : bcftools
Inputs : [[0, 'bam_mpileup2']]
Outputs : [[1, 'bcftools_mpileup']]
Emits : []


Name : pileup2SNP
Inputs : [[0, 'samtools_mpileup1']]
Outputs : [[0, 'mpileup_sync'], [1, ''], [2, 'mpileup_snps_pwc']]
Emits : []


Name : rc2region
Inputs : [[0, 'mpileup_snps_rc1']]
Outputs : [[0, '']]
Emits : []


Name : splitRC
Inputs : [[0, 'mpileup_snps_rc2'], [1, 'sample_list']]
Outputs : [[0, 'snp_files']]
Emits : []


Name : countSNPs
Inputs : [[0, 'snp_files']]
Outputs : []
Emits : []


Name : sync2GenePop
Inputs : [[0, 'genome_region1'], [1, 'mpileup_sync']]
Outputs : [[0, 'genepop_merge']]
Emits : []


Name : Genepop_merge
Inputs : [[0, 'genepop_merge']]
Outputs : [[0, 'pool'], [1, 'ref']]
Emits : []


Name : TajimaPi
Inputs : [[0, 'samtools_mpileup2']]
Outputs : []
Emits : []


Name : TajimaD
Inputs : [[0, 'samtools_mpileup4']]
Outputs : []
Emits : []


Name : WattersonTheta
Inputs : [[0, 'samtools_mpileup4']]
Outputs : []
Emits : []


