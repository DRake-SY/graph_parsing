OPERATION_1 string : Channel
    .fromPath(sdrfFile, checkIfExists: true)
    .splitCsv(header:true, sep:"\t")
    .filter{ row -> (! row.containsKey(params.fields.quality)) || ( row["${params.fields.quality}"].toLowerCase() != 'not ok') }
    .into {
        SDRF_FOR_FASTQS
        SDRF_FOR_STRAND
        SDRF_FOR_TECHREP
        SDRF_FOR_COUNT
    }
OPERATION_1 origin : [['sdrfFile, checkIfExists: true', 'A']]
OPERATION_1 gives  : []


OPERATION_2 string : TRANSCRIPT_TO_GENE = Channel.fromPath( transcriptToGene, checkIfExists: true ).first()
OPERATION_2 origin : [['transcriptToGene, checkIfExists: true', 'A']]
OPERATION_2 gives  : [['TRANSCRIPT_TO_GENE', 'P']]


OPERATION_3 string : SDRF_FOR_FASTQS
    .map{ row-> 
      controlled_access='no'
      if (  params.fields.containsKey('controlled_access')){
        controlled_access=row["${params.fields.controlled_access}"]
      }
      tuple(row["${params.fields.run}"], row["${params.fields.cdna_uri}"], row["${params.fields.cell_barcode_uri}"], file(row["${params.fields.cdna_uri}"]).getName(), file(row["${params.fields.cell_barcode_uri}"]).getName(), row["${params.fields.cell_barcode_size}"], row["${params.fields.umi_barcode_size}"], row["${params.fields.end}"], row["${params.fields.cell_count}"], controlled_access) 
    }    
    .set { FASTQ_RUNS }
OPERATION_3 origin : [['SDRF_FOR_FASTQS', 'P']]
OPERATION_3 gives  : [['FASTQ_RUNS', 'P']]


OPERATION_4 string : SDRF_FOR_TECHREP
        .map{ row-> tuple(row["${params.fields.run}"], row["${params.fields.techrep}"]) }
        .groupTuple()
        .map{ row-> tuple( row[0], row[1][0]) }
        .set{ TECHREPS }
OPERATION_4 origin : [['SDRF_FOR_TECHREP', 'P']]
OPERATION_4 gives  : [['TECHREPS', 'P']]


OPERATION_5 string : SDRF_FOR_COUNT
        .map{ row-> tuple(row["${params.fields.techrep}"]) }
        .unique()
        .count()
        .set { TARGET_RESULT_COUNT }
OPERATION_5 origin : [['SDRF_FOR_COUNT', 'P']]
OPERATION_5 gives  : [['TARGET_RESULT_COUNT', 'P']]


OPERATION_6 string : TECHREPS.join( DOWNLOADED_FASTQS )
        .groupTuple(by: 1)
        .map{ row-> tuple( row[1], row[2].flatten(), row[3].flatten(), row[4][0], row[5][0], row[6][0], row[7][0]) }
        .set{
            FINAL_FASTQS
        }
OPERATION_6 origin : [['TECHREPS', 'P'], ['DOWNLOADED_FASTQS', 'P']]
OPERATION_6 gives  : [['FINAL_FASTQS', 'P']]


OPERATION_7 string : DOWNLOADED_FASTQS.set{ FINAL_FASTQS }
OPERATION_7 origin : [['DOWNLOADED_FASTQS', 'P']]
OPERATION_7 gives  : [['FINAL_FASTQS', 'P']]


OPERATION_8 string : SDRF_FOR_COUNT
      .map{ row-> tuple(row["${params.fields.run}"]) }
      .unique()
      .count()
      .set { TARGET_RESULT_COUNT }
OPERATION_8 origin : [['SDRF_FOR_COUNT', 'P']]
OPERATION_8 gives  : [['TARGET_RESULT_COUNT', 'P']]


OPERATION_9 string : FINAL_FASTQS.into{
    FINAL_FASTQS_FOR_CONFIG
    FINAL_FASTQS_FOR_ALEVIN
}
OPERATION_9 origin : [['FINAL_FASTQS', 'P']]
OPERATION_9 gives  : []


OPERATION_10 string : ALEVIN_RESULTS
    .into{
        ALEVIN_RESULTS_FOR_QC
        ALEVIN_RESULTS_FOR_PROCESSING
        ALEVIN_RESULTS_FOR_OUTPUT
    }
OPERATION_10 origin : [['ALEVIN_RESULTS', 'P']]
OPERATION_10 gives  : []


OPERATION_11 string : ALEVIN_MTX
    .into{
        ALEVIN_MTX_FOR_QC
        ALEVIN_MTX_FOR_EMPTYDROPS
        ALEVIN_MTX_FOR_OUTPUT
    }
OPERATION_11 origin : [['ALEVIN_MTX', 'P']]
OPERATION_11 gives  : []


OPERATION_12 string : ALEVIN_RESULTS_FOR_QC
    .join(ALEVIN_MTX_FOR_QC)
    .set{
        ALEVIN_QC_INPUTS
    }
OPERATION_12 origin : [['ALEVIN_RESULTS_FOR_QC', 'P'], ['ALEVIN_MTX_FOR_QC', 'P']]
OPERATION_12 gives  : [['ALEVIN_QC_INPUTS', 'P']]


OPERATION_13 string : ALEVIN_RESULTS_FOR_OUTPUT
    .join(ALEVIN_MTX_FOR_OUTPUT)
    .join(NONEMPTY_MTX)
    .join(ALEVIN_QC_PLOTS)
    .set{ COMPILED_RESULTS }
OPERATION_13 origin : [['ALEVIN_RESULTS_FOR_OUTPUT', 'P'], ['ALEVIN_MTX_FOR_OUTPUT', 'P'], ['NONEMPTY_MTX', 'P'], ['ALEVIN_QC_PLOTS', 'P']]
OPERATION_13 gives  : [['COMPILED_RESULTS', 'P']]


OPERATION_14 string : RESULTS_FOR_COUNTING
    .count()
    .set{ ALEVIN_RESULTS_COUNT }
OPERATION_14 origin : [['RESULTS_FOR_COUNTING', 'P']]
OPERATION_14 gives  : [['ALEVIN_RESULTS_COUNT', 'P']]


