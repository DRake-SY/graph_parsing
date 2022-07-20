Name : get_mtbc_reads
Inputs : [[0, 'reads_ch'], [1, 'params']]
Outputs : [[0, 'mtbc_reads_ch']]
Emits : []


Name : indexRefGenome
Inputs : [[0, 'params']]
Outputs : [[0, 'bwa_index']]
Emits : []


Name : mapping_mtbc_and_filter
Inputs : [[0, 'mtbc_reads_ch'], [1, 'bwa_index'], [2, 'params']]
Outputs : [[0, 'bam_to_tbprofiling'], [1, 'bam_to_snippy'], [2, 'mapped_ch']]
Emits : []


Name : run_snippy_and_variant_filter
Inputs : [[0, 'bam_to_snippy'], [1, 'params']]
Outputs : [[0, 'build_tree_ch'], [1, 'csi_ch']]
Emits : []


Name : run_tbprofiling
Inputs : [[0, 'bam_to_tbprofiling']]
Outputs : [[0, 'vcf_ch'], [1, 'results_ch']]
Emits : []


Name : run_tbprofiler_collate
Inputs : [[0, 'results_dir_ch'], [1, 'results_ch']]
Outputs : [[0, 'collate_results']]
Emits : []


Name : build_genome_tree
Inputs : [[0, 'build_tree_ch'], [1, 'csi_ch']]
Outputs : [[0, 'tree_out_ch']]
Emits : []


