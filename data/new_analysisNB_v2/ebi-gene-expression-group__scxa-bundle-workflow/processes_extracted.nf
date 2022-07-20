Name : meta_manifest_lines
Inputs : [[0, 'CELL_METADATA'], [1, 'CONDENSED_SDRF'], [2, 'PROJECT_FILE']]
Outputs : [[0, 'META_MANIFEST_LINES']]
Emits : []


Name : reference_manifest_lines
Inputs : [[0, 'REFERENCE_FASTA'], [1, 'REFERENCE_GTF'], [2, 'GENE_METADATA']]
Outputs : [[0, 'REFERENCE_MANIFEST_LINES']]
Emits : []


Name : publish_reference
Inputs : [[0, 'REFERENCE_FASTA'], [1, 'REFERENCE_GTF'], [2, 'GENE_METADATA']]
Outputs : []
Emits : []


Name : reference_supplementary_lines
Inputs : [[0, 'REFERENCE_FASTA'], [1, 'REFERENCE_GTF']]
Outputs : [[0, 'REFERENCE_SOFTWARE']]
Emits : []


Name : filter_tpms
Inputs : [[0, 'RAW_FILTERED_MATRIX_FOR_TPM_FILTERING'], [1, 'RAW_TPM_MATRIX_FOR_FILTERING']]
Outputs : [[0, 'TPM_FILTER_CELLS_MTX'], [1, 'TPM_FILTER_CELLS_MTX_ROWS'], [2, 'TPM_FILTER_CELLS_MTX_COLS']]
Emits : []


Name : compress_filtered_tpms
Inputs : [[0, 'TPM_FILTER_CELLS_MTX'], [0, 'TPM_FILTER_CELLS_MTX_ROWS'], [0, 'TPM_FILTER_CELLS_MTX_COLS']]
Outputs : [[0, 'RAW_FILTERED_TPM_MATRIX']]
Emits : []


Name : master_workflow_software
Inputs : []
Outputs : [[0, 'MASTER_SOFTWARE']]
Emits : []


Name : make_base_software_report
Inputs : []
Outputs : [[0, 'BASE_SOFTWARE']]
Emits : []


Name : make_tertiary_software_report
Inputs : []
Outputs : [[0, 'TERTIARY_SOFTWARE']]
Emits : []


Name : finalise_software
Inputs : [[0, 'MERGED_SOFTWARE']]
Outputs : [[0, 'SOFTWARE_FOR_MANIFEST']]
Emits : []


Name : mark_dimred_params
Inputs : [[0, 'SCANPY_DIMRED']]
Outputs : [[0, 'EMBEDDINGS_BY_PARAMVAL']]
Emits : []


Name : dimred_lines
Inputs : [[0, 'EMBEDDINGS_BY_PARAMVAL']]
Outputs : [[0, 'TSNE_MANIFEST_LINES']]
Emits : []


Name : repackage_matrices
Inputs : [[0, 'MATRICES_TO_REPACKAGE']]
Outputs : [[0, 'MTX_MATRIX_ROWNAMES'], [1, 'MTX_MATRIX_COLNAMES'], [2, 'MTX_MATRIX_CONTENT'], [3, 'MTX_MATRICES_FOR_SUMMARY']]
Emits : []


Name : cell_library_mappings
Inputs : [[0, 'MTX_MATRIX_COLNAMES_FOR_CELLMAPPING']]
Outputs : [[0, 'expressionType']]
Emits : []


Name : cell_count
Inputs : [[0, 'MATRICES_FOR_TSV']]
Outputs : [[0, 'MATRICES_FOR_TSV_WITH_COUNT']]
Emits : []


Name : mtx_to_tsv
Inputs : [[0, 'SMALL_MATRICES']]
Outputs : [[0, 'TSV_MATRICES']]
Emits : []


Name : matrix_lines
Inputs : [[0, 'MTX_MATRIX_ROWNAMES'], [0, 'MTX_MATRIX_COLNAMES_FOR_MANIFEST_LINES'], [0, 'MTX_MATRIX_CONTENT'], [0, 'TSV_AND_NOTSV_MATRICES']]
Outputs : [[0, 'MATRIX_MANIFEST_LINES']]
Emits : []


Name : renumber_clusters
Inputs : [[0, 'SCANPY_CLUSTERS']]
Outputs : [[0, 'FINAL_CLUSTERS']]
Emits : []


Name : mark_marker_param
Inputs : [[0, 'SCANPY_MARKERS']]
Outputs : [[0, 'CLUSTER_MARKERS_BY_RESOLUTION'], [1, 'META_MARKERS_BY_VAR']]
Emits : []


Name : renumber_markers
Inputs : [[0, 'CLUSTER_MARKERS_BY_RESOLUTION']]
Outputs : [[0, 'RENUMBERED_CLUSTER_MARKERS_BY_RESOLUTION']]
Emits : []


Name : rename_meta_markers
Inputs : [[0, 'META_MARKERS_BY_VAR']]
Outputs : [[0, 'RENAMED_META_MARKERS_BY_VAR']]
Emits : []


Name : collate_cluster_markers
Inputs : [[0, 'CLUSTER_MARKERS_FOR_SUMMARY']]
Outputs : [[0, 'COLLATED_CLUSTER_MARKERS']]
Emits : []


Name : collate_meta_markers
Inputs : [[0, 'META_MARKERS_FOR_SUMMARY']]
Outputs : [[0, 'COLLATED_META_MARKERS']]
Emits : []


Name : publish_markers
Inputs : [[0, 'CLUSTER_MARKERS_FOR_BUNDLE'], [0, 'META_MARKERS_FOR_BUNDLE']]
Outputs : [[0, 'ALL_MARKERS']]
Emits : []


Name : bundle_summary
Inputs : [[0, 'MTX_MATRICES_FOR_SUMMARY'], [1, 'COLLATED_CLUSTER_MARKERS'], [1, 'COLLATED_META_MARKERS'], [2, 'FINAL_CLUSTERS_FOR_SUMMARY'], [3, 'CELL_METADATA']]
Outputs : [[0, 'BUNDLE_SUMMARY'], [1, 'BUNDLE_SUMMARY_TPM']]
Emits : []


Name : bundle_summary_lines
Inputs : [[0, 'BUNDLE_SUMMARY'], [0, 'BUNDLE_SUMMARY_TPM']]
Outputs : [[0, 'SUMMARY_MANIFEST_LINES']]
Emits : []


Name : markers_lines
Inputs : [[0, 'ALL_MARKERS']]
Outputs : [[0, 'MARKER_MANIFEST_LINES']]
Emits : []


Name : base_manifest
Inputs : [[0, 'MATRIX_MANIFEST_CONTENT'], [1, 'SOFTWARE_FOR_MANIFEST'], [2, 'REFERENCE_MANIFEST_LINES'], [3, 'META_MANIFEST_LINES']]
Outputs : [[0, 'BASE_MANIFEST']]
Emits : []


Name : tertiary_manifest
Inputs : [[0, 'STARTING_MANIFEST'], [1, 'FINAL_CLUSTERS_FOR_MANIFEST']]
Outputs : []
Emits : []


Name : publish_manifest
Inputs : [[0, 'BASE_MANIFEST']]
Outputs : []
Emits : []


