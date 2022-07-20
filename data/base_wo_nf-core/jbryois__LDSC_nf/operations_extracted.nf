OPERATION_1 string : bedfiles = Channel.fromPath(params.bed + "*.bed")
OPERATION_1 origin : [['params.bed + "*.bed"', 'A']]
OPERATION_1 gives  : [['bedfiles', 'P']]


OPERATION_2 string : Channel
    .fromPath(pheno_file)
    .splitCsv(header: false)
    .set { ch_pheno }
OPERATION_2 origin : [['pheno_file', 'A']]
OPERATION_2 gives  : [['ch_pheno', 'P']]


OPERATION_3 string : InputBedsPerChr
    .flatMap { item ->
        inputname = item[0];
        files  = item[1];
        files.collect { onefile -> \
        return [ inputname, \
        onefile, \
        file(model_path + "${onefile.simpleName.replaceFirst(/chr/,'')}" + ".annot.gz"), \
        file(plink + "${onefile.simpleName.replaceFirst(/chr/,'')}" + ".bim"), \
        file(plink + "${onefile.simpleName.replaceFirst(/chr/,'')}" + ".bed"), \
        file(plink + "${onefile.simpleName.replaceFirst(/chr/,'')}" + ".fam"), \
        file(hmsnps)]}
    }
    .set { ch_chr }
OPERATION_3 origin : [['InputBedsPerChr', 'P']]
OPERATION_3 gives  : [['ch_chr', 'P']]


OPERATION_4 string : LDscores
.groupTuple()
.map { mytuple ->
	 def key = mytuple[0]
     def myfiles = mytuple[1].flatten()
     return tuple(key.toString(), myfiles) 
     }
.combine(ch_pheno)
.set { LDscores_join }
OPERATION_4 origin : [['LDscores', 'P'], ['ch_pheno', 'P']]
OPERATION_4 gives  : [['LDscores_join', 'P']]


