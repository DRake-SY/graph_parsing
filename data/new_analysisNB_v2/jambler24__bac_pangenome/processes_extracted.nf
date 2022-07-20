Name : get_software_versions
Inputs : []
Outputs : [[0, 'software_versions_yaml']]
Emits : []


Name : convertGFFtoGTF
Inputs : [[0, 'gffFile']]
Outputs : [[0, 'gtf_makeSTARindex'], [0, 'gtf_makeBED12'], [0, 'gtf_star'], [0, 'gtf_dupradar'], [0, 'gtf_featureCounts']]
Emits : []


Name : convertGTFtoGFF
Inputs : [[0, 'gtfFile']]
Outputs : [[0, 'gtf_makeSTARindex'], [0, 'gtf_makeBED12'], [0, 'gtf_star'], [0, 'gtf_dupradar'], [0, 'gtf_featureCounts'], [1, 'snpeff_gff_old_to_test_deleting']]
Emits : []


Name : prepare_genome_samtools
Inputs : [[0, 'genome_file']]
Outputs : [[0, 'genome_index_ch']]
Emits : []


Name : prepare_genome_picard
Inputs : [[0, 'genome_file']]
Outputs : [[0, 'genome_dict_ch']]
Emits : []


Name : prepare_genome_bwa
Inputs : [[0, 'genome_file']]
Outputs : [[0, 'genome_bwa_amb'], [1, 'genome_bwa_ann'], [2, 'genome_bwa_bwt'], [3, 'genome_bwa_pac'], [4, 'genome_bwa_sa']]
Emits : []


Name : fastqc
Inputs : [[0, 'newSampleChannelFastQC']]
Outputs : [[0, 'fastqc_results'], [1, 'ch_fastqc_results']]
Emits : []


Name : trim_galore
Inputs : [[0, 'newSampleChannel']]
Outputs : [[0, 'forwardTrimmed'], [1, 'reverseTrimmed'], [2, 'ch_trimgalore_results_mqc'], [3, 'sampleNumber'], [4, 'vf_read_pairs'], [5, 'unicycler_read_pairs']]
Emits : []


Name : read_mapping
Inputs : [[0, 'forwardTrimmed'], [1, 'reverseTrimmed'], [2, 'sampleNumber'], [3, 'genome_file'], [4, 'genome_bwa_amb'], [5, 'genome_bwa_ann'], [6, 'genome_bwa_bwt'], [7, 'genome_bwa_pac'], [8, 'genome_bwa_sa']]
Outputs : [[0, 'bamfiles'], [1, 'bamindexfiles'], [2, 'bam_rseqc'], [3, 'bamindexfiles_rseqc'], [4, 'bam_preseq'], [5, 'bam_forSubsamp'], [6, 'bam_skipSubsamp'], [7, 'bam_featurecounts']]
Emits : []


Name : mark_duplicates
Inputs : [[0, 'bamfiles']]
Outputs : [[0, 'dedup_bamfiles'], [1, 'bam_md'], [3, 'picard_results']]
Emits : []


Name : unicycler
Inputs : [[0, 'unicycler_read_pairs']]
Outputs : [[0, ''], [1, '']]
Emits : []


Name : quast
Inputs : [[0, 'quast_ch']]
Outputs : [[1, 'quast_logs_ch'], [2, 'ch_quast_version']]
Emits : []


Name : prokka
Inputs : [[0, 'prokka_ch']]
Outputs : [[0, 'gff']]
Emits : []


Name : dfast
Inputs : [[0, 'dfast_ch']]
Outputs : [[1, 'ch_dfast_version_for_multiqc']]
Emits : []


Name : roary
Inputs : [[0, 'gff']]
Outputs : [[0, 'roary'], [1, 'pan_genome'], [2, 'mGWAS_GPA']]
Emits : []


Name : post_roary
Inputs : [[0, 'phenotype_file']]
Outputs : [[0, 'traits_file']]
Emits : []


Name : scoary
Inputs : [[0, 'traits_file'], [1, 'mGWAS_GPA']]
Outputs : [[0, 'scoary']]
Emits : []


