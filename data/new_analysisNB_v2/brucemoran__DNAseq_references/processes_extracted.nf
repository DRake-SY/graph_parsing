Name : fasta_dl
Inputs : []
Outputs : [[0, '']]
Emits : []


Name : dict_pr
Inputs : [[0, 'fasta_dict']]
Outputs : [[0, 'dict_win'], [1, '']]
Emits : []


Name : dbsnp_dl
Inputs : []
Outputs : [[0, 'vcf_tabix'], [1, 'ascatloci']]
Emits : []


Name : ascat_loci
Inputs : [[0, 'ascatloci']]
Outputs : [[0, 'complete_ascat']]
Emits : []


Name : bwa_index
Inputs : [[0, 'fasta_bwa']]
Outputs : [[0, 'complete_bwa']]
Emits : []


Name : dict_pr2
Inputs : [[0, 'dict_win']]
Outputs : [[0, 'complete_dict']]
Emits : []


Name : exome_url
Inputs : []
Outputs : [[0, 'exome_bed']]
Emits : []


Name : exome_file
Inputs : [[0, 'exomebed_file']]
Outputs : [[0, 'exome_bed']]
Emits : []


Name : lift_over
Inputs : [[0, 'exome_bed']]
Outputs : [[0, 'exome_bed_liftd']]
Emits : []


Name : exome_bed_pr
Inputs : [[0, 'fasta_dict_exome'], [1, 'exome_bed_liftd']]
Outputs : [[0, 'complete_exome'], [1, '']]
Emits : []


Name : wgs_bed
Inputs : [[0, 'fasta_dict_wgs']]
Outputs : [[0, 'complete_wgs'], [1, '']]
Emits : []


Name : tabix_files
Inputs : [[0, 'bint_tabix']]
Outputs : [[0, 'complete_tabix']]
Emits : []


Name : exome_biall
Inputs : [[0, 'exome_biallgz'], [1, 'fasta_exome_biall']]
Outputs : [[0, 'exome_biallelicgz'], [1, 'pcgrtoml_exome']]
Emits : []


Name : wgs_biall
Inputs : [[0, 'wgs_fasta_biallgz'], [1, 'fasta_wgs_biall']]
Outputs : [[0, 'wgs_biallelicgz'], [1, 'pcgrtoml_wgs']]
Emits : []


Name : indexfeature_files
Inputs : [[0, 'vcf_tabix']]
Outputs : [[0, 'indexfeatured']]
Emits : []


Name : seqnza
Inputs : [[0, 'fasta_seqza']]
Outputs : [[0, 'sequenzaout']]
Emits : []


Name : msisen
Inputs : [[0, 'fasta_msi']]
Outputs : [[0, 'completedmsisensor']]
Emits : []


Name : pcgr_data
Inputs : []
Outputs : [[0, 'completedpcgrdb'], [1, 'pcgrdbvep'], [2, 'pcgrreleasenotes'], [3, 'pcgrtoml']]
Emits : []


Name : pcgr_toml
Inputs : [[0, 'pcgrtoml'], [1, 'pcgrtoml_exome'], [2, 'pcgrtoml_wgs']]
Outputs : [[0, 'pcgrtomld']]
Emits : []


Name : vepdb
Inputs : [[0, 'pcgrreleasenotes'], [1, 'pcgrdbvep']]
Outputs : [[0, 'complete_vepdb']]
Emits : []


Name : gensizxml
Inputs : [[0, 'fasta_dict_gensiz']]
Outputs : [[0, 'complete_gensiz']]
Emits : []


Name : hartwigmed
Inputs : [[0, 'fasta_dict_gridss']]
Outputs : [[0, 'gpldld'], [1, 'gpldle'], [2, 'gridsspon']]
Emits : []


Name : gridss
Inputs : []
Outputs : [[0, 'gridssout']]
Emits : []


