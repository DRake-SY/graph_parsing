Name : crawl_and_mirror
Inputs : []
Outputs : [[0, 'CRAWL_AND_MIRROR_OUT']]
Emits : []


Name : create_index_jobs
Inputs : [[0, 'CRAWL_AND_MIRROR_OUT']]
Outputs : [[0, 'INDEX_JOB_FILES']]
Emits : []


Name : calculate_memory
Inputs : [[0, 'INDEX_JOB_FILE_LIST']]
Outputs : [[0, 'INDEX_JOB_SET']]
Emits : []


Name : index_genome
Inputs : [[0, 'INDEX_JOB_SET']]
Outputs : []
Emits : []


