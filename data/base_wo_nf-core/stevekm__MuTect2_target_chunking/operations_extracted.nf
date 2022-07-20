OPERATION_1 string : Channel.from("${params.numlines}").map { nlines ->
    def lineChunkLabel = "${params.numlines}lineChunk"

    return([ lineChunkLabel, nlines ])
}.into { lineChunkLabel_ch; lineChunkLabel_ch2 }
OPERATION_1 origin : []
OPERATION_1 gives  : [['lineChunkLabel_ch', 'P'], ['lineChunkLabel_ch2', 'P']]


OPERATION_2 string : Channel.from("${params.numChunks}").map { nchunks ->
    def nChunkLabel = "${nchunks}Chunk"

    return([ nChunkLabel, nchunks ])
    }.into { nChunkLabel_ch; nChunkLabel_ch2 }
OPERATION_2 origin : []
OPERATION_2 gives  : [['nChunkLabel_ch', 'P'], ['nChunkLabel_ch2', 'P']]


OPERATION_3 string : Channel.fromPath("${params.samplesheet}")
    .splitCsv(header: true, sep: '\t')
    .map { row ->
        def tumorID = "${row.Tumor}"
        def normalID = "${row.Normal}"
        def comparisonID = "${tumorID}-${normalID}"
        def tumorBam = file("${row.Tumor_Bam}")
        def tumorBai = file("${row.Tumor_Bai}")
        def normalBam = file("${row.Normal_Bam}")
        def normalBai = file("${row.Normal_Bai}")

        return([ comparisonID, tumorID, normalID, tumorBam, tumorBai, normalBam, normalBai ])
    }
    .into { input_bams; input_bams2; input_bams3; input_bams4 }
OPERATION_3 origin : [['"${params.samplesheet}"', 'A']]
OPERATION_3 gives  : [['input_bams', 'P'], ['input_bams2', 'P'], ['input_bams3', 'P'], ['input_bams4', 'P']]


OPERATION_4 string : Channel.fromPath( file(params.targetsBed) ).into{ targets_bed; targets_bed2; targets_bed3; targets_bed4 }
OPERATION_4 origin : [['file(params.targetsBed', 'A']]
OPERATION_4 gives  : [['targets_bed', 'P'], ['targets_bed2', 'P'], ['targets_bed3', 'P'], ['targets_bed4', 'P']]


OPERATION_5 string : Channel.fromPath( file(params.ref_fa) ).into { ref_fasta; ref_fasta2; ref_fasta3; ref_fasta4; ref_fasta5; ref_fasta6; ref_fasta7; ref_fasta8 }
OPERATION_5 origin : [['file(params.ref_fa', 'A']]
OPERATION_5 gives  : [['ref_fasta', 'P'], ['ref_fasta2', 'P'], ['ref_fasta3', 'P'], ['ref_fasta4', 'P'], ['ref_fasta5', 'P'], ['ref_fasta6', 'P'], ['ref_fasta7', 'P'], ['ref_fasta8', 'P']]


OPERATION_6 string : Channel.fromPath( file(params.ref_fai) ).into { ref_fai; ref_fai2; ref_fai3; ref_fai4; ref_fai5; ref_fai6; ref_fai7; ref_fai8 }
OPERATION_6 origin : [['file(params.ref_fai', 'A']]
OPERATION_6 gives  : [['ref_fai', 'P'], ['ref_fai2', 'P'], ['ref_fai3', 'P'], ['ref_fai4', 'P'], ['ref_fai5', 'P'], ['ref_fai6', 'P'], ['ref_fai7', 'P'], ['ref_fai8', 'P']]


OPERATION_7 string : Channel.fromPath( file(params.ref_dict) ).into { ref_dict; ref_dict2; ref_dict3; ref_dict4; ref_dict5; ref_dict6; ref_dict7; ref_dict8 }
OPERATION_7 origin : [['file(params.ref_dict', 'A']]
OPERATION_7 gives  : [['ref_dict', 'P'], ['ref_dict2', 'P'], ['ref_dict3', 'P'], ['ref_dict4', 'P'], ['ref_dict5', 'P'], ['ref_dict6', 'P'], ['ref_dict7', 'P'], ['ref_dict8', 'P']]


