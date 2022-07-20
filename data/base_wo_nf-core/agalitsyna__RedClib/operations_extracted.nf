OPERATION_1 string : Channel.from(
    preprocessingCmd.execute().text
).into{PREPROCESSING_TO_RNA; PREPROCESSING}
OPERATION_1 origin : []
OPERATION_1 gives  : [['PREPROCESSING_TO_RNA', 'P'], ['PREPROCESSING', 'P']]


OPERATION_2 string : LIST_RENZ = Channel.fromList(params.protocol.renz.collect{k, v -> [k, v]})
OPERATION_2 origin : []
OPERATION_2 gives  : [['LIST_RENZ', 'P']]


OPERATION_3 string : Channel.from(params.rna_annotation.get('rna_annotation_name', 'rna'))
       .combine(PREPROCESSING_TO_RNA).set{GENOME_RNA_ANNOT_NAME}
OPERATION_3 origin : [['PREPROCESSING_TO_RNA', 'P']]
OPERATION_3 gives  : [['GENOME_RNA_ANNOT_NAME', 'P']]


OPERATION_4 string : Channel.from(params.input.fastq_paths
    .collect{k, v ->  [k, v]}
    )
    .branch{
        for_download: isSRA(it[1][0])
        local:       !isSRA(it[1][0])
    }.set{FASTQ_PATHS}
OPERATION_4 origin : []
OPERATION_4 gives  : [['FASTQ_PATHS', 'P']]


OPERATION_5 string : LIB_OLIGOS_RAW = Channel.from(
    params.input.oligos.collect{k, v ->  [k, v, file(v)]}
    ).combine(PREPROCESSING)
OPERATION_5 origin : [['PREPROCESSING', 'P']]
OPERATION_5 gives  : [['LIB_OLIGOS_RAW', 'P']]


OPERATION_6 string : Channel.fromList(params.protocol.read_length.collect{k, v -> [k, v]})
    .into{ LIST_RLENGTHS_COLLECTION1; LIST_RLENGTHS_COLLECTION2}
OPERATION_6 origin : []
OPERATION_6 gives  : [['LIST_RLENGTHS_COLLECTION1', 'P'], ['LIST_RLENGTHS_COLLECTION2', 'P']]


OPERATION_7 string : Channel.create().into{LIB_DISTANCES; LIB_RESTR_COMBINATIONS}
OPERATION_7 origin : []
OPERATION_7 gives  : [['LIB_DISTANCES', 'P'], ['LIB_RESTR_COMBINATIONS', 'P']]


OPERATION_8 string : Channel.fromList(
        params.run.restriction_check.collect{ segment, renz_keys ->
            renz_keys.collect{ renz_key ->
                available_renz.containsKey(renz_key) ?
                    [renz_key, segment, ''] :
                    renz_key.endsWith('p') ?
                        [renz_key[0..-2], segment, '+'] :
                        [renz_key[0..-2], segment, '-']
            }
        }.sum()
    ).into{LIST_FOR_RESTR_RUN; LIB_RESTR_COMBINATIONS}
OPERATION_8 origin : []
OPERATION_8 gives  : [['LIST_FOR_RESTR_RUN', 'P'], ['LIB_RESTR_COMBINATIONS', 'P']]


OPERATION_9 string : Channel.fromList(
        tables_list = params.output.tables.collect{ k, v -> [k, v['filter'], v['header']]}
        ).set{LIST_TABLES}
OPERATION_9 origin : []
OPERATION_9 gives  : [['LIST_TABLES', 'P']]


OPERATION_10 string : FASTQ_PATHS.local().map { it -> [ it[0], file(it[1][0]), file(it[1][1]) ] }
    .concat(DOWNLOADED).into{ LIB_FASTQ; LIB_VIEW;
                              LIB_FASTQ_TO_FASTUNIQ }
OPERATION_10 origin : [['FASTQ_PATHS', 'P'], ['DOWNLOADED', 'P']]
OPERATION_10 gives  : [['LIB_FASTQ', 'P'], ['LIB_VIEW', 'P'], ['LIB_FASTQ_TO_FASTUNIQ', 'P']]


OPERATION_11 string : LIB_SPLIT_FASTQ_RAW
    .transpose()
    .map{[it[0],
          parseChunkPair(it[1],it[2]),                                           
          it[1],
          file(it[1]),
          it[2],
          file(it[2])]}
    .into{ LIB_SPLIT_FASTQ_TO_TABLE;
           LIB_SPLIT_FASTQ_TO_TRIM;
           LIB_SPLIT_FASTQ_TO_CINDEX }
OPERATION_11 origin : [['LIB_SPLIT_FASTQ_RAW', 'P']]
OPERATION_11 gives  : [['LIB_SPLIT_FASTQ_TO_TABLE', 'P'], ['LIB_SPLIT_FASTQ_TO_TRIM', 'P'], ['LIB_SPLIT_FASTQ_TO_CINDEX', 'P']]


