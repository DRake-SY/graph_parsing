OPERATION_1 string : Channel
  .fromPath("${params.fasta_ccs_dir}/*.{fa,fasta}")
  .map{ it -> [it.baseName, "ccs", it] }
  .set{ Minimap }
OPERATION_1 origin : [['"${params.fasta_ccs_dir}/*.{fa,fasta}"', 'A']]
OPERATION_1 gives  : [['Minimap', 'P']]


