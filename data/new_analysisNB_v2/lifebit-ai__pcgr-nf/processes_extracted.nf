Name : check_fields
Inputs : [[0, 'ch_input'], [1, 'getfilter']]
Outputs : [[0, 'ch_input_2'], [1, 'filterstr']]
Emits : []


Name : vcffilter
Inputs : [[0, 'ch_input_2'], [1, 'filterstr']]
Outputs : [[0, 'ch_vcf_for_pcgr']]
Emits : []


Name : check_data_bundle
Inputs : [[0, 'data_bundle']]
Outputs : [[0, 'data_bundle_checked']]
Emits : []


Name : pcgr
Inputs : [[0, 'ch_vcf_for_pcgr'], [1, 'data_bundle_checked'], [2, 'pcgr_toml_config'], [3, 'ch_reference']]
Outputs : [[0, 'out_pcgr'], [1, 'pcgr_tsv']]
Emits : []


Name : combine_tiers
Inputs : [[0, 'pcgr_tsv'], [1, 'ch_optional_metadata'], [2, 'combine_tables']]
Outputs : [[0, '']]
Emits : []


Name : report
Inputs : [[0, 'out_pcgr'], [1, 'run_report']]
Outputs : [[1, 'report']]
Emits : []


Name : pivot_table_gene_simple
Inputs : [[0, 'combined_tiers_gene_simple'], [1, 'pivot_gene_simple_py']]
Outputs : [[0, 'pivot_tiers_gene_simple']]
Emits : []


Name : pivot_table_gene_complete
Inputs : [[0, 'combined_tiers_gene_complete'], [1, 'pivot_gene_complete_py']]
Outputs : [[0, 'pivot_tiers_gene_complete']]
Emits : []


Name : pivot_table_variant
Inputs : [[0, 'combined_tiers_variant'], [1, 'pivot_variant_py']]
Outputs : [[0, 'pivot_tiers_variant']]
Emits : []


Name : plot_tiers
Inputs : [[0, 'combined_tiers_plot'], [1, 'plot_tiers_py']]
Outputs : [[0, 'tiers_plot']]
Emits : []


Name : summary
Inputs : [[0, 'pivot_tiers_gene_simple'], [1, 'pivot_tiers_gene_complete'], [2, 'pivot_tiers_variant'], [3, 'tiers_plot']]
Outputs : []
Emits : []