OPERATION_12 string : LIB_TABLE_FASTQ.into{ LIB_TABLE_FASTQ_FOR_TRIM;
                      LIB_TABLE_FASTQ_FOR_GA;
                      LIB_TABLE_FASTQ_FOR_RNACOMP;
                      LIB_TABLE_FASTQ_FOR_SUBSTR;
                      LIB_TABLE_FASTQ_FOR_COLLECT}
OPERATION_12 origin : [['LIB_TABLE_FASTQ', 'P']]
OPERATION_12 gives  : [['LIB_TABLE_FASTQ_FOR_TRIM', 'P'], ['LIB_TABLE_FASTQ_FOR_GA', 'P'], ['LIB_TABLE_FASTQ_FOR_RNACOMP', 'P'], ['LIB_TABLE_FASTQ_FOR_SUBSTR', 'P'], ['LIB_TABLE_FASTQ_FOR_COLLECT', 'P']]


OPERATION_13 string : LIB_TABLE_FASTQ_FOR_TRIM
    .combine(LIB_TRIMMED, by: [0, 1] )
    .map { it ->  [it[0], it[1], file(it[2]), file(it[3]), file(it[4]) ] }
    .set { LIB_FOR_GET_TRIM_OUTPUT }
OPERATION_13 origin : [['LIB_TABLE_FASTQ_FOR_TRIM', 'P']]
OPERATION_13 gives  : [['LIB_FOR_GET_TRIM_OUTPUT', 'P']]


OPERATION_14 string : MAPPING_COLLECTION1 = LIST_RLENGTHS_COLLECTION1.flatMap { lib, read_length ->
    [[library: lib, oligo: "adaptor_forward", apply_to:1, right_shift:read_length-14, read_length:read_length,
    n_primers:params.input.oligos_variants.adaptor_forward, left_shift:-6, mismatch_general:1, report_len:20],
    [library: lib, oligo: "adaptor_reverse", apply_to:1, right_shift: read_length-14, read_length:read_length,
    n_primers:params.input.oligos_variants.adaptor_reverse, left_shift:-6, mismatch_general:1, report_len:20],
    [library: lib, oligo: "adaptor_reverse_short", apply_to:1, right_shift:read_length-14, read_length:read_length,
    n_primers:params.input.oligos_variants.adaptor_reverse_short, left_shift:0, mismatch_general:1, report_len:16],
    [library: lib, oligo: "bridge_forward", apply_to:1, right_shift:read_length-14, read_length:read_length,
    n_primers:params.input.oligos_variants.bridge_forward, left_shift:0, mismatch_general:1, report_len:br_length],
    [library: lib, oligo: "bridge_reverse", apply_to:1, right_shift:read_length-14, read_length:read_length,
    n_primers:params.input.oligos_variants.bridge_reverse, left_shift:0, mismatch_general:1, report_len:br_length]]
}
OPERATION_14 origin : [['LIST_RLENGTHS_COLLECTION1', 'P']]
OPERATION_14 gives  : [['MAPPING_COLLECTION1', 'P']]


OPERATION_15 string : MAPPING_COLLECTION2 = LIST_RLENGTHS_COLLECTION2.flatMap { lib, read_length ->
    [[library: lib, oligo: "adaptor_forward", apply_to:2, right_shift:read_length-14, read_length:read_length,
    n_primers:params.input.oligos_variants.adaptor_forward, left_shift:-6, mismatch_general:1, report_len:20],
    [library: lib, oligo: "adaptor_reverse", apply_to:2, right_shift:read_length-14, read_length:read_length,
    n_primers:params.input.oligos_variants.adaptor_reverse, left_shift:-6, mismatch_general:1, report_len:20],
    [library: lib, oligo: "bridge_forward", apply_to:2, right_shift:read_length-14, read_length:read_length,
    n_primers:params.input.oligos_variants.bridge_forward, left_shift:0, mismatch_general:1, report_len:br_length],
    [library: lib, oligo: "bridge_reverse", apply_to:2, right_shift:read_length-14, read_length:read_length,
    n_primers:params.input.oligos_variants.bridge_reverse, left_shift:0, mismatch_general:1, report_len:br_length],
    [library: lib, oligo: "ggg", apply_to:2, right_shift:3, read_length:read_length,
    n_primers:params.input.oligos_variants.ggg, left_shift:0, mismatch_general:0, report_len:3]]
}
OPERATION_15 origin : [['LIST_RLENGTHS_COLLECTION2', 'P']]
OPERATION_15 gives  : [['MAPPING_COLLECTION2', 'P']]


