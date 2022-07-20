OPERATION_1 string : RAW_MATRIX = Channel.fromPath( "$resultsRoot/${params.rawMatrix}", checkIfExists: true)
OPERATION_1 origin : [['"$resultsRoot/${params.rawMatrix}", checkIfExists: true', 'A']]
OPERATION_1 gives  : [['RAW_MATRIX', 'P']]


OPERATION_2 string : REFERENCE_FASTA = Channel.fromPath( "$resultsRoot/${params.referenceFasta}", checkIfExists: true ).first()
OPERATION_2 origin : [['"$resultsRoot/${params.referenceFasta}", checkIfExists: true', 'A']]
OPERATION_2 gives  : [['REFERENCE_FASTA', 'P']]


OPERATION_3 string : REFERENCE_GTF = Channel.fromPath( "$resultsRoot/${params.referenceGtf}", checkIfExists: true ).first()
OPERATION_3 origin : [['"$resultsRoot/${params.referenceGtf}", checkIfExists: true', 'A']]
OPERATION_3 gives  : [['REFERENCE_GTF', 'P']]


OPERATION_4 string : GENE_METADATA = Channel.fromPath( "$resultsRoot/${params.geneMetadata}", checkIfExists: true ).first()
OPERATION_4 origin : [['"$resultsRoot/${params.geneMetadata}", checkIfExists: true', 'A']]
OPERATION_4 gives  : [['GENE_METADATA', 'P']]


OPERATION_5 string : CELL_METADATA = Channel.fromPath( "$resultsRoot/${params.cellMetadata}", checkIfExists: true).first()
OPERATION_5 origin : [['"$resultsRoot/${params.cellMetadata}", checkIfExists: true', 'A']]
OPERATION_5 gives  : [['CELL_METADATA', 'P']]


OPERATION_6 string : CONDENSED_SDRF = Channel.fromPath( "$resultsRoot/${params.condensedSdrf}", checkIfExists: true).first()
OPERATION_6 origin : [['"$resultsRoot/${params.condensedSdrf}", checkIfExists: true', 'A']]
OPERATION_6 gives  : [['CONDENSED_SDRF', 'P']]


OPERATION_7 string : PROJECT_FILE = Channel.fromPath( "$resultsRoot/${params.projectFile}", checkIfExists: true).first()
OPERATION_7 origin : [['"$resultsRoot/${params.projectFile}", checkIfExists: true', 'A']]
OPERATION_7 gives  : [['PROJECT_FILE', 'P']]


OPERATION_8 string : RAW_FILTERED_MATRIX = Channel.fromPath( "$resultsRoot/${params.rawFilteredMatrix}", checkIfExists: true)
OPERATION_8 origin : [['"$resultsRoot/${params.rawFilteredMatrix}", checkIfExists: true', 'A']]
OPERATION_8 gives  : [['RAW_FILTERED_MATRIX', 'P']]


OPERATION_9 string : NORMALISED_MATRIX = Channel.fromPath( "$resultsRoot/${params.normalisedMatrix}", checkIfExists: true)
OPERATION_9 origin : [['"$resultsRoot/${params.normalisedMatrix}", checkIfExists: true', 'A']]
OPERATION_9 gives  : [['NORMALISED_MATRIX', 'P']]


OPERATION_10 string : SCANPY_CLUSTERS = Channel.fromPath( "$resultsRoot/${params.clusters}", checkIfExists: true)
OPERATION_10 origin : [['"$resultsRoot/${params.clusters}", checkIfExists: true', 'A']]
OPERATION_10 gives  : [['SCANPY_CLUSTERS', 'P']]


OPERATION_11 string : SCANPY_TSNE = Channel.fromPath( "$resultsRoot/${params.tsneDir}/tsne_perplexity*.tsv", checkIfExists: true )
OPERATION_11 origin : [['"$resultsRoot/${params.tsneDir}/tsne_perplexity*.tsv", checkIfExists: true', 'A']]
OPERATION_11 gives  : [['SCANPY_TSNE', 'P']]


OPERATION_12 string : SCANPY_UMAP = Channel.fromPath( "$resultsRoot/${params.umapDir}/umap_n_neighbors*.tsv", checkIfExists: true )
OPERATION_12 origin : [['"$resultsRoot/${params.umapDir}/umap_n_neighbors*.tsv", checkIfExists: true', 'A']]
OPERATION_12 gives  : [['SCANPY_UMAP', 'P']]


