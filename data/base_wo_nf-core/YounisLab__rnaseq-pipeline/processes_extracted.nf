Name : STAR
Inputs : [[0, 'raw_reads_fastq']]
Outputs : [[0, 'bam_for_regtools'], [0, 'bam_for_stringtie'], [0, 'bam_for_intron_analysis'], [0, 'bam_for_bam2bigwig'], [1, 'STAR_DIR']]
Emits : []


Name : regtools
Inputs : [[1, 'bam_for_regtools']]
Outputs : [[0, 'bed_for_intron_analysis']]
Emits : []


Name : stringtie
Inputs : [[0, 'bam_for_stringtie']]
Outputs : [[0, 'fpkm_for_intron_analysis']]
Emits : []


Name : intron_analysis
Inputs : [[0, 'bam_for_intron_analysis'], [1, 'fpkm_for_intron_analysis'], [2, 'bed_for_intron_analysis']]
Outputs : [[1, 'INTRON_ANALYSIS_DIR']]
Emits : []


Name : bam2bigwig
Inputs : [[0, 'bam_for_bam2bigwig']]
Outputs : [[0, 'BAM2BIGIWG_DIR']]
Emits : []


