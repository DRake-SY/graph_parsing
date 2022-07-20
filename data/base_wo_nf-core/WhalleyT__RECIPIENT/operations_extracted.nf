OPERATION_1 string : fasta_dataset = Channel
  .fromPath(fasta_path)
  .ifEmpty{exit 1, "Fasta files not found not found: ${fasta_path}"}
  .map{file -> tuple(file.baseName, file)}
OPERATION_1 origin : [['fasta_path', 'A']]
OPERATION_1 gives  : [['fasta_dataset', 'P']]


OPERATION_2 string : fasta_dataset.into{
    fasta_dataset_prokka
    fasta_dataset_kraken
}
OPERATION_2 origin : [['fasta_dataset', 'P']]
OPERATION_2 gives  : []


