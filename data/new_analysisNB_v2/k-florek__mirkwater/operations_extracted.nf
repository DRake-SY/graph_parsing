OPERATION_1 string : Channel
    .fromPath("${params.pacbio}/*.bam")
    .set { pacbio_reads }
OPERATION_1 origin : [['"${params.pacbio}/*.bam"', 'A']]
OPERATION_1 gives  : [['pacbio_reads', 'P']]


OPERATION_2 string : Channel
  .fromPath(params.reference_genome, checkIfExists: true, type: 'file')
  .into { reference_genome; reference_genome_cluster }
OPERATION_2 origin : [["params.reference_genome, checkIfExists: true, type: 'file'", 'A']]
OPERATION_2 gives  : [['reference_genome', 'P'], ['reference_genome_cluster', 'P']]


OPERATION_3 string : Channel
  .fromPath(params.reference_gff, checkIfExists: true, type: 'file')
  .set { reference_genome_gff }
OPERATION_3 origin : [["params.reference_gff, checkIfExists: true, type: 'file'", 'A']]
OPERATION_3 gives  : [['reference_genome_gff', 'P']]


OPERATION_4 string : Channel
  .fromPath(params.snpEff_database, checkIfExists: true, type: 'file')
  .set { snpeff_database_input }
OPERATION_4 origin : [["params.snpEff_database, checkIfExists: true, type: 'file'", 'A']]
OPERATION_4 gives  : [['snpeff_database_input', 'P']]


OPERATION_5 string : pacbio_reads
  .combine(reference_genome)
  .combine(reference_genome_gff)
  .set { pacbio_reads_reference }
OPERATION_5 origin : [['pacbio_reads', 'P'], ['reference_genome', 'P'], ['reference_genome_gff', 'P']]
OPERATION_5 gives  : [['pacbio_reads_reference', 'P']]


OPERATION_6 string : prep_variant_calls
  .flatten()
  .combine(snpeff_database_input)
  .set { annotation_input }
OPERATION_6 origin : [['prep_variant_calls', 'P'], ['snpeff_database_input', 'P']]
OPERATION_6 gives  : [['annotation_input', 'P']]


