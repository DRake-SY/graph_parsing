OPERATION_1 string : star_index = Channel
        .fromPath(params.star_index)
        .ifEmpty { exit 1, "STAR index not found: ${params.star_index}" }
OPERATION_1 origin : [['params.star_index', 'A']]
OPERATION_1 gives  : [['star_index', 'P']]


OPERATION_2 string : Channel
        .fromPath(params.gtf)
        .ifEmpty { exit 1, "GTF annotation file not found: ${params.gtf}" }
        .into { gtf_extract_transcriptome; gtf_alevin; gtf_makeSTARindex; gtf_star; gtf_gene_map }
OPERATION_2 origin : [['params.gtf', 'A']]
OPERATION_2 gives  : [['gtf_extract_transcriptome', 'P'], ['gtf_alevin', 'P'], ['gtf_makeSTARindex', 'P'], ['gtf_star', 'P'], ['gtf_gene_map', 'P']]


OPERATION_3 string : Channel
        .fromPath(params.fasta)
        .ifEmpty { exit 1, "Fasta file not found: ${params.fasta}" }
        .into { genome_fasta_extract_transcriptome ; genome_fasta_makeSTARindex }
OPERATION_3 origin : [['params.fasta', 'A']]
OPERATION_3 gives  : [['genome_fasta_extract_transcriptome', 'P'], ['genome_fasta_makeSTARindex', 'P']]


OPERATION_4 string : genome_fasta_extract_transcriptome = Channel.empty()
OPERATION_4 origin : []
OPERATION_4 gives  : [['genome_fasta_extract_transcriptome', 'P']]


OPERATION_5 string : genome_fasta_makeSTARindex = Channel.empty()
OPERATION_5 origin : []
OPERATION_5 gives  : [['genome_fasta_makeSTARindex', 'P']]


OPERATION_6 string : Channel
        .fromPath(params.transcript_fasta)
        .ifEmpty { exit 1, "Fasta file not found: ${params.transcript_fasta}" }
        .into { transcriptome_fasta_alevin; transcriptome_fasta_kallisto }
OPERATION_6 origin : [['params.transcript_fasta', 'A']]
OPERATION_6 gives  : [['transcriptome_fasta_alevin', 'P'], ['transcriptome_fasta_kallisto', 'P']]


OPERATION_7 string : transcriptome_fasta_alevin = Channel.empty()
OPERATION_7 origin : []
OPERATION_7 gives  : [['transcriptome_fasta_alevin', 'P']]


OPERATION_8 string : transcriptome_fasta_kallisto = Channel.empty()
OPERATION_8 origin : []
OPERATION_8 gives  : [['transcriptome_fasta_kallisto', 'P']]


OPERATION_9 string : Channel
        .fromPath(params.salmon_index)
        .ifEmpty { exit 1, "Salmon index not found: ${params.salmon_index}" }
        .set { salmon_index_alevin }
OPERATION_9 origin : [['params.salmon_index', 'A']]
OPERATION_9 gives  : [['salmon_index_alevin', 'P']]


OPERATION_10 string : ch_multiqc_custom_config = Channel.fromPath(params.multiqc_config, checkIfExists: true)
OPERATION_10 origin : [['params.multiqc_config, checkIfExists: true', 'A']]
OPERATION_10 gives  : [['ch_multiqc_custom_config', 'P']]


OPERATION_11 string : ch_multiqc_custom_config = Channel.empty()
OPERATION_11 origin : []
OPERATION_11 gives  : [['ch_multiqc_custom_config', 'P']]


OPERATION_12 string : Channel
             .from(params.input_paths)
             .map { row -> [ row[0], [file(row[1][0]), file(row[1][1])]] }
             .ifEmpty { exit 1, "params.input_paths was empty - no input files supplied" }
             .into { read_files_alevin; read_files_star; read_files_kallisto}
OPERATION_12 origin : [['params.input_paths', 'V']]
OPERATION_12 gives  : [['read_files_alevin', 'P'], ['read_files_star', 'P'], ['read_files_kallisto', 'P']]


