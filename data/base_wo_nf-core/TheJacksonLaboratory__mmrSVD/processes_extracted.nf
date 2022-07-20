Name : NGMLRmap
Inputs : [[0, 'params'], [1, 'ch_fasta'], [2, 'ch_fastq1']]
Outputs : [[0, 'ngmlr_sam']]
Emits : []


Name : NGMLRsort
Inputs : [[0, 'params'], [1, 'ngmlr_sam']]
Outputs : [[0, 'ch_bam_map'], [1, 'ch_bam_index']]
Emits : []


Name : sniffles
Inputs : [[0, 'ch_bam_map']]
Outputs : [[0, 'sniffles_vcf'], [1, 'vcf_sniffles_path']]
Emits : []


Name : svim
Inputs : [[0, 'params'], [1, 'ch_bam_map'], [2, 'ch_fasta']]
Outputs : [[0, 'svim_output'], [1, 'svim_vcf']]
Emits : []


Name : cutesv_css
Inputs : [[0, 'ch_bam_map'], [1, 'ch_bam_index'], [2, 'ch_fasta']]
Outputs : [[0, 'cutesv_css_vcf']]
Emits : []


Name : cutesv_clr
Inputs : [[0, 'ch_bam_map'], [1, 'ch_bam_index'], [2, 'ch_fasta']]
Outputs : [[0, 'cutesv_clr_vcf']]
Emits : []


Name : BuildPBMM2index
Inputs : [[0, 'ch_fasta']]
Outputs : [[0, 'pbmm2_built']]
Emits : []


Name : PBMM2fastqMap_css
Inputs : [[0, 'params'], [1, 'pbmm2_built'], [2, 'ch_fastq1']]
Outputs : [[0, 'pbmm2_bam_css']]
Emits : []


Name : PBMM2fastqMap_clr
Inputs : [[0, 'params'], [1, 'pbmm2_built'], [2, 'ch_fastq1']]
Outputs : [[0, 'pbmm2_bam_clr']]
Emits : []


Name : pbsv_discovery_tandem
Inputs : [[0, 'pbmm2_bam']]
Outputs : [[0, 'pbsv_svsig_tandem']]
Emits : []


Name : pbsv_discovery_no_tandem
Inputs : [[0, 'pbmm2_bam'], [1, 'ch_pbsvTandem']]
Outputs : [[0, 'pbsv_svsig_no_tandem']]
Emits : []


Name : pbsv_call_ccs
Inputs : [[0, 'pbsv_svsig'], [1, 'ch_fasta']]
Outputs : [[0, 'pbsv_vcf_ccs'], [1, 'vcf_pbsv_path']]
Emits : []


Name : pbsv_call_clr
Inputs : [[0, 'pbsv_svsig'], [1, 'ch_fasta']]
Outputs : [[0, 'pbsv_vcf_clr'], [1, 'vcf_pbsv_path']]
Emits : []


Name : prep_vcf_list
Inputs : [[0, 'pbsv_vcf_ccs'], [1, 'sniffles_vcf']]
Outputs : [[0, 'ch_vcf']]
Emits : []


Name : BuildBWAindexes
Inputs : [[0, 'ch_fasta']]
Outputs : [[0, 'bwa_built']]
Emits : []


Name : readgroup
Inputs : [[0, 'ch_fastq1'], [1, 'params']]
Outputs : [[0, 'readgroup']]
Emits : []


Name : map
Inputs : [[0, 'ch_fastq1'], [1, 'ch_fastq2'], [2, 'ch_bwa'], [3, 'ch_fasta'], [4, 'readgroup'], [5, 'params']]
Outputs : [[0, 'ch_sam_map']]
Emits : []


Name : map2
Inputs : [[0, 'ch_sam_map'], [1, 'params']]
Outputs : [[0, 'ch_bam_map']]
Emits : []


Name : dedup
Inputs : [[0, 'ch_bam_und'], [1, 'params']]
Outputs : [[0, 'ch_sample_name_bam_bai'], [1, 'bam_markd_m']]
Emits : []


Name : avoid_race_condition
Inputs : []
Outputs : [[0, 'avoid_race_cond_1']]
Emits : []


Name : avoid_race_condition_2
Inputs : [[0, 'avoid_race_cond_1']]
Outputs : [[0, 'avoid_race_cond_2']]
Emits : []


Name : avoid_race_condition_3
Inputs : [[0, 'avoid_race_cond_2']]
Outputs : [[0, 'avoid_race_cond_3']]
Emits : []


Name : avoid_race_condition_4
Inputs : [[0, 'avoid_race_cond_3']]
Outputs : [[0, 'avoid_race_cond_4']]
Emits : []


Name : avoid_race_condition_5
Inputs : [[0, 'avoid_race_cond_4']]
Outputs : [[0, 'avoid_race_cond_5']]
Emits : []


Name : avoid_race_condition_6
Inputs : [[0, 'avoid_race_cond_5']]
Outputs : [[0, 'avoid_race_cond_6']]
Emits : []


Name : bam_insertsize
Inputs : [[0, 'ch_sample_name_bam_bai']]
Outputs : [[0, 'ins_size_ch']]
Emits : []


Name : fastaindex
Inputs : [[0, 'ch_fasta']]
Outputs : [[0, 'fasta_fai_ch']]
Emits : []


Name : lumpy_mapping
Inputs : [[0, 'in_lumpy']]
Outputs : [[0, ''], [1, 'dis_unsorted_bam_ch']]
Emits : []


Name : lumpy_bwa_sort
Inputs : [[0, 'bam_bwa_lumpy_ch']]
Outputs : [[0, 'bam_bwa_lumpy_sort_ch']]
Emits : []


