OPERATION_1 string : Channel
   .fromPath(params.read)
   .ifEmpty { error "Cannot find any reads matching: ${params.read}" }
   .into { fastp_ch; jellyfish_ch; assembly_ch; flye_ch; hifiasm_ch; minimap1_ch }
OPERATION_1 origin : [['params.read', 'A']]
OPERATION_1 gives  : [['fastp_ch', 'P'], ['jellyfish_ch', 'P'], ['assembly_ch', 'P'], ['flye_ch', 'P'], ['hifiasm_ch', 'P'], ['minimap1_ch', 'P']]


