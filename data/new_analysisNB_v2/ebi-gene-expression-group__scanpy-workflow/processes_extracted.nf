Name : read_10x
Inputs : [[0, 'RAW_COUNT_MATRIX']]
Outputs : [[0, 'RAW_ANNDATA']]
Emits : []


Name : filter_cells
Inputs : [[0, 'RAW_ANNDATA']]
Outputs : [[0, 'FILTER_CELLS_ANNDATA']]
Emits : []


Name : make_genelist
Inputs : [[0, 'CDNA_GTF']]
Outputs : [[0, 'GENE_LIST']]
Emits : []


Name : filter_genes
Inputs : [[0, 'FILTER_CELLS_ANNDATA'], [1, 'GENE_LIST']]
Outputs : [[0, 'FILTER_GENES_ANNDATA'], [1, 'FILTER_CELLS_MTX']]
Emits : []


Name : normalise_data
Inputs : [[0, 'FILTER_GENES_ANNDATA']]
Outputs : [[0, 'NORMALISED_ANNDATA'], [1, 'NORMALISED_MTX']]
Emits : []


Name : find_variable_genes
Inputs : [[0, 'NORMALISED_ANNDATA']]
Outputs : [[0, 'FIND_VARIABLE_GENES_ANNDATA'], [1, 'VARIABLE_GENES_PLOT']]
Emits : []


Name : scale_data
Inputs : [[0, 'FIND_VARIABLE_GENES_ANNDATA']]
Outputs : [[0, 'SCALE_DATA_ANNDATA']]
Emits : []


Name : run_pca
Inputs : [[0, 'SCALE_DATA_ANNDATA']]
Outputs : [[0, 'PCA_ANNDATA']]
Emits : []


Name : neighbours
Inputs : [[0, 'PCA_ANNDATA']]
Outputs : [[0, 'NEIGHBOURS_ANNDATA']]
Emits : []


Name : find_cluster
Inputs : [[0, 'NEIGHBOURS_ANNDATA']]
Outputs : [[0, 'CLUSTERS_ANNDATA']]
Emits : []


Name : run_umap
Inputs : [[0, 'CLUSTERS_ANNDATA_FOR_UMAP']]
Outputs : [[0, 'UMAP_ANNDATA']]
Emits : []


Name : run_tsne
Inputs : [[0, 'CLUSTERS_ANNDATA_FOR_TSNE'], [1, 'params']]
Outputs : [[0, 'TSNE_ANNDATA']]
Emits : []


Name : find_markers
Inputs : [[0, 'params'], [1, 'CLUSTERS_ANNDATA_FOR_MARKERS']]
Outputs : [[0, 'MARKERS_ANNDATA']]
Emits : []