OPERATION_13 string : SCANPY_MARKERS = Channel.fromPath( "$resultsRoot/${params.markersDir}/markers_*.tsv" )
OPERATION_13 origin : [['"$resultsRoot/${params.markersDir}/markers_*.tsv"', 'A']]
OPERATION_13 gives  : [['SCANPY_MARKERS', 'P']]


OPERATION_14 string : RAW_FILTERED_MATRIX = Channel.empty()
OPERATION_14 origin : []
OPERATION_14 gives  : [['RAW_FILTERED_MATRIX', 'P']]


OPERATION_15 string : NORMALISED_MATRIX = Channel.empty()
OPERATION_15 origin : []
OPERATION_15 gives  : [['NORMALISED_MATRIX', 'P']]


OPERATION_16 string : RAW_TPM_MATRIX = Channel.empty()
OPERATION_16 origin : []
OPERATION_16 gives  : [['RAW_TPM_MATRIX', 'P']]


OPERATION_17 string : SCANPY_CLUSTERS = Channel.empty()
OPERATION_17 origin : []
OPERATION_17 gives  : [['SCANPY_CLUSTERS', 'P']]


OPERATION_18 string : SCANPY_TSNE = Channel.empty()
OPERATION_18 origin : []
OPERATION_18 gives  : [['SCANPY_TSNE', 'P']]


OPERATION_19 string : SCANPY_UMAP = Channel.empty()
OPERATION_19 origin : []
OPERATION_19 gives  : [['SCANPY_UMAP', 'P']]


OPERATION_20 string : SCANPY_MARKERS = Channel.empty()
OPERATION_20 origin : []
OPERATION_20 gives  : [['SCANPY_MARKERS', 'P']]


OPERATION_21 string : RAW_TPM_MATRIX = Channel.fromPath( "$resultsRoot/${params.tpmMatrix}", checkIfExists: true)
OPERATION_21 origin : [['"$resultsRoot/${params.tpmMatrix}", checkIfExists: true', 'A']]
OPERATION_21 gives  : [['RAW_TPM_MATRIX', 'P']]


OPERATION_22 string : RAW_TPM_MATRIX = Channel.empty()
OPERATION_22 origin : []
OPERATION_22 gives  : [['RAW_TPM_MATRIX', 'P']]


OPERATION_23 string : Channel.from( expressionTypes ).into{
    EXPRESSION_TYPES_FOR_MTX
    EXPRESSION_TYPES_FOR_TSV
}
OPERATION_23 origin : [['expressionTypes', 'V']]
OPERATION_23 gives  : []


OPERATION_24 string : SMALL_MATRICES = Channel.create()
OPERATION_24 origin : []
OPERATION_24 gives  : [['SMALL_MATRICES', 'P']]


OPERATION_25 string : BIG_MATRICES = Channel.create()
OPERATION_25 origin : []
OPERATION_25 gives  : [['BIG_MATRICES', 'P']]


OPERATION_26 string : SCANPY_TSNE
    .map{ r -> tuple('tsne', 'perplexity', r) }
    .concat(SCANPY_UMAP.map{ r -> tuple('umap', 'n_neighbors', r) })
    .set {SCANPY_DIMRED}
OPERATION_26 origin : [['SCANPY_TSNE', 'P']]
OPERATION_26 gives  : [['SCANPY_DIMRED', 'P']]


OPERATION_27 string : RAW_MATRIX.into{
    RAW_MATRIX_FOR_MTX
    RAW_MATRIX_FOR_TSV
}
OPERATION_27 origin : [['RAW_MATRIX', 'P']]
OPERATION_27 gives  : []


OPERATION_28 string : RAW_FILTERED_MATRIX.into{
    RAW_FILTERED_MATRIX_FOR_TPM_FILTERING
    RAW_FILTERED_MATRIX_FOR_MTX
    RAW_FILTERED_MATRIX_FOR_TSV
}
OPERATION_28 origin : [['RAW_FILTERED_MATRIX', 'P']]
OPERATION_28 gives  : []


OPERATION_29 string : NORMALISED_MATRIX.into{
    NORMALISED_MATRIX_FOR_MTX
    NORMALISED_MATRIX_FOR_TSV
}
OPERATION_29 origin : [['NORMALISED_MATRIX', 'P']]
OPERATION_29 gives  : []