OPERATION_16 string : LIB_OLIGOS_CINDEX.into { LIB_OLIGOS_CINDEX1; LIB_OLIGOS_CINDEX2 }
OPERATION_16 origin : [['LIB_OLIGOS_CINDEX', 'P']]
OPERATION_16 gives  : [['LIB_OLIGOS_CINDEX1', 'P'], ['LIB_OLIGOS_CINDEX2', 'P']]


OPERATION_17 string : LIB_FASTQ_CINDEX.into { LIB_FASTQ_CINDEX1; LIB_FASTQ_CINDEX2;
                        LIB_FASTQ_CINDEX_FOR_RNACOMP;
                        LIB_FASTQ_CINDEX_FOR_SUBSTR}
OPERATION_17 origin : [['LIB_FASTQ_CINDEX', 'P']]
OPERATION_17 gives  : [['LIB_FASTQ_CINDEX1', 'P'], ['LIB_FASTQ_CINDEX2', 'P'], ['LIB_FASTQ_CINDEX_FOR_RNACOMP', 'P'], ['LIB_FASTQ_CINDEX_FOR_SUBSTR', 'P']]


OPERATION_18 string : LIB_OLIGOS_CINDEX1.combine(LIB_FASTQ_CINDEX1).combine(MAPPING_COLLECTION1)
    .filter { it[0]==it[6]["oligo"] && it[2]==it[6]["library"] }
    .map { it ->  [it[0], file(it[1]), it[2], it[3], file(it[4]), it[6].apply_to, it[6], it[6]["read_length"] ] }
    .set { LIB_FOR_OLIGOS_MAPPING1 }
OPERATION_18 origin : [['LIB_OLIGOS_CINDEX1', 'P'], ['LIB_FASTQ_CINDEX1', 'P'], ['MAPPING_COLLECTION1', 'P']]
OPERATION_18 gives  : [['LIB_FOR_OLIGOS_MAPPING1', 'P']]


OPERATION_19 string : LIB_OLIGOS_CINDEX2.combine(LIB_FASTQ_CINDEX2).combine(MAPPING_COLLECTION2)
    .filter { it[0]==it[6]["oligo"] && it[2]==it[6]["library"] }
    .map { it ->  [it[0], file(it[1]), it[2], it[3], file(it[5]), it[6].apply_to, it[6], it[6]["read_length"]  ] }
    .set { LIB_FOR_OLIGOS_MAPPING2 }
OPERATION_19 origin : [['LIB_OLIGOS_CINDEX2', 'P'], ['LIB_FASTQ_CINDEX2', 'P'], ['MAPPING_COLLECTION2', 'P']]
OPERATION_19 gives  : [['LIB_FOR_OLIGOS_MAPPING2', 'P']]


OPERATION_20 string : LIB_FOR_OLIGOS_MAPPING = LIB_FOR_OLIGOS_MAPPING1.concat(LIB_FOR_OLIGOS_MAPPING2)
OPERATION_20 origin : [['LIB_FOR_OLIGOS_MAPPING1', 'P'], ['LIB_FOR_OLIGOS_MAPPING2', 'P']]
OPERATION_20 gives  : [['LIB_FOR_OLIGOS_MAPPING', 'P']]


OPERATION_21 string : LIB_MAPPED_OLIGOS.into{ LIB_MAPPED_OLIGOS_FOR_GA;
                        LIB_MAPPED_OLIGOS_FOR_RNACOMP;
                        LIB_MAPPED_OLIGOS_FOR_SUBSTR;
                        LIB_MAPPED_OLIGOS_FOR_COLLECT}
OPERATION_21 origin : [['LIB_MAPPED_OLIGOS', 'P']]
OPERATION_21 gives  : [['LIB_MAPPED_OLIGOS_FOR_GA', 'P'], ['LIB_MAPPED_OLIGOS_FOR_RNACOMP', 'P'], ['LIB_MAPPED_OLIGOS_FOR_SUBSTR', 'P'], ['LIB_MAPPED_OLIGOS_FOR_COLLECT', 'P']]


OPERATION_22 string : LIB_TABLE_FASTQ_FOR_GA
    .combine( LIB_MAPPED_OLIGOS_FOR_GA, by: [0, 1])
    .filter{ it[3]=="bridge_forward" && it[4]==1 }
    .map{ [it[0], it[1], file(it[2]), file(it[5])]  }
    .set{ LIB_FOR_GA }
OPERATION_22 origin : [['LIB_TABLE_FASTQ_FOR_GA', 'P']]
OPERATION_22 gives  : [['LIB_FOR_GA', 'P']]


