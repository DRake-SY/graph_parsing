Name : GetNucleotideSequences
Inputs : [[0, 'gtfs'], [1, 'genome_fasta']]
Outputs : [[0, 'nucleotide_fastas']]
Emits : []


Name : ThreeFrameTranslation
Inputs : [[0, 'nucleotide_fastas']]
Outputs : [[0, 'aa_fastas']]
Emits : []


Name : MergeSampleFastas
Inputs : [[0, 'aa_fastas_combined']]
Outputs : [[0, 'fasta_combined_unique']]
Emits : []


Name : SplitStopCodons
Inputs : [[0, 'fasta_combined_unique']]
Outputs : [[0, 'fasta_nostop']]
Emits : []


Name : DigestTranscriptome
Inputs : [[0, 'fasta_nostop']]
Outputs : [[0, 'peptides']]
Emits : []


Name : PIPredictionOnTranscriptome
Inputs : [[0, 'peptides']]
Outputs : [[0, 'peptides_pI']]
Emits : []


Name : SplitTranscriptomePeptidesToPIDBs
Inputs : [[0, 'peptides_pI'], [1, 'fractions'], [2, 'normPsms']]
Outputs : [[0, 'pI_fastas']]
Emits : []


Name : DigestKnownProteome
Inputs : [[0, 'canonical_proteins_fasta']]
Outputs : [[0, 'canonical_peptides']]
Emits : []


Name : MergeTranscriptomeCanonicalsAndAddDecoys
Inputs : [[0, 'pI_tdbs'], [1, 'canonical_peptides']]
Outputs : [[0, 'combined_tdbs']]
Emits : []


Name : MSGFPlus
Inputs : [[0, 'mzmls_fastas'], [1, 'mods']]
Outputs : [[0, 'mzids'], [1, 'mzidtsvs']]
Emits : []


Name : Percolator
Inputs : [[0, 'mzids2pin']]
Outputs : [[0, 'percolated']]
Emits : []


