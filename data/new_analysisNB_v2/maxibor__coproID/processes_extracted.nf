Name : decomp_kraken
Inputs : [[0, 'comp_kraken']]
Outputs : [[0, 'krakendb_ch']]
Emits : []


Name : fastqc
Inputs : [[0, 'ch_read_files_fastqc']]
Outputs : [[0, 'fastqc_results']]
Emits : []


Name : renameGenome1
Inputs : [[0, 'fasta1']]
Outputs : [[0, '']]
Emits : []


Name : renameGenome2
Inputs : [[0, 'fasta2']]
Outputs : [[0, '']]
Emits : []


Name : renameGenome3
Inputs : [[0, 'fasta3']]
Outputs : [[0, '']]
Emits : []


Name : AdapterRemovalCollapse
Inputs : [[0, 'ch_read_files_trimming']]
Outputs : [[0, 'trimmed_reads_genome1'], [0, 'trimmed_reads_genome2'], [0, 'trimmed_reads_genome3'], [0, 'trimmed_reads_kraken'], [1, 'adapter_removal_results']]
Emits : []


Name : AdapterRemovalNoCollapse
Inputs : [[0, 'ch_read_files_trimming']]
Outputs : [[0, 'trimmed_reads_genome1'], [0, 'trimmed_reads_genome2'], [0, 'trimmed_reads_genome3'], [1, 'adapter_removal_results']]
Emits : []


Name : BowtieIndexGenome1
Inputs : [[0, 'genome1Fasta']]
Outputs : [[0, 'bt1_ch']]
Emits : []


Name : AlignToGenome1
Inputs : [[0, 'trimmed_reads_genome1'], [1, 'bt1_ch']]
Outputs : [[0, 'alignment_genome1'], [0, 'alignment_genome1_pmd'], [1, 'unaligned_genome1'], [2, 'align1_multiqc']]
Emits : []


Name : bam2fq
Inputs : [[0, 'unaligned_genome1']]
Outputs : [[0, 'unmapped_humans_reads']]
Emits : []


Name : BowtieIndexGenome2
Inputs : [[0, 'genome2Fasta']]
Outputs : [[0, 'bt2_ch']]
Emits : []


Name : BowtieIndexGenome3
Inputs : [[0, 'genome3Fasta']]
Outputs : [[0, 'bt3_ch']]
Emits : []


Name : AlignToGenome2
Inputs : [[0, 'trimmed_reads_genome2'], [1, 'bt2_ch']]
Outputs : [[0, 'alignment_genome2'], [0, 'alignment_genome2_pmd'], [1, 'unaligned_genome2'], [2, 'align2_multiqc']]
Emits : []


Name : AlignToGenome3
Inputs : [[0, 'trimmed_reads_genome3'], [1, 'bt3_ch']]
Outputs : [[0, 'alignment_genome3'], [0, 'alignment_genome3_pmd'], [1, 'unaligned_genome3'], [2, 'align3_multiqc']]
Emits : []


Name : pmdtoolsgenome1
Inputs : [[0, 'alignment_genome1_pmd']]
Outputs : [[0, 'pmd_aligned1']]
Emits : []


Name : pmdtoolsgenome2
Inputs : [[0, 'alignment_genome2_pmd']]
Outputs : [[0, 'pmd_aligned2']]
Emits : []


Name : pmdtoolsgenome3
Inputs : [[0, 'alignment_genome3_pmd']]
Outputs : [[0, 'pmd_aligned3']]
Emits : []


Name : kraken2
Inputs : [[0, 'unmapped_humans_reads'], [1, 'krakendb_ch']]
Outputs : [[0, 'kraken_out'], [1, 'kraken_report']]
Emits : []


Name : kraken_parse
Inputs : [[0, 'kraken_report']]
Outputs : [[0, 'kraken_parsed']]
Emits : []


