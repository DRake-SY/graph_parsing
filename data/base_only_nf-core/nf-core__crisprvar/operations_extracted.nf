OPERATION_1 string : Channel
             .from(params.readPaths)
             .map { row -> [ row[0], [file(row[1][0])]] }
             .ifEmpty { exit 1, "params.readPaths was empty - no input files supplied" }
             .map{ name, reads -> tuple(trim_pattern ? name.replaceAll(trim_pattern, '') : name, reads) }
             .dump()
             .into { raw_reads_to_join; raw_reads_to_print }
OPERATION_1 origin : [['params.readPaths', 'V']]
OPERATION_1 gives  : [['raw_reads_to_join', 'P'], ['raw_reads_to_print', 'P']]


OPERATION_2 string : Channel
             .from(params.readPaths)
             .map { row -> [ row[0], [file(row[1][0]), file(row[1][1])]] }
             .ifEmpty { exit 1, "params.readPaths was empty - no input files supplied" }
             .map{ name, reads -> tuple(trim_pattern ? name.replaceAll(trim_pattern, '') : name, reads) }
             .dump()
             .into { raw_reads_to_join; raw_reads_to_print }
OPERATION_2 origin : [['params.readPaths', 'V']]
OPERATION_2 gives  : [['raw_reads_to_join', 'P'], ['raw_reads_to_print', 'P']]


OPERATION_3 string : Channel
         .fromFilePairs( params.reads, size: params.singleEnd ? 1 : 2 )
         .ifEmpty { exit 1, "Cannot find any reads matching: ${params.reads}\nNB: Path needs to be enclosed in quotes!\nNB: Path requires at least one * wildcard!\nIf this is single-end data, please specify --singleEnd on the command line." }
         .map{ name, reads -> tuple(trim_pattern ? name.replaceAll(trim_pattern, '') : name, reads) }
         .dump()
         .into { raw_reads_to_join; raw_reads_to_print }
OPERATION_3 origin : [['params.reads, size: params.singleEnd ? 1 : 2', 'A']]
OPERATION_3 gives  : [['raw_reads_to_join', 'P'], ['raw_reads_to_print', 'P']]


OPERATION_4 string : Channel
      .fromPath(params.samplesheet)
      .ifEmpty{ exit 1, "Cannot find samplesheet file: ${params.samplesheet}" }
      .dump()
      .into { original_samplesheet_ch; original_samplesheet_to_print_ch }
OPERATION_4 origin : [['params.samplesheet', 'A']]
OPERATION_4 gives  : [['original_samplesheet_ch', 'P'], ['original_samplesheet_to_print_ch', 'P']]


OPERATION_5 string : Channel.fromPath("$baseDir/assets/where_are_my_files.txt", checkIfExists: true)
       .into{ch_where_trim_galore; ch_where_star; ch_where_hisat2; ch_where_hisat2_sort}
OPERATION_5 origin : [['"$baseDir/assets/where_are_my_files.txt", checkIfExists: true', 'A']]
OPERATION_5 gives  : [['ch_where_trim_galore', 'P'], ['ch_where_star', 'P'], ['ch_where_hisat2', 'P'], ['ch_where_hisat2_sort', 'P']]


OPERATION_6 string : original_samplesheet_to_print_ch.println()
OPERATION_6 origin : [['original_samplesheet_to_print_ch', 'P']]
OPERATION_6 gives  : []


OPERATION_7 string : raw_reads_to_print.subscribe{ println it }
OPERATION_7 origin : [['raw_reads_to_print', 'P']]
OPERATION_7 gives  : []


OPERATION_8 string : summary.collect { k,v -> "${k.padRight(20)}: $v" }.join("\n")
OPERATION_8 origin : [['summary', 'P']]
OPERATION_8 gives  : []


OPERATION_9 string : samplesheet_cleaned
   .collect()
   .splitCsv(header:true)
   .map{ row -> tuple(row.sample_id[0], tuple(row.amplicon_seq[0], row.expected_hdr_amplicon_seq[0], row.guide_seq[0]))}
   .ifEmpty { exit 1, "Cannot parse cleaned input samplesheet ${params.samplesheet}" }
                              
   .dump()
   .into{ samplesheet_ch; samplesheet_parsed_to_print }
OPERATION_9 origin : [['samplesheet_cleaned', 'P']]
OPERATION_9 gives  : [['samplesheet_ch', 'P'], ['samplesheet_parsed_to_print', 'P']]


OPERATION_10 string : samplesheet_cleaned
   .collect()
   .splitCsv(header:true)
   .map{ row -> tuple(row.sample_id[0], tuple(row.amplicon_seq[0], row.guide_seq[0]))}
   .ifEmpty { exit 1, "Cannot parse cleaned input samplesheet ${params.samplesheet}" }
   .dump()
                              
   .into{ samplesheet_ch; samplesheet_parsed_to_print }
OPERATION_10 origin : [['samplesheet_cleaned', 'P']]
OPERATION_10 gives  : [['samplesheet_ch', 'P'], ['samplesheet_parsed_to_print', 'P']]


OPERATION_11 string : samplesheet_parsed_to_print
    .subscribe{ println it }
OPERATION_11 origin : [['samplesheet_parsed_to_print', 'P']]
OPERATION_11 gives  : []


OPERATION_12 string : samplesheet_ch
  .join( raw_reads_to_join )
  .ifEmpty{ exit 1, "No samples found matching samplesheet sample_id column" }
  .into{ raw_reads_fastqc; raw_reads_trimgalore; joined_reads_to_print }
OPERATION_12 origin : [['samplesheet_ch', 'P'], ['raw_reads_to_join', 'P']]
OPERATION_12 gives  : [['raw_reads_fastqc', 'P'], ['raw_reads_trimgalore', 'P'], ['joined_reads_to_print', 'P']]


OPERATION_13 string : joined_reads_to_print
      .subscribe{ println it }
OPERATION_13 origin : [['joined_reads_to_print', 'P']]
OPERATION_13 gives  : []


