Name : collect_fasta
Inputs : [[0, 'assemblies']]
Outputs : [[0, 'annotate_multi_fasta'], [0, 'split_multi'], [0, 'nextclade_genomes'], [0, 'pangolin_genomes']]
Emits : []


Name : annotate
Inputs : [[0, 'annotate_multi_fasta']]
Outputs : [[0, 'convert_tsv']]
Emits : []


Name : convert_sqa
Inputs : [[0, 'convert_tsv']]
Outputs : [[0, 'vadr_results'], [0, 'compile_vadr'], [0, 'render_vadr']]
Emits : []


Name : nextlclade_mutations
Inputs : [[0, 'nextclade_genomes']]
Outputs : [[0, 'nextclade_results'], [1, 'nextclade_version']]
Emits : []


Name : lineage
Inputs : [[0, 'pangolin_genomes']]
Outputs : [[0, 'lineage_results'], [1, 'pangolin_version']]
Emits : []


Name : build_report
Inputs : [[0, 'nextclade_results'], [1, 'lineage_results'], [2, 'nextclade_version'], [3, 'pangolin_version'], [4, 'vadr_results']]
Outputs : [[0, 'render_berrywood']]
Emits : []


Name : render
Inputs : [[0, 'render_berrywood'], [1, 'render_vadr'], [2, 'report'], [3, 'bash']]
Outputs : []
Emits : []


