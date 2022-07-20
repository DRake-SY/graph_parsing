Name : makeBowtieIndex
Inputs : [[0, 'mature'], [1, 'hairpin']]
Outputs : [[0, 'mature_index'], [1, 'hairpin_index']]
Emits : []


Name : fastqc
Inputs : [[0, 'raw_reads_fastqc']]
Outputs : [[0, 'fastqc_results']]
Emits : []


Name : bbduk
Inputs : [[0, 'raw_reads_bbduk'], [1, 'adapters']]
Outputs : [[0, 'trimmed_reads_bowtie'], [0, 'trimmed_reads_bowtie2'], [0, 'trimmed_reads_insertsize']]
Emits : []


Name : insertsize
Inputs : [[0, 'trimmed_reads_insertsize']]
Outputs : [[0, 'insertsize_results']]
Emits : []


Name : bowtie_miRBase_mature
Inputs : [[0, 'trimmed_reads_bowtie'], [1, 'mature_index']]
Outputs : [[0, 'miRBase_mature_bam'], [1, 'mature_unmapped_reads']]
Emits : []


Name : bowtie_miRBase_hairpin
Inputs : [[0, 'mature_unmapped_reads'], [1, 'hairpin_index']]
Outputs : [[0, 'miRBase_hairpin_bam'], [1, 'hairpin_unmapped_reads']]
Emits : []


Name : miRBasePostAlignment
Inputs : [[0, 'miRBase_mature_bam'], [0, 'miRBase_hairpin_bam']]
Outputs : [[0, 'miRBase_counts'], [1, 'miRBase_bam'], [2, 'miRBase_bai']]
Emits : []


Name : edgeR_miRBase
Inputs : [[0, 'miRBase_counts']]
Outputs : [[0, 'edgeR_miRBase_results']]
Emits : []


Name : bowtie2
Inputs : [[0, 'trimmed_reads_bowtie2'], [1, 'bt2_indices']]
Outputs : [[0, 'bowtie2_bam'], [0, 'bowtie2_bam_for_unmapped']]
Emits : []


Name : bowtie2_unmapped
Inputs : [[0, 'bowtie2_bam_for_unmapped']]
Outputs : [[0, 'bowtie2_unmapped']]
Emits : []


Name : ngi_visualizations
Inputs : [[0, 'gtf'], [1, 'bowtie2_bam']]
Outputs : [[0, 'bowtie2_ngi_visualizations']]
Emits : []


