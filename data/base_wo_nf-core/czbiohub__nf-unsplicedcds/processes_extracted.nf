Name : get_software_versions
Inputs : []
Outputs : [[0, 'software_versions_yaml']]
Emits : []


Name : samtools_get_unspliced
Inputs : [[0, 'bam_ch']]
Outputs : [[0, 'unspliced_bam']]
Emits : []


Name : unzip_GTF
Inputs : [[0, 'gz_ch']]
Outputs : [[0, 'unzipped_gtf']]
Emits : []


Name : remove_chrom_m_from_gtf
Inputs : [[0, 'gtf_for_remove_chromM']]
Outputs : [[0, 'no_chromM_gtf']]
Emits : []


Name : get_only_cds
Inputs : [[0, 'no_chromM_gtf']]
Outputs : [[0, 'only_cds']]
Emits : []


Name : intersect_cds_bam
Inputs : [[0, 'only_cds'], [1, 'unspliced_bam']]
Outputs : [[0, 'unspliced_bam_in_cds']]
Emits : []


Name : extract_stop_codons_from_gtf
Inputs : [[0, 'gtf_for_extract_stop_codons']]
Outputs : [[0, 'stop_codons_gtf']]
Emits : []


Name : subtract_stopcodons_bam
Inputs : [[0, 'unspliced_bam_in_cds'], [1, 'stop_codons_gtf']]
Outputs : [[0, 'unspliced_bam_in_cds_no_stop_codon']]
Emits : []


