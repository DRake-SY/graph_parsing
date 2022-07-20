OPERATION_1 string : Channel
    .fromPath(params.qc)
    .splitCsv(sep:'\t', header: true)
    .filter { row -> Float.parseFloat(row.pc_acgt) >= params.breadth }
    .filter { row -> Float.parseFloat(row["pc_pos_cov_gte${params.depth}"]) >= params.breadth }
    .map { row-> tuple(file([params.artifacts_root, 'fasta', row.fasta_path].join('/')), file([params.artifacts_root, 'alignment', row.bam_path].join('/'))) }
    .set { manifest_ch }
OPERATION_1 origin : [['params.qc', 'A']]
OPERATION_1 gives  : [['manifest_ch', 'P']]


