Name : supernova_full
Inputs : [[0, 'supernova_input']]
Outputs : [[0, 'supernova_results'], [0, 'supernova_results2']]
Emits : []


Name : supernova
Inputs : [[0, 'supernova_input']]
Outputs : [[0, 'supernova_results'], [0, 'supernova_results2']]
Emits : []


Name : supernova_mkoutput
Inputs : [[0, 'supernova_results']]
Outputs : [[0, 'supernova_asm1'], [0, 'supernova_asm2']]
Emits : []


Name : quast
Inputs : [[0, 'supernova_asm1']]
Outputs : [[0, 'quast_results']]
Emits : []


Name : busco
Inputs : [[0, 'supernova_asm2']]
Outputs : [[0, 'busco_results']]
Emits : []


Name : get_supernova_version
Inputs : []
Outputs : [[0, 'v_supernova']]
Emits : []


Name : get_software_versions
Inputs : [[0, 'v_supernova']]
Outputs : [[0, 'software_versions_yaml']]
Emits : []


Name : multiqc
Inputs : [[0, 'supernova_results2'], [1, 'busco_results'], [2, 'quast_results'], [3, 'software_versions_yaml']]
Outputs : []
Emits : []


Name : output_documentation
Inputs : [[0, 'ch_output_docs']]
Outputs : []
Emits : []


