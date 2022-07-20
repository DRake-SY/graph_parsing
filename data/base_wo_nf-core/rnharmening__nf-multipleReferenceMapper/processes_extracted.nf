Name : fastqc
Inputs : [[0, 'reads_fastqc_ch']]
Outputs : [[0, 'fastqc_results_ch'], [1, 'fastqc_out']]
Emits : []


Name : adapterremoval
Inputs : [[0, 'reads_ch']]
Outputs : [[0, 'adapter_removed_ch']]
Emits : []


Name : prinseq_derep
Inputs : [[0, 'adapter_removed_ch']]
Outputs : [[0, 'derep_reads_ch']]
Emits : []


Name : bwa_index
Inputs : [[0, 'ref_ch']]
Outputs : [[0, 'bwa_index_ch']]
Emits : []


Name : bwamem
Inputs : [[0, 'derep_reads_ch'], [0, 'bwa_index_ch']]
Outputs : [[0, 'mapping_pair_ch'], [1, 'bam_file']]
Emits : []


Name : qualimap
Inputs : [[0, 'mapping_pair_ch']]
Outputs : [[0, 'qualimap_results_ch']]
Emits : []


Name : multiqc
Inputs : [[0, 'fastqc_results_ch'], [1, 'qualimap_results_ch']]
Outputs : [[0, 'multiqc_report']]
Emits : []


