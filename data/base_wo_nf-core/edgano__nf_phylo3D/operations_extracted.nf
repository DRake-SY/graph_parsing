OPERATION_1 string : Channel
  .fromPath(params.phylip)
  .map { item -> [ item.baseName, item] }
  .set { phySeqs }
OPERATION_1 origin : [['params.phylip', 'A']]
OPERATION_1 gives  : [['phySeqs', 'P']]


OPERATION_2 string : Channel
  .fromPath(params.fasta)
  .map { item -> [ item.baseName, item] }
  .set { fastaSeqs }
OPERATION_2 origin : [['params.fasta', 'A']]
OPERATION_2 gives  : [['fastaSeqs', 'P']]


OPERATION_3 string : Channel
  .fromPath(params.templates)
  .map { item -> [ item.baseName, item] }
  .set { templates }
OPERATION_3 origin : [['params.templates', 'A']]
OPERATION_3 gives  : [['templates', 'P']]


OPERATION_4 string : Channel
  .fromPath(params.pdb)
  .collect()
  .set { pdbFiles }
OPERATION_4 origin : [['params.pdb', 'A']]
OPERATION_4 gives  : [['pdbFiles', 'P']]


