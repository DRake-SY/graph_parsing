Name : trim_and_combine
Inputs : [[0, 'fastq_ch']]
Outputs : [[0, 'trim_and_combine_ch']]
Emits : []


Name : decont
Inputs : [[0, 'trim_and_combine_ch'], [1, 'cont_fasta'], [1, 'cont_amb'], [1, 'cont_ann'], [1, 'cont_bwt'], [2, 'cont_fasta_ch']]
Outputs : [[0, 'fastq_for_tadpole'], [0, 'fastq_for_polish_assembly_ch'], [0, 'fastq_for_mapping_ch'], [0, 'fastq_for_kraken_ch'], [2, 'fastqc_ch']]
Emits : []


Name : kraken
Inputs : [[0, 'fastq_for_kraken_ch']]
Outputs : []
Emits : []


Name : tadpole
Inputs : [[0, 'fastq_for_tadpole']]
Outputs : [[0, 'contigs_ch']]
Emits : []


Name : gap_fill_assembly
Inputs : [[0, 'contigs_ch'], [1, 'input_ref_fasta']]
Outputs : [[0, 'gap_filled_assembly_ch']]
Emits : []


Name : polish_assembly
Inputs : [[0, 'gap_filled_assembly_ch'], [0, 'fastq_for_polish_assembly_ch']]
Outputs : [[0, 'polished_assembly_ch']]
Emits : []


Name : final_mapping
Inputs : [[0, 'polished_assembly_ch'], [0, 'fastq_for_mapping_ch']]
Outputs : [[0, 'final_mapping_for_vcf_ch'], [0, 'final_mapping_for_cov_ch'], [1, 'final_mapping_bamstats_ch']]
Emits : []


Name : var_calling
Inputs : [[0, 'final_mapping_for_vcf_ch']]
Outputs : [[0, 'vcf_ch']]
Emits : []


Name : genomecov
Inputs : [[0, 'final_mapping_for_cov_ch']]
Outputs : [[0, 'cov_ch']]
Emits : []


Name : vipr_tools
Inputs : [[0, 'cov_ch'], [0, 'vcf_ch']]
Outputs : [[0, 'sample_id']]
Emits : []


