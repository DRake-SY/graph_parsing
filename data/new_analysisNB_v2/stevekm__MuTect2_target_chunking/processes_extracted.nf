Name : mutect2_noChunk
Inputs : [[0, 'input_noChunk_ch']]
Outputs : [[0, 'variants_noChunk']]
Emits : []


Name : filter_vcf_noChunk
Inputs : [[0, 'variants_noChunk']]
Outputs : [[0, 'variants_noChunk_filtered']]
Emits : []


Name : vcf_to_tsv_noChunk
Inputs : [[0, 'variants_noChunk_filtered'], [0, 'ref_fasta6'], [0, 'ref_fai6'], [0, 'ref_dict6']]
Outputs : [[0, 'vcf_tsv_noChunk']]
Emits : []


Name : bed_chromChunk
Inputs : [[0, 'targets_chroms']]
Outputs : [[0, 'chromChunk_targets']]
Emits : []


Name : mutect2_chromChunk
Inputs : [[0, 'input_chromChunk_ch']]
Outputs : [[0, 'variants_chromChunk']]
Emits : []


Name : filter_vcf_chromChunk
Inputs : [[0, 'variants_chromChunk']]
Outputs : [[0, 'variants_chromChunk_filtered']]
Emits : []


Name : vcf_to_tsv_chromChunk
Inputs : [[0, 'variants_chromChunk_filtered'], [0, 'ref_fasta5'], [0, 'ref_fai5'], [0, 'ref_dict5']]
Outputs : [[0, 'vcf_tsv_chromChunk']]
Emits : []


Name : bed_nChunk
Inputs : [[0, 'nChunk_target']]
Outputs : [[0, 'chunked_targets']]
Emits : []


Name : mutect2_nChunk
Inputs : [[0, 'input_nChunk_ch']]
Outputs : [[0, 'variants_nChunk']]
Emits : []


Name : filter_vcf_nChunk
Inputs : [[0, 'variants_nChunk']]
Outputs : [[0, 'variants_nChunk_filtered']]
Emits : []


Name : vcf_to_tsv_nChunk
Inputs : [[0, 'variants_nChunk_filtered'], [0, 'ref_fasta4'], [0, 'ref_fai4'], [0, 'ref_dict4']]
Outputs : [[0, 'vcf_tsv_nChunk']]
Emits : []


Name : targetChunkLines
Inputs : [[0, 'lineChunk_target']]
Outputs : [[0, 'line_chunked_targets']]
Emits : []


Name : mutect2_lineChunk
Inputs : [[0, 'input_lineChunk_ch']]
Outputs : [[0, 'variants_lineChunk']]
Emits : []


Name : filter_vcf_lineChunk
Inputs : [[0, 'variants_lineChunk']]
Outputs : [[0, 'variants_lineChunk_filtered']]
Emits : []


Name : vcf_to_tsv_lineChunk
Inputs : [[0, 'variants_lineChunk_filtered'], [0, 'ref_fasta8'], [0, 'ref_fai8'], [0, 'ref_dict8']]
Outputs : [[0, 'vcf_tsv_lineChunk']]
Emits : []


Name : annotate
Inputs : [[0, 'vcfs_tsvs'], [0, 'annovar_db_dir']]
Outputs : [[0, 'vcfs_tsvs_annotations']]
Emits : []


Name : merge_tables
Inputs : [[0, 'vcfs_tsvs_annotations']]
Outputs : [[0, 'merged_tables']]
Emits : []


