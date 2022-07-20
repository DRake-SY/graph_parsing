Name : get_software_versions
Inputs : []
Outputs : [[0, 'software_versions_yaml']]
Emits : []


Name : extractReadsMappingToChromosome
Inputs : [[0, 'bam_chr']]
Outputs : [[0, 'bam_files_check']]
Emits : []


Name : checkIfPairedEnd
Inputs : [[0, 'bam_files_check']]
Outputs : [[0, 'bam_files_paired_map_map'], [0, 'bam_files_paired_unmap_unmap'], [0, 'bam_files_paired_unmap_map'], [0, 'bam_files_paired_map_unmap'], [1, 'bam_file_single_end']]
Emits : []


Name : computeFlagstatInput
Inputs : [[0, 'bam_files_flagstats']]
Outputs : [[0, 'ch_bam_flagstat_mqc']]
Emits : []


Name : computeIdxstatsInput
Inputs : [[0, 'bam_files_idxstats']]
Outputs : [[0, 'ch_bam_idxstat_mqc']]
Emits : []


Name : computeStatsInput
Inputs : [[0, 'bam_files_stats']]
Outputs : [[0, 'ch_bam_stats_mqc']]
Emits : []


Name : computeFastQCInput
Inputs : [[0, 'bam_files_fastqc']]
Outputs : [[0, 'ch_fastqc_reports_mqc_input_bam']]
Emits : []


Name : pairedEndMapMap
Inputs : [[0, 'bam_files_paired_map_map']]
Outputs : [[0, 'map_map_bam']]
Emits : []


Name : pairedEndUnmapUnmap
Inputs : [[0, 'bam_files_paired_unmap_unmap']]
Outputs : [[0, 'unmap_unmap_bam']]
Emits : []


Name : pairedEndUnmapMap
Inputs : [[0, 'bam_files_paired_unmap_map']]
Outputs : [[0, 'unmap_map_bam']]
Emits : []


Name : pairedEndMapUnmap
Inputs : [[0, 'bam_files_paired_map_unmap']]
Outputs : [[0, 'map_unmap_bam']]
Emits : []


Name : mergeUnmapped
Inputs : [[0, 'all_unmapped_bam']]
Outputs : [[0, 'merged_unmapped']]
Emits : []


Name : sortExtractMapped
Inputs : [[0, 'map_map_bam']]
Outputs : [[0, 'reads_mapped']]
Emits : []


Name : sortExtractUnmapped
Inputs : [[0, 'merged_unmapped']]
Outputs : [[0, 'reads_unmapped']]
Emits : []


Name : joinMappedAndUnmappedFastq
Inputs : [[0, 'all_fastq']]
Outputs : [[0, 'read_qc']]
Emits : []


Name : pairedEndReadsQC
Inputs : [[0, 'read_qc']]
Outputs : [[0, 'ch_fastqc_reports_mqc_pe']]
Emits : []


Name : sortExtractSingleEnd
Inputs : [[0, 'bam_file_single_end']]
Outputs : [[0, 'single_end_reads']]
Emits : []


Name : singleEndReadQC
Inputs : [[0, 'single_end_reads']]
Outputs : [[0, 'ch_fastqc_reports_mqc_se']]
Emits : []


Name : output_documentation
Inputs : [[0, 'ch_output_docs']]
Outputs : []
Emits : []


Name : multiqc
Inputs : [[0, 'ch_multiqc_config'], [1, 'software_versions_yaml'], [2, 'summary'], [3, 'ch_bam_flagstat_mqc'], [4, 'ch_bam_stats_mqc'], [5, 'ch_bam_idxstat_mqc'], [6, 'ch_fastqc_reports_mqc_input_bam'], [7, 'ch_fastqc_reports_mqc_se'], [8, 'ch_fastqc_reports_mqc_pe']]
Outputs : []
Emits : []


