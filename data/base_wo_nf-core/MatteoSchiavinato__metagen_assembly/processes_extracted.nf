Name : remove_host_reads
Inputs : [[0, 'Minimap']]
Outputs : [[0, 'NoHost'], [1, 'NoHost_count']]
Emits : []


Name : count_reads_wo_host
Inputs : [[0, 'NoHost_count']]
Outputs : []
Emits : []


Name : remove_human_reads
Inputs : [[0, 'NoHost']]
Outputs : [[0, 'NoHuman_canu'], [1, 'NoHuman_count']]
Emits : []


Name : count_reads_wo_human
Inputs : [[0, 'NoHuman_count']]
Outputs : []
Emits : []


Name : canu_assembly
Inputs : [[0, 'NoHuman_canu']]
Outputs : [[0, 'sample_id'], [1, 'read_type'], [4, 'Canu_out'], [5, 'Canu_quast'], [6, 'Contigs_plot'], [7, 'Contigs_prokka']]
Emits : []


Name : metaquast
Inputs : [[0, 'Canu_quast']]
Outputs : [[0, 'Metaquast']]
Emits : []


Name : get_ctg_lengths
Inputs : [[0, 'Contigs_plot']]
Outputs : [[0, 'Contig_lengths']]
Emits : []


Name : plot_ctg_lengths
Inputs : [[0, 'Contig_lengths']]
Outputs : [[0, 'Ctg_len_pngs'], [1, 'Ctg_len_svgs']]
Emits : []


Name : run_prokka
Inputs : [[0, 'Contigs_prokka']]
Outputs : [[0, 'Prokka_out'], [1, 'Prokka_gff']]
Emits : []


Name : run_roary
Inputs : [[0, 'Prokka_gff']]
Outputs : [[0, 'Roary_out']]
Emits : []


