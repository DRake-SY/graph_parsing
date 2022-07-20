OPERATION_1 string : fileinfo = Channel
    .from(fq_file.collect { it.tokenize("\t") })
    .map { strain, SM, reads_1, reads_2, pol -> [ strain, SM, file("${reads_1}"), file("${reads_2}"), pol ] }
    .into { fq_file_1;fq_file_2 }
OPERATION_1 origin : []
OPERATION_1 gives  : [['fileinfo', 'P'], ['fq_file_1', 'P'], ['fq_file_2', 'P']]


OPERATION_2 string : Channel
    .from(fq_file.collect { it.tokenize("\t") })
    .map { ST, SM, reads_1, reads_2, pol -> ST  }
    .unique()
    .into { Strains; 
            Strains2}
OPERATION_2 origin : []
OPERATION_2 gives  : [['Strains', 'P'], ['Strains2', 'P']]


OPERATION_3 string : fq_file_trim1
	.combine(transcriptome_index, by: 0)
	.into{mapping_data_set;
             print_mapping}
OPERATION_3 origin : [['fq_file_trim1', 'P']]
OPERATION_3 gives  : [['mapping_data_set', 'P'], ['print_mapping', 'P']]


OPERATION_4 string : fastqc_ch
    .mix(kallisto_log)
    .collect()
    .into{qc_data;
    qc_data_2 }
OPERATION_4 origin : [['fastqc_ch', 'P'], ['kallisto_log', 'P']]
OPERATION_4 gives  : [['qc_data', 'P'], ['qc_data_2', 'P']]


