OPERATION_1 string : fasta_dataset = Channel
  .fromPath( fasta_path )
  .ifEmpty{exit 1, "Fasta files not found not found: ${fasta_path}"}
  .map { file -> tuple(file.baseName, file) }
OPERATION_1 origin : [['fasta_path', 'A']]
OPERATION_1 gives  : [['fasta_dataset', 'P']]


OPERATION_2 string : summary.collect { k,v -> "${k.padRight(15)}: $v" }.join("\n")
OPERATION_2 origin : [['summary', 'P']]
OPERATION_2 gives  : []