Name : kraken_merge
Inputs : [[0, 'kraken_parsed']]
Outputs : [[0, 'kraken_merged']]
Emits : []


Name : sourcepredict
Inputs : [[0, 'kraken_merged'], [1, 'sp_sources'], [2, 'sp_labels']]
Outputs : [[0, 'sourcepredict_out'], [1, 'sourcepredict_embed_out']]
Emits : []


Name : countBp2genomes
Inputs : [[0, '(params'], [0, 'pmd_aligned2'], [0, 'alignment_genome2_pmd'], [0, 'alignment_genome1'], [0, 'alignment_genome2'], [1, 'genome1Size'], [2, 'genome2Size']]
Outputs : [[0, 'bp_count'], [1, 'ancient_filtered_bam1'], [2, 'ancient_filtered_bam2']]
Emits : []


Name : countBp3genomes
Inputs : [[0, '(params'], [0, 'pmd_aligned2'], [0, 'pmd_aligned3'], [0, 'alignment_genome2_pmd'], [0, 'alignment_genome3_pmd'], [0, 'alignment_genome1'], [0, 'alignment_genome2'], [0, 'alignment_genome3'], [1, 'genome1Size'], [2, 'genome2Size'], [3, 'genome3Size']]
Outputs : [[0, 'bp_count'], [1, 'ancient_filtered_bam1'], [2, 'ancient_filtered_bam2'], [3, 'ancient_filtered_bam3']]
Emits : []


Name : damageprofilerGenome1
Inputs : [[0, 'ancient_filtered_bam1'], [1, 'genome1damageprofiler']]
Outputs : [[0, 'damage_result_genome1'], [1, 'dmgProf1_ch']]
Emits : []


Name : damageprofilerGenome2
Inputs : [[0, 'ancient_filtered_bam2'], [1, 'genome2damageprofiler']]
Outputs : [[0, 'damage_result_genome2'], [1, 'dmgProf2_ch']]
Emits : []


Name : damageprofilerGenome3
Inputs : [[0, 'ancient_filtered_bam3'], [1, 'genome3damageprofiler']]
Outputs : [[0, 'damage_result_genome3'], [1, 'dmgProf3_ch']]
Emits : []


Name : concatenateRatios
Inputs : [[0, 'bp_count'], [1, 'sourcepredict_out']]
Outputs : [[0, 'coproid_res'], [1, 'coproid_bp_count']]
Emits : []


Name : generate_report_adna_3_genomes
Inputs : [[0, 'coproid_res'], [1, 'thelogo'], [2, 'damage_result_genome1'], [3, 'damage_result_genome2'], [4, 'damage_result_genome3'], [5, 'sourcepredict_embed_out'], [6, 'report_template_ch']]
Outputs : [[0, 'coproid_report']]
Emits : []


Name : generate_report_adna_2_genomes
Inputs : [[0, 'coproid_res'], [1, 'coproid_logo'], [2, 'damage_result_genome1'], [3, 'damage_result_genome2'], [4, 'sourcepredict_embed_out'], [5, 'report_template_ch']]
Outputs : [[0, 'coproid_report']]
Emits : []


Name : generate_report
Inputs : [[0, 'coproid_res'], [1, 'sourcepredict_embed_out'], [2, 'report_template_ch']]
Outputs : [[0, 'coproid_report']]
Emits : []


Name : get_software_versions
Inputs : []
Outputs : [[0, 'ch_software_versions_yaml']]
Emits : []


Name : multiqc
Inputs : [[0, 'adapter_removal_results'], [1, 'align1_multiqc'], [2, 'fastqc_results'], [3, 'dmgProf1_ch'], [4, 'dmgProf2_ch'], [5, 'ch_software_versions_yaml'], [6, 'ch_multiqc_config'], [7, 'coproid_logo']]
Outputs : [[0, 'multiqc_report']]
Emits : []


Name : output_documentation
Inputs : [[0, 'ch_output_docs']]
Outputs : []
Emits : []


