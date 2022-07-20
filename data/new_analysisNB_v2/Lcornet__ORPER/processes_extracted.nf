Name : RiboDBSetUp
Inputs : [[0, 'ribodb_ch']]
Outputs : [[0, 'ribodir_ch1']]
Emits : []


Name : Taxonomy
Inputs : [[0, 'taxdump_ch']]
Outputs : [[0, 'taxdump_path1'], [1, 'taxdump_path2'], [2, 'taxdir_ch1'], [3, 'taxdir_ch2']]
Emits : []


Name : RefSeq
Inputs : [[0, 'taxdump_path1'], [1, 'params']]
Outputs : [[0, 'refseq_ftp1'], [1, 'refseq_ftp2'], [2, 'refseq_tax1'], [3, 'refseq_tax2']]
Emits : []


Name : GenBank
Inputs : [[0, 'taxdump_path2'], [1, 'params']]
Outputs : [[0, 'genbank_ftp1'], [1, 'genbank_ftp2'], [2, 'genbank_tax1'], [3, 'genbank_tax2']]
Emits : []


Name : GetRefGenomesRefseq
Inputs : [[0, 'params'], [1, 'params'], [2, 'params'], [3, 'refseq_ftp1'], [4, 'refseq_tax1']]
Outputs : [[0, 'refgenomes_ch1'], [1, 'refgenomes_ch2'], [2, 'refgenomes_ch3'], [3, 'reduceRefFtp_ch'], [4, 'refgroupRefseqGC_ch']]
Emits : []


Name : GetRefGenomesGenbank
Inputs : [[0, 'params'], [1, 'params'], [2, 'params'], [3, 'genbank_ftp1'], [4, 'genbank_tax1'], [5, 'refgroupRefseqGC_ch']]
Outputs : [[0, 'refgenomesGB_ch1'], [1, 'refgenomesGB_ch2'], [2, 'refgenomesGB_ch3'], [3, 'reduceRefFtpGB_ch']]
Emits : []


Name : RefGenomesCheckm
Inputs : [[0, 'refgenomes_ch1'], [1, 'refgenomesGB_ch1'], [2, 'params']]
Outputs : [[0, 'refGenomesCheckm_ch']]
Emits : []


Name : RefGenomesBarnapp
Inputs : [[0, 'refgenomes_ch2'], [1, 'refgenomesGB_ch2'], [2, 'params']]
Outputs : [[0, 'refGenomeWithSsu_ch'], [1, 'refRnammer_ch']]
Emits : []


Name : RefGenomesFilter
Inputs : [[0, 'refGenomeWithSsu_ch'], [1, 'refGenomesCheckm_ch'], [2, 'params']]
Outputs : [[0, 'refReliablegenomes_ch']]
Emits : []


Name : RefGenomesDereplication
Inputs : [[0, 'refgenomes_ch3'], [1, 'refgenomesGB_ch3'], [2, 'refReliablegenomes_ch'], [3, 'params']]
Outputs : [[0, 'refDrepReliablegenomes_ch']]
Emits : []


Name : GetRefRelProteomes
Inputs : [[0, 'refDrepReliablegenomes_ch'], [1, 'reduceRefFtp_ch'], [2, 'reduceRefFtpGB_ch']]
Outputs : [[0, 'refReliableproteomes_ch']]
Emits : []


Name : GetOutGenomesRefSeq
Inputs : [[0, 'params'], [1, 'params'], [2, 'params'], [3, 'refseq_ftp2'], [4, 'refseq_tax2']]
Outputs : [[0, 'outgenomes_ch1'], [1, 'outgenomes_ch2'], [2, 'outgenomes_ch3'], [3, 'reduceOutFtp_ch'], [4, 'outgroupRefseqGC_ch']]
Emits : []


Name : GetOutGenomesGenbank
Inputs : [[0, 'params'], [1, 'params'], [2, 'params'], [3, 'genbank_ftp2'], [4, 'genbank_tax2'], [5, 'outgroupRefseqGC_ch']]
Outputs : [[0, 'outgenomesGB_ch1'], [1, 'outgenomesGB_ch2'], [2, 'outgenomesGB_ch3'], [3, 'reduceOutFtpGB_ch']]
Emits : []


Name : OutGenomesCheckm
Inputs : [[0, 'outgenomes_ch1'], [1, 'outgenomesGB_ch1'], [2, 'params']]
Outputs : [[0, 'outGenomesCheckm_ch']]
Emits : []


Name : OutGenomesBarnap
Inputs : [[0, 'outgenomes_ch2'], [1, 'outgenomesGB_ch2'], [2, 'params']]
Outputs : [[0, 'outGenomeWithSsu_ch'], [1, 'outRnammer_ch']]
Emits : []


Name : OutGenomesFilter
Inputs : [[0, 'outGenomeWithSsu_ch'], [1, 'outGenomesCheckm_ch'], [2, 'params']]
Outputs : [[0, 'outReliablegenomes_ch']]
Emits : []


Name : GetOutRelProteomes
Inputs : [[0, 'outReliablegenomes_ch'], [1, 'reduceOutFtp_ch'], [2, 'reduceOutFtpGB_ch'], [3, 'outgenomes_ch3'], [4, 'outgenomesGB_ch3']]
Outputs : [[0, 'outReliableproteomes_ch']]
Emits : []


Name : RiboDBFortytwo
Inputs : [[0, 'params'], [1, 'refReliableproteomes_ch'], [2, 'outReliableproteomes_ch'], [3, 'params'], [4, 'taxdir_ch1'], [5, 'params'], [6, 'ribodir_ch1']]
Outputs : [[0, 'enrichedRiboDB_ch']]
Emits : []


Name : AlignmentMUSCLE
Inputs : [[0, 'enrichedRiboDB_ch']]
Outputs : [[0, 'alignments_ch']]
Emits : []


Name : ConcatScafos
Inputs : [[0, 'alignments_ch']]
Outputs : [[0, 'matrix_ch']]
Emits : []


Name : ReferenceTreeRaxml
Inputs : [[0, 'matrix_ch'], [1, 'params']]
Outputs : [[0, 'referenceTree_ch'], [1, 'referenceTreeList_ch']]
Emits : []


Name : SSUDereplication
Inputs : [[0, 'ssu_ch'], [1, 'params']]
Outputs : [[0, 'ssuDereplicated_ch']]
Emits : []


Name : ConstrainTreeRaxml
Inputs : [[0, 'referenceTree_ch'], [1, 'refRnammer_ch'], [2, 'outRnammer_ch'], [3, 'ssuDereplicated_ch'], [4, 'referenceTreeList_ch'], [5, 'taxdir_ch2'], [6, 'params'], [7, 'params'], [8, 'params']]
Outputs : [[0, 'constTreeNexus_ch'], [1, 'constTreeTre_ch'], [2, 'alignementBmge_ch'], [3, 'alignement_ch'], [4, 'gcfList_ch']]
Emits : []


Name : PublicationResults
Inputs : [[0, 'constTreeNexus_ch'], [1, 'constTreeTre_ch'], [2, 'alignementBmge_ch'], [3, 'alignement_ch'], [4, 'gcfList_ch']]
Outputs : [[0, 'outConstTreeNexus_ch'], [1, 'outConstTreeTre_ch'], [2, 'outAlignementBmge_ch'], [3, 'outAlignement_ch'], [4, 'outGcfList_ch']]
Emits : []


