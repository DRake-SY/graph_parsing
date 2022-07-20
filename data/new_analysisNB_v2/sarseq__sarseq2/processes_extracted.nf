Name : index_tiles
Inputs : [[0, 'ch_amplicons']]
Outputs : [[0, 'ch_tile_indices']]
Emits : []


Name : index_genome
Inputs : [[0, 'ch_genomefa']]
Outputs : [[0, 'ch_genome_indices']]
Emits : []


Name : make_primerbed
Inputs : [[0, 'ch_genomefa'], [1, 'ch_amplicons']]
Outputs : [[0, 'ch_primerbed']]
Emits : []


Name : demux
Inputs : [[0, 'ch_input'], [1, 'platebc_file'], [2, 'ch_wellbc']]
Outputs : [[0, 'ch_dmx'], [1, 'ch_dmx_rmd']]
Emits : []


Name : read2tile
Inputs : [[0, 'ch_read2tile'], [1, 'ch_amplicons']]
Outputs : [[0, 'ch_r2t_report'], [1, 'ch_r2t_fastq']]
Emits : []


Name : aln2tile
Inputs : [[0, 'ch_r2t_fastq_set'], [1, 'ch_tile_indices']]
Outputs : [[0, 'ch_aln2tile_bam_log'], [1, 'ch_aln2tile_multiqc']]
Emits : []


Name : aln2tile_multiqc
Inputs : [[0, 'ch_aln2tile_multiqc'], [1, 'ch_multiqc_config']]
Outputs : [[0, 'ch_aln2tile_multiqc_report']]
Emits : []


Name : aln2tile_mpile
Inputs : [[0, 'ch_aln2tile_bam_set'], [1, 'ch_tile_indices']]
Outputs : [[0, 'ch_aln2tile_fractions_consensus']]
Emits : []


Name : aln2spike
Inputs : [[0, 'ch_aln2spike_set'], [1, 'ch_genome_indices']]
Outputs : [[0, 'ch_aln2spike_bam_log'], [1, 'ch_aln2spike_multiqc']]
Emits : []


Name : aln2spike_multiqc
Inputs : [[0, 'ch_aln2spike_multiqc'], [1, 'ch_multiqc_config']]
Outputs : [[0, 'ch_aln2spike_multiqc_report']]
Emits : []


Name : aln2spike_ivar_mpile
Inputs : [[0, 'ch_aln2spike_bam_set'], [1, 'ch_genome_indices'], [2, 'ch_primerbed']]
Outputs : [[0, 'ch_ivar_consensus'], [1, 'ch_aln2spike_fractions_consensus']]
Emits : []


Name : consensus_pangolin
Inputs : [[0, 'ch_ivar_consensus']]
Outputs : [[0, 'ch_lineage']]
Emits : []


Name : summarize
Inputs : [[0, 'ch_aln2spike_multiqc_report'], [1, 'ch_aln2tile_multiqc_report'], [2, 'ch_aln2tile_fractions_consensus'], [3, 'ch_tile_indices'], [4, 'ch_spikefa'], [5, 'ch_lineage'], [6, 'ch_bc2sample']]
Outputs : []
Emits : []


Name : checkContainer
Inputs : []
Outputs : []
Emits : []


