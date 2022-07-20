OPERATION_1 string : Channel
    .fromFilePairs( params.reads_pe )
    .ifEmpty{ error "Cannot find any reads matching: ${params.reads_pe}" }
    .set{ metagenome_fastq_pair }
OPERATION_1 origin : [['params.reads_pe', 'A']]
OPERATION_1 gives  : [['metagenome_fastq_pair', 'P']]


OPERATION_2 string : Channel
    .fromPath(params.run_params_csv)
    .splitCsv(header:true)
    .map{ row -> tuple(row.tool, row.label, row.run_params) }
    .branch {
        METASPADES_params: it[0] == "metaspades"
        MEGAHIT_params: it[0] == "megahit"
        IDBA_UD_params: it[0] == "idba_ud"
        CONCOCT_params: it[0] == "concoct"
        MAXBIN2_params: it[0] == "maxbin2"
        METABAT2_params: it[0] == "metabat2"
        DASTOOL_params: it[0] == "dastool"
    }
    .set{ runs_ch }
OPERATION_2 origin : [['params.run_params_csv', 'A']]
OPERATION_2 gives  : [['runs_ch', 'P']]


OPERATION_3 string : runs_ch.METASPADES_params().combine( METASPADES_input )
  .set{ METASPADES_run_params }
OPERATION_3 origin : [['runs_ch', 'P'], ['METASPADES_input', 'P']]
OPERATION_3 gives  : [['METASPADES_run_params', 'P']]


OPERATION_4 string : runs_ch.IDBA_UD_params().combine( IDBA_UD_input )
    .set{ IDBA_UD_run_params }
OPERATION_4 origin : [['runs_ch', 'P'], ['IDBA_UD_input', 'P']]
OPERATION_4 gives  : [['IDBA_UD_run_params', 'P']]


OPERATION_5 string : runs_ch.MEGAHIT_params().combine( MEGAHIT_input )
    .set{ MEGAHIT_run_params }
OPERATION_5 origin : [['runs_ch', 'P'], ['MEGAHIT_input', 'P']]
OPERATION_5 gives  : [['MEGAHIT_run_params', 'P']]


OPERATION_6 string : METASPADES_assemblies
    .concat( IDBAUD_assemblies, MEGAHIT_assemblies )
    .combine( read_mapping_input )
    .into{ assembly_coverage_input; concoct_coverage_input; dastool_assembly_inputs }
OPERATION_6 origin : [['METASPADES_assemblies', 'P'], ['read_mapping_input', 'P'], ['IDBAUD_assemblies', 'P'], ['MEGAHIT_assemblies', 'P']]
OPERATION_6 gives  : [['assembly_coverage_input', 'P'], ['concoct_coverage_input', 'P'], ['dastool_assembly_inputs', 'P']]


OPERATION_7 string : runs_ch.METABAT2_params().combine(METABAT2_input )
    .set{ METABAT2_run_params }
OPERATION_7 origin : [['runs_ch', 'P'], ['METABAT2_input', 'P']]
OPERATION_7 gives  : [['METABAT2_run_params', 'P']]


OPERATION_8 string : runs_ch.MAXBIN2_params().combine( MAXBIN2_input )
    .set{ MAXBIN2_run_params }
OPERATION_8 origin : [['runs_ch', 'P'], ['MAXBIN2_input', 'P']]
OPERATION_8 gives  : [['MAXBIN2_run_params', 'P']]


OPERATION_9 string : runs_ch.CONCOCT_params().combine( CONCOCT_input )
    .set{ CONCOCT_run_params }
OPERATION_9 origin : [['runs_ch', 'P'], ['CONCOCT_input', 'P']]
OPERATION_9 gives  : [['CONCOCT_run_params', 'P']]


