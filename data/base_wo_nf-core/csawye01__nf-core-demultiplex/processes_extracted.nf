Name : reformat_samplesheet
Inputs : [[0, 'ss_sheet']]
Outputs : [[0, 'standard_samplesheet1'], [0, 'standard_samplesheet2'], [0, 'standard_samplesheet3'], [0, 'standard_samplesheet4'], [1, 'bcl2fastq_results1'], [1, 'bcl2fastq_results2'], [1, 'bcl2fastq_results3'], [2, 'tenx_results1'], [2, 'tenx_results2'], [2, 'tenx_results3'], [2, 'tenx_results4'], [2, 'tenx_results5'], [3, 'tenx_samplesheet1'], [3, 'tenx_samplesheet2']]
Emits : []


Name : check_samplesheet
Inputs : [[0, 'standard_samplesheet1']]
Outputs : [[0, 'resultChannel1'], [0, 'resultChannel2'], [0, 'resultChannel3'], [0, 'resultChannel4'], [0, 'resultChannel5']]
Emits : []


Name : make_fake_SS
Inputs : [[0, 'standard_samplesheet2'], [1, 'resultChannel1']]
Outputs : [[0, 'fake_samplesheet'], [1, 'problem_samples_list1'], [1, 'problem_samples_list2']]
Emits : []


Name : bcl2fastq_problem_SS
Inputs : [[0, 'fake_samplesheet'], [1, 'resultChannel2']]
Outputs : [[0, 'stats_json_file']]
Emits : []


Name : parse_jsonfile
Inputs : [[0, 'stats_json_file'], [1, 'standard_samplesheet3'], [2, 'problem_samples_list1'], [3, 'resultChannel3']]
Outputs : [[0, 'updated_samplesheet1'], [0, 'updated_samplesheet2']]
Emits : []


Name : recheck_samplesheet
Inputs : [[0, 'ss_sheet'], [1, 'updated_samplesheet1'], [2, 'problem_samples_list2'], [3, 'resultChannel4']]
Outputs : [[0, 'PROBLEM_SS_CHECK2']]
Emits : []


Name : cellRangerMkFastQ
Inputs : [[0, 'tenx_samplesheet1'], [1, 'tenx_results1']]
Outputs : [[0, 'cr_undetermined_default_fq_ch'], [0, 'cr_undetermined_fastqs_screen_ch'], [0, 'cr_undetermined_move_fq_ch mode flatten'], [1, 'cr_fastqs_count_ch'], [1, 'cr_fastqs_fqc_ch'], [1, 'cr_fastqs_screen_ch'], [1, 'cr_fastqs_copyfs_ch mode flatten'], [2, 'cr_b2fq_default_reports_ch'], [3, 'cr_b2fq_default_stats_ch']]
Emits : []


Name : cellRangerCount
Inputs : [[0, 'cr_grouped_fastq_dir_sample_ch'], [1, 'tenx_results3']]
Outputs : [[0, 'count_output']]
Emits : []


Name : bcl2fastq_default
Inputs : [[0, 'PROBLEM_SS_CHECK2'], [1, 'resultChannel5'], [2, 'standard_samplesheet4'], [3, 'updated_samplesheet2'], [4, 'bcl2fastq_results1']]
Outputs : [[0, 'fastqs_fqc_ch'], [0, 'fastqs_screen_ch'], [0, 'fastq_kraken_ch mode flatten'], [1, 'fastqs_idx_ch'], [2, 'undetermined_default_fq_ch'], [2, 'undetermined_default_fastqs_screen_ch'], [2, 'undetermined_fastq_kraken_ch mode flatten'], [3, 'undetermined_idx_fq_ch'], [4, 'b2fq_default_reports_ch'], [5, 'b2fq_default_stats_ch']]
Emits : []


Name : fastqc
Inputs : [[0, 'fastqcAll_ch']]
Outputs : [[0, 'fqc_folder_ch'], [0, 'all_fcq_files_tuple'], [1, 'fqc_html_ch']]
Emits : []


Name : fastq_screen
Inputs : [[0, 'grouped_fqscreen_ch'], [1, 'ch_fastq_screen_config']]
Outputs : [[0, 'fastq_screen_txt'], [0, 'all_fq_screen_txt_tuple'], [1, 'fastq_screen_html']]
Emits : []


Name : multiqc
Inputs : [[0, 'fqc_folder_ch'], [1, 'fastq_screen_txt'], [2, 'ch_multiqc_config']]
Outputs : [[0, 'multiqc_report'], [3, 'projectList']]
Emits : []


Name : multiqcAll
Inputs : [[0, 'all_fcq_files'], [1, 'all_fq_screen_files'], [2, 'b2fq_default_stats_all_ch'], [3, 'ch_multiqc_config']]
Outputs : [[0, 'multiqc_report_all']]
Emits : []


Name : get_software_versions
Inputs : []
Outputs : [[0, 'software_versions_yaml']]
Emits : []


Name : output_documentation
Inputs : [[0, 'ch_output_docs']]
Outputs : []
Emits : []