OPERATION_23 string : LIB_TABLE_FASTQ_FOR_RNACOMP
    .combine(LIB_MAPPED_OLIGOS_FOR_RNACOMP, by: [0, 1])                                                                                                  
    .branch {
        bridge_forward: it[3]=="bridge_forward"
        ggg: it[3]=="ggg"
    }.combine()                                                                                                                                                                                                  
    .filter{
        it[0]==it[7] && it[1]==it[8] && it[4]==1 && it[11]==2
    }
    .map{
        [it[0], it[1], file(it[2]), file(it[5]), file(it[12]), it[13] ]
    }                                                                                                  
    .combine(LIB_FASTQ_CINDEX_FOR_RNACOMP, by:[0,1])
    .set { LIB_FOR_RNACOMP }
OPERATION_23 origin : [['LIB_TABLE_FASTQ_FOR_RNACOMP', 'P']]
OPERATION_23 gives  : [['LIB_FOR_RNACOMP', 'P']]


OPERATION_24 string : LIB_MAPPED_OLIGOS_FOR_SUBSTR.into {
    LIB_MAPPED_OLIGOS_FOR_SUBSTR_DNA;
    LIB_MAPPED_OLIGOS_FOR_SUBSTR_RNA1;
    LIB_MAPPED_OLIGOS_FOR_SUBSTR_RNA2;
}
OPERATION_24 origin : [['LIB_MAPPED_OLIGOS_FOR_SUBSTR', 'P']]
OPERATION_24 gives  : [['LIB_MAPPED_OLIGOS_FOR_SUBSTR_DNA', 'P'], ['LIB_MAPPED_OLIGOS_FOR_SUBSTR_RNA1', 'P'], ['LIB_MAPPED_OLIGOS_FOR_SUBSTR_RNA2', 'P'], ['', 'P']]


OPERATION_25 string : LIB_TABLE_FASTQ_FOR_SUBSTR.into {
    LIB_TABLE_FASTQ_FOR_SUBSTR_DNA;
    LIB_TABLE_FASTQ_FOR_SUBSTR_RNA1;
    LIB_TABLE_FASTQ_FOR_SUBSTR_RNA2
}
OPERATION_25 origin : [['LIB_TABLE_FASTQ_FOR_SUBSTR', 'P']]
OPERATION_25 gives  : [['LIB_TABLE_FASTQ_FOR_SUBSTR_DNA', 'P'], ['LIB_TABLE_FASTQ_FOR_SUBSTR_RNA1', 'P'], ['LIB_TABLE_FASTQ_FOR_SUBSTR_RNA2', 'P']]


OPERATION_26 string : LIB_TRIMTABLE.into {
    LIB_TRIMTABLE_FOR_SUBSTR_DNA;
    LIB_TRIMTABLE_FOR_SUBSTR_RNA1;
    LIB_TRIMTABLE_FOR_SUBSTR_RNA2;
    LIB_TRIMTABLE_FOR_COLLECT
}
OPERATION_26 origin : [['LIB_TRIMTABLE', 'P']]
OPERATION_26 gives  : [['LIB_TRIMTABLE_FOR_SUBSTR_DNA', 'P'], ['LIB_TRIMTABLE_FOR_SUBSTR_RNA1', 'P'], ['LIB_TRIMTABLE_FOR_SUBSTR_RNA2', 'P'], ['LIB_TRIMTABLE_FOR_COLLECT', 'P']]


OPERATION_27 string : LIB_MAPPED_OLIGOS_FOR_SUBSTR_DNA
    .branch{
        bridge_forward:  it[2]=="bridge_forward"  && it[3]==1
        adaptor_forward: it[2]=="adaptor_forward" && it[3]==1
    }.set{LIB_MAPPED_BRANCHED_FOR_DNA}
OPERATION_27 origin : [['LIB_MAPPED_OLIGOS_FOR_SUBSTR_DNA', 'P']]
OPERATION_27 gives  : [['LIB_MAPPED_BRANCHED_FOR_DNA', 'P']]


OPERATION_28 string : LIB_TABLE_FASTQ_FOR_SUBSTR_DNA
    .combine(LIB_MAPPED_BRANCHED_FOR_DNA.bridge_forward, by:[0,1])           
    .combine(LIB_MAPPED_BRANCHED_FOR_DNA.adaptor_forward, by:[0,1])          
    .combine(LIB_TRIMTABLE_FOR_SUBSTR_DNA, by:[0,1])
    .map{
        library, chunk, table_fastq,
        oligo1, side1, file_oligo1, read_length1,
        oligo2, side2, file_oligo2, read_length2,
        trim_table
        -> [library, chunk, table_fastq, file_oligo1, file_oligo2, trim_table, read_length1]
    }.set{ LIB_FOR_SUBSTR_DNA }
OPERATION_28 origin : [['LIB_TABLE_FASTQ_FOR_SUBSTR_DNA', 'P']]
OPERATION_28 gives  : [['LIB_FOR_SUBSTR_DNA', 'P']]


