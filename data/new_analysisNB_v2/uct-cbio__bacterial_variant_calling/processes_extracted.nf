Name : convertGFFtoGTF
Inputs : [[0, 'gffFile']]
Outputs : [[0, 'yolo'], [1, 'snpeff_gff'], [1, 'gff_makeBED12'], [1, 'gtf_makeSTARindex'], [1, 'gtf_star'], [1, 'gtf_dupradar'], [1, 'gtf_featureCounts']]
Emits : []


Name : convertGTFtoGFF
Inputs : [[0, 'gtfFile']]
Outputs : [[0, 'gtf_makeSTARindex'], [0, 'gtf_star'], [0, 'gtf_dupradar'], [0, 'gtf_featureCounts'], [1, 'snpeff_gff'], [1, 'gff_makeBED12']]
Emits : []


Name : makeBED12
Inputs : [[0, 'gff_makeBED12']]
Outputs : [[0, 'bed_rseqc'], [0, 'bed_genebody_coverage']]
Emits : []


Name : get_software_versions
Inputs : []
Outputs : [[0, 'software_versions_yaml']]
Emits : []


