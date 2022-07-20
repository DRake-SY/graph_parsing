OPERATION_1 string : Channel
    .fromPath('/data/ficklin_class/AFS505/course_material/data/all.pep')
    .splitFasta(by : 5000, file:true)
    .set { split_ch }
OPERATION_1 origin : [["'/data/ficklin_class/AFS505/course_material/data/all.pep'", 'A']]
OPERATION_1 gives  : [['split_ch', 'P']]


OPERATION_2 string : match_ch
    .collectFile(name : 'match_ch.txt')
OPERATION_2 origin : [['match_ch', 'P']]
OPERATION_2 gives  : []


