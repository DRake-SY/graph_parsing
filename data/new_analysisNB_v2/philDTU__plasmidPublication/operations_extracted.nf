OPERATION_1 string : Channel
    .fromPath(params.query)
    .map { file -> tuple(file.baseName, file) }
    .splitFastq(by: 1, file:true)
    .set { fastq_files }
OPERATION_1 origin : [['params.query', 'A']]
OPERATION_1 gives  : [['fastq_files', 'P']]


OPERATION_2 string : Channel
    .fromPath(params.query)
    .splitFastq(by:1, record: true)
    .map{ record -> record.readHeader }
    .merge(fastq_files)
    .into{fastq_ch1; fastq_ch2}
OPERATION_2 origin : [['fastq_files', 'P'], ['params.query', 'A']]
OPERATION_2 gives  : [['fastq_ch1', 'P'], ['fastq_ch2', 'P']]


OPERATION_3 string : assembly_results_ch
   .collectFile(storeDir: "output/assemblies/") { item ->
       [ "${item[1]}.fasta", item[2]]}
   .println { "Merged assemblies results into " + it }
OPERATION_3 origin : [['assembly_results_ch', 'P']]
OPERATION_3 gives  : []


OPERATION_4 string : remap_ch
   .collectFile(keepHeader: true, skip: 1, storeDir: "output/remapping/") { item ->
       [ "${item[1]}.tsv", item[2]]}
   .println { "Merged remapping results into " + it }
OPERATION_4 origin : [['remap_ch', 'P']]
OPERATION_4 gives  : []


