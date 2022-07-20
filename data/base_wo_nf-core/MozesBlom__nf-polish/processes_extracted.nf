Name : fastqc
Inputs : [[0, 'read_pairs_ch']]
Outputs : [[1, 'fastqc_stats_ch']]
Emits : []


Name : dedup
Inputs : [[0, 'read_pairs2_ch']]
Outputs : [[0, 'sample_id'], [2, 'dedup_ch'], [3, 'dedup_stats_ch']]
Emits : []


Name : trim_adapt_dedup
Inputs : [[0, 'dedup_ch']]
Outputs : [[0, 'sample_id'], [3, 'trim_adapt_ch'], [4, 'trim_adapt_stats_ch']]
Emits : []


Name : trim_adapt
Inputs : [[0, 'read_pairs2_ch']]
Outputs : [[0, 'sample_id'], [3, 'trim_adapt_ch'], [4, 'trim_adapt_stats_ch']]
Emits : []


Name : merge
Inputs : [[0, 'sample_id'], [1, 'r1_trimAdapt'], [2, 'r2_trimAdapt'], [3, 'trim_adapt_ch']]
Outputs : [[0, 'sample_id'], [3, 'merge_ch'], [4, 'merge_stats_ch']]
Emits : []


Name : trim_qual
Inputs : [[0, 'merge_ch']]
Outputs : [[0, 'sample_id'], [3, 'qual_ch'], [4, 'qual_stats_ch']]
Emits : []


Name : low_complex
Inputs : [[0, 'qual_ch']]
Outputs : [[0, 'sample_id'], [3, 'low_complex_ch'], [4, 'low_complex_stats_ch']]
Emits : []


Name : summarize_stats_withDedup
Inputs : [[0, 'sample_id'], [1, 'fqc_stats_fn'], [2, 'dedup_stats_fn'], [3, 'adapt_stats_fn'], [4, 'merge_stats_fn'], [5, 'qual_stats_fn'], [6, 'fastqc_stats_ch'], [6, 'dedup_stats_ch'], [6, 'trim_adapt_stats_ch'], [6, 'merge_stats_ch'], [6, 'qual_stats_ch'], [6, 'low_complex_stats_ch']]
Outputs : []
Emits : []


Name : summarize_stats
Inputs : [[0, 'sample_id'], [1, 'fqc_stats_fn'], [2, 'adapt_stats_fn'], [3, 'merge_stats_fn'], [4, 'qual_stats_fn'], [5, 'fastqc_stats_ch'], [5, 'trim_adapt_stats_ch'], [5, 'merge_stats_ch'], [5, 'qual_stats_ch'], [5, 'low_complex_stats_ch']]
Outputs : []
Emits : []


