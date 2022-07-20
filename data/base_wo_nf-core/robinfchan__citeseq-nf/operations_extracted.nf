OPERATION_1 string : Channel
        .fromPath(params.gtf)
        .ifEmpty { exit 1, "GTF annotation file not found: ${params.gtf}" }
        .set { gtf_matching }
OPERATION_1 origin : [['params.gtf', 'A']]
OPERATION_1 gives  : [['gtf_matching', 'P']]


OPERATION_2 string : gtf_alevin = Channel.empty()
OPERATION_2 origin : []
OPERATION_2 gives  : [['gtf_alevin', 'P']]


OPERATION_3 string : Channel
        .fromPath(params.gtf)
        .ifEmpty { exit 1, "GTF annotation file not found: ${params.gtf}" }
        .set { gtf_alevin }
OPERATION_3 origin : [['params.gtf', 'A']]
OPERATION_3 gives  : [['gtf_alevin', 'P']]


OPERATION_4 string : gtf_alevin_trimmed = Channel.empty()
OPERATION_4 origin : []
OPERATION_4 gives  : [['gtf_alevin_trimmed', 'P']]


OPERATION_5 string : Channel.empty().into{ gtf_matching; gtf_alevin }
OPERATION_5 origin : []
OPERATION_5 gives  : [['gtf_matching', 'P'], ['gtf_alevin', 'P']]


OPERATION_6 string : Channel
        .fromPath(params.genome_fasta)
        .ifEmpty { exit 1, "Genome Reference FASTA file not found: ${params.genome_fasta}" }
        .into { genome_fasta_matching; genome_fasta_extract_transcriptome }
OPERATION_6 origin : [['params.genome_fasta', 'A']]
OPERATION_6 gives  : [['genome_fasta_matching', 'P'], ['genome_fasta_extract_transcriptome', 'P']]


OPERATION_7 string : genome_fasta_extract_transcriptome = Channel.empty()
OPERATION_7 origin : []
OPERATION_7 gives  : [['genome_fasta_extract_transcriptome', 'P']]


OPERATION_8 string : Channel
        .fromPath(params.transcriptome_fasta)
        .ifEmpty { exit 1, "Transcriptome FASTA file not found: ${params.transcriptome_fasta}" }
        .set { transcriptome_fasta_alevin }
OPERATION_8 origin : [['params.transcriptome_fasta', 'A']]
OPERATION_8 gives  : [['transcriptome_fasta_alevin', 'P']]


OPERATION_9 string : transcriptome_fasta_alevin = Channel.empty()
OPERATION_9 origin : []
OPERATION_9 gives  : [['transcriptome_fasta_alevin', 'P']]


OPERATION_10 string : Channel
        .fromPath(params.salmon_index)
        .ifEmpty { exit 1, "Salmon index not found: ${params.salmon_index}" }
        .set { salmon_index_alevin }
OPERATION_10 origin : [['params.salmon_index', 'A']]
OPERATION_10 gives  : [['salmon_index_alevin', 'P']]


OPERATION_11 string : Channel.fromFilePairs( params.rna_reads )
            .ifEmpty { exit 1, "Cannot find any reads matching: ${params.rna_reads}\nNB: Path needs to be enclosed in quotes!\nNB: Path requires at least one * wildcard!\n" }
            .set { read_files_alevin }
OPERATION_11 origin : [['params.rna_reads', 'A']]
OPERATION_11 gives  : [['read_files_alevin', 'P']]


OPERATION_12 string : read_files_alevin = Channel.empty()
OPERATION_12 origin : []
OPERATION_12 gives  : [['read_files_alevin', 'P']]


OPERATION_13 string : Channel.fromFilePairs( params.adt_reads )
            .ifEmpty { exit 1, "Cannot find any reads matching: ${params.adt_reads}\nNB: Path needs to be enclosed in quotes!\nNB: Path requires at least one * wildcard!\n" }
            .set { read_files_csc }
OPERATION_13 origin : [['params.adt_reads', 'A']]
OPERATION_13 gives  : [['read_files_csc', 'P']]


OPERATION_14 string : read_files_csc = Channel.empty()
OPERATION_14 origin : []
OPERATION_14 gives  : [['read_files_csc', 'P']]


OPERATION_15 string : Channel.fromPath(barcode_filename)
         .ifEmpty{ exit 1, "Cannot find ${params.type} barcode whitelist: $barcode_filename" }
         .set{ barcode_whitelist_gzipped }
OPERATION_15 origin : [['barcode_filename', 'A']]
OPERATION_15 gives  : [['barcode_whitelist_gzipped', 'P']]


OPERATION_16 string : Channel.empty().set{ barcode_whitelist_csc }
OPERATION_16 origin : []
OPERATION_16 gives  : [['barcode_whitelist_csc', 'P']]


OPERATION_17 string : Channel.fromPath(params.barcode_whitelist)
         .ifEmpty{ exit 1, "Cannot find barcode whitelist: $barcode_filename" }
         .set{ barcode_whitelist_csc }
OPERATION_17 origin : [['params.barcode_whitelist', 'A']]
OPERATION_17 gives  : [['barcode_whitelist_csc', 'P']]


OPERATION_18 string : barcode_whitelist_gzipped = Channel.empty()
OPERATION_18 origin : []
OPERATION_18 gives  : [['barcode_whitelist_gzipped', 'P']]


OPERATION_19 string : Channel
        .fromPath(params.antibody_tags)
        .ifEmpty { exit 1, "ADT Sequences file not found: ${params.antibody_tags}" }
        .set { adt_tags }
OPERATION_19 origin : [['params.antibody_tags', 'A']]
OPERATION_19 gives  : [['adt_tags', 'P']]


OPERATION_20 string : adt_tags = Channel.empty()
OPERATION_20 origin : []
OPERATION_20 gives  : [['adt_tags', 'P']]


OPERATION_21 string : summary.collect { k,v -> "${k.padRight(18)}: $v" }.join("\n")
OPERATION_21 origin : [['summary', 'P']]
OPERATION_21 gives  : []


