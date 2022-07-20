OPERATION_1 string : fastq_files = Channel.fromFilePairs("${params.fastq_dir}/**/*_{1,2,unpaired}.fq.gz",size:3)
OPERATION_1 origin : [['"${params.fastq_dir}/**/*_{1,2,unpaired}.fq.gz",size:3', 'A']]
OPERATION_1 gives  : [['fastq_files', 'P']]


OPERATION_2 string : html_files = Channel.fromFilePairs("${params.html_dir}/html_{start,end}.txt",size:2)
OPERATION_2 origin : [['"${params.html_dir}/html_{start,end}.txt",size:2', 'A']]
OPERATION_2 gives  : [['html_files', 'P']]


OPERATION_3 string : fastq_files.into{
  asm_megahit_in;
  asm_metaspades_in;
  reads_to_map;
  tax_reads_metaphlan2_in;
  tax_reads_kraken2_in;
  tax_reads_FastViromeExplorer_in;
  print_reads
 }
OPERATION_3 origin : [['fastq_files', 'P']]
OPERATION_3 gives  : [['asm_megahit_in', 'P'], ['asm_metaspades_in', 'P'], ['reads_to_map', 'P'], ['tax_reads_metaphlan2_in', 'P'], ['tax_reads_kraken2_in', 'P'], ['tax_reads_FastViromeExplorer_in', 'P'], ['print_reads', 'P']]


OPERATION_4 string : html_files.into{html_each;
html_all;
html_simplified_all}
OPERATION_4 origin : [['html_files', 'P']]
OPERATION_4 gives  : [['html_each', 'P'], ['html_all', 'P'], ['html_simplified_all', 'P']]


OPERATION_5 string : all_assemblies = asm_megahit_out.mix(asm_metaspades_out)
OPERATION_5 origin : [['asm_megahit_out', 'P'], ['asm_metaspades_out', 'P']]
OPERATION_5 gives  : [['all_assemblies', 'P']]


OPERATION_6 string : asm_filter_contigs_out.into{
  contigs_to_be_mapped;
  tax_contigs_diamond_in;
  tax_contigs_kraken2_in;
  tax_contigs_virfinder_in;
  tax_contigs_fgs_in;
  tax_contigs_virsorter_in
                               
}
OPERATION_6 origin : [['asm_filter_contigs_out', 'P']]
OPERATION_6 gives  : [['contigs_to_be_mapped', 'P'], ['tax_contigs_diamond_in', 'P'], ['tax_contigs_kraken2_in', 'P'], ['tax_contigs_virfinder_in', 'P'], ['tax_contigs_fgs_in', 'P'], ['tax_contigs_virsorter_in', 'P']]


OPERATION_7 string : asm_map_reads_to_contigs_in = reads_to_map.cross(contigs_to_be_mapped).map{ it[0]+it[1][1,2] }
OPERATION_7 origin : [['reads_to_map', 'P'], ['contigs_to_be_mapped', 'P']]
OPERATION_7 gives  : [['asm_map_reads_to_contigs_in', 'P']]


OPERATION_8 string : asm_map_reads_to_contigs_out.into{ asm_mapping_stats_in;
                                   asm_per_ctg_coverage_in }
OPERATION_8 origin : [['asm_map_reads_to_contigs_out', 'P']]
OPERATION_8 gives  : [['asm_mapping_stats_in', 'P'], ['asm_per_ctg_coverage_in', 'P']]


OPERATION_9 string : tax_reads_unmapped_kraken2.into{unmapped_reads_kraken2_blastn; unmapped_reads_kraken2_blastx}
OPERATION_9 origin : [['tax_reads_unmapped_kraken2', 'P']]
OPERATION_9 gives  : [['unmapped_reads_kraken2_blastn', 'P'], ['unmapped_reads_kraken2_blastx', 'P']]


OPERATION_10 string : unmapped_contigs = tax_contigs_unmapped_kraken2.combine(tax_contigs_unmapped_diamond, by: [0,1])
OPERATION_10 origin : [['tax_contigs_unmapped_kraken2', 'P']]
OPERATION_10 gives  : [['unmapped_contigs', 'P']]


OPERATION_11 string : tax_contigs_taxonomy_out.into{data_for_html_table;
collect_all_tsv;
collect_virus_tsv;
collect_bact_tsv;
collect_eukar_tsv;
collect_other_tsv}
OPERATION_11 origin : [['tax_contigs_taxonomy_out', 'P']]
OPERATION_11 gives  : [['data_for_html_table', 'P'], ['collect_all_tsv', 'P'], ['collect_virus_tsv', 'P'], ['collect_bact_tsv', 'P'], ['collect_eukar_tsv', 'P'], ['collect_other_tsv', 'P']]


OPERATION_12 string : html_data_each = data_for_html_table.combine(html_each)
OPERATION_12 origin : [['data_for_html_table', 'P'], ['html_each', 'P']]
OPERATION_12 gives  : [['html_data_each', 'P']]


OPERATION_13 string : collected_tsv = all_tsv_collected.combine(virus_tsv_collected).combine(bact_tsv_collected).combine(eukar_tsv_collected).combine(other_tsv_collected)
OPERATION_13 origin : [['all_tsv_collected', 'P'], ['virus_tsv_collected', 'P'], ['bact_tsv_collected', 'P'], ['eukar_tsv_collected', 'P'], ['other_tsv_collected', 'P']]
OPERATION_13 gives  : [['collected_tsv', 'P']]


OPERATION_14 string : collected_tsv.into{collected_tsv_into_html;
collected_tsv_to_simplified}
OPERATION_14 origin : [['collected_tsv', 'P']]
OPERATION_14 gives  : [['collected_tsv_into_html', 'P'], ['collected_tsv_to_simplified', 'P']]


OPERATION_15 string : html_simplifed_in = tsv_simplifed_out.combine(html_simplified_all)
OPERATION_15 origin : [['tsv_simplifed_out', 'P'], ['html_simplified_all', 'P']]
OPERATION_15 gives  : [['html_simplifed_in', 'P']]


OPERATION_16 string : html_collection_tsv_in = collected_tsv_into_html.combine(html_all)
OPERATION_16 origin : [['collected_tsv_into_html', 'P'], ['html_all', 'P']]
OPERATION_16 gives  : [['html_collection_tsv_in', 'P']]


