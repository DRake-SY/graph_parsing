Name : preProcessPacBioBAM
Inputs : [[0, 'pacbio_reads_reference']]
Outputs : [[0, 'fastq_reads_mapping'], [0, 'fastq_reads_pbaa'], [1, 'reference_genome_index_pbaa'], [2, 'read_index']]
Emits : []


Name : pbaa
Inputs : [[0, 'fastq_reads_pbaa'], [1, 'reference_genome_index_pbaa'], [2, 'read_index']]
Outputs : [[0, 'passed_clusters']]
Emits : []


Name : cluster_seq_alignment
Inputs : [[0, 'passed_clusters'], [1, 'reference_genome_cluster']]
Outputs : [[0, 'cluster_alignment']]
Emits : []


Name : cluster_variant_sites
Inputs : [[0, 'cluster_alignment']]
Outputs : [[0, 'cluster_variants']]
Emits : []


Name : prep_variant_calls
Inputs : [[0, 'cluster_variants']]
Outputs : [[0, 'prep_variant_calls']]
Emits : []


Name : annotate_variants
Inputs : [[0, 'annotation_input']]
Outputs : [[0, 'annotated_variants']]
Emits : []


Name : find_hits
Inputs : [[0, 'annotated_variants']]
Outputs : [[0, 'lineage_hits']]
Emits : []


Name : mapping_reads
Inputs : [[0, 'fastq_reads_mapping']]
Outputs : [[0, 'mapped_reads']]
Emits : []


Name : ivar_variant_calling
Inputs : [[0, 'mapped_reads']]
Outputs : []
Emits : []


Name : summary
Inputs : [[0, 'lineage_hits']]
Outputs : [[0, 'results']]
Emits : []


