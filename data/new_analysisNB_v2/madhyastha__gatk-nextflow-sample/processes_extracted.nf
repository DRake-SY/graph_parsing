Name : bwa_mem
Inputs : [[0, 'ref_indices'], [1, 'reads']]
Outputs : [[0, 'sam_file']]
Emits : []


Name : samtools_sort
Inputs : [[0, 'sam_file']]
Outputs : [[0, 'bam_file']]
Emits : []


Name : samtools_index
Inputs : [[0, 'bam_file']]
Outputs : [[0, 'bai_file']]
Emits : []


Name : MarkDuplicates
Inputs : [[0, 'ref_indices'], [1, 'bam_file'], [2, 'bai_file']]
Outputs : [[0, 'bam_markdup']]
Emits : []


Name : BaseRecalibrator
Inputs : [[0, 'bam_markdup'], [1, 'ref_indices'], [2, 'ref_dict'], [3, 'ref_golden_indel'], [4, 'ref_dbsnp']]
Outputs : [[0, 'BaseRecalibrator_table']]
Emits : []


Name : ApplyBQSR
Inputs : [[0, 'bam_markdup'], [1, 'BaseRecalibrator_table']]
Outputs : [[0, 'bam_bqsr']]
Emits : []


Name : HaplotypeCaller
Inputs : [[0, 'bam_bqsr'], [1, 'ref_indices'], [2, 'ref_dict']]
Outputs : [[0, 'haplotypecaller_gvcf']]
Emits : []


Name : GenotypeGVCFs
Inputs : [[0, 'haplotypecaller_gvcf'], [1, 'ref_indices'], [2, 'ref_dict'], [3, 'ref_dbsnp']]
Outputs : []
Emits : []


