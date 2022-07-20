OPERATION_1 string : Channel.fromPath(params.peaks).ifEmpty{ exit 1, "Cannot find peak file"}.into{ peak_file_extraction; peak_file_annotation}
OPERATION_1 origin : [['params.peaks', 'A']]
OPERATION_1 gives  : [['peak_file_extraction', 'P'], ['peak_file_annotation', 'P']]


OPERATION_2 string : Channel.fromPath(params.background).ifEmpty{exit 1, "Cannot find background file"}.set{background}
OPERATION_2 origin : [['params.background', 'A']]
OPERATION_2 gives  : [['background', 'P']]


OPERATION_3 string : summary.collect { k,v -> "${k.padRight(15)}: $v" }.join("\n")
OPERATION_3 origin : [['summary', 'P']]
OPERATION_3 gives  : []


OPERATION_4 string : extended_peaks.into{ ext_peaks_background; ext_peaks_enrichment; ext_peaks_bed; ext_peaks_targets }
OPERATION_4 origin : [['extended_peaks', 'P']]
OPERATION_4 gives  : [['ext_peaks_background', 'P'], ['ext_peaks_enrichment', 'P'], ['ext_peaks_bed', 'P'], ['ext_peaks_targets', 'P']]


