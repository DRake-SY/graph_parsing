Name : prep_fasta
Inputs : [[0, 'manifest_ch']]
Outputs : [[0, 'chrlist_ch']]
Emits : []


Name : generate_chrlist
Inputs : [[0, 'chrlist_ch']]
Outputs : [[0, 'genmanifest_ch']]
Emits : []


Name : generate_manifest
Inputs : [[0, 'genmanifest_ch']]
Outputs : [[0, 'webin_validate_ch']]
Emits : []


Name : webin_validate
Inputs : [[0, 'webin_validate_ch']]
Outputs : [[0, 'webin_submit_ch']]
Emits : []


Name : webin_submit
Inputs : [[0, 'webin_submit_ch']]
Outputs : [[0, 'webin_parse_ch']]
Emits : []


Name : receipt_parser
Inputs : [[0, 'webin_parse_ch']]
Outputs : [[0, 'accession_report_ch']]
Emits : []


