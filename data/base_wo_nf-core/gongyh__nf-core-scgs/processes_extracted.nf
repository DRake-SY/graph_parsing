Name : get_software_versions
Inputs : []
Outputs : [[0, 'software_versions_yaml1'], [0, 'software_versions_yaml2']]
Emits : []


Name : save_reference
Inputs : [[0, 'fasta'], [1, 'gff']]
Outputs : [[3, 'genome_circlize'], [3, 'genome_samtools']]
Emits : []


Name : prepare_bowtie2
Inputs : [[0, 'fasta']]
Outputs : [[0, 'bowtie2_index']]
Emits : []


Name : fastqc
Inputs : [[0, 'read_files_fastqc']]
Outputs : [[0, 'fastqc_results1'], [0, 'fastqc_results2']]
Emits : []


Name : trim_galore
Inputs : [[0, 'read_files_trimming']]
Outputs : [[0, 'trimmed_reads'], [0, 'trimmed_reads_for_spades'], [0, 'trimmed_reads_for_kraken'], [0, 'trimmed_reads_for_kmer'], [1, 'trimgalore_results1'], [1, 'trimgalore_results2'], [2, 'trimgalore_fastqc_reports1'], [2, 'trimgalore_fastqc_reports2']]
Emits : []


Name : kraken
Inputs : [[0, 'trimmed_reads_for_kraken'], [1, 'kraken_db']]
Outputs : [[0, 'kraken_for_mqc1'], [0, 'kraken_for_mqc2']]
Emits : []


Name : saturation
Inputs : [[0, 'trimmed_reads_for_kmer']]
Outputs : []
Emits : []


Name : minimap2
Inputs : [[0, 'trimmed_reads'], [1, 'fasta']]
Outputs : [[0, 'bb_bam']]
Emits : []


Name : bowtie2
Inputs : [[0, 'trimmed_reads'], [1, 'bowtie2_index']]
Outputs : [[0, 'bb_bam']]
Emits : []


Name : samtools
Inputs : [[0, 'bb_bam'], [1, 'genome_samtools']]
Outputs : [[0, 'bam_for_qualimap'], [0, 'bam_for_aneufinder'], [0, 'bam_for_realign'], [0, 'bam_for_quast'], [1, 'bai_for_qualimap'], [1, 'bai_for_aneufinder'], [1, 'bai_for_realign'], [1, 'bai_for_quast'], [2, 'bed_for_circlize'], [2, 'bed_for_preseq'], [3, 'samtools_stats']]
Emits : []


Name : preseq
Inputs : [[0, 'bed_for_preseq']]
Outputs : [[0, 'preseq_for_multiqc']]
Emits : []


Name : qualimap
Inputs : [[0, 'bam_for_qualimap'], [1, 'bai_for_qualimap'], [2, 'gff']]
Outputs : [[0, 'qualimap_for_multiqc']]
Emits : []


Name : IndelRealign
Inputs : [[0, 'bam_for_realign'], [1, 'fasta']]
Outputs : [[0, 'bam_for_monovar'], [1, 'bai_for_monovar']]
Emits : []


Name : monovar
Inputs : [[0, 'bam_for_monovar'], [1, 'bai_for_monovar'], [2, 'fasta']]
Outputs : [[0, 'monovar_vcf']]
Emits : []


Name : aneufinder
Inputs : [[0, 'bam_for_aneufinder'], [1, 'bai_for_aneufinder']]
Outputs : [[0, 'cnv_output']]
Emits : []


Name : circlize
Inputs : [[0, 'bed_for_circlize'], [1, 'genome_circlize']]
Outputs : []
Emits : []


Name : normalize
Inputs : [[0, 'trimmed_reads_for_spades']]
Outputs : [[0, 'normalized_reads_for_assembly']]
Emits : []


Name : canu
Inputs : [[0, 'normalized_reads_for_assembly']]
Outputs : [[0, 'contigs_for_nt'], [0, 'contigs_for_split'], [1, 'contigs_for_quast1'], [1, 'contigs_for_quast2'], [1, 'contigs_for_checkm'], [1, 'contigs_for_prokka'], [1, 'contigs_for_prodigal'], [1, 'contigs_for_resfinder'], [1, 'contigs_for_pointfinder'], [1, 'contigs_for_tsne'], [1, 'contigs_for_augustus'], [1, 'contigs_for_eukcc']]
Emits : []


Name : spades
Inputs : [[0, 'normalized_reads_for_assembly']]
Outputs : [[0, 'contigs_for_nt'], [0, 'contigs_for_split'], [1, 'contigs_for_quast1'], [1, 'contigs_for_quast2'], [1, 'contigs_for_checkm'], [1, 'contigs_for_prokka'], [1, 'contigs_for_prodigal'], [1, 'contigs_for_resfinder'], [1, 'contigs_for_pointfinder'], [1, 'contigs_for_tsne'], [1, 'contigs_for_augustus'], [1, 'contigs_for_eukcc']]
Emits : []


