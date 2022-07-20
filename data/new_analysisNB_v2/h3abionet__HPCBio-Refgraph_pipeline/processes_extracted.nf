Name : prepare_genome
Inputs : [[0, 'genome_file']]
Outputs : [[0, 'genome_index_ch']]
Emits : []


Name : qc_input
Inputs : [[0, 'CRAM_Ch1']]
Outputs : [[0, 'extract_unmapped_ch'], [0, 'extract_clipped_ch']]
Emits : []


Name : extract_improper
Inputs : [[0, 'extract_unmapped_ch'], [1, 'genome_file'], [2, 'genome_index_ch']]
Outputs : [[0, 'improper_unmapped_ch'], [0, 'improper_clipped_ch']]
Emits : []


Name : extract_unmapped
Inputs : [[0, 'improper_unmapped_ch']]
Outputs : [[0, 'fq_pe_unmapped_ch'], [1, 'unmapped_bam_ch']]
Emits : []


Name : extract_clipped
Inputs : [[0, 'improper_clipped_ch']]
Outputs : [[0, 'extract_sort_ch'], [1, 'fq_pe_clipped_ch']]
Emits : []


Name : merge_pairs
Inputs : [[0, 'fq_pe_unmapped_ch'], [0, 'fq_pe_clipped_ch']]
Outputs : [[0, 'merge_trim_ch'], [0, 'merge_fastqc_ch']]
Emits : []


Name : fastqc
Inputs : [[0, 'merge_fastqc_ch']]
Outputs : [[0, 'fastqc_results']]
Emits : []


Name : trimming
Inputs : [[0, 'merge_trim_ch']]
Outputs : [[0, 'trim_megahit_ch'], [0, 'trim_masurca_ch'], [0, 'trim_fastqc'], [0, 'trim_aln_ch'], [1, 'trim_multiqc_ch']]
Emits : []


Name : fastqc_post
Inputs : [[0, 'trim_fastqc']]
Outputs : [[0, 'fastqc_trimmed_results']]
Emits : []


Name : megahit_assemble
Inputs : [[0, 'trim_megahit_ch']]
Outputs : [[0, 'megahit_rename_ch']]
Emits : []


Name : masurca_assemble
Inputs : [[0, 'trim_masurca_ch']]
Outputs : [[0, 'masurca_rename_ch']]
Emits : []


Name : assembly_rename
Inputs : [[0, 'all_assemblies_rename_ch']]
Outputs : [[0, 'all_assemblies_metrics_ch'], [0, 'all_assemblies_aln_ch']]
Emits : []


Name : assembly_metrics
Inputs : [[0, 'all_assemblies_metrics_ch']]
Outputs : [[1, 'metrics_multiqc_ch']]
Emits : []


Name : aln_reads
Inputs : [[0, 'all_assemblies_aln_ch']]
Outputs : []
Emits : []


Name : MultiQC
Inputs : [[0, 'metrics_multiqc_ch'], [1, 'fastqc_results'], [2, 'fastqc_trimmed_results'], [3, 'trim_multiqc_ch']]
Outputs : []
Emits : []


