Name : salmon
Inputs : [[0, 'r1_salmon'], [1, 'r2_salmon']]
Outputs : [[0, 'salmon_quant']]
Emits : []


Name : STAR_Aln
Inputs : [[0, 'r1'], [1, 'r2']]
Outputs : [[0, 'junctions'], [1, 'star_bam'], [2, 'bai'], [3, 'geneCounts']]
Emits : []


Name : STAR_Fusion
Inputs : [[0, 'junctions']]
Outputs : [[0, 'Fusion_dir']]
Emits : []


Name : GATK_Split
Inputs : [[0, 'bam'], [1, 'bai']]
Outputs : [[0, 'GATK_bam'], [1, 'GATK_bai']]
Emits : []


Name : StringTie
Inputs : [[0, 'stringtie_bam']]
Outputs : [[0, 'stringtie_gff'], [1, 'gffstats'], [2, 'annotated_gff']]
Emits : []


Name : GATK_ASE
Inputs : [[0, 'GATK_bam'], [1, 'GATK_bai']]
Outputs : [[0, 'GATK_haplotype_vcf'], [1, 'GATK_haplotype_ASE_vcf'], [2, 'GATK_ASE_CSV']]
Emits : []


