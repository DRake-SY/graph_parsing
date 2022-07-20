Name : GenomicsDBImport
Inputs : [[0, 'chromosomes_ch'], [1, 'gvcf_ch'], [2, 'gvcf_idx_ch']]
Outputs : [[0, 'gendb_ch']]
Emits : []


Name : GenotypeGVCFs
Inputs : [[0, 'gendb_ch'], [1, 'ref']]
Outputs : [[0, 'vcf_ch'], [1, 'faidx_sid_ch'], [1, 'faidx_snv_ch'], [2, 'dict_sid_ch'], [2, 'dict_snv_ch']]
Emits : []


Name : HardFilter
Inputs : [[0, 'vcf_ch']]
Outputs : [[0, ''], [1, '']]
Emits : []


Name : GatherVcfs
Inputs : [[0, 'vcf_hf_ch'], [1, 'vcf_idx_hf_ch']]
Outputs : [[0, '']]
Emits : []


Name : SID_VariantRecalibrator
Inputs : [[0, 'vcf_sid_ch'], [1, 'ref'], [2, 'faidx_sid_ch'], [3, 'dict_sid_ch']]
Outputs : [[0, 'sid_recal_ch']]
Emits : []


Name : SNV_VariantRecalibrator
Inputs : [[0, 'vcf_snv_ch'], [1, 'ref'], [2, 'faidx_snv_ch'], [3, 'dict_snv_ch']]
Outputs : [[0, 'snv_recal_ch']]
Emits : []


Name : ApplyRecalibration
Inputs : [[0, 'vcf_recal_ch'], [1, 'sid_recal_ch'], [2, 'snv_recal_ch']]
Outputs : [[0, 'vcf_final_ch']]
Emits : []


