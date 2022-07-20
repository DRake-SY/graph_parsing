Name : CheckSampleSheet
Inputs : [[0, 'ch_input']]
Outputs : [[0, 'ch_samplesheet_reformat']]
Emits : []


Name : StringTie2
Inputs : [[0, 'ch_txome_reconstruction']]
Outputs : [[0, 'ch_txome_feature_count'], [1, 'ch_stringtie_version']]
Emits : []


Name : FeatureCounts
Inputs : [[0, 'ch_feature_count']]
Outputs : [[0, 'ch_counts'], [1, 'ch_feat_counts_version']]
Emits : []


Name : get_software_versions
Inputs : [[0, 'ch_feat_counts_version'], [1, 'ch_stringtie_version']]
Outputs : [[0, 'software_versions_yaml']]
Emits : []