OPERATION_29 string : LIB_COUT_RNACOMP.into { LIB_RNACOMP_TO_SUBSTR_RNA1;
                        LIB_RNACOMP_TO_SUBSTR_RNA2 }
OPERATION_29 origin : [['LIB_COUT_RNACOMP', 'P']]
OPERATION_29 gives  : [['LIB_RNACOMP_TO_SUBSTR_RNA1', 'P'], ['LIB_RNACOMP_TO_SUBSTR_RNA2', 'P']]


OPERATION_30 string : LIB_MAPPED_OLIGOS_FOR_SUBSTR_RNA1
    .branch{
        bridge_forward:  it[2]=="bridge_forward"  && it[3]==1
        adaptor_reverse_short: it[2]=="adaptor_reverse_short" && it[3]==1
    }.set{LIB_MAPPED_BRANCHED_FOR_RNA1}
OPERATION_30 origin : [['LIB_MAPPED_OLIGOS_FOR_SUBSTR_RNA1', 'P']]
OPERATION_30 gives  : [['LIB_MAPPED_BRANCHED_FOR_RNA1', 'P']]


OPERATION_31 string : LIB_TABLE_FASTQ_FOR_SUBSTR_RNA1
    .combine(LIB_MAPPED_BRANCHED_FOR_RNA1.bridge_forward, by:[0,1])           
    .combine(LIB_MAPPED_BRANCHED_FOR_RNA1.adaptor_reverse_short, by:[0,1])          
    .combine(LIB_RNACOMP_TO_SUBSTR_RNA1, by:[0,1])
    .combine(LIB_TRIMTABLE_FOR_SUBSTR_RNA1, by:[0,1])
    .map{
        library, chunk, table_fastq,
        oligo1, side1, file_oligo1, read_length1,
        oligo2, side2, file_oligo2, read_length2,
        rnacomp1, rnacomp2, trim_table
        -> [library, chunk, table_fastq, file_oligo1, file_oligo2, rnacomp1, trim_table, read_length1]
    }.set{ LIB_FOR_SUBSTR_RNA1 }
OPERATION_31 origin : [['LIB_TABLE_FASTQ_FOR_SUBSTR_RNA1', 'P']]
OPERATION_31 gives  : [['LIB_FOR_SUBSTR_RNA1', 'P']]


OPERATION_32 string : LIB_MAPPED_OLIGOS_FOR_SUBSTR_RNA2
    .branch{
        ggg:  it[2]=="ggg"  && it[3]==2
        adaptor_forward: it[2]=="adaptor_forward" && it[3]==2
        bridge_reverse:  it[2]=="bridge_reverse"  && it[3]==2
    }.set{LIB_MAPPED_BRANCHED_FOR_RNA2}
OPERATION_32 origin : [['LIB_MAPPED_OLIGOS_FOR_SUBSTR_RNA2', 'P']]
OPERATION_32 gives  : [['LIB_MAPPED_BRANCHED_FOR_RNA2', 'P']]


OPERATION_33 string : LIB_TABLE_FASTQ_FOR_SUBSTR_RNA2
    .combine(LIB_MAPPED_BRANCHED_FOR_RNA2.ggg, by:[0,1])                      
    .combine(LIB_MAPPED_BRANCHED_FOR_RNA2.adaptor_forward, by:[0,1])          
    .combine(LIB_MAPPED_BRANCHED_FOR_RNA2.bridge_reverse, by:[0,1])           
    .combine(LIB_RNACOMP_TO_SUBSTR_RNA2, by:[0,1])
    .combine(LIB_TRIMTABLE_FOR_SUBSTR_RNA2, by:[0,1])
    .map{
        library, chunk, table_fastq,
        oligo1, side1, file_oligo1, read_length1,
        oligo2, side2, file_oligo2, read_length2,
        oligo3, side3, file_oligo3, read_length3,
        rnacomp1, rnacomp2, trim_table
        -> [library, chunk, table_fastq, file_oligo1, file_oligo2, file_oligo3, rnacomp2, trim_table, read_length1]
    }.set{ LIB_FOR_SUBSTR_RNA2 }
OPERATION_33 origin : [['LIB_TABLE_FASTQ_FOR_SUBSTR_RNA2', 'P']]
OPERATION_33 gives  : [['LIB_FOR_SUBSTR_RNA2', 'P']]


OPERATION_34 string : GENOME_INDEX.into{
    GENOME_INDEX_FOR_DNA;
    GENOME_INDEX_FOR_DNA_EXT;
    GENOME_INDEX_FOR_RNA1;
    GENOME_INDEX_FOR_RNA2
}
OPERATION_34 origin : [['GENOME_INDEX', 'P']]
OPERATION_34 gives  : [['GENOME_INDEX_FOR_DNA', 'P'], ['GENOME_INDEX_FOR_DNA_EXT', 'P'], ['GENOME_INDEX_FOR_RNA1', 'P'], ['GENOME_INDEX_FOR_RNA2', 'P']]


