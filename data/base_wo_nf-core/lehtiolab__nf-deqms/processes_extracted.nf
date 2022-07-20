Name : get_software_versions
Inputs : []
Outputs : [[0, 'software_versions_qc']]
Emits : []


Name : DEqMS
Inputs : [[0, 'deqms_input']]
Outputs : [[0, 'ready_feats']]
Emits : []


Name : featQC
Inputs : [[0, 'ready_feats']]
Outputs : [[0, 'featsout'], [1, 'qccollect']]
Emits : []


Name : collectQC
Inputs : [[0, 'collected_feats_qc'], [1, 'software_versions_qc']]
Outputs : []
Emits : []


Name : output_documentation
Inputs : [[0, 'output_docs']]
Outputs : []
Emits : []


