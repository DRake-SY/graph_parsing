OPERATION_1 string : Channel
    .fromPath(params.fasta)
    .ifEmpty { exit 1, "fasta annotation file not found: ${params.fasta}" }
    .into {fasta_to_index; fasta_minimap2; fasta_clairvoyante; fasta_sniffles}
OPERATION_1 origin : [['params.fasta', 'A']]
OPERATION_1 gives  : [['fasta_to_index', 'P'], ['fasta_minimap2', 'P'], ['fasta_clairvoyante', 'P'], ['fasta_sniffles', 'P']]


OPERATION_2 string : Channel
    .fromPath(params.fai)
    .ifEmpty{exit 1, "FASTA index file not found: ${params.fai}"}
    .into {fai_clairvoyante; fai_sniffles}
OPERATION_2 origin : [['params.fai', 'A']]
OPERATION_2 gives  : [['fai_clairvoyante', 'P'], ['fai_sniffles', 'P']]


OPERATION_3 string : Channel.fromPath(params.data)
           .ifEmpty { exit 1, "Trained model data file for Clairvoyante not found: ${params.data}" }
           .set { model_data }
OPERATION_3 origin : [['params.data', 'A']]
OPERATION_3 gives  : [['model_data', 'P']]


OPERATION_4 string : Channel.fromPath(params.index)
           .ifEmpty { exit 1, "Trained model index file for Clairvoyante not found: ${params.index}" }
           .set { model_index }
OPERATION_4 origin : [['params.index', 'A']]
OPERATION_4 gives  : [['model_index', 'P']]


OPERATION_5 string : Channel.fromPath(params.meta)
           .ifEmpty { exit 1, "Trained model meta file for Clairvoyante not found: ${params.meta}" }
           .set { model_meta }
OPERATION_5 origin : [['params.meta', 'A']]
OPERATION_5 gives  : [['model_meta', 'P']]


OPERATION_6 string : Channel
      .fromPath(params.reads)
      .map { file -> tuple(file.baseName, file) }
      .ifEmpty { exit 1, "Cannot find any reads matching: ${params.reads}\nNB: Path needs to be enclosed in quotes" }
      .set { reads_minimap2 }
OPERATION_6 origin : [['params.reads', 'A']]
OPERATION_6 gives  : [['reads_minimap2', 'P']]


OPERATION_7 string : minimap2 = reads_minimap2.combine(fasta_minimap2)
OPERATION_7 origin : [['reads_minimap2', 'P'], ['fasta_minimap2', 'P']]
OPERATION_7 gives  : [['minimap2', 'P']]


OPERATION_8 string : clairvoyante = marked_bam_clairvoyante.merge(fasta_clairvoyante, fai_clairvoyante, model_data, model_index, model_meta)
OPERATION_8 origin : [['marked_bam_clairvoyante', 'P'], ['fasta_clairvoyante', 'P'], ['fai_clairvoyante', 'P'], ['model_data', 'P'], ['model_index', 'P'], ['model_meta', 'P']]
OPERATION_8 gives  : [['clairvoyante', 'P']]


OPERATION_9 string : sniffles_preprocessing = marked_bam_sniffles.merge(fasta_sniffles, fai_sniffles)
OPERATION_9 origin : [['marked_bam_sniffles', 'P'], ['fasta_sniffles', 'P'], ['fai_sniffles', 'P']]
OPERATION_9 gives  : [['sniffles_preprocessing', 'P']]


OPERATION_10 string : sniffles_vcf
    .map { file -> tuple(file.baseName, file) }
    .into { sniffles_vcf_length; sniffles_vcf_carriers }
OPERATION_10 origin : [['sniffles_vcf', 'P']]
OPERATION_10 gives  : [['sniffles_vcf_length', 'P'], ['sniffles_vcf_carriers', 'P']]


OPERATION_11 string : svim_filtered_vcf
    .map { file -> tuple(file.baseName, file) }
    .into { svim_filtered_vcf_length; svim_filtered_vcf_carriers}
OPERATION_11 origin : [['svim_filtered_vcf', 'P']]
OPERATION_11 gives  : [['svim_filtered_vcf_length', 'P'], ['svim_filtered_vcf_carriers', 'P']]


