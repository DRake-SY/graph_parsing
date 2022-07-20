Name : preprocess_fasta_index
Inputs : [[0, 'genome_fasta_file']]
Outputs : [[0, 'genome_fasta_index']]
Emits : []


Name : preprocess_fasta_dict
Inputs : [[0, 'genome_fasta_file']]
Outputs : [[0, 'genome_fasta_dict']]
Emits : []


Name : preprocess_bam_rg
Inputs : [[0, 'bam_file']]
Outputs : [[0, 'bam_rg'], [1, 'bam_rg_index']]
Emits : []


Name : preprocess_bam_rmdup
Inputs : [[0, 'bam_rg']]
Outputs : [[0, 'bam_rmdup'], [1, 'bam_rmdup_index']]
Emits : []


Name : var_call_freebayes
Inputs : [[0, 'genome_fasta_file'], [1, 'genome_fasta_index'], [2, 'bam_rmdup'], [3, 'bam_rmdup_index'], [4, 'roi_bed_file']]
Outputs : [[0, 'vcf_freebayes']]
Emits : []


Name : process_freebayes
Inputs : [[0, 'vcf_freebayes']]
Outputs : [[0, 'processed_freebayes']]
Emits : []


Name : var_call_mutect
Inputs : [[0, 'genome_fasta_file'], [1, 'genome_fasta_index'], [2, 'genome_fasta_dict'], [3, 'bam_rmdup'], [4, 'bam_rmdup_index'], [5, 'roi_bed_file']]
Outputs : [[0, 'vcf_mutect']]
Emits : []


Name : process_mutect
Inputs : [[0, 'vcf_mutect']]
Outputs : [[0, 'processed_mutect']]
Emits : []


Name : var_call_varscan
Inputs : [[0, 'genome_fasta_file'], [1, 'bam_rmdup'], [2, 'roi_bed_file']]
Outputs : [[0, 'vcf_varscan']]
Emits : []


Name : process_varscan
Inputs : [[0, 'vcf_varscan']]
Outputs : [[0, 'processed_varscan']]
Emits : []


Name : combine_vcfs
Inputs : [[0, 'processed_freebayes'], [1, 'processed_mutect'], [2, 'processed_varscan']]
Outputs : [[0, 'combined_vcfs']]
Emits : []


