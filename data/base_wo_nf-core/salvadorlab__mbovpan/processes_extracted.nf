Name : pre_fastqc
Inputs : [[0, 'reads_process']]
Outputs : [[0, 'fastqc_ch1']]
Emits : []


Name : fastp
Inputs : [[0, 'reads_trim']]
Outputs : [[0, 'fastp_ch']]
Emits : []


Name : post_fastqc
Inputs : [[0, 'fastp_reads1']]
Outputs : [[0, 'fastqc_ch2']]
Emits : []


Name : read_map
Inputs : [[0, 'fastp_reads2']]
Outputs : [[0, 'map_ch']]
Emits : []


Name : mark_dups
Inputs : [[0, 'bam']]
Outputs : [[0, 'nodup_ch']]
Emits : []


Name : freebayes
Inputs : [[0, 'nodup1_ch'], [1, 'ref']]
Outputs : [[0, 'freebayes_ch']]
Emits : []


Name : vcf_filter
Inputs : [[0, 'freebayes_ch']]
Outputs : [[0, 'filter_ch']]
Emits : []


Name : stats
Inputs : [[0, 'stats_ch']]
Outputs : [[0, 'output_stat_ch']]
Emits : []


Name : psuedo_assembly
Inputs : [[0, 'filter1_ch']]
Outputs : [[0, 'fasta_ch']]
Emits : []


Name : iqtree
Inputs : [[0, 'fasta_ch']]
Outputs : [[0, 'phylo_ch']]
Emits : []


Name : assembly
Inputs : [[0, 'fastp_reads3']]
Outputs : [[0, 'shortassembly_ch']]
Emits : []


Name : quast
Inputs : [[0, 'assembly_ch1']]
Outputs : [[0, 'quast_ch']]
Emits : []


Name : annotate
Inputs : [[0, 'assembly_ch2']]
Outputs : [[0, 'annotate_ch']]
Emits : []


Name : roary
Inputs : [[0, 'annotate_ch']]
Outputs : [[0, 'roary_ch']]
Emits : []


Name : pan_curve
Inputs : [[0, 'roary_ch']]
Outputs : [[0, 'output_ch']]
Emits : []


Name : multiqc
Inputs : [[0, 'fastqc_ch1'], [1, 'fastqc_ch2']]
Outputs : []
Emits : []


