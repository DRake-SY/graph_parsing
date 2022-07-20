Name : _report_Nbseqreads
Inputs : [[0, 'ch_Toreport_reads_nb']]
Outputs : [[0, '']]
Emits : []


Name : trimming
Inputs : [[0, 'design_reads_csv']]
Outputs : [[0, 'design_mapping_ch'], [1, 'trimed_reads_ch']]
Emits : []


Name : _report_Nbtrimreads
Inputs : [[0, 'ch_report_trim_nb']]
Outputs : [[0, '']]
Emits : []


Name : buildIndexBT
Inputs : [[0, 'params']]
Outputs : [[0, 'index_ch']]
Emits : []


Name : mapping_Bowtie2
Inputs : [[0, 'design_mapping_ch'], [1, 'params'], [2, 'index_ch']]
Outputs : [[0, 'mapping_ch'], [1, 'libName_ch']]
Emits : []


Name : buildIndexSR
Inputs : [[0, 'params']]
Outputs : [[0, 'index_ch']]
Emits : []


Name : mapping_Subread
Inputs : [[0, 'design_mapping_ch'], [1, 'params'], [2, 'index_ch']]
Outputs : [[0, 'mapping_ch'], [1, 'libName_ch']]
Emits : []


Name : mergeBamFiles
Inputs : [[0, 'design_bam_merged']]
Outputs : [[0, 'mapping_ch'], [1, '']]
Emits : []


Name : samtools
Inputs : [[0, 'mapping_ch']]
Outputs : [[1, 'samtooled_ch'], [2, 'mapped_reads_ch'], [3, 'samtooled_rmdup_ch'], [4, 'mapped_uniq_reads_ch']]
Emits : []


Name : genome_coverage_bam
Inputs : [[0, 'samtooled_ch']]
Outputs : [[0, 'genCoved_ch']]
Emits : []


Name : genome_coverage_rmdup
Inputs : [[0, 'samtooled_rmdup_ch']]
Outputs : [[0, 'genCoved_uniq_ch']]
Emits : []


Name : _report_nb_mapped_reads
Inputs : [[0, 'ch_report_mapped_nb']]
Outputs : [[0, 'ch_Toreport_insert_size']]
Emits : []


Name : _report_insert_size
Inputs : [[0, 'ch_Toreport_insert_size']]
Outputs : [[0, ''], [1, 'table']]
Emits : []


Name : _report_mapping_stats_csv
Inputs : [[0, 'ch_report_all_stats']]
Outputs : []
Emits : []


Name : _report_nb_uniq_reads
Inputs : [[0, 'ch_report_uniq_nb']]
Outputs : [[0, 'ch_Toreport_uniq_insert_size']]
Emits : []


Name : _report_uniq_insert_size
Inputs : [[0, 'ch_Toreport_uniq_insert_size']]
Outputs : [[0, ''], [1, 'table_uniq']]
Emits : []


Name : _report_mapping_uniq_stats_csv
Inputs : [[0, 'ch_report_uniq_stats']]
Outputs : []
Emits : []


Name : _report_AoC_csv
Inputs : [[0, 'ch_report_Aoc']]
Outputs : []
Emits : []


Name : _report_AoC_uniq_csv
Inputs : [[0, 'ch_report_Aoc_uniq']]
Outputs : []
Emits : []


