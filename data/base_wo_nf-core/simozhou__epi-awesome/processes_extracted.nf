Name : get_software_versions
Inputs : []
Outputs : [[0, 'software_versions_yaml']]
Emits : []


Name : buildIndex
Inputs : [[0, 'fasta']]
Outputs : [[0, 'genome_index']]
Emits : []


Name : fastqc
Inputs : [[0, 'read_files_fastqc']]
Outputs : [[0, 'fastqc_results']]
Emits : []


Name : multiqc
Inputs : [[0, 'ch_multiqc_config'], [1, 'fastqc_results'], [2, 'software_versions_yaml'], [3, 'summary']]
Outputs : [[0, 'multiqc_report']]
Emits : []


Name : bowtie2
Inputs : [[0, 'fasta'], [1, 'read_files_trimming'], [2, 'genome_index']]
Outputs : [[0, 'bowtie_output']]
Emits : []


Name : samtools
Inputs : [[0, 'bowtie_output']]
Outputs : [[0, 'sorted_bams']]
Emits : []


Name : macs2
Inputs : [[0, 'sorted_bams'], [1, 'macs_para']]
Outputs : [[0, 'macs_results']]
Emits : []


Name : output_documentation
Inputs : [[0, 'ch_output_docs']]
Outputs : []
Emits : []


