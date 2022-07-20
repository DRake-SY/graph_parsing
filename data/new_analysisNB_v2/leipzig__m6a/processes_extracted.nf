Name : makeBED12
Inputs : [[0, 'gtf']]
Outputs : [[0, 'bed12file']]
Emits : []


Name : MakeTophat2Index
Inputs : [[0, 'fasta']]
Outputs : [[0, 'tophat2_index']]
Emits : []


Name : MakeHisat2Index
Inputs : [[0, 'fasta'], [1, 'gtf']]
Outputs : [[0, 'hisat2_index']]
Emits : []


Name : MakeBWAIndex
Inputs : [[0, 'fasta']]
Outputs : [[0, 'bwa_index']]
Emits : []


Name : MakeStarIndex
Inputs : [[0, 'fasta'], [1, 'gtf']]
Outputs : [[0, 'star_index']]
Emits : []


Name : MakerRNAindex
Inputs : [[0, 'rRNA_fasta']]
Outputs : [[0, 'rRNA_index']]
Emits : []


Name : Fastp
Inputs : [[0, 'raw_data']]
Outputs : [[0, 'pair_id_fastqc'], [0, 'pair_id_tophat2'], [0, 'pair_id_hisat2'], [0, 'pair_id_bwa'], [0, 'pair_id_star'], [0, 'pair_id_rRNA'], [1, 'fastqc_reads'], [1, 'tophat2_reads'], [1, 'hisat2_reads'], [1, 'bwa_reads'], [1, 'star_reads'], [1, 'rRNA_reads'], [2, 'fastp_results']]
Emits : []


Name : Fastqc
Inputs : [[0, 'pair_id_fastqc'], [1, 'fastqc_reads']]
Outputs : [[0, 'fastqc_results']]
Emits : []


Name : Tophat2Align
Inputs : [[0, 'pair_id_tophat2'], [1, 'tophat2_reads'], [2, 'tophat2_index'], [3, 'gtf']]
Outputs : [[0, 'tophat2_bam'], [1, 'tophat2_log']]
Emits : []


Name : Hisat2Align
Inputs : [[0, 'pair_id_hisat2'], [1, 'hisat2_reads'], [2, 'hisat2_index']]
Outputs : [[0, 'hisat2_bam'], [1, 'hisat2_log']]
Emits : []


Name : BWAAlign
Inputs : [[0, 'pair_id_bwa'], [1, 'bwa_reads'], [2, 'bwa_index']]
Outputs : [[0, 'bwa_bam'], [1, 'bwa_result']]
Emits : []


Name : StarAlign
Inputs : [[0, 'pair_id_star'], [1, 'star_reads'], [2, 'star_index']]
Outputs : [[0, 'star_bam'], [1, 'star_log']]
Emits : []


Name : FilterrRNA
Inputs : [[0, 'pair_id_rRNA'], [1, 'rRNA_reads'], [2, 'rRNA_index']]
Outputs : [[0, 'rRNA_bam'], [1, 'rRNA_log']]
Emits : []


Name : Sort
Inputs : [[0, 'merge_bam_file']]
Outputs : [[0, 'rename_bam_file'], [1, 'bam_results']]
Emits : []


Name : RenameByDesignfile
Inputs : [[0, 'rename_bam_file'], [1, 'designfile'], [2, 'comparefile']]
Outputs : [[0, 'sort_bam'], [1, 'formatted_designfile'], [2, 'rename_results']]
Emits : []


Name : RSeQC
Inputs : [[0, 'sort_bam'], [1, 'bed12file']]
Outputs : [[0, 'rseqc_results'], [1, 'bam_stat_for_normlization']]
Emits : []


Name : CreateBedgraph
Inputs : [[0, 'sort_bam']]
Outputs : [[0, 'bedgraph_for_genebody']]
Emits : []


Name : GenebodyCoverage
Inputs : [[0, 'bedgraph_for_genebody'], [1, 'bed12file']]
Outputs : [[0, 'genebody_coverage_results']]
Emits : []


Name : multiqc
Inputs : [[0, 'arranged_qc']]
Outputs : [[0, 'multiqc_results']]
Emits : []


Name : Metpeak
Inputs : [[0, 'sort_bam'], [1, 'gtf'], [2, 'formatted_designfile']]
Outputs : [[0, 'metpeak_results'], [1, 'metpeak_nomarlized_bed']]
Emits : []


Name : Macs2
Inputs : [[0, 'fasta'], [1, 'sort_bam'], [2, 'formatted_designfile']]
Outputs : [[0, 'macs2_results'], [1, 'macs2_nomarlized_bed']]
Emits : []


