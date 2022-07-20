Name : convertGFFtoGTF
Inputs : [[0, 'gffFile']]
Outputs : [[0, 'gtf_makeSTARindex'], [0, 'gtf_makeBED12'], [0, 'gtf_star'], [0, 'gtf_dupradar'], [0, 'gtf_featureCounts'], [1, 'snpeff_gff']]
Emits : []


Name : convertGTFtoGFF
Inputs : [[0, 'gtfFile']]
Outputs : [[0, 'gtf_makeSTARindex'], [0, 'gtf_makeBED12'], [0, 'gtf_star'], [1, 'snpeff_gff'], [2, 'gtf_featureCounts'], [3, 'gtf_dupradar']]
Emits : []


Name : makeBED12
Inputs : [[0, 'gtf_makeBED12']]
Outputs : [[0, 'bed_rseqc'], [0, 'bed_genebody_coverage']]
Emits : []


