Name : makeContigsDB
Inputs : [[0, 'contig_file']]
Outputs : [[0, 'db_for_HMM']]
Emits : []


Name : runHMM
Inputs : [[0, 'db_for_HMM']]
Outputs : [[0, 'HMM_db']]
Emits : []


Name : setupNCBIcogs
Inputs : []
Outputs : [[0, 'anvio_cogs_tar']]
Emits : []


Name : annotateGenesWithCogs
Inputs : [[0, 'HMM_db'], [1, 'anvio_cogs_tar']]
Outputs : [[0, 'annotated_contigsDB'], [0, 'contigsDB_for_merge']]
Emits : []


Name : refineBams
Inputs : [[0, 'raw_bam_ch']]
Outputs : [[0, 'bam_ch']]
Emits : []


Name : anvioProfile
Inputs : [[0, 'bam_ch'], [1, 'annotated_contigsDB']]
Outputs : []
Emits : []


Name : mergeProfiles
Inputs : [[0, 'bam_profiles'], [1, 'contigsDB_for_merge']]
Outputs : []
Emits : []