OPERATION_8 string : Channel.fromPath( file(params.dbsnp_ref_vcf) ).into{ dbsnp_ref_vcf; dbsnp_ref_vcf2; dbsnp_ref_vcf3; dbsnp_ref_vcf4 }
OPERATION_8 origin : [['file(params.dbsnp_ref_vcf', 'A']]
OPERATION_8 gives  : [['dbsnp_ref_vcf', 'P'], ['dbsnp_ref_vcf2', 'P'], ['dbsnp_ref_vcf3', 'P'], ['dbsnp_ref_vcf4', 'P']]


OPERATION_9 string : Channel.fromPath( file(params.dbsnp_ref_vcf_idx) ).into{ dbsnp_ref_vcf_idx; dbsnp_ref_vcf_idx2; dbsnp_ref_vcf_idx3; dbsnp_ref_vcf_idx4 }
OPERATION_9 origin : [['file(params.dbsnp_ref_vcf_idx', 'A']]
OPERATION_9 gives  : [['dbsnp_ref_vcf_idx', 'P'], ['dbsnp_ref_vcf_idx2', 'P'], ['dbsnp_ref_vcf_idx3', 'P'], ['dbsnp_ref_vcf_idx4', 'P']]


OPERATION_10 string : Channel.fromPath( file(params.cosmic_ref_vcf) ).into{ cosmic_ref_vcf; cosmic_ref_vcf2; cosmic_ref_vcf3; cosmic_ref_vcf4 }
OPERATION_10 origin : [['file(params.cosmic_ref_vcf', 'A']]
OPERATION_10 gives  : [['cosmic_ref_vcf', 'P'], ['cosmic_ref_vcf2', 'P'], ['cosmic_ref_vcf3', 'P'], ['cosmic_ref_vcf4', 'P']]


OPERATION_11 string : Channel.fromPath( file(params.cosmic_ref_vcf_idx) ).into{ cosmic_ref_vcf_idx; cosmic_ref_vcf_idx2; cosmic_ref_vcf_idx3; cosmic_ref_vcf_idx4 }
OPERATION_11 origin : [['file(params.cosmic_ref_vcf_idx', 'A']]
OPERATION_11 gives  : [['cosmic_ref_vcf_idx', 'P'], ['cosmic_ref_vcf_idx2', 'P'], ['cosmic_ref_vcf_idx3', 'P'], ['cosmic_ref_vcf_idx4', 'P']]


OPERATION_12 string : Channel.fromPath( file(params.ANNOVAR_DB_DIR) ).into { annovar_db_dir; annovar_db_dir2; annovar_db_dir3 }
OPERATION_12 origin : [['file(params.ANNOVAR_DB_DIR', 'A']]
OPERATION_12 gives  : [['annovar_db_dir', 'P'], ['annovar_db_dir2', 'P'], ['annovar_db_dir3', 'P']]


OPERATION_13 string : Channel.fromPath( params.targetsBed )
            .splitCsv(sep: '\t')
            .map{row ->
                row[0]
            }
            .unique()
            .set{ chroms }
OPERATION_13 origin : [['params.targetsBed', 'A']]
OPERATION_13 gives  : [['chroms', 'P']]


OPERATION_14 string : input_bams.combine(targets_bed)
    .combine(ref_fasta)
    .combine(ref_fai)
    .combine(ref_dict)
    .combine(dbsnp_ref_vcf)
    .combine(dbsnp_ref_vcf_idx)
    .combine(cosmic_ref_vcf)
    .combine(cosmic_ref_vcf_idx)
    .tap { input_noChunk_ch }PROCESS DEF mutect2_noChunk
OPERATION_14 origin : [['input_bams', 'P'], ['targets_bed', 'P'], ['ref_fasta', 'P'], ['ref_fai', 'P'], ['ref_dict', 'P'], ['dbsnp_ref_vcf', 'P'], ['dbsnp_ref_vcf_idx', 'P'], ['cosmic_ref_vcf', 'P'], ['cosmic_ref_vcf_idx', 'P']]
OPERATION_14 gives  : [['input_noChunk_ch', 'P']]


OPERATION_15 string : targets_bed2.combine(chroms).set { targets_chroms }PROCESS DEF bed_chromChunk
OPERATION_15 origin : [['targets_bed2', 'P'], ['chroms', 'P']]
OPERATION_15 gives  : [['targets_chroms', 'P']]


