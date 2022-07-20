OPERATION_1 string : Channel
  .fromPath('/data/ficklin_class/AFS505/course_material/data/all.pep') 
  .splitFasta(by : 5000, file:true)
  .set { fasta_split }
OPERATION_1 origin : [["'/data/ficklin_class/AFS505/course_material/data/all.pep'", 'A']]
OPERATION_1 gives  : [['fasta_split', 'P']]


