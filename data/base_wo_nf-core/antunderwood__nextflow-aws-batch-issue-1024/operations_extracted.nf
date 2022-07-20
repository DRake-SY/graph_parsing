OPERATION_1 string : Channel
      .fromPath(accession_number_file)
      .splitText()
      .map{ x -> x.trim()}
      .set { accession_numbers }
OPERATION_1 origin : [['accession_number_file', 'A']]
OPERATION_1 gives  : [['accession_numbers', 'P']]


OPERATION_2 string : Channel
    .fromFilePairs( fastqs )
    .ifEmpty { error "Cannot find any reads matching: ${fastqs}" }
    .set { raw_fastqs }
OPERATION_2 origin : [['fastqs', 'A']]
OPERATION_2 gives  : [['raw_fastqs', 'P']]


OPERATION_3 string : raw_fastqs.into {raw_fastqs_for_qc; raw_fastqs_for_trimming; raw_fastqs_for_length_assessment}
OPERATION_3 origin : [['raw_fastqs', 'P']]
OPERATION_3 gives  : [['raw_fastqs_for_qc', 'P'], ['raw_fastqs_for_trimming', 'P'], ['raw_fastqs_for_length_assessment', 'P']]


OPERATION_4 string : min_read_length_and_raw_fastqs = min_read_length_for_trimming.join(raw_fastqs_for_trimming)
OPERATION_4 origin : [['min_read_length_for_trimming', 'P'], ['raw_fastqs_for_trimming', 'P']]
OPERATION_4 gives  : [['min_read_length_and_raw_fastqs', 'P']]


OPERATION_5 string : mash_output.map { pair_id, file -> find_genome_size(pair_id, file.text) }.into{genome_size_estimation_for_read_correction; genome_size_estimation_for_downsampling}
OPERATION_5 origin : [['mash_output', 'P']]
OPERATION_5 gives  : [['genome_size_estimation_for_read_correction', 'P'], ['genome_size_estimation_for_downsampling', 'P']]


OPERATION_6 string : trimmed_fastqs_and_genome_size = trimmed_fastqs_for_correction.join(genome_size_estimation_for_read_correction).map{ tuple -> [tuple[0], tuple[1], tuple[2]]}
OPERATION_6 origin : [['trimmed_fastqs_for_correction', 'P'], ['genome_size_estimation_for_read_correction', 'P']]
OPERATION_6 gives  : [['trimmed_fastqs_and_genome_size', 'P']]


OPERATION_7 string : base_counts = seqtk_fqchk_output.map { pair_id, file -> find_total_number_of_bases(pair_id, file.text) }
OPERATION_7 origin : [['seqtk_fqchk_output', 'P']]
OPERATION_7 gives  : [['base_counts', 'P']]


OPERATION_8 string : corrected_fastqs_and_genome_size_and_base_count = corrected_fastqs_for_merging.join(genome_size_estimation_for_downsampling).join(base_counts).map{ tuple -> [tuple[0], tuple[1], tuple[2], tuple[3]]}
OPERATION_8 origin : [['corrected_fastqs_for_merging', 'P'], ['genome_size_estimation_for_downsampling', 'P'], ['base_counts', 'P']]
OPERATION_8 gives  : [['corrected_fastqs_and_genome_size_and_base_count', 'P']]


OPERATION_9 string : min_read_length_and_raw_fastqs = min_read_length_for_assembly.join(merged_fastqs)
OPERATION_9 origin : [['min_read_length_for_assembly', 'P'], ['merged_fastqs', 'P']]
OPERATION_9 gives  : [['min_read_length_and_raw_fastqs', 'P']]


OPERATION_10 string : quality_files = qc_post_trimming_files.join(confindr_files).join(quast_files_for_qualifyr).join(scaffolds_for_qc)
OPERATION_10 origin : [['qc_post_trimming_files', 'P'], ['confindr_files', 'P'], ['quast_files_for_qualifyr', 'P'], ['scaffolds_for_qc', 'P']]
OPERATION_10 gives  : [['quality_files', 'P']]