OPERATION_13 string : Channel
            .fromFilePairs( params.input )
            .ifEmpty { exit 1, "Cannot find any reads matching: ${params.input}\nNB: Path needs to be enclosed in quotes!\nNB: Path requires at least one * wildcard!\n" }
            .into { read_files_alevin; read_files_star; read_files_kallisto }
OPERATION_13 origin : [['params.input', 'A']]
OPERATION_13 gives  : [['read_files_alevin', 'P'], ['read_files_star', 'P'], ['read_files_kallisto', 'P']]


OPERATION_14 string : Channel.fromPath(barcode_filename)
         .ifEmpty{ exit 1, "Cannot find ${params.type} barcode whitelist: $barcode_filename" }
         .set{ barcode_whitelist_gzipped }
OPERATION_14 origin : [['barcode_filename', 'A']]
OPERATION_14 gives  : [['barcode_whitelist_gzipped', 'P']]


OPERATION_15 string : Channel.empty().into{ barcode_whitelist_star; barcode_whitelist_kallisto; barcode_whitelist_alevinqc }
OPERATION_15 origin : []
OPERATION_15 gives  : [['barcode_whitelist_star', 'P'], ['barcode_whitelist_kallisto', 'P'], ['barcode_whitelist_alevinqc', 'P']]


OPERATION_16 string : Channel.fromPath(params.barcode_whitelist)
         .ifEmpty{ exit 1, "Cannot find ${params.type} barcode whitelist: $barcode_filename" }
         .into{ barcode_whitelist_star; barcode_whitelist_kallisto; barcode_whitelist_alevinqc }
OPERATION_16 origin : [['params.barcode_whitelist', 'A']]
OPERATION_16 gives  : [['barcode_whitelist_star', 'P'], ['barcode_whitelist_kallisto', 'P'], ['barcode_whitelist_alevinqc', 'P']]


OPERATION_17 string : barcode_whitelist_gzipped = Channel.empty()
OPERATION_17 origin : []
OPERATION_17 gives  : [['barcode_whitelist_gzipped', 'P']]


OPERATION_18 string : Channel.from(summary.collect{ [it.key, it.value] })
    .map { k,v -> "<dt>$k</dt><dd><samp>${v ?: '<span style=\"color:#999999;\">N/A</a>'}</samp></dd>" }
    .reduce { a, b -> return [a, b].join("\n            ") }
    .map { x -> """
    id: 'nf-core-scrnaseq-summary'
    description: " - this information is collected when the pipeline is started."
    section_name: 'nf-core/scrnaseq Workflow Summary'
    section_href: 'https://github.com/nf-core/scrnaseq'
    plot_type: 'html'
    data: |
        <dl class=\"dl-horizontal\">
            $x
        </dl>
    """.stripIndent() }
    .set { ch_workflow_summary }
OPERATION_18 origin : [['summary.collect{ [it.key, it.value] }', 'V']]
OPERATION_18 gives  : [['ch_workflow_summary', 'P']]


OPERATION_19 string : configFiles.join(', ')
OPERATION_19 origin : [['configFiles', 'P']]
OPERATION_19 gives  : []


OPERATION_20 string : star_aligned
    .flatMap {  logs, bams -> bams }
.into { bam_count; bam_rseqc; bam_preseq; bam_markduplicates; bam_htseqcount; bam_stringtieFPKM; bam_for_genebody; bam_dexseq; leafcutter_bam }
OPERATION_20 origin : [['star_aligned', 'P']]
OPERATION_20 gives  : [['bam_count', 'P'], ['bam_rseqc', 'P'], ['bam_preseq', 'P'], ['bam_markduplicates', 'P'], ['bam_htseqcount', 'P'], ['bam_stringtieFPKM', 'P'], ['bam_for_genebody', 'P'], ['bam_dexseq', 'P'], ['leafcutter_bam', 'P']]


