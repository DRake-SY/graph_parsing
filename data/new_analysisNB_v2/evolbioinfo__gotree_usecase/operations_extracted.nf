OPERATION_1 string : protids2.collectFile(name: "all_orthoid.txt").subscribe{file -> file.copyTo(outpath.resolve(file.name))}
OPERATION_1 origin : [['protids2', 'P']]
OPERATION_1 gives  : []


OPERATION_2 string : genefile.collectFile(name: 'genes.txt').subscribe{file -> file.copyTo(outpath.resolve(file.name))}
OPERATION_2 origin : [['genefile', 'P']]
OPERATION_2 gives  : []


