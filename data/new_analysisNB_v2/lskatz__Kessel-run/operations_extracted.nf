OPERATION_1 string : Channel
  .fromPath(params.fastq)
  .ifEmpty{
    println("No fastq files were given")
    exit 1
    }
  .map { file -> tuple(file.baseName.replaceAll(/(_[12])?(.fq|.fastq)?(.gz)?$/,""), file) }
                                      
  .groupTuple(by:0, sort:true, size:2)
                                        
  .set {fastqChannel}
OPERATION_1 origin : [['params.fastq', 'A']]
OPERATION_1 gives  : [['fastqChannel', 'P']]


