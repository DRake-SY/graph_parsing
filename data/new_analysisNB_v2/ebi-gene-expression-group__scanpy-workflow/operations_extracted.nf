OPERATION_1 string : RAW_COUNT_MATRIX = Channel.fromPath( "${params.matrix}" )
OPERATION_1 origin : [['"${params.matrix}"', 'A']]
OPERATION_1 gives  : [['RAW_COUNT_MATRIX', 'P']]


OPERATION_2 string : CDNA_GTF = Channel.fromPath( "${params.gtf}" )
OPERATION_2 origin : [['"${params.gtf}"', 'A']]
OPERATION_2 gives  : [['CDNA_GTF', 'P']]


OPERATION_3 string : CLUSTERS_ANNDATA.into{
    CLUSTERS_ANNDATA_FOR_MARKERS
    CLUSTERS_ANNDATA_FOR_UMAP
    CLUSTERS_ANNDATA_FOR_TSNE
}
OPERATION_3 origin : [['CLUSTERS_ANNDATA', 'P']]
OPERATION_3 gives  : []


