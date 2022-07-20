Name : merge
Inputs : [[0, 'read_pairs']]
Outputs : [[0, '']]
Emits : []


Name : fastqc_merged
Inputs : [[0, 'merged_c1']]
Outputs : [[0, 'fastqc_merged']]
Emits : []


Name : multiqc_merged
Inputs : [[0, 'fastqc_merged']]
Outputs : []
Emits : []


Name : cutadapters
Inputs : [[0, 'merged_c2']]
Outputs : [[0, ''], [1, 'sample_id']]
Emits : []


Name : fastqc_cutadapters
Inputs : [[0, 'adapters_trimmed_c1']]
Outputs : [[0, 'fastqc_cutadapters']]
Emits : []


Name : multiqc_cutadapters
Inputs : [[0, 'fastqc_cutadapters']]
Outputs : []
Emits : []


Name : cutprimers
Inputs : [[0, 'adapters_trimmed_c2']]
Outputs : [[0, ''], [1, 'sample_id']]
Emits : []


Name : fastqc_cutprimers
Inputs : [[0, 'primers_trimmed_c1']]
Outputs : [[0, 'fastqc_cutprimers']]
Emits : []


Name : multiqc_cutprimers
Inputs : [[0, 'fastqc_cutprimers']]
Outputs : []
Emits : []


Name : filter
Inputs : [[0, 'primers_trimmed_c2']]
Outputs : [[0, ''], [1, 'filtered_fastq_c1']]
Emits : []


Name : fastqc_filtered
Inputs : [[0, 'filtered_fastq_c1']]
Outputs : [[0, 'fastqc_filtered']]
Emits : []


Name : multiqc_filtered
Inputs : [[0, 'fastqc_filtered']]
Outputs : []
Emits : []


Name : uniques
Inputs : [[0, 'filtered_fasta_c1']]
Outputs : [[0, '']]
Emits : []


Name : cluster
Inputs : [[0, 'all_uniques']]
Outputs : [[0, '']]
Emits : []


Name : zotutab_CO1
Inputs : [[0, 'filtered_fasta_c2'], [1, 'zotus_rep1']]
Outputs : [[0, 'zotutab_CO1']]
Emits : []


Name : zotutab_16S
Inputs : [[0, 'filtered_fasta_c3'], [1, 'zotus_rep1']]
Outputs : [[0, 'zotutab_16S']]
Emits : []


Name : matchlist_CO1
Inputs : [[0, 'zotus_rep2']]
Outputs : [[0, 'matchlist_CO1']]
Emits : []


Name : matchlist_16S
Inputs : [[0, 'zotus_rep2']]
Outputs : [[0, 'matchlist_16S']]
Emits : []


Name : lulu_CO1
Inputs : [[0, 'zotutab_CO1'], [1, 'matchlist_CO1']]
Outputs : [[0, 'zotus_lulu_CO1'], [1, 'zotutab_lulu_CO1']]
Emits : []


Name : lulu_16S
Inputs : [[0, 'zotutab_16S'], [1, 'matchlist_16S']]
Outputs : [[0, 'zotus_lulu_16S']]
Emits : []


Name : blastn_16S
Inputs : [[0, 'zotus_lulu_16S'], [1, 'zotus_rep3']]
Outputs : []
Emits : []


Name : translate_CO1
Inputs : [[0, 'zotus_rep3'], [1, 'frame']]
Outputs : [[0, 'header']]
Emits : []


Name : nostopcodon_CO1
Inputs : [[0, 'zotus_rep4'], [1, 'header']]
Outputs : [[0, 'zotus_codon']]
Emits : []


Name : commonzotus_CO1
Inputs : [[0, 'zotus_rep5'], [1, 'zotus_lulu_CO1'], [2, 'zotus_codon']]
Outputs : [[0, 'zotus_lulu'], [1, 'zotus_common']]
Emits : []


