OPERATION_1 string : Channel.value("$workflow.launchDir/$params.refFasta")
        .set { ch_refFasta }
OPERATION_1 origin : []
OPERATION_1 gives  : [['ch_refFasta', 'P']]


OPERATION_2 string : Channel.fromPath("$params.gatkMarkDuplicatesSparkResultsDir/*bam")
        .into {
            ch_in_collectAlignmentSummaryMetrics;
            ch_in_collectInsertSizeMetrics
        }
OPERATION_2 origin : [['"$params.gatkMarkDuplicatesSparkResultsDir/*bam"', 'A']]
OPERATION_2 gives  : [['ch_in_collectAlignmentSummaryMetrics', 'P'], ['ch_in_collectInsertSizeMetrics', 'P']]


