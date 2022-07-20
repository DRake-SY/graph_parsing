Name : FastQC
Inputs : [[0, 'fastqc_pairs']]
Outputs : [[0, '']]
Emits : []


Name : QualityControl
Inputs : [[0, 'read_pairs']]
Outputs : [[0, ''], [1, ''], [2, '']]
Emits : []


Name : BuildReferenceIndex
Inputs : [[0, 'reference']]
Outputs : [[0, 'index']]
Emits : []


Name : AlignReadsToGenome
Inputs : [[0, 'paired_fastq_alignment'], [1, 'index']]
Outputs : [[0, 'prokka_sam'], [1, 'freebayes_sam']]
Emits : []


Name : AssembleReads
Inputs : [[0, 'paired_fastq_assembly']]
Outputs : [[0, ''], [1, ''], [2, '']]
Emits : []


Name : FindAribaMarkers
Inputs : [[0, 'paired_fastq_ariba']]
Outputs : [[0, ''], [1, ''], [2, ''], [3, ''], [4, ''], [5, ''], [6, ''], [7, '']]
Emits : []


Name : SummarizeAribaReports
Inputs : [[0, 'ariba_card_reports'], [1, 'ariba_megares_reports'], [2, 'ariba_plasmidfinder_reports'], [3, 'ariba_virulencefinder_reports']]
Outputs : [[0, '']]
Emits : []


Name : SeparatePlasmidContigs
Inputs : [[0, 'spades_contigs_ariba'], [1, 'ariba_plasmidfinder_assemblies']]
Outputs : [[0, ''], [1, '']]
Emits : []


Name : FindPhages
Inputs : [[0, 'spades_contigs_phaster']]
Outputs : [[0, '']]
Emits : []


Name : AnnotateGenomeAssemblies
Inputs : [[0, 'genome_contigs']]
Outputs : [[0, '']]
Emits : []


Name : AnnotatePlasmidAssemblies
Inputs : [[0, 'plasmid_contigs']]
Outputs : [[0, '']]
Emits : []


