OPERATION_1 string : multi_lane_input_fq = Channel
        .fromFilePairs("${params.input_fq_dir}${params.fastq_file_regex}", size: 2)
        .filter {it[0] =~ "^$params.sample_name_regex"}
        .map(extract_sample_code_multi_lane)
        .groupTuple(size: 4)
        .map(flattenFileList)
OPERATION_1 origin : [['"${params.input_fq_dir}${params.fastq_file_regex}", size: 2', 'A']]
OPERATION_1 gives  : [['multi_lane_input_fq', 'P']]


OPERATION_2 string : input_fq = Channel
        .fromPath("${params.input_fq_dir}${params.fastq_file_regex}")
        .map(extract_sample_code_single_lane)
        .groupTuple(size:2, sort:"true")
OPERATION_2 origin : [['"${params.input_fq_dir}${params.fastq_file_regex}"', 'A']]
OPERATION_2 gives  : [['input_fq', 'P']]


OPERATION_3 string : indexed_genomes = Channel.fromPath( "${params.index_dir}*.ht2" )
    .map(extract_sample_name)
    .groupTuple(size: 8)
OPERATION_3 origin : [['"${params.index_dir}*.ht2"', 'A']]
OPERATION_3 gives  : [['indexed_genomes', 'P']]


OPERATION_4 string : mRNAgff = Channel.fromPath("${params.mRNAgff_dir}*.gff")
          .map(extract_sample_name)
OPERATION_4 origin : [['"${params.mRNAgff_dir}*.gff"', 'A']]
OPERATION_4 gives  : [['mRNAgff', 'P']]


OPERATION_5 string : flattened_file_list = list_of_paired_files.flatten()
OPERATION_5 origin : [['list_of_paired_files', 'P']]
OPERATION_5 gives  : [['flattened_file_list', 'P']]


OPERATION_6 string : input_fq
    .tap{input_fq_qc}
    .tap{input_fq_umi}
OPERATION_6 origin : [['input_fq', 'P']]
OPERATION_6 gives  : [['input_fq_qc', 'P'], ['input_fq_umi', 'P']]


OPERATION_7 string : input_fq_umi
        .tap{input_fq_cut}
OPERATION_7 origin : [['input_fq_umi', 'P']]
OPERATION_7 gives  : [['input_fq_cut', 'P']]


OPERATION_8 string : reads_genome_tuple = indexed_genomes
    .join(cut_fq)
OPERATION_8 origin : [['indexed_genomes', 'P'], ['cut_fq', 'P']]
OPERATION_8 gives  : [['reads_genome_tuple', 'P']]


OPERATION_9 string : deduplicated_bam.into { bedgraph_bam; htscount_bam }
OPERATION_9 origin : [['deduplicated_bam', 'P']]
OPERATION_9 gives  : [['bedgraph_bam', 'P'], ['htscount_bam', 'P']]


OPERATION_10 string : aligned_sorted_bam.into { bedgraph_bam; htscount_bam }
OPERATION_10 origin : [['aligned_sorted_bam', 'P']]
OPERATION_10 gives  : [['bedgraph_bam', 'P'], ['htscount_bam', 'P']]


OPERATION_11 string : gff_bam_tuple = mRNAgff
                .join(sampleid_aln_bam)
OPERATION_11 origin : [['mRNAgff', 'P'], ['sampleid_aln_bam', 'P']]
OPERATION_11 gives  : [['gff_bam_tuple', 'P']]


