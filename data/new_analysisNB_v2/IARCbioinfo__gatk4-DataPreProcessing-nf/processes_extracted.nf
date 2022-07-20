Name : PICARD_FixMate
Inputs : [[0, 'ubam_ch']]
Outputs : [[0, 'fix_bam_ch']]
Emits : []


Name : PICARD_SamToFastq
Inputs : [[0, 'fix_bam_ch']]
Outputs : [[0, 'fastq_ch']]
Emits : []


Name : BWA_mapping
Inputs : [[0, 'ref'], [1, 'ref_alt'], [2, 'ref_amb'], [3, 'ref_ann'], [4, 'ref_bwt'], [5, 'ref_pac'], [6, 'ref_sa'], [7, 'fastq_ch']]
Outputs : [[0, 'aln_bam_ch']]
Emits : []


Name : SAMBAMBA_markdup
Inputs : [[0, 'aln_bam_ch']]
Outputs : [[0, 'dup_bam_ch']]
Emits : []


Name : GATK_BaseRecalibrator_ApplyBQSR
Inputs : [[0, 'ref'], [1, 'dup_bam_ch']]
Outputs : [[0, 'recal_bam_ch']]
Emits : []


Name : QUALIMAP_BamQC
Inputs : [[0, 'recal_bam_ch']]
Outputs : [[0, 'recal_bam_stats_ch']]
Emits : []


