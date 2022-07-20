OPERATION_1 string : reads_summary_ch = Channel
					.fromFilePairs( params.reads_summary )
OPERATION_1 origin : [['params.reads_summary', 'A']]
OPERATION_1 gives  : [['reads_summary_ch', 'P']]


OPERATION_2 string : reads_summary_ch.into { reads_minimap2_ch ; reads_nanopolish_index_ch ; reads_nanopolish_eventalign_ch ; reads_xpore_dataprep_ch }
OPERATION_2 origin : [['reads_summary_ch', 'P']]
OPERATION_2 gives  : [['reads_minimap2_ch', 'P'], ['reads_nanopolish_index_ch', 'P'], ['reads_nanopolish_eventalign_ch', 'P'], ['reads_xpore_dataprep_ch', 'P']]


