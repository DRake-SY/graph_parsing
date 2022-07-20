Name : CheckDesignCompare
Inputs : [[0, 'format_design'], [1, 'comparefile']]
Outputs : [[0, 'formatted_designfile']]
Emits : []


Name : makeBED12
Inputs : [[0, 'gtf']]
Outputs : [[0, 'bed12file']]
Emits : []


Name : makechromesize
Inputs : [[0, 'fasta']]
Outputs : [[0, 'chromsizesfile']]
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
Inputs : [[0, 'raw_fastq']]
Outputs : [[0, 'fastqc_reads'], [0, 'fastp_reads'], [1, 'fastp_results']]
Emits : []


Name : Fastqc
Inputs : [[0, 'fastqc_reads']]
Outputs : [[0, 'fastqc_results']]
Emits : []


Name : FilterrRNA
Inputs : [[0, 'rRNA_reads'], [1, 'rRNA_index']]
Outputs : [[0, 'tophat2_reads'], [0, 'hisat2_reads'], [0, 'bwa_reads'], [0, 'star_reads'], [1, 'rRNA_log']]
Emits : []


Name : Tophat2Align
Inputs : [[0, 'tophat2_reads'], [1, 'tophat2_index'], [2, 'gtf']]
Outputs : [[0, 'tophat2_bam'], [1, 'tophat2_log']]
Emits : []


Name : Hisat2Align
Inputs : [[0, 'hisat2_reads'], [1, 'hisat2_index']]
Outputs : [[0, 'hisat2_bam'], [1, 'hisat2_log']]
Emits : []


Name : BWAAlign
Inputs : [[0, 'bwa_reads'], [1, 'bwa_index']]
Outputs : [[0, 'bwa_bam'], [1, 'bwa_result']]
Emits : []


Name : StarAlign
Inputs : [[0, 'star_reads'], [1, 'star_index']]
Outputs : [[0, 'star_bam'], [1, 'star_log']]
Emits : []


Name : SortRename
Inputs : [[0, 'merge_bam_file']]
Outputs : [[0, 'sorted_bam'], [1, 'rseqc_bam'], [1, 'bedgraph_bam'], [1, 'feacount_bam'], [1, 'cuffbam'], [1, 'peakquan_bam'], [1, 'diffpeak_bam'], [1, 'sng_bam'], [2, 'bam_results']]
Emits : []


Name : RSeQC
Inputs : [[0, 'rseqc_bam'], [1, 'bed12file']]
Outputs : [[0, 'rseqc_results'], [1, 'bam_stat_for_normlization']]
Emits : []


Name : CreateBedgraph
Inputs : [[0, 'bedgraph_bam']]
Outputs : [[0, 'bedgraph_for_genebody'], [0, 'bedgraph_for_igv']]
Emits : []


Name : multiqc
Inputs : [[0, 'arranged_qc']]
Outputs : [[0, 'multiqc_results']]
Emits : []


Name : FeatureCount
Inputs : [[0, 'feacount_bam'], [1, 'formatted_designfile'], [2, 'gtf']]
Outputs : [[0, 'htseq_count_input'], [0, 'htseq_count_input_to_arrange'], [1, 'htseq_results'], [2, 'htseq_diffm6a_results']]
Emits : []


Name : DESeq2
Inputs : [[0, 'htseq_count_input'], [1, 'formatted_designfile'], [2, 'compareLines_for_DESeq2']]
Outputs : [[0, 'deseq2_results']]
Emits : []


Name : EdgeR
Inputs : [[0, 'htseq_count_input'], [1, 'formatted_designfile'], [2, 'compareLines_for_edgeR']]
Outputs : [[0, 'edgeR_results']]
Emits : []


Name : Metpeak
Inputs : [[0, 'metpeak_bam'], [1, 'gtf']]
Outputs : [[0, 'metpeak_results'], [1, 'metpeak_nomarlized_bed']]
Emits : []


Name : Macs2
Inputs : [[0, 'fasta'], [1, 'macs2_bam']]
Outputs : [[0, 'macs2_results'], [1, 'macs2_nomarlized_bed']]
Emits : []


Name : MATKpeakCalling
Inputs : [[0, 'matk_bam'], [1, 'gtf']]
Outputs : [[0, 'matk_results'], [1, 'matk_nomarlized_bed']]
Emits : []


Name : MeyerPrepration
Inputs : [[0, 'fasta'], [1, 'chromsizesfile']]
Outputs : [[0, 'chrNamefile'], [1, 'bin25file'], [2, 'genomebin']]
Emits : []


Name : Meyer
Inputs : [[0, 'meyer_bam'], [1, 'chrNamefile'], [2, 'bin25file'], [3, 'genomebin']]
Outputs : [[0, 'meyer_results'], [1, 'meyer_nomarlized_bed']]
Emits : []


Name : PeakMerge
Inputs : [[0, 'merged_bed'], [1, 'formatted_designfile']]
Outputs : [[0, 'merge_result'], [1, 'group_merged_bed'], [2, 'all_merged_bed']]
Emits : []


Name : BedAnnotated
Inputs : [[0, 'beds_anno'], [1, 'fasta'], [2, 'gtf']]
Outputs : [[0, 'annotation_results_xy'], [0, 'anno_for_quantification'], [0, 'anno_for_diffreport'], [1, 'annotation_results_homer']]
Emits : []


Name : MotifSearching
Inputs : [[0, 'motif_collection'], [1, 'chromsizesfile'], [2, 'bed12file'], [3, 'fasta'], [4, 'gtf']]
Outputs : [[0, 'motif_results'], [0, 'motif_results_for_report']]
Emits : []


Name : PeaksMotifReport
Inputs : [[0, 'motif_results'], [1, 'annotation_results_xy'], [2, 'formatted_designfile']]
Outputs : [[0, 'peaksMotifReport']]
Emits : []


Name : PeaksQuantification
Inputs : [[0, 'all_merged_bed'], [1, 'htseq_count_input'], [2, 'peakquan_bam'], [3, 'formatted_designfile'], [4, 'methylation_annotaion_file'], [5, 'gtf']]
Outputs : [[0, 'quantification_results'], [0, 'quantification_matrix']]
Emits : []


Name : diffm6APeak
Inputs : [[0, 'all_merged_bed'], [1, 'diffpeak_bam'], [2, 'formatted_designfile'], [3, 'quantification_matrix'], [4, 'htseq_diffm6a_results'], [5, 'gtf'], [6, 'compareLines_for_diffm6A']]
Outputs : [[0, 'diffm6A_results']]
Emits : []


Name : SingleNucleotidePrediction
Inputs : [[0, 'group_merged_bed'], [1, 'all_merged_bed'], [2, 'formatted_designfile'], [3, 'sng_bam'], [4, 'fasta'], [5, 'gtf']]
Outputs : [[0, 'prediction_results']]
Emits : []


Name : DiffReport
Inputs : [[0, 'results_arrange'], [1, 'formatted_designfile'], [2, 'compareLines_for_arranged_result']]
Outputs : [[0, 'm6APipe_result'], [1, 'diffReport_result']]
Emits : []


Name : CreateIGVjs
Inputs : [[0, 'm6APipe_result'], [1, 'fasta'], [2, 'gtf'], [3, 'formatted_designfile'], [4, 'group_merged_bed'], [5, 'all_merged_bed'], [6, 'bedgraph_for_igv']]
Outputs : [[0, 'igv_js']]
Emits : []


Name : get_software_versions
Inputs : []
Outputs : [[0, 'software_versions_yaml']]
Emits : []


