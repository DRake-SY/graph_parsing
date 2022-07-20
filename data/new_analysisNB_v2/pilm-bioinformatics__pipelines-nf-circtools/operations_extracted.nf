OPERATION_1 string : Channel.fromPath("$baseDir/assets/where_are_my_files.txt")
       .into{ch_where_trim_galore; ch_where_star; }
OPERATION_1 origin : [['"$baseDir/assets/where_are_my_files.txt"', 'A']]
OPERATION_1 gives  : [['ch_where_trim_galore', 'P'], ['ch_where_star', 'P'], ['', 'P']]


OPERATION_2 string : star_index = Channel
        .fromPath(params.star_index)
        .ifEmpty { exit 1, "STAR index not found: ${params.star_index}" }
OPERATION_2 origin : [['params.star_index', 'A']]
OPERATION_2 gives  : [['star_index', 'P']]


OPERATION_3 string : Channel.fromPath(params.fasta)
           .ifEmpty { exit 1, "Fasta file not found: ${params.fasta}" }
           .into { ch_fasta_for_star_index; ch_fasta_for_circtools}
OPERATION_3 origin : [['params.fasta', 'A']]
OPERATION_3 gives  : [['ch_fasta_for_star_index', 'P'], ['ch_fasta_for_circtools', 'P']]


OPERATION_4 string : Channel
        .fromPath(params.gtf)
        .ifEmpty { exit 1, "GTF annotation file not found: ${params.gtf}" }
        .into { gtf_makeSTARindex; 
              gtf_star; gtf_qualimap;  gtf_circtools; }
OPERATION_4 origin : [['params.gtf', 'A']]
OPERATION_4 gives  : [['gtf_makeSTARindex', 'P'], ['gtf_star', 'P'], ['gtf_qualimap', 'P'], ['gtf_circtools', 'P'], ['', 'P']]


OPERATION_5 string : Channel
    .fromPath(params.rrna)
    .ifEmpty { exit 1, "rrna FASTA file is unreachable: ${params.rrna}"  }
    .set { tx_rrna_ch  }
OPERATION_5 origin : [['params.rrna', 'A']]
OPERATION_5 gives  : [['tx_rrna_ch', 'P']]


OPERATION_6 string : Channel
    .fromPath(params.repeat)
    .ifEmpty { exit 1, "repeat GTF fasta file is unreachable: ${params.repeat}"  }
    .set { repeat_ch  }
OPERATION_6 origin : [['params.repeat', 'A']]
OPERATION_6 gives  : [['repeat_ch', 'P']]


OPERATION_7 string : ch_multiqc_config = Channel.fromPath(params.multiqc_config)
OPERATION_7 origin : [['params.multiqc_config', 'A']]
OPERATION_7 gives  : [['ch_multiqc_config', 'P']]


OPERATION_8 string : ch_output_docs = Channel.fromPath("$baseDir/docs/output.md")
OPERATION_8 origin : [['"$baseDir/docs/output.md"', 'A']]
OPERATION_8 gives  : [['ch_output_docs', 'P']]


OPERATION_9 string : Channel
            .from(params.readPaths)
            .map { row -> [ row[0], [file(row[1][0])]] }
            .ifEmpty { exit 1, "params.readPaths was empty - no input files supplied" }
            .into { raw_reads_fastqc; raw_reads_trim; }
OPERATION_9 origin : [['params.readPaths', 'V']]
OPERATION_9 gives  : [['raw_reads_fastqc', 'P'], ['raw_reads_trim', 'P'], ['', 'P']]


OPERATION_10 string : Channel
        .fromFilePairs( params.reads, size: params.singleEnd ? 1 : 2 )
        .ifEmpty { exit 1, "Cannot find any reads matching: ${params.reads}\nNB: Path needs to be enclosed in quotes!\nNB: Path requires at least one * wildcard!\nIf this is single-end data, please specify --singleEnd on the command line." }
        .into { raw_reads_fastqc; raw_reads_trim; }
OPERATION_10 origin : [['params.reads, size: params.singleEnd ? 1 : 2', 'A']]
OPERATION_10 gives  : [['raw_reads_fastqc', 'P'], ['raw_reads_trim', 'P'], ['', 'P']]


OPERATION_11 string : summary.collect { k,v -> "${k.padRight(18)}: $v" }.join("\n")
OPERATION_11 origin : [['summary', 'P']]
OPERATION_11 gives  : []