OPERATION_16 string : input_bams2.combine(chromChunk_targets).map { comparisonID, tumorID, normalID, tumorBam, tumorBai, normalBam, normalBai, label, chrom, targets_bed ->
    return([ label, chrom, comparisonID, tumorID, normalID, tumorBam, tumorBai, normalBam, normalBai, targets_bed ])
}
.combine(ref_fasta2)
.combine(ref_fai2)
.combine(ref_dict2)
.combine(dbsnp_ref_vcf2)
.combine(dbsnp_ref_vcf_idx2)
.combine(cosmic_ref_vcf2)
.combine(cosmic_ref_vcf_idx2)
.tap { input_chromChunk_ch }
OPERATION_16 origin : [['input_bams2', 'P'], ['chromChunk_targets', 'P'], ['ref_fasta2', 'P'], ['ref_fai2', 'P'], ['ref_dict2', 'P'], ['dbsnp_ref_vcf2', 'P'], ['dbsnp_ref_vcf_idx2', 'P'], ['cosmic_ref_vcf2', 'P'], ['cosmic_ref_vcf_idx2', 'P']]
OPERATION_16 gives  : [['input_chromChunk_ch', 'P']]


OPERATION_17 string : nChunkLabel_ch.combine(targets_bed3).set { nChunk_target }                                PROCESS DEF bed_nChunk
OPERATION_17 origin : [['nChunkLabel_ch', 'P'], ['targets_bed3', 'P']]
OPERATION_17 gives  : [['nChunk_target', 'P']]


OPERATION_18 string : chunked_targets.flatten()
    .combine(nChunkLabel_ch2)
    .map { targets, chunkLabel, numChunks ->
        def targetChunkNum = "${targets.name}".findAll(/\d*$/)[0]                                          
        return([ chunkLabel, targets, targetChunkNum ])
    }
    .combine(input_bams3)
    .map { chunkLabel, targets, targetChunkNum, comparisonID, tumorID, normalID, tumorBam, tumorBai, normalBam, normalBai ->
        return([ chunkLabel, targetChunkNum, comparisonID, tumorID, normalID, tumorBam, tumorBai, normalBam, normalBai, targets])
    }
    .combine(ref_fasta3)
    .combine(ref_fai3)
    .combine(ref_dict3)
    .combine(dbsnp_ref_vcf3)
    .combine(dbsnp_ref_vcf_idx3)
    .combine(cosmic_ref_vcf3)
    .combine(cosmic_ref_vcf_idx3)
    .tap { input_nChunk_ch }
OPERATION_18 origin : [['chunked_targets', 'P'], ['nChunkLabel_ch2', 'P'], ['input_bams3', 'P'], ['ref_fasta3', 'P'], ['ref_fai3', 'P'], ['ref_dict3', 'P'], ['dbsnp_ref_vcf3', 'P'], ['dbsnp_ref_vcf_idx3', 'P'], ['cosmic_ref_vcf3', 'P'], ['cosmic_ref_vcf_idx3', 'P']]
OPERATION_18 gives  : [['input_nChunk_ch', 'P']]


OPERATION_19 string : lineChunkLabel_ch.combine(targets_bed4).set { lineChunk_target }PROCESS DEF targetChunkLines
OPERATION_19 origin : [['lineChunkLabel_ch', 'P'], ['targets_bed4', 'P']]
OPERATION_19 gives  : [['lineChunk_target', 'P']]


OPERATION_20 string : line_chunked_targets.flatten()
    .combine(lineChunkLabel_ch2)
    .map { targets, chunkLabel, numLineChunks ->
        def targetChunkNum = "${targets.name}".findAll(/\d*$/)[0]                                          
        return([ chunkLabel, targets, targetChunkNum ])
    }
    .combine(input_bams4)
    .map { chunkLabel, targets, targetChunkNum, comparisonID, tumorID, normalID, tumorBam, tumorBai, normalBam, normalBai ->
        return([ chunkLabel, targetChunkNum, comparisonID, tumorID, normalID, tumorBam, tumorBai, normalBam, normalBai, targets])
    }
    .combine(ref_fasta7)
    .combine(ref_fai7)
    .combine(ref_dict7)
    .combine(dbsnp_ref_vcf4)
    .combine(dbsnp_ref_vcf_idx4)
    .combine(cosmic_ref_vcf4)
    .combine(cosmic_ref_vcf_idx4)
    .tap { input_lineChunk_ch }
    .subscribe { println "[line_chunked_targets] ${it}" }
