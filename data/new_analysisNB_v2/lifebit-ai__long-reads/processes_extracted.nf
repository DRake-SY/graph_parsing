Name : preprocess_fai
Inputs : [[0, 'fasta_to_index']]
Outputs : [[0, '']]
Emits : []


Name : minimap2
Inputs : [[0, 'minimap2']]
Outputs : [[0, 'mapped_reads']]
Emits : []


Name : bwa_sort
Inputs : [[0, 'mapped_reads']]
Outputs : [[0, 'sorted_bam']]
Emits : []


Name : mark_duplicates
Inputs : [[0, 'sorted_bam']]
Outputs : [[0, 'marked_bam_qc'], [0, 'marked_bam_clairvoyante'], [0, 'marked_bam_sniffles'], [0, 'marked_bam_svim'], [1, 'mark_dup_report']]
Emits : []


Name : bam_qc
Inputs : [[0, 'marked_bam_qc']]
Outputs : [[0, 'bam_qc_report']]
Emits : []


Name : clairvoyante
Inputs : [[0, 'clairvoyante']]
Outputs : [[0, 'clairvoyante_vcf']]
Emits : []


Name : sniffles_preprocessing
Inputs : [[0, 'sniffles_preprocessing']]
Outputs : [[0, 'bam_md_sniffles']]
Emits : []


Name : sniffles
Inputs : [[0, 'bam_md_sniffles']]
Outputs : [[0, 'sniffles_vcf']]
Emits : []


Name : svim
Inputs : [[0, 'marked_bam_svim']]
Outputs : [[0, 'svim_vcf']]
Emits : []


Name : filter_svim
Inputs : [[0, 'svim_vcf']]
Outputs : [[0, 'svim_filtered_vcf']]
Emits : []


Name : multiqc
Inputs : [[0, 'mark_dup_report'], [1, 'bam_qc_report']]
Outputs : [[0, 'multiqc_report']]
Emits : []


Name : sv_length_plot
Inputs : [[0, 'sniffles_vcf_length'], [1, 'svim_filtered_vcf_length']]
Outputs : [[0, 'sv_length_plots']]
Emits : []


Name : sv_carriers_plot
Inputs : [[0, 'sniffles_vcf_carriers'], [1, 'svim_filtered_vcf_carriers']]
Outputs : [[0, 'sv_carriers_plots']]
Emits : []


Name : deploit_report
Inputs : [[0, 'sv_length_plots'], [1, 'sv_carriers_plots']]
Outputs : [[0, 'results']]
Emits : []