Name : lumpy_discordant_sort
Inputs : [[0, 'dis_unsorted_bam_ch']]
Outputs : [[0, 'dis_sorted_bam_ch']]
Emits : []


Name : lumpy_extract_splits
Inputs : [[0, 'bam_bwa_lumpy_splits_ch']]
Outputs : [[0, 'split_unsorted_bam_ch']]
Emits : []


Name : lumpy_split_bam_sort
Inputs : [[0, 'split_unsorted_bam_ch']]
Outputs : [[0, 'split_sorted_bam_ch']]
Emits : []


Name : lumpy_call_sv
Inputs : [[0, 'bam_bwa_lumpy_sort_ch'], [1, 'split_sorted_bam_ch'], [2, 'dis_sorted_bam_ch'], [3, 'abs_outdir']]
Outputs : [[0, 'reheader_lumpy']]
Emits : []


Name : reheader_lumpy
Inputs : [[0, 'abs_outdir'], [1, 'params'], [2, 'reheader_lumpy']]
Outputs : [[1, 'vcf_lumpy']]
Emits : []


Name : breakdancer_calling_sv
Inputs : [[0, 'in_brkdncr'], [1, 'abs_outdir']]
Outputs : [[0, 'ch_breakdancer_sv']]
Emits : []


Name : breakdancer_sv_to_vcf
Inputs : [[0, 'in_brkdncr'], [1, 'abs_outdir'], [2, 'ch_breakdancer_sv']]
Outputs : [[0, 'reheader_breakdancer']]
Emits : []


Name : reheader_breakdancer
Inputs : [[0, 'abs_outdir'], [1, 'params'], [2, 'reheader_breakdancer']]
Outputs : [[1, 'vcf_breakdancer']]
Emits : []


Name : manta_calling_sv
Inputs : [[0, 'in_manta'], [1, 'ch_fasta'], [2, 'fasta_fai_ch'], [3, 'abs_outdir']]
Outputs : [[0, 'reheader_manta']]
Emits : []


Name : reheader_manta
Inputs : [[0, 'abs_outdir'], [1, 'params'], [2, 'reheader_manta']]
Outputs : [[1, 'vcf_manta']]
Emits : []


Name : delly_calling_sv
Inputs : [[0, 'in_delly'], [1, 'ch_fasta'], [2, 'fasta_fai_ch']]
Outputs : [[0, 'delly_bcf_out']]
Emits : []


Name : delly_bcf2vcf_sort
Inputs : [[0, 'delly_bcf_out'], [1, 'abs_outdir']]
Outputs : [[0, 'reheader_delly']]
Emits : []


Name : reheader_delly
Inputs : [[0, 'abs_outdir'], [1, 'params'], [2, 'reheader_delly']]
Outputs : [[1, 'vcf_delly']]
Emits : []


Name : survivor
Inputs : [[0, 'sample_vcfs_paths'], [1, 'params'], [2, 'params'], [3, 'params'], [4, 'params'], [5, 'params'], [6, 'params']]
Outputs : [[0, '']]
Emits : []


Name : annotate_sv
Inputs : [[0, 'vcf_merged_1'], [1, 'params']]
Outputs : [[0, 'ch_annot']]
Emits : []


Name : summarize_sv
Inputs : [[0, 'vcf_merged_2']]
Outputs : [[0, 'ch_summary']]
Emits : []


Name : prep_beds
Inputs : [[0, 'ch_annot'], [1, 'ch_summary_1'], [2, 'params']]
Outputs : [[0, 'ch_ins'], [1, 'ch_inv'], [2, 'ch_del'], [3, 'ch_dup'], [4, 'ch_tra']]
Emits : []


Name : intersect_beds
Inputs : [[0, 'params'], [1, 'ch_ins_1'], [2, 'ch_inv_1'], [3, 'ch_del_1'], [4, 'ch_dup_1'], [5, 'ch_tra_1']]
Outputs : [[0, 'ch_ins_s'], [1, 'ch_ins_e'], [2, 'ch_del_s'], [3, 'ch_del_e'], [4, 'ch_inv_e'], [5, 'ch_tra_e'], [6, 'ch_dup_e'], [7, 'ch_ins_genes'], [8, 'ch_del_genes'], [9, 'ch_inv_genes'], [10, 'ch_dup_genes'], [11, 'ch_tra_genes'], [12, 'ch_ins_exons'], [13, 'ch_del_exons'], [14, 'ch_inv_exons'], [15, 'ch_dup_exons'], [16, 'ch_tra_exons']]
Emits : []


Name : summarize_intersections
Inputs : [[0, 'params'], [1, 'ch_summary_2'], [2, 'ch_ins_2'], [3, 'ch_dup_2'], [4, 'ch_tra_2'], [5, 'ch_inv_2'], [6, 'ch_del_2'], [7, 'ch_ins_s'], [8, 'ch_ins_e'], [9, 'ch_del_s'], [10, 'ch_del_e'], [11, 'ch_dup_e'], [12, 'ch_inv_e'], [13, 'ch_tra_e'], [14, 'ch_ins_genes'], [15, 'ch_del_genes'], [16, 'ch_dup_genes'], [17, 'ch_tra_genes'], [18, 'ch_inv_genes'], [19, 'ch_ins_exons_1'], [20, 'ch_del_exons_1'], [21, 'ch_dup_exons_1'], [22, 'ch_tra_exons_1'], [23, 'ch_inv_exons_1']]
Outputs : []
Emits : []


Name : annotate_exons
Inputs : [[0, 'vcf_merged_3'], [1, 'ch_ins_exons_2'], [2, 'ch_del_exons_2'], [3, 'ch_dup_exons_2'], [4, 'ch_tra_exons_2'], [5, 'ch_inv_exons_2']]
Outputs : []
Emits : []


