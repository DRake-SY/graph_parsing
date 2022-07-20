Name : annovar
Inputs : [[0, 'tables'], [1, 'annodb']]
Outputs : [[0, 'output_annovar_txt'], [1, 'output_annovar_vcf'], [2, 'coding_changes_fasta']]
Emits : []


Name : CompressAndIndex
Inputs : [[0, 'output_annovar_vcf']]
Outputs : [[0, 'output_annovar_vcfgztbi']]
Emits : []