Name : quast_ref
Inputs : [[0, 'fasta'], [1, 'gff'], [2, 'contigs_for_quast1'], [3, 'bam_for_quast'], [4, 'bai_for_quast']]
Outputs : [[0, 'quast_report1']]
Emits : []


Name : quast_denovo
Inputs : [[0, 'contigs_for_quast2']]
Outputs : [[0, 'quast_report2']]
Emits : []


Name : checkm
Inputs : [[0, 'contigs_for_checkm']]
Outputs : []
Emits : []


Name : blast_nt
Inputs : [[0, 'contigs_for_nt'], [1, 'nt_db']]
Outputs : [[0, 'nt_for_blobtools_original'], [1, 'contigs_for_uniprot']]
Emits : []


Name : diamond_uniprot
Inputs : [[0, 'contigs_for_uniprot'], [1, 'nt_for_blobtools_original'], [2, 'uniprot_db'], [3, 'uniprot_taxids']]
Outputs : [[0, 'uniprot_for_blobtools'], [1, 'contigs_for_blob'], [2, 'nt_for_blobtools'], [3, 'uniprot_real']]
Emits : []


Name : blobtools
Inputs : [[0, 'contigs_for_blob'], [1, 'nt_for_blobtools'], [2, 'uniprot_real'], [3, 'uniprot_for_blobtools']]
Outputs : [[0, 'blob_tax'], [1, 'contigs_for_acdc'], [2, 'blob_tax_for_split']]
Emits : []


Name : acdc
Inputs : [[0, 'contigs_for_acdc'], [1, 'kraken_db'], [2, 'blob_tax']]
Outputs : []
Emits : []


Name : tsne
Inputs : [[0, 'contigs_for_tsne']]
Outputs : []
Emits : []


Name : prokka
Inputs : [[0, 'contigs_for_prokka']]
Outputs : [[0, 'prokka_for_mqc1'], [0, 'prokka_for_mqc2'], [0, 'prokka_for_split'], [1, 'faa_eggnog'], [1, 'faa_kofam']]
Emits : []


Name : prodigal
Inputs : [[0, 'contigs_for_prodigal']]
Outputs : []
Emits : []


Name : augustus
Inputs : [[0, 'contigs_for_augustus']]
Outputs : [[0, 'faa_eukcc'], [0, 'faa_eggnog'], [0, 'faa_kofam']]
Emits : []


Name : eukcc
Inputs : [[0, 'faa_eukcc'], [1, 'eukcc_db']]
Outputs : []
Emits : []


Name : multiqc_ref
Inputs : [[0, 'ch_multiqc_config1'], [1, 'fastqc_results1'], [2, 'software_versions_yaml1'], [3, 'trimgalore_results1'], [4, 'trimgalore_fastqc_reports1'], [5, 'samtools_stats'], [6, 'preseq_for_multiqc'], [7, 'qualimap_for_multiqc'], [8, 'quast_report1'], [9, 'prokka_for_mqc1'], [10, 'kraken_for_mqc1'], [11, 'summary']]
Outputs : [[0, 'multiqc_report1']]
Emits : []


Name : multiqc_denovo
Inputs : [[0, 'ch_multiqc_config2'], [1, 'fastqc_results2'], [2, 'software_versions_yaml2'], [3, 'trimgalore_results2'], [4, 'trimgalore_fastqc_reports2'], [5, 'quast_report2'], [6, 'prokka_for_mqc2'], [7, 'kraken_for_mqc2'], [8, 'summary']]
Outputs : [[0, 'multiqc_report2']]
Emits : []


Name : eggnog
Inputs : [[0, 'faa_eggnog'], [1, 'eggnog_db']]
Outputs : []
Emits : []


Name : kofam
Inputs : [[0, 'faa_kofam'], [1, 'kofam_profile'], [2, 'kofam_kolist']]
Outputs : [[0, 'kofam_for_split']]
Emits : []


Name : resfinder
Inputs : [[0, 'contigs_for_resfinder'], [1, 'resfinder_db']]
Outputs : []
Emits : []


Name : pointfinder
Inputs : [[0, 'contigs_for_pointfinder'], [1, 'pointfinder_db']]
Outputs : []
Emits : []


Name : split_checkm
Inputs : [[0, 'contigs_for_split'], [1, 'blob_tax_for_split'], [2, 'prokka_for_split'], [3, 'kofam_for_split']]
Outputs : []
Emits : []


Name : output_documentation
Inputs : [[0, 'ch_output_docs']]
Outputs : []
Emits : []


