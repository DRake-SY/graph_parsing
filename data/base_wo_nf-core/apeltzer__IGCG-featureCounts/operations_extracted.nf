OPERATION_1 string : Channel
        .fromPath(params.gtf)
        .ifEmpty { exit 1, "GTF annotation file not found: ${params.gtf}" }
        .into {gtf_featureCounts}
OPERATION_1 origin : [['params.gtf', 'A']]
OPERATION_1 gives  : [['gtf_featureCounts', 'P']]


OPERATION_2 string : Channel.from(file_manifest)
       .splitCsv(header: true, sep="\t")
       .map { row -> tuple("${row.file_name}", "${row.object_id}")}
       .set (crypted_object_ids)
OPERATION_2 origin : [['file_manifest', 'V']]
OPERATION_2 gives  : []


OPERATION_3 string : summary.collect { k,v -> "${k.padRight(15)}: $v" }.join("\n")
OPERATION_3 origin : [['summary', 'P']]
OPERATION_3 gives  : []