OPERATION_35 string : LIB_SUBSTR_DNA.combine(GENOME_INDEX_FOR_DNA)
    .set{LIB_FOR_DNA_MAPPING}
OPERATION_35 origin : [['LIB_SUBSTR_DNA', 'P'], ['GENOME_INDEX_FOR_DNA', 'P']]
OPERATION_35 gives  : [['LIB_FOR_DNA_MAPPING', 'P']]


OPERATION_36 string : LIB_SUBSTR_DNA_EXT.combine(GENOME_INDEX_FOR_DNA_EXT)
        .set{LIB_FOR_DNA_MAPPING_EXT}
OPERATION_36 origin : [['LIB_SUBSTR_DNA_EXT', 'P'], ['GENOME_INDEX_FOR_DNA_EXT', 'P']]
OPERATION_36 gives  : [['LIB_FOR_DNA_MAPPING_EXT', 'P']]


OPERATION_37 string : GENOME_SPLICESITES.into{GENOME_SPLICESITES_RNA1; GENOME_SPLICESITES_RNA2}
OPERATION_37 origin : [['GENOME_SPLICESITES', 'P']]
OPERATION_37 gives  : [['GENOME_SPLICESITES_RNA1', 'P'], ['GENOME_SPLICESITES_RNA2', 'P']]


OPERATION_38 string : LIB_SUBSTR_RNA1.combine(GENOME_INDEX_FOR_RNA1).combine(GENOME_SPLICESITES_RNA1)
    .set{LIB_FOR_RNA1_MAPPING}
OPERATION_38 origin : [['LIB_SUBSTR_RNA1', 'P'], ['GENOME_INDEX_FOR_RNA1', 'P'], ['GENOME_SPLICESITES_RNA1', 'P']]
OPERATION_38 gives  : [['LIB_FOR_RNA1_MAPPING', 'P']]


OPERATION_39 string : LIB_SUBSTR_RNA2.combine(GENOME_INDEX_FOR_RNA2).combine(GENOME_SPLICESITES_RNA2)
    .set{LIB_FOR_RNA2_MAPPING}
OPERATION_39 origin : [['LIB_SUBSTR_RNA2', 'P'], ['GENOME_INDEX_FOR_RNA2', 'P'], ['GENOME_SPLICESITES_RNA2', 'P']]
OPERATION_39 gives  : [['LIB_FOR_RNA2_MAPPING', 'P']]


OPERATION_40 string : LIB_SAM_RNA1.into{LIB_SAM_RNA1_FOR_BED; LIB_SAM_RNA1_FOR_COLLECT}
OPERATION_40 origin : [['LIB_SAM_RNA1', 'P']]
OPERATION_40 gives  : [['LIB_SAM_RNA1_FOR_BED', 'P'], ['LIB_SAM_RNA1_FOR_COLLECT', 'P']]


OPERATION_41 string : LIB_SAM_RNA2.into{LIB_SAM_RNA2_FOR_BED; LIB_SAM_RNA2_FOR_COLLECT}
OPERATION_41 origin : [['LIB_SAM_RNA2', 'P']]
OPERATION_41 gives  : [['LIB_SAM_RNA2_FOR_BED', 'P'], ['LIB_SAM_RNA2_FOR_COLLECT', 'P']]


OPERATION_42 string : LIB_SAM_DNA.into{LIB_SAM_DNA_FOR_BED; LIB_SAM_DNA_FOR_COLLECT}
OPERATION_42 origin : [['LIB_SAM_DNA', 'P']]
OPERATION_42 gives  : [['LIB_SAM_DNA_FOR_BED', 'P'], ['LIB_SAM_DNA_FOR_COLLECT', 'P']]


OPERATION_43 string : LIB_SAM_DNA_EXT.into{LIB_SAM_DNA_EXT_FOR_BED; LIB_SAM_DNA_EXT_FOR_COLLECT}
OPERATION_43 origin : [['LIB_SAM_DNA_EXT', 'P']]
OPERATION_43 gives  : [['LIB_SAM_DNA_EXT_FOR_BED', 'P'], ['LIB_SAM_DNA_EXT_FOR_COLLECT', 'P']]


OPERATION_44 string : LIB_SAM_DNA_FOR_BED.map{ [it[0], it[1], "dna_nonextended", file(it[2]) ] }
        .concat(LIB_SAM_DNA_EXT_FOR_BED.map{ [it[0], it[1], "dna", file(it[2]) ] })
        .concat(LIB_SAM_RNA1_FOR_BED.map{ [it[0], it[1], "rna1", file(it[2]) ] })
        .concat(LIB_SAM_RNA2_FOR_BED.map{ [it[0], it[1], "rna2", file(it[2]) ] }).set{LIB_SAM2BED}
