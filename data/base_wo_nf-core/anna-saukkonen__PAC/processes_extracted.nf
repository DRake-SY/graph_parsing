Name : read_length
Inputs : [[0, 'reads_ch']]
Outputs : [[0, 'readlen_file_ch']]
Emits : []


Name : prepare_star_genome_index
Inputs : [[0, 'params'], [1, 'params'], [2, 'read_len_ch1'], [3, 'params']]
Outputs : [[0, 'genome_dir_ch']]
Emits : []


Name : rnaseq_mapping_star
Inputs : [[0, 'params'], [1, 'genome_dir_ch'], [2, 'reads_ch1'], [3, 'read_len_ch2'], [4, 'params'], [5, 'params']]
Outputs : [[1, 'id'], [3, 'aligned_bam_ch']]
Emits : []


Name : clean_up_reads
Inputs : [[0, 'aligned_bam_ch'], [1, 'params'], [2, 'params'], [3, 'params']]
Outputs : [[0, 'phaser_ch'], [1, 'phaser_bai_ch'], [2, 'pp_um_ch']]
Emits : []


Name : phaser_step
Inputs : [[0, 'params'], [1, 'phaser_ch'], [2, 'phaser_bai_ch'], [3, 'params'], [4, 'params']]
Outputs : [[0, '']]
Emits : []


Name : create_parental_genomes
Inputs : [[0, 'params'], [1, 'params'], [2, 'phaser_out_ch1'], [3, 'params'], [4, 'params']]
Outputs : [[0, 'maternal_chain_ch'], [1, 'paternal_chain_ch'], [2, ''], [3, ''], [4, ''], [5, 'not_lift_m_ch'], [6, ''], [7, 'not_lift_p_ch'], [8, 'adjusted_ref_ch'], [9, 'mothervcf_ch'], [10, 'fathervcf_ch'], [11, 'mat_bed_ch'], [12, 'pat_bed_ch']]
Emits : []


Name : STAR_reference_maternal_genomes
Inputs : [[0, 'mat_fa1'], [1, 'mat_annotation_ch1'], [2, 'read_len_ch3'], [3, 'params'], [4, 'params']]
Outputs : [[0, 'Maternal_STAR_ch']]
Emits : []


Name : STAR_reference_paternal_genomes
Inputs : [[0, 'pat_fa1'], [1, 'pat_annotation_ch1'], [2, 'read_len_ch4'], [3, 'params'], [4, 'params']]
Outputs : [[0, 'Paternal_STAR_ch']]
Emits : []


Name : map_paternal_gen_filter
Inputs : [[0, 'Paternal_STAR_ch'], [1, 'reads_ch2'], [2, 'pat_annotation_ch2'], [3, 'pat_fa2'], [4, 'read_len_ch5'], [5, 'params'], [6, 'params']]
Outputs : [[0, ''], [1, 'pat_rsem_ch']]
Emits : []


Name : map_maternal_gen_filter
Inputs : [[0, 'Maternal_STAR_ch'], [1, 'reads_ch3'], [2, 'mat_annotation_ch2'], [3, 'mat_fa2'], [4, 'read_len_ch6'], [5, 'params'], [6, 'params']]
Outputs : [[0, ''], [1, 'mat_rsem_ch']]
Emits : []


Name : extra_reads_rsem
Inputs : [[0, 'maternal_mapgen_ch1'], [1, 'mat_rsem_ch'], [2, 'paternal_mapgen_ch1'], [3, 'pat_rsem_ch'], [4, 'params']]
Outputs : [[0, 'mat_rsembam'], [1, 'pat_rsembam']]
Emits : []


Name : add_rsemreads_bam
Inputs : [[0, 'mat_rsembam'], [1, 'pat_rsembam'], [2, 'paternal_mapgen_ch2'], [3, 'maternal_mapgen_ch2'], [4, 'adjusted_ref_ch'], [5, 'phaser_out_ch2'], [6, 'params'], [7, 'params'], [8, 'pp_um_ch'], [9, 'mothervcf_ch'], [10, 'fathervcf_ch'], [11, 'mat_bed_ch'], [12, 'pat_bed_ch'], [13, 'params']]
Outputs : []
Emits : []


