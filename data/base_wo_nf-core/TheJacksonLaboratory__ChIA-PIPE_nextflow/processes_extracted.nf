Name : detect_linker_pigz
Inputs : [[0, 'sample_fastqs_ch']]
Outputs : [[0, ''], [1, ''], [2, 'none_fq'], [3, 'stat_cpuprg'], [4, 'log_cpuprg']]
Emits : []


Name : map_pair
Inputs : [[0, 'linker_pe_fq'], [1, 'log_cpuprg']]
Outputs : [[0, ''], [1, 'xls_pe_bam'], [2, 'xls_nrpe_bam'], [3, 'cluster_gz'], [4, 'log_map'], [5, 'log_map_dedup'], [6, 'log_map_gz'], [7, 'log_map_stat'], [8, 'log_map_BE'], [9, 'log_map_pe']]
Emits : []


Name : bam2pairs_juicer
Inputs : [[0, 'map_pe_bam1'], [1, 'log_map_pe']]
Outputs : [[0, ''], [1, 'log_juicer'], [2, 'hic_juicer'], [3, 'log_map_pairgz'], [4, 'log_map_px2']]
Emits : []


Name : map_single
Inputs : [[0, 'linker_se_fq'], [1, 'log_juicer']]
Outputs : [[0, ''], [1, ''], [2, 'log_map_se'], [3, 'log_map_se_xls'], [4, 'log_map_se_dedup']]
Emits : []


Name : map_none
Inputs : [[0, 'none_fq'], [1, 'log_map_se']]
Outputs : [[0, ''], [1, ''], [2, 'log_map_no'], [3, 'log_map_no_xls'], [4, 'log_map_no_dedup']]
Emits : []


Name : convert_format
Inputs : [[0, 'map_pe_bam'], [1, 'map_se_bam'], [2, 'map_no_bam']]
Outputs : [[0, ''], [1, ''], [2, 'cvt_fmt_tag'], [3, 'log_cvt_fmt_bam']]
Emits : []


Name : make_bedgraph
Inputs : [[0, 'cvt_fmt_bam'], [1, 'cvt_fmt_bai'], [2, 'log_map_no']]
Outputs : [[0, ''], [1, '']]
Emits : []


Name : make_bigwig
Inputs : [[0, 'mk_bg_bed'], [1, 'cvt_fmt_bai']]
Outputs : [[0, '']]
Emits : []


Name : call_peak_spp
Inputs : [[0, 'cvt_fmt_bam1'], [1, 'cvt_fmt_bai1'], [2, 'log_mk_bg1']]
Outputs : [[0, 'log_spp'], [1, '']]
Emits : []


Name : call_peak_macs2
Inputs : [[0, 'cvt_fmt_bam1'], [1, 'cvt_fmt_bai1'], [2, 'log_mk_bg2']]
Outputs : [[0, 'log_macs2'], [1, '']]
Emits : []


Name : final_stats
Inputs : [[0, 'stat_cpuprg'], [1, 'xls_pe_bam'], [2, 'xls_nrpe_bam'], [3, 'cvt_fmt_tag'], [4, 'input_peak'], [5, 'cluster_gz'], [6, 'ch_seq']]
Outputs : [[0, '']]
Emits : []


