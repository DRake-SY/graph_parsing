OPERATION_1 string : Channel
    .fromPath("$quantDir/*", type: 'dir')
    .set { QUANT_DIRS }
OPERATION_1 origin : [['"$quantDir/*", type: \'dir\'', 'A']]
OPERATION_1 gives  : [['QUANT_DIRS', 'P']]


OPERATION_2 string : Channel
    .fromPath("$quantDir/*/transcript_to_gene.txt", checkIfExists: true )
    .set { TRANSCRIPT_TO_GENE_MANY }
OPERATION_2 origin : [['"$quantDir/*/transcript_to_gene.txt", checkIfExists: true', 'A']]
OPERATION_2 gives  : [['TRANSCRIPT_TO_GENE_MANY', 'P']]


OPERATION_3 string : ALEVIN_RESULTS = Channel.create()
OPERATION_3 origin : []
OPERATION_3 gives  : [['ALEVIN_RESULTS', 'P']]


OPERATION_4 string : KALLISTO_RESULTS = Channel.create()
OPERATION_4 origin : []
OPERATION_4 gives  : [['KALLISTO_RESULTS', 'P']]


OPERATION_5 string : ALL_RESULTS
    .map{ row-> tuple( row[0].text, row[1].text, row[2]) }        
    .set{ ALL_RESULTS_VALS }
OPERATION_5 origin : [['ALL_RESULTS', 'P']]
OPERATION_5 gives  : [['ALL_RESULTS_VALS', 'P']]


OPERATION_6 string : ALL_RESULTS_VALS.choice( KALLISTO_RESULTS, ALEVIN_RESULTS ) {a -> 
if (= 'kallisto' ) { 
    a[1]  = 0
 } else { 
    a[1]  = 1
 } 
}
OPERATION_6 origin : [['ALL_RESULTS_VALS', 'P']]
OPERATION_6 gives  : [['KALLISTO_RESULTS', 'P'], ['ALEVIN_RESULTS', 'P']]


OPERATION_7 string : KALLISTO_CHUNKS
    .transpose()
    .set { FLATTENED_KALLISTO_CHUNKS }
OPERATION_7 origin : [['KALLISTO_CHUNKS', 'P']]
OPERATION_7 gives  : [['FLATTENED_KALLISTO_CHUNKS', 'P']]


OPERATION_8 string : ALEVIN_RESULTS_BY_LIB
    .transpose()
    .into{
        FLATTENED_ALEVIN_RESULTS_BY_LIB
        FLATTENED_ALEVIN_RESULTS_BY_LIB_FOR_STATS
    }
OPERATION_8 origin : [['ALEVIN_RESULTS_BY_LIB', 'P']]
OPERATION_8 gives  : []


OPERATION_9 string : ALEVIN_CHUNK_COUNT_MATRICES
    .concat(KALLISTO_CHUNK_COUNT_MATRICES)
    .groupTuple()
    .set { PROTOCOL_COUNT_CHUNKS }
OPERATION_9 origin : [['ALEVIN_CHUNK_COUNT_MATRICES', 'P'], ['KALLISTO_CHUNK_COUNT_MATRICES', 'P']]
OPERATION_9 gives  : [['PROTOCOL_COUNT_CHUNKS', 'P']]


OPERATION_10 string : KALLISTO_CHUNK_ABUNDANCE_MATRICES
    .groupTuple()
    .set { PROTOCOL_KALLISTO_ABUNDANCE_CHUNKS }
OPERATION_10 origin : [['KALLISTO_CHUNK_ABUNDANCE_MATRICES', 'P']]
OPERATION_10 gives  : [['PROTOCOL_KALLISTO_ABUNDANCE_CHUNKS', 'P']]


OPERATION_11 string : KALLISTO_CHUNK_STATS
    .collectFile( sort: true, name: "kallisto_stats.tsv", storeDir: "${resultsRoot}/matrices", keepHeader: true )
OPERATION_11 origin : [['KALLISTO_CHUNK_STATS', 'P']]
OPERATION_11 gives  : []


OPERATION_12 string : ALEVIN_CHUNK_STATS
    .collectFile( sort: true, name: "alevin_stats.tsv", storeDir: "${resultsRoot}/matrices", keepHeader: true )
OPERATION_12 origin : [['ALEVIN_CHUNK_STATS', 'P']]
OPERATION_12 gives  : []