OPERATION_20 origin : [['line_chunked_targets', 'P'], ['lineChunkLabel_ch2', 'P'], ['input_bams4', 'P'], ['ref_fasta7', 'P'], ['ref_fai7', 'P'], ['ref_dict7', 'P'], ['dbsnp_ref_vcf4', 'P'], ['dbsnp_ref_vcf_idx4', 'P'], ['cosmic_ref_vcf4', 'P'], ['cosmic_ref_vcf_idx4', 'P']]
OPERATION_20 gives  : [['input_lineChunk_ch', 'P']]


OPERATION_21 string : vcf_tsv_lineChunk.map { chunkLabel, targetChunkNum, comparisonID, tumorID, normalID, vcf, tsv ->
    def label = "${comparisonID}.${chunkLabel}.${targetChunkNum}"
    def lineChunkLabel = "${params.numlines}lineChunk"
    return([ lineChunkLabel, label, vcf, tsv ])
}.set { vcf_tsv_lineChunk_refactor }
OPERATION_21 origin : [['vcf_tsv_lineChunk', 'P']]
OPERATION_21 gives  : [['vcf_tsv_lineChunk_refactor', 'P']]


OPERATION_22 string : vcf_tsv_nChunk.map { chunkLabel, targetChunkNum, comparisonID, tumorID, normalID, vcf, tsv ->
    def label = "${comparisonID}.${chunkLabel}.${targetChunkNum}"
    def nChunkLabel = "${params.numChunks}Chunk"
    return([ nChunkLabel, label, vcf, tsv ])
}.set { vcf_tsv_nChunk_refactor }
OPERATION_22 origin : [['vcf_tsv_nChunk', 'P']]
OPERATION_22 gives  : [['vcf_tsv_nChunk_refactor', 'P']]


OPERATION_23 string : vcf_tsv_chromChunk.map { label, chrom, comparisonID, tumorID, normalID, vcf, tsv ->
    def newlabel = "${comparisonID}.${label}.${chrom}"
    def type = "chromChunk"
    return([ type, newlabel, vcf, tsv ])
}.set { vcf_tsv_chromChunk_refactor }
OPERATION_23 origin : [['vcf_tsv_chromChunk', 'P']]
OPERATION_23 gives  : [['vcf_tsv_chromChunk_refactor', 'P']]


OPERATION_24 string : vcf_tsv_noChunk.map { label, comparisonID, tumorID, normalID, vcf, tsv ->
    def newlabel = "${comparisonID}.${label}"
    def type = "noChunk"
    return([ type, newlabel, vcf, tsv ])
}.set { vcf_tsv_noChunk_refactor }
OPERATION_24 origin : [['vcf_tsv_noChunk', 'P']]
OPERATION_24 gives  : [['vcf_tsv_noChunk_refactor', 'P']]


OPERATION_25 string : vcf_tsv_nChunk_refactor.concat(vcf_tsv_chromChunk_refactor, vcf_tsv_noChunk_refactor, vcf_tsv_lineChunk_refactor)
        .filter { type, label, vcf, tsv ->
            long count = Files.lines(tsv).count()
            if (count <= 1) println ">>> WARNING: file ${tsv} (${label}) does not have enough lines and will not be included"
            count > 1
        }
        .set { vcfs_tsvs }
OPERATION_25 origin : [['vcf_tsv_nChunk_refactor', 'P'], ['vcf_tsv_chromChunk_refactor', 'P'], ['vcf_tsv_noChunk_refactor', 'P'], ['vcf_tsv_lineChunk_refactor', 'P']]
OPERATION_25 gives  : [['vcfs_tsvs', 'P']]


OPERATION_26 string : merged_tables.collectFile(name: "MuTect2.chunking_validation.annotations.tsv", storeDir: "${params.outputDir}", keepHeader: true, sort: false)
OPERATION_26 origin : [['merged_tables', 'P']]
OPERATION_26 gives  : []


