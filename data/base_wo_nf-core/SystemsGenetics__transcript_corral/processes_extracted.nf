Name : retrieve_sra_metadata
Inputs : [[0, 'SRR_FILE'], [1, 'SKIP_SAMPLES_FILE']]
Outputs : [[0, 'REMOTE_SAMPLES_LIST'], [1, 'METADATA_FAILED_RUNS']]
Emits : []


Name : write_sample_files
Inputs : [[0, 'ALL_SAMPLES']]
Outputs : [[0, 'SAMPLE_FILES']]
Emits : []


Name : get_software_versions
Inputs : []
Outputs : [[0, 'ch_software_versions_yaml']]
Emits : []


Name : read_sample_file
Inputs : [[0, 'SAMPLE_FILES']]
Outputs : [[0, 'SAMPLE_FILE_CONTENTS']]
Emits : []


Name : download_runs
Inputs : [[0, 'REMOTE_SAMPLES']]
Outputs : [[0, 'SRA_TO_EXTRACT'], [1, 'DOWNLOAD_FAILED_RUNS']]
Emits : []


Name : fastq_dump
Inputs : [[0, 'SRA_TO_EXTRACT']]
Outputs : [[0, 'DOWNLOADED_FASTQ_FOR_MERGING'], [1, 'FASTQ_DUMP_FAILED_RUNS']]
Emits : []


Name : fastq_merge
Inputs : [[0, 'DOWNLOADED_FASTQ_FOR_MERGING']]
Outputs : [[0, 'MERGED_SAMPLES_FOR_TRIMMING']]
Emits : []


Name : failed_run_report
Inputs : [[0, 'METADATA_FAILED_RUNS'], [1, 'DOWNLOAD_FAILED_RUNS'], [2, 'FASTQ_DUMP_FAILED_RUNS'], [3, 'FAILED_RUN_TEMPLATE']]
Outputs : [[0, 'FAILED_RUN_REPORT']]
Emits : []


Name : trim_adapters
Inputs : [[0, 'COMBINED_SAMPLES']]
Outputs : [[0, 'TRIMMED_PAIRS']]
Emits : []


Name : error_correction
Inputs : [[0, 'TRIMMED_PAIRS']]
Outputs : [[0, 'CORRECTED_PAIRS']]
Emits : []


Name : discard_unfixables
Inputs : [[0, 'CORRECTED_PAIRS']]
Outputs : [[0, 'CORRECTED_PAIRS_CLEAN']]
Emits : []


Name : remove_rRNA
Inputs : [[0, 'CORRECTED_PAIRS_CLEAN']]
Outputs : [[0, 'FORWARD_READS_FOR_ASSEMBLY'], [1, 'REVERSE_READS_FOR_ASSEMBLY']]
Emits : []


Name : assembly_Trinity
Inputs : [[0, 'FORWARD_READS_FOR_TRINITY'], [1, 'REVERSE_READS_FOR_TRINITY']]
Outputs : [[0, 'TRANSCRIPTOME_ASSEMBLIES']]
Emits : []


Name : unify_assembly_ids
Inputs : [[0, 'COMBINED_ASSEMBLY']]
Outputs : [[0, 'UNIFIED_COMBINED_ASSEMBLY']]
Emits : []


Name : evigene
Inputs : [[0, 'UNIFIED_COMBINED_ASSEMBLY']]
Outputs : [[0, 'EVIGENE_OKAY_SET']]
Emits : []


