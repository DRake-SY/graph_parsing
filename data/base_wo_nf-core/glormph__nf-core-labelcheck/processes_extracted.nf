Name : get_software_versions
Inputs : []
Outputs : [[0, 'software_versions_yaml']]
Emits : []


Name : quantifySpectra
Inputs : [[0, 'mzml_quant']]
Outputs : [[0, 'isobaricxml']]
Emits : []


Name : createSpectraLookup
Inputs : [[0, 'mzmlfiles_all']]
Outputs : [[0, 'speclookup']]
Emits : []


Name : quantLookup
Inputs : [[0, 'speclookup'], [1, 'isofiles_sorted']]
Outputs : [[0, 'quantlookup']]
Emits : []


Name : createTargetDecoyFasta
Inputs : [[0, 'tdb']]
Outputs : [[0, 'concatdb']]
Emits : []


Name : msgfPlus
Inputs : [[0, 'mzml_msgf'], [1, 'concatdb'], [2, 'mods']]
Outputs : [[0, 'mzids'], [1, 'mzidtsvs']]
Emits : []


Name : percolator
Inputs : [[0, 'mzids_2pin']]
Outputs : [[0, 'percolated']]
Emits : []


Name : svmToTSV
Inputs : [[0, 'mzperco']]
Outputs : [[0, 'tmzidtsv_perco']]
Emits : []


Name : createPSMTable
Inputs : [[0, 'prepsm']]
Outputs : [[0, 'setpsmtables']]
Emits : []


Name : psm2Peptides
Inputs : [[0, 'psm_pep']]
Outputs : [[0, 'psmmeans']]
Emits : []


Name : reportLabelCheck
Inputs : [[0, 'psm_values']]
Outputs : [[0, 'results']]
Emits : []