OPERATION_44 origin : [['LIB_SAM_DNA_FOR_BED', 'P']]
OPERATION_44 gives  : [['LIB_SAM2BED', 'P']]


OPERATION_45 string : LIB_SAM_DNA.set{LIB_SAM_DNA_EXT_FOR_COLLECT}
OPERATION_45 origin : [['LIB_SAM_DNA', 'P']]
OPERATION_45 gives  : [['LIB_SAM_DNA_EXT_FOR_COLLECT', 'P']]


OPERATION_46 string : LIB_SAM_DNA_FOR_BED.map{ [it[0], it[1], "dna_nonextended", file(it[2]) ] }
        .concat(LIB_SAM_RNA1_FOR_BED.map{ [it[0], it[1], "rna1", file(it[2]) ] })
        .concat(LIB_SAM_RNA2_FOR_BED.map{ [it[0], it[1], "rna2", file(it[2]) ] }).set{LIB_SAM2BED}
OPERATION_46 origin : [['LIB_SAM_DNA_FOR_BED', 'P']]
OPERATION_46 gives  : [['LIB_SAM2BED', 'P']]


OPERATION_47 string : LIB_BED.into{LIB_BED_FOR_RESTR; LIB_BED_FOR_COLLECT}
OPERATION_47 origin : [['LIB_BED', 'P']]
OPERATION_47 gives  : [['LIB_BED_FOR_RESTR', 'P'], ['LIB_BED_FOR_COLLECT', 'P']]


OPERATION_48 string : LIST_FOR_RESTR_RUN
        .combine(GENOME_RENZ, by:0)
        .combine(LIB_BED_FOR_RESTR)
        .filter{
            renz_key, segment_left, renz_strand, renz_file, library, chunk, segment_right, bed_file ->
            segment_left == segment_right
         }.map{
            renz_key, segment_left, renz_strand, renz_file, library, chunk, segment_right, bed_file ->
            [library, chunk, segment_left, file(bed_file), renz_key, renz_strand, file(renz_file)]
         }.set{ LIB_FOR_RESTR_RUN }
OPERATION_48 origin : [['LIST_FOR_RESTR_RUN', 'P'], ['LIB_BED_FOR_RESTR', 'P']]
OPERATION_48 gives  : [['LIB_FOR_RESTR_RUN', 'P']]


OPERATION_49 string : LIB_MAPPED_OLIGOS_FOR_COLLECT.branch{
            bridge_forward: it[2]=="bridge_forward" & it[3]==1
            ggg: it[2]=="ggg" & it[3]==2
        }.set{LIB_MAPPED_OLIGOS_FOR_COLLECT_BRANCHED}
OPERATION_49 origin : [['LIB_MAPPED_OLIGOS_FOR_COLLECT', 'P']]
OPERATION_49 gives  : [['LIB_MAPPED_OLIGOS_FOR_COLLECT_BRANCHED', 'P']]


OPERATION_50 string : LIB_BED_FOR_COLLECT.branch{
        dna : it[2]==dna_mode
        rna1 : it[2]=="rna1"
        rna2 : it[2]=="rna2"
    }.set{LIB_BED_FOR_COLLECT_BRANCHED}
OPERATION_50 origin : [['LIB_BED_FOR_COLLECT', 'P']]
OPERATION_50 gives  : [['LIB_BED_FOR_COLLECT_BRANCHED', 'P']]


OPERATION_51 string : LIB_DISTANCES
    .groupTuple(by: [0,1]).map{it -> [it[0], it[1], it[5]]}.set{ LIB_DISTANCES_FOR_COLLECT }
OPERATION_51 origin : [['LIB_DISTANCES', 'P']]
OPERATION_51 gives  : [['LIB_DISTANCES_FOR_COLLECT', 'P']]


OPERATION_52 string : IDS_FASTUNIQ
    .combine(LIB_TABLE_FASTQ_FOR_COLLECT, by:0).map{ v -> [v[0], v[2], v[3], v[1]]}
    .combine(LIB_TRIMTABLE_FOR_COLLECT, by: [0,1])
    .combine(LIB_MAPPED_OLIGOS_FOR_COLLECT_BRANCHED.bridge_forward().map{it -> [it[0], it[1], it[4]]}, by: [0,1])
    .combine(LIB_MAPPED_GA, by: [0,1])
    .combine(LIB_MAPPED_OLIGOS_FOR_COLLECT_BRANCHED.ggg().map{it -> [it[0], it[1], it[4]]}, by: [0,1])
    .combine(LIB_SUBSTR_DNA_INFO, by:[0,1])
    .combine(LIB_SUBSTR_RNA1_INFO, by:[0,1])
    .combine(LIB_SUBSTR_RNA2_INFO, by:[0,1])
    .combine(LIB_SAM_DNA_EXT_FOR_COLLECT, by:[0,1])
    .combine(LIB_SAM_DNA_FOR_COLLECT, by:[0,1])
    .combine(LIB_SAM_RNA1_FOR_COLLECT, by:[0,1])
    .combine(LIB_SAM_RNA2_FOR_COLLECT, by:[0,1])
    .combine(LIB_BED_FOR_COLLECT_BRANCHED.dna().map{it -> [it[0], it[1], it[3]]}, by:[0,1])
    .combine(LIB_BED_FOR_COLLECT_BRANCHED.rna1().map{it -> [it[0], it[1], it[3]]}, by:[0,1])
    .combine(LIB_BED_FOR_COLLECT_BRANCHED.rna2().map{it -> [it[0], it[1], it[3]]}, by:[0,1])
    .combine(LIB_DISTANCES_FOR_COLLECT, by:[0,1])
    .map{ v -> [ v[0], v[1], v[2..-2]+v[-1] ] }.set{ LIB_COLLECT }
