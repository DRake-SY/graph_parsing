OPERATION_1 string : Channel
    .fromPath("/data/ficklin_class/AFS505/course_material/data/all.pep")
    .splitFasta(by: 5000, file:true)
    .set { fasta_split }
OPERATION_1 origin : [['"/data/ficklin_class/AFS505/course_material/data/all.pep"', 'A']]
OPERATION_1 gives  : [['fasta_split', 'P']]


OPERATION_2 string : fasta_result
    .collectFile(name: "File")
OPERATION_2 origin : [['fasta_result', 'P']]
OPERATION_2 gives  : []


