OPERATION_1 string : Channel.fromPath(params.input, checkIfExists: true)
    .splitCsv(header:true, sep:',')
    .map { row -> [ row.sample_id, [ file(row.fastq_1, checkIfExists: true), file(row.fastq_2, checkIfExists: true) ] ] }
    .into {  ch_raw_reads_fastqc;
            ch_raw_reads_trim }
OPERATION_1 origin : [['params.input, checkIfExists: true', 'A']]
OPERATION_1 gives  : [['ch_raw_reads_fastqc', 'P'], ['ch_raw_reads_trim', 'P']]


OPERATION_2 string : ch_blacklist = Channel.fromPath(params.blacklist, checkIfExists: true) } else { ch_blacklist = Channel.empty() }

if (params.fasta) {
OPERATION_2 origin : [['params.blacklist, checkIfExists: true', 'A']]
OPERATION_2 gives  : [['ch_blacklist', 'P']]


OPERATION_3 string : Channel
        .fromPath(bt2_dir, checkIfExists: true)
        .set { ch_bt2_index }
OPERATION_3 origin : [['bt2_dir, checkIfExists: true', 'A']]
OPERATION_3 gives  : [['ch_bt2_index', 'P']]


OPERATION_4 string : Channel.from(summary.collect{ [it.key, it.value] })
    .map { k,v -> "<dt>$k</dt><dd><samp>${v ?: '<span style=\"color:#999999;\">N/A</a>'}</samp></dd>" }
    .reduce { a, b -> return [a, b].join("\n            ") }
    .map { x -> """
    id: 'cutrun-nextflow-summary'
    description: " - this information is collected when the pipeline is started."
    section_name: 'cutrun_nextflow Workflow Summary'
    section_href: 'https://github.com/khigashi1987/CUTRUN_Nextflow'
    plot_type: 'html'
    data: |
        <dl class=\"dl-horizontal\">
            $x
        </dl>
    """.stripIndent() }
    .set { ch_workflow_summary }
OPERATION_4 origin : [['summary.collect{ [it.key, it.value] }', 'V']]
OPERATION_4 gives  : [['ch_workflow_summary', 'P']]


OPERATION_5 string : summary.collect { k,v -> "${k.padRight(20)}: $v" }.join('\n')
OPERATION_5 origin : [['summary', 'P']]
OPERATION_5 gives  : []


OPERATION_6 string : ch_filtered_bam.into {ch_filtered_bam_macs; ch_filtered_bam_filter_macs; ch_filtered_bam_flagstat; ch_filtered_bam_bedgraph; ch_filtered_bam_bigwig}
OPERATION_6 origin : [['ch_filtered_bam', 'P']]
OPERATION_6 gives  : [['ch_filtered_bam_macs', 'P'], ['ch_filtered_bam_filter_macs', 'P'], ['ch_filtered_bam_flagstat', 'P'], ['ch_filtered_bam_bedgraph', 'P'], ['ch_filtered_bam_bigwig', 'P']]


OPERATION_7 string : ch_genome_filter_regions.into {ch_genome_filter_regions_macs; ch_genome_filter_regions_seacr}
OPERATION_7 origin : [['ch_genome_filter_regions', 'P']]
OPERATION_7 gives  : [['ch_genome_filter_regions_macs', 'P'], ['ch_genome_filter_regions_seacr', 'P']]


OPERATION_8 string : ch_macs_peaks.into {ch_filtered_macs_peaks_qc; ch_filtered_macs_peaks_annot}
OPERATION_8 origin : [['ch_macs_peaks', 'P']]
OPERATION_8 gives  : [['ch_filtered_macs_peaks_qc', 'P'], ['ch_filtered_macs_peaks_annot', 'P']]


OPERATION_9 string : ch_seacr_peaks.into {ch_filtered_seacr_peaks; ch_filtered_seacr_peaks_annot}
OPERATION_9 origin : [['ch_seacr_peaks', 'P']]
OPERATION_9 gives  : [['ch_filtered_seacr_peaks', 'P'], ['ch_filtered_seacr_peaks_annot', 'P']]


OPERATION_10 string : ch_dedup_bam = ch_sorted_bam
OPERATION_10 origin : [['ch_sorted_bam', 'P']]
OPERATION_10 gives  : [['ch_dedup_bam', 'P']]


OPERATION_11 string : ch_filtered_bam = ch_dedup_bam
OPERATION_11 origin : [['ch_dedup_bam', 'P']]
OPERATION_11 gives  : [['ch_filtered_bam', 'P']]


OPERATION_12 string : ch_genome_filter_regions_macs = ch_genome_filter_regions
OPERATION_12 origin : [['ch_genome_filter_regions', 'P']]
OPERATION_12 gives  : [['ch_genome_filter_regions_macs', 'P']]


OPERATION_13 string : ch_genome_filter_regions_seacr = ch_genome_filter_regions
OPERATION_13 origin : [['ch_genome_filter_regions', 'P']]
OPERATION_13 gives  : [['ch_genome_filter_regions_seacr', 'P']]


