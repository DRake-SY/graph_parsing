Name : DOWNLOAD_GENOME
Inputs : [[0, 'GENOME_ASSEMBLY']]
Outputs : [[0, 'GENOME_FASTA'], [1, 'GENOME_CHROMSIZES'], [2, 'GENOME_INDEX']]
Emits : []


Name : RESTRICT_GENOME
Inputs : [[0, 'GENOME_ASSEMBLY'], [1, 'GENOME_FASTA'], [2, 'LIST_RENZ']]
Outputs : [[0, 'GENOME_RENZ']]
Emits : []


Name : PREPARE_RNA_ANNOTATION
Inputs : [[0, 'GENOME_RNA_ANNOT_NAME']]
Outputs : [[0, 'GENOME_SPLICESITES'], [1, 'RNA_ANNOT_FILE']]
Emits : []


Name : DOWNLOAD_FASTQ
Inputs : [[0, 'FASTQ_PATHS']]
Outputs : [[0, 'DOWNLOADED']]
Emits : []


Name : SPLIT_FASTQ_INTO_CHUNKS
Inputs : [[0, 'LIB_FASTQ']]
Outputs : [[0, 'LIB_SPLIT_FASTQ_RAW']]
Emits : []


Name : CREATE_READS_TABLE_CHUNKS
Inputs : [[0, 'LIB_SPLIT_FASTQ_TO_TABLE']]
Outputs : [[0, 'LIB_TABLE_FASTQ']]
Emits : []


Name : DEDUP
Inputs : [[0, 'LIB_FASTQ_TO_FASTUNIQ']]
Outputs : [[0, 'IDS_FASTUNIQ']]
Emits : []


Name : TRIM_CHUNKS
Inputs : [[0, 'LIB_SPLIT_FASTQ_TO_TRIM']]
Outputs : [[0, 'LIB_TRIMMED']]
Emits : []


Name : CREATE_TRIM_TABLE_CHUNKS
Inputs : [[0, 'LIB_FOR_GET_TRIM_OUTPUT']]
Outputs : [[0, 'LIB_TRIMTABLE']]
Emits : []


Name : INDEX_OLIGOS
Inputs : [[0, 'LIB_OLIGOS_RAW']]
Outputs : [[0, 'LIB_OLIGOS_CINDEX']]
Emits : []


Name : INDEX_CHUNKS
Inputs : [[0, 'LIB_SPLIT_FASTQ_TO_CINDEX']]
Outputs : [[0, 'LIB_FASTQ_CINDEX']]
Emits : []


Name : SEARCH_OLIGOS_CHUNKS
Inputs : [[0, 'LIB_FOR_OLIGOS_MAPPING']]
Outputs : [[0, 'LIB_MAPPED_OLIGOS']]
Emits : []


Name : CHECK_GA
Inputs : [[0, 'LIB_FOR_GA']]
Outputs : [[0, 'LIB_MAPPED_GA']]
Emits : []


Name : CHECK_COMPLEMENTARY_RNA_CHUNKS
Inputs : [[0, 'LIB_FOR_RNACOMP']]
Outputs : [[0, 'LIB_COUT_RNACOMP']]
Emits : []


Name : GET_DNA_FRAGMENTS_CHUNKS
Inputs : [[0, 'LIB_FOR_SUBSTR_DNA']]
Outputs : [[0, 'LIB_SUBSTR_DNA'], [1, 'LIB_SUBSTR_DNA_EXT'], [2, 'LIB_SUBSTR_DNA_INFO']]
Emits : []


Name : GET_RNA1_FRAGMENTS_CHUNKS
Inputs : [[0, 'LIB_FOR_SUBSTR_RNA1']]
Outputs : [[0, 'LIB_SUBSTR_RNA1'], [1, 'LIB_SUBSTR_RNA1_INFO']]
Emits : []


Name : GET_RNA2_FRAGMENTS_CHUNKS
Inputs : [[0, 'LIB_FOR_SUBSTR_RNA2']]
Outputs : [[0, 'LIB_SUBSTR_RNA2'], [1, 'LIB_SUBSTR_RNA2_INFO']]
Emits : []


Name : MAP_DNA_NONEXTENDED_CHUNKS
Inputs : [[0, 'LIB_FOR_DNA_MAPPING']]
Outputs : [[0, 'LIB_SAM_DNA']]
Emits : []


Name : MAP_DNA_EXTENDED_CHUNKS
Inputs : [[0, 'LIB_FOR_DNA_MAPPING_EXT']]
Outputs : [[0, 'LIB_SAM_DNA_EXT']]
Emits : []


Name : MAP_RNA1_CHUNKS
Inputs : [[0, 'LIB_FOR_RNA1_MAPPING']]
Outputs : [[0, 'LIB_SAM_RNA1']]
Emits : []


Name : MAP_RNA2_CHUNKS
Inputs : [[0, 'LIB_FOR_RNA2_MAPPING']]
Outputs : [[0, 'LIB_SAM_RNA2']]
Emits : []


Name : SAM2BED_CHUNKS
Inputs : [[0, 'LIB_SAM2BED']]
Outputs : [[0, 'LIB_BED']]
Emits : []


Name : ANNOTATE_RENZYMES_CHUNKS
Inputs : [[0, 'LIB_FOR_RESTR_RUN']]
Outputs : [[0, 'LIB_DISTANCES']]
Emits : []


Name : COLLECT_DATA_CHUNKS
Inputs : [[0, 'LIB_COLLECT']]
Outputs : [[0, 'LIB_COLLECTED']]
Emits : []


Name : COLLECT_FILTERS_CHUNKS
Inputs : [[0, 'LIB_COLLECTED_FOR_FILTERS']]
Outputs : [[0, 'LIB_FILTERS']]
Emits : []


Name : WRITE_STATS_CHUNKS
Inputs : [[0, 'LIB_FILTERS_STATS']]
Outputs : [[0, 'FILES_STATS']]
Emits : []


Name : MERGE_STATS
Inputs : [[0, 'FILES_STATS_FOR_MERGE']]
Outputs : [[0, 'FILES_STATS_MERGED']]
Emits : []


Name : WRITE_FINAL_TABLE_CHUNKS
Inputs : [[0, 'LIB_FOR_WRITING']]
Outputs : [[0, 'FILES_TABLE']]
Emits : []


Name : MERGE_TABLE
Inputs : [[0, 'FILES_TABLE_FOR_MERGE']]
Outputs : [[0, 'FILES_TABLE_MERGED']]
Emits : []


Name : WRITE_COOLER
Inputs : [[0, 'TABLES_FOR_COOLER']]
Outputs : [[0, 'COOLERS']]
Emits : []


