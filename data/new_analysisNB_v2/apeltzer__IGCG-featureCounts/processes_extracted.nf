Name : get_software_versions
Inputs : []
Outputs : [[0, 'software_versions_yaml']]
Emits : []


Name : fetch_encrypted_s3_url
Inputs : [[0, 'crypted_object_ids']]
Outputs : [[0, 's3_url']]
Emits : []


Name : featureCounts
Inputs : [[0, 's3_url'], [1, 'gtf_featureCounts'], [2, 'biotypes_header']]
Outputs : [[0, 'geneCounts'], [0, 'featureCounts_to_merge'], [1, 'featureCounts_logs'], [2, 'featureCounts_biotype']]
Emits : []


Name : merge_featureCounts
Inputs : [[0, 'featureCounts_to_merge']]
Outputs : []
Emits : []