OPERATION_30 string : RAW_TPM_MATRIX.into{
    RAW_TPM_MATRIX_FOR_FILTERING
    RAW_TPM_MATRIX_FOR_MTX
    RAW_TPM_MATRIX_FOR_TSV
}
OPERATION_30 origin : [['RAW_TPM_MATRIX', 'P']]
OPERATION_30 gives  : []


OPERATION_31 string : MASTER_SOFTWARE
    .concat(BASE_SOFTWARE)
    .concat(REFERENCE_SOFTWARE)
    .collectFile(name: 'software.tsv', newLine: true, keepHeader: true )
    .set { ALL_BASE_SOFTWARE }
OPERATION_31 origin : [['MASTER_SOFTWARE', 'P'], ['BASE_SOFTWARE', 'P'], ['REFERENCE_SOFTWARE', 'P']]
OPERATION_31 gives  : [['ALL_BASE_SOFTWARE', 'P']]


OPERATION_32 string : ALL_BASE_SOFTWARE
        .concat(TERTIARY_SOFTWARE)
        .set{ SOFTWARE }
OPERATION_32 origin : [['ALL_BASE_SOFTWARE', 'P'], ['TERTIARY_SOFTWARE', 'P']]
OPERATION_32 gives  : [['SOFTWARE', 'P']]


OPERATION_33 string : ALL_BASE_SOFTWARE
        .set{ SOFTWARE }
OPERATION_33 origin : [['ALL_BASE_SOFTWARE', 'P']]
OPERATION_33 gives  : [['SOFTWARE', 'P']]


OPERATION_34 string : SOFTWARE
    .collectFile(name: 'collected_software.tsv', keepHeader: true, newLine: false)
    .set{ MERGED_SOFTWARE }
OPERATION_34 origin : [['SOFTWARE', 'P']]
OPERATION_34 gives  : [['MERGED_SOFTWARE', 'P']]


OPERATION_35 string : RAW_FILTERED_TPM_MATRIX.into{
    RAW_FILTERED_TPM_MATRIX_FOR_MTX
    RAW_FILTERED_TPM_MATRIX_FOR_TSV
}
OPERATION_35 origin : [['RAW_FILTERED_TPM_MATRIX', 'P']]
OPERATION_35 gives  : []


OPERATION_36 string : RAW_MATRIX_FOR_MTX
    .concat(RAW_FILTERED_MATRIX_FOR_MTX)
    .concat(NORMALISED_MATRIX_FOR_MTX)
    .concat(RAW_TPM_MATRIX_FOR_MTX)
    .concat(RAW_FILTERED_TPM_MATRIX_FOR_MTX)
    .merge(EXPRESSION_TYPES_FOR_MTX)
    .set{
        MATRICES_TO_REPACKAGE
    }
OPERATION_36 origin : [['RAW_MATRIX_FOR_MTX', 'P'], ['RAW_FILTERED_MATRIX_FOR_MTX', 'P'], ['NORMALISED_MATRIX_FOR_MTX', 'P'], ['RAW_TPM_MATRIX_FOR_MTX', 'P'], ['RAW_FILTERED_TPM_MATRIX_FOR_MTX', 'P'], ['EXPRESSION_TYPES_FOR_MTX', 'P']]
OPERATION_36 gives  : [['MATRICES_TO_REPACKAGE', 'P']]


OPERATION_37 string : MTX_MATRIX_COLNAMES
    .into{
        MTX_MATRIX_COLNAMES_FOR_MANIFEST_LINES
        MTX_MATRIX_COLNAMES_FOR_CELLMAPPING
    }
OPERATION_37 origin : [['MTX_MATRIX_COLNAMES', 'P']]
OPERATION_37 gives  : []


OPERATION_38 string : RAW_MATRIX_FOR_TSV
    .concat(RAW_FILTERED_MATRIX_FOR_TSV)
    .concat(NORMALISED_MATRIX_FOR_TSV)
    .concat(RAW_TPM_MATRIX_FOR_TSV)
    .concat(RAW_FILTERED_TPM_MATRIX_FOR_TSV)
    .merge( EXPRESSION_TYPES_FOR_TSV)
    .set{
        MATRICES_FOR_TSV
    }
OPERATION_38 origin : [['RAW_MATRIX_FOR_TSV', 'P'], ['RAW_FILTERED_MATRIX_FOR_TSV', 'P'], ['NORMALISED_MATRIX_FOR_TSV', 'P'], ['RAW_TPM_MATRIX_FOR_TSV', 'P'], ['RAW_FILTERED_TPM_MATRIX_FOR_TSV', 'P'], ['EXPRESSION_TYPES_FOR_TSV', 'P']]
OPERATION_38 gives  : [['MATRICES_FOR_TSV', 'P']]


