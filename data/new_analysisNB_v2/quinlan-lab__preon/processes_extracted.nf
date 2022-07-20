Name : map_reads
Inputs : [[0, 'fastq_ch'], [1, 'fasta'], [2, 'bwaidx_ch']]
Outputs : [[0, 'bwa_ch']]
Emits : []


Name : mark_duplicates
Inputs : [[0, 'bwa_ch']]
Outputs : [[0, ''], [1, '']]
Emits : []


Name : upload_alignments
Inputs : [[0, 'params'], [1, 'params'], [2, 'alignments_upload_ch'], [3, 'alignment_indexes_upload_ch']]
Outputs : []
Emits : []


Name : run_freebayes
Inputs : [[0, 'alignments_ch'], [1, 'alignment_indexes_ch'], [2, 'intervals_ch'], [3, 'fasta'], [4, 'faidx']]
Outputs : [[0, '']]
Emits : []


Name : merge_vcfs
Inputs : [[0, 'unannotated_ch'], [1, 'fasta'], [2, 'faidx']]
Outputs : [[0, 'freebayesvcf_ch'], [1, 'freebayesvcfidx_ch']]
Emits : []


Name : upload_vcfs
Inputs : [[0, 'params'], [1, 'params'], [2, 'freebayesvcf_ch'], [3, 'freebayesvcfidx_ch']]
Outputs : []
Emits : []


Name : annotate_vcf
Inputs : [[0, 'vcf_ch'], [1, 'cadd_indel'], [2, 'cadd_indel_idx'], [3, 'cadd_snv'], [4, 'cadd_snv_idx']]
Outputs : [[0, 'annotated_ch']]
Emits : []


Name : merge_annotated_vcfs
Inputs : [[0, 'annotated_ch'], [1, 'fasta'], [2, 'faidx']]
Outputs : [[0, ''], [1, 'vepvcfidx_ch']]
Emits : []


Name : upload_annotated_vcfs
Inputs : [[0, 'params'], [1, 'params'], [2, 'vepvcf_ch'], [3, 'vepvcfidx_ch']]
Outputs : []
Emits : []


Name : smoove_call
Inputs : [[0, 'params'], [1, 'call_bams'], [2, 'fasta'], [3, 'faidx'], [4, 'bed']]
Outputs : [[0, 'call_vcfs'], [1, 'call_idxs'], [2, 'variant_counts'], [3, 'sequence_counts']]
Emits : []


Name : smoove_merge
Inputs : [[0, 'call_vcfs'], [1, 'call_idxs'], [2, 'fasta'], [3, 'faidx']]
Outputs : [[0, 'sites']]
Emits : []


Name : smoove_genotype
Inputs : [[0, 'params'], [1, 'genotype_bams'], [2, 'sites'], [3, 'fasta'], [4, 'faidx']]
Outputs : [[0, 'genotyped_idxs'], [1, 'genotyped_vcfs']]
Emits : []


Name : smoove_square
Inputs : [[0, 'genotyped_vcfs'], [1, 'genotyped_idxs'], [2, 'gff']]
Outputs : [[0, 'square_vcf'], [1, 'square_idx'], [2, 'svvcf']]
Emits : []


Name : run_indexcov
Inputs : [[0, 'indexcov_input_ch'], [1, 'faidx']]
Outputs : [[2, 'bed_ch'], [3, 'indexcov_ped_ch'], [4, 'roc_ch']]
Emits : []


Name : build_covviz_report
Inputs : [[0, 'indexcov_ped_ch'], [1, 'bed_ch'], [2, 'gff']]
Outputs : []
Emits : []


Name : make_somatic
Inputs : [[0, 'somaticvcf_ch'], [1, 'params']]
Outputs : []
Emits : []


