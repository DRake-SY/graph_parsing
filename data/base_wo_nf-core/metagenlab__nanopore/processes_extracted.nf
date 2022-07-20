Name : stop_watch
Inputs : []
Outputs : []
Emits : []


Name : guppy_basecalling
Inputs : []
Outputs : [[0, 'failed_fastq_ch'], [1, 'passed_fastq_ch'], [2, 'basecall_summary_ch']]
Emits : []


Name : quality_reads_filtering
Inputs : []
Outputs : []
Emits : []


Name : pyco_qc
Inputs : []
Outputs : []
Emits : []


Name : nanoplot_qc
Inputs : []
Outputs : []
Emits : []


Name : centrifuge_fastqs
Inputs : []
Outputs : []
Emits : []


Name : assembly_with_flye
Inputs : []
Outputs : [[0, 'fasta_ch'], [1, 'gfa_ch'], [2, 'assembly_info_ch']]
Emits : []


Name : hybrid_assembly_unicycler
Inputs : [[0, 'fastq_hybrid_assembly_ch'], [1, 'illumina_fastq_ch']]
Outputs : [[0, 'hybrid_fasta_ch'], [1, 'hybrid_gfa_ch']]
Emits : []


Name : mapping_reads_against_assembly
Inputs : [[0, 'fastq_mapping_assembly_ch'], [1, 'assemblies_map_ch']]
Outputs : [[0, 'bam_assembly_ch']]
Emits : []


Name : minimap2_reads_to_reference
Inputs : [[0, 'fastq_mapping_reads_ch'], [1, 'references_ch']]
Outputs : [[0, 'bam_ref_ch'], [1, 'bai_ch']]
Emits : []


Name : bam_to_bed
Inputs : []
Outputs : []
Emits : []


Name : pycoQC_coverage_plot
Inputs : [[0, 'pyco_bam_ch'], [1, 'bai_ch'], [2, 'sampleId'], [2, 'file("*_cov']]
Outputs : []
Emits : []


Name : rgi
Inputs : []
Outputs : [[0, 'rgi_txt_ch'], [1, 'rgi_json_ch']]
Emits : []


Name : rgi_heatmap
Inputs : []
Outputs : []
Emits : []


Name : prokka_annotation
Inputs : []
Outputs : []
Emits : []