OPERATION_39 string : MATRICES_FOR_TSV_WITH_COUNT
    .choice( SMALL_MATRICES, BIG_MATRICES ) {a -> a[0].toInteger() < params.largeMatrixThreshold ? 0 : 1 }
OPERATION_39 origin : [['MATRICES_FOR_TSV_WITH_COUNT', 'P']]
OPERATION_39 gives  : [['SMALL_MATRICES', 'P'], ['BIG_MATRICES', 'P']]


OPERATION_40 string : BIG_MATRICES
    .map{ row-> tuple( row[2], file('NOTSV')) }        
    .concat( TSV_MATRICES)
    .set { 
        TSV_AND_NOTSV_MATRICES 
    }
OPERATION_40 origin : [['BIG_MATRICES', 'P'], ['TSV_MATRICES', 'P']]
OPERATION_40 gives  : [['TSV_AND_NOTSV_MATRICES', 'P']]


OPERATION_41 string : FINAL_CLUSTERS.into{
    FINAL_CLUSTERS_FOR_MANIFEST
    FINAL_CLUSTERS_FOR_SUMMARY
}
OPERATION_41 origin : [['FINAL_CLUSTERS', 'P']]
OPERATION_41 gives  : []


OPERATION_42 string : RENUMBERED_CLUSTER_MARKERS_BY_RESOLUTION.into{
    CLUSTER_MARKERS_FOR_SUMMARY
    CLUSTER_MARKERS_FOR_BUNDLE
}
OPERATION_42 origin : [['RENUMBERED_CLUSTER_MARKERS_BY_RESOLUTION', 'P']]
OPERATION_42 gives  : []


OPERATION_43 string : RENAMED_META_MARKERS_BY_VAR.into{
    META_MARKERS_FOR_SUMMARY
    META_MARKERS_FOR_BUNDLE
}
OPERATION_43 origin : [['RENAMED_META_MARKERS_BY_VAR', 'P']]
OPERATION_43 gives  : []


OPERATION_44 string : TSNE_MANIFEST_LINES
    .collectFile(name: 'tsnes.txt', newLine: false, sort: true)
    .set{ TSNE_MANIFEST_CONTENT }
OPERATION_44 origin : [['TSNE_MANIFEST_LINES', 'P']]
OPERATION_44 gives  : [['TSNE_MANIFEST_CONTENT', 'P']]


OPERATION_45 string : MATRIX_MANIFEST_LINES
    .collectFile(name: 'matrixes.txt',  newLine: false, sort: false )
    .set{ MATRIX_MANIFEST_CONTENT }
OPERATION_45 origin : [['MATRIX_MANIFEST_LINES', 'P']]
OPERATION_45 gives  : [['MATRIX_MANIFEST_CONTENT', 'P']]


OPERATION_46 string : MARKER_MANIFEST_LINES
    .collectFile(name: 'markers.txt',  newLine: false, sort: true )
    .set{ MARKER_MANIFEST_CONTENT }
OPERATION_46 origin : [['MARKER_MANIFEST_LINES', 'P']]
OPERATION_46 gives  : [['MARKER_MANIFEST_CONTENT', 'P']]


OPERATION_47 string : SUMMARY_MANIFEST_LINES
    .collectFile(name: 'summaries.txt',  newLine: false, sort: true )
    .set{ SUMMARY_MANIFEST_CONTENT }
OPERATION_47 origin : [['SUMMARY_MANIFEST_LINES', 'P']]
OPERATION_47 gives  : [['SUMMARY_MANIFEST_CONTENT', 'P']]


OPERATION_48 string : BASE_MANIFEST
        .concat(TSNE_MANIFEST_CONTENT)
        .concat(MARKER_MANIFEST_CONTENT)
        .concat(SUMMARY_MANIFEST_CONTENT)
        .collectFile(name: 'manifest_lines.tsv', newLine: false, sort: 'index' )
        .set { STARTING_MANIFEST }
OPERATION_48 origin : [['BASE_MANIFEST', 'P'], ['TSNE_MANIFEST_CONTENT', 'P'], ['MARKER_MANIFEST_CONTENT', 'P'], ['SUMMARY_MANIFEST_CONTENT', 'P']]
OPERATION_48 gives  : [['STARTING_MANIFEST', 'P']]