Name : MATKpeakCalling
Inputs : [[0, 'sort_bam'], [1, 'gtf'], [2, 'formatted_designfile']]
Outputs : [[0, 'matk_results'], [1, 'matk_nomarlized_bed']]
Emits : []


Name : MeyerPrepration
Inputs : [[0, 'fasta']]
Outputs : [[0, 'chromsizesfile'], [1, 'chrNamefile'], [2, 'bin25file'], [3, 'genomebin']]
Emits : []


Name : Meyer
Inputs : [[0, 'sort_bam'], [1, 'formatted_designfile'], [2, 'chrNamefile'], [3, 'bin25file'], [4, 'genomebin']]
Outputs : [[0, 'meyer_results'], [1, 'meyer_nomarlized_bed']]
Emits : []


Name : HtseqCountNewToYou
Inputs : [[0, 'sort_bam'], [1, 'formatted_designfile'], [2, 'gtf']]
Outputs : [[0, 'htseq_counts']]
Emits : []


Name : HtseqMatrixNew
Inputs : [[0, 'sort_bam'], [1, 'formatted_designfile'], [2, 'gtf'], [3, 'htseq_counts']]
Outputs : [[0, 'htseq_results'], [1, 'htseq_count_input'], [1, 'htseq_count_input_to_arrange']]
Emits : []


Name : DESeq2
Inputs : [[0, 'htseq_count_input'], [1, 'formatted_designfile'], [2, 'compareLines_for_DESeq2']]
Outputs : [[0, 'deseq2_results']]
Emits : []


Name : EdgeR
Inputs : [[0, 'htseq_count_input'], [1, 'formatted_designfile'], [2, 'compareLines_for_edgeR']]
Outputs : [[0, 'edgeR_results']]
Emits : []


Name : Cufflinks
Inputs : [[0, 'sort_bam'], [1, 'gtf'], [2, 'formatted_designfile']]
Outputs : [[0, 'cufflinks_results']]
Emits : []


Name : PeakMerge
Inputs : [[0, 'merged_bed'], [1, 'formatted_designfile']]
Outputs : [[0, 'merge_result'], [1, 'group_merged_bed'], [2, 'all_merged_bed']]
Emits : []


Name : BedAnnotated
Inputs : [[0, 'bed_for_annotation'], [1, 'annotate_collection'], [2, 'formatted_designfile'], [3, 'fasta'], [4, 'gtf']]
Outputs : [[0, 'annotation_results'], [0, 'annotation_results_2'], [1, 'methylation_annotaion_file']]
Emits : []


Name : MotifSearching
Inputs : [[0, 'motif_collection'], [1, 'formatted_designfile'], [2, 'bed12file'], [3, 'fasta'], [4, 'gtf']]
Outputs : [[0, 'motif_results'], [0, 'motif_results_2']]
Emits : []


Name : QCPeaksReport
Inputs : [[0, 'motif_results'], [1, 'annotation_results'], [2, 'formatted_designfile']]
Outputs : [[0, 'qcPeaksReport']]
Emits : []


Name : PeaksQuantification
Inputs : [[0, 'all_merged_bed'], [1, 'htseq_count_input'], [2, 'sort_bam'], [3, 'formatted_designfile'], [4, 'methylation_annotaion_file'], [5, 'gtf']]
Outputs : [[0, 'quantification_results'], [0, 'quantification_matrix']]
Emits : []


Name : diffm6APeak
Inputs : [[0, 'all_merged_bed'], [1, 'sort_bam'], [2, 'formatted_designfile'], [3, 'quantification_matrix'], [4, 'htseq_results'], [5, 'gtf'], [6, 'compareLines_for_diffm6A']]
Outputs : [[0, 'diffm6A_results']]
Emits : []


Name : SingleNucleotidePrediction
Inputs : [[0, 'group_merged_bed'], [1, 'all_merged_bed'], [2, 'formatted_designfile'], [3, 'sort_bam'], [4, 'fasta'], [5, 'gtf']]
Outputs : [[0, 'prediction_results']]
Emits : []


Name : DiffReport
Inputs : [[0, 'results_arrange'], [1, 'formatted_designfile'], [2, 'compareLines_for_arranged_result']]
Outputs : [[0, 'm6APipe_result'], [1, 'diffReport_result']]
Emits : []


Name : CreateIGVjs
Inputs : [[0, 'm6APipe_result'], [1, 'fasta'], [2, 'gtf'], [3, 'formatted_designfile'], [4, 'group_merged_bed'], [5, 'all_merged_bed'], [6, 'bedgraph_for_genebody']]
Outputs : [[0, 'igv_js']]
Emits : []


Name : get_software_versions
Inputs : []
Outputs : [[0, 'software_versions_yaml']]
Emits : []