OPERATION_52 origin : [['IDS_FASTUNIQ', 'P']]
OPERATION_52 gives  : [['LIB_COLLECT', 'P']]


OPERATION_53 string : restriction
                   .collect{k, v -> k+":"+"("+v.join(") | (")+")"}.join("\\n")
                   .replaceAll(/"\+"/, "1")
                   .replaceAll(/"-"/, "0")
OPERATION_53 origin : [['restriction', 'P']]
OPERATION_53 gives  : []


OPERATION_54 string : additional_filters
                   .collect{k, v -> k+":"+v}.join("\\n")
OPERATION_54 origin : [['additional_filters', 'P']]
OPERATION_54 gives  : []


OPERATION_55 string : GENOME_CHROMSIZES.into{GENOME_CHROMSIZES_FOR_FILTERS; GENOME_CHROMSIZES_FOR_COOLER}
OPERATION_55 origin : [['GENOME_CHROMSIZES', 'P']]
OPERATION_55 gives  : [['GENOME_CHROMSIZES_FOR_FILTERS', 'P'], ['GENOME_CHROMSIZES_FOR_COOLER', 'P']]


OPERATION_56 string : GENOME_CHROMSIZES.set{GENOME_CHROMSIZES_FOR_FILTERS}
OPERATION_56 origin : [['GENOME_CHROMSIZES', 'P']]
OPERATION_56 gives  : [['GENOME_CHROMSIZES_FOR_FILTERS', 'P']]


OPERATION_57 string : LIB_COLLECTED.combine(GENOME_CHROMSIZES_FOR_FILTERS).set{LIB_COLLECTED_FOR_FILTERS}
OPERATION_57 origin : [['LIB_COLLECTED', 'P'], ['GENOME_CHROMSIZES_FOR_FILTERS', 'P']]
OPERATION_57 gives  : [['LIB_COLLECTED_FOR_FILTERS', 'P']]


OPERATION_58 string : LIB_FILTERS.into{ LIB_FILTERS_STATS; LIB_FILTERS_TABLE }
OPERATION_58 origin : [['LIB_FILTERS', 'P']]
OPERATION_58 gives  : [['LIB_FILTERS_STATS', 'P'], ['LIB_FILTERS_TABLE', 'P']]


OPERATION_59 string : report_stats.collect()
OPERATION_59 origin : [['report_stats', 'P']]
OPERATION_59 gives  : []


OPERATION_60 string : FILES_STATS.groupTuple(by:0).set{FILES_STATS_FOR_MERGE}
OPERATION_60 origin : [['FILES_STATS', 'P']]
OPERATION_60 gives  : [['FILES_STATS_FOR_MERGE', 'P']]


OPERATION_61 string : LIB_FILTERS_TABLE.combine(LIST_TABLES).set{LIB_FOR_WRITING}
OPERATION_61 origin : [['LIB_FILTERS_TABLE', 'P'], ['LIST_TABLES', 'P']]
OPERATION_61 gives  : [['LIB_FOR_WRITING', 'P']]


OPERATION_62 string : FILES_TABLE.groupTuple(by:[0,2]).set{FILES_TABLE_FOR_MERGE}
OPERATION_62 origin : [['FILES_TABLE', 'P']]
OPERATION_62 gives  : [['FILES_TABLE_FOR_MERGE', 'P']]


OPERATION_63 string : FILES_TABLE_MERGED.filter{ it[1] == params.output.cooler_properties.table_name }
      .combine(GENOME_CHROMSIZES_FOR_COOLER)
      .set{ TABLES_FOR_COOLER }
OPERATION_63 origin : [['FILES_TABLE_MERGED', 'P'], ['GENOME_CHROMSIZES_FOR_COOLER', 'P']]
OPERATION_63 gives  : [['TABLES_FOR_COOLER', 'P']]


