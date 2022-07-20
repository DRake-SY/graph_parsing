OPERATION_1 string : Channel
     .fromFilePairs(params.datadir + '/**R{1,2}*.fastq.gz', flat: true)
     .map { prefix, file1, file2 -> tuple(getLibraryId(prefix), file1, file2) }
     .groupTuple() 
     .filter { it[0] =~ /^[0-9]/}
     .into { fastq_ch; fastq_ch_sal; fastq_ch_star }
OPERATION_1 origin : [["params.datadir + '/**R{1,2}*.fastq.gz', flat: true", 'A']]
OPERATION_1 gives  : [['fastq_ch', 'P'], ['fastq_ch_sal', 'P'], ['fastq_ch_star', 'P']]


OPERATION_2 string : Channel
     .fromPath(params.covar)
     .splitCsv(header:true)
     .map {row -> tuple (row.id.split("_")[5], row.sex, "G${row.ngen}")}
     .set { metadata }
OPERATION_2 origin : [['params.covar', 'A']]
OPERATION_2 gives  : [['metadata', 'P']]


OPERATION_3 string : Channel
     .fromPath(params.covar)
     .set { QTL_metadata }
OPERATION_3 origin : [['params.covar', 'A']]
OPERATION_3 gives  : [['QTL_metadata', 'P']]


OPERATION_4 string : Channel
     .fromPath(params.rdata)
     .set { rdataCh }
OPERATION_4 origin : [['params.rdata', 'A']]
OPERATION_4 gives  : [['rdataCh', 'P']]


OPERATION_5 string : Channel
      .fromPath(params.genoprobs)
      .set { genopCh }
OPERATION_5 origin : [['params.genoprobs', 'A']]
OPERATION_5 gives  : [['genopCh', 'P']]


OPERATION_6 string : Channel
  .fromPath(params.gbrs_data + "/suppFiles/C57BL6J/C57BL6J.fa")
  .into{genome_fa; genome_fa2; star_genome; rsem_genome}
OPERATION_6 origin : [['params.gbrs_data + "/suppFiles/C57BL6J/C57BL6J.fa"', 'A']]
OPERATION_6 gives  : [['genome_fa', 'P'], ['genome_fa2', 'P'], ['star_genome', 'P'], ['rsem_genome', 'P']]


OPERATION_7 string : Channel
  .fromPath(params.gbrs_data + "/suppFiles/C57BL6J/C57BL6J.gtf")
  .into{genome_gtf; trans_gtf; star_gtf; rsem_gtf}
OPERATION_7 origin : [['params.gbrs_data + "/suppFiles/C57BL6J/C57BL6J.gtf"', 'A']]
OPERATION_7 gives  : [['genome_gtf', 'P'], ['trans_gtf', 'P'], ['star_gtf', 'P'], ['rsem_gtf', 'P']]


OPERATION_8 string : metadata.join(aln_compressed).into {compm1; compm2}PROCESS DEF quantify
OPERATION_8 origin : [['metadata', 'P'], ['aln_compressed', 'P']]
OPERATION_8 gives  : [['compm1', 'P'], ['compm2', 'P']]


OPERATION_9 string : genes_tpm.join(salmon_out).join(rsem_genes_count).set{both_out}PROCESS DEF compare_tpm
OPERATION_9 origin : [['genes_tpm', 'P'], ['salmon_out', 'P'], ['rsem_genes_count', 'P']]
OPERATION_9 gives  : [['both_out', 'P']]


OPERATION_10 string : count_tbl.splitCsv(header:true, by:100)
     .map {row -> row.gene}
     .set { genes }
OPERATION_10 origin : [['count_tbl', 'P']]
OPERATION_10 gives  : [['genes', 'P']]


OPERATION_11 string : h2g_gene.collectFile().set { h2g_all }
OPERATION_11 origin : [['h2g_gene', 'P']]
OPERATION_11 gives  : [['h2g_all', 'P']]


OPERATION_12 string : gene_perm.collectFile().set { perm_all }PROCESS DEF collect_h2g
OPERATION_12 origin : [['gene_perm', 'P']]
OPERATION_12 gives  : [['perm_all', 'P']]


