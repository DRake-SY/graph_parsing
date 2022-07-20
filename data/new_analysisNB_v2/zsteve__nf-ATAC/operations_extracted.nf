OPERATION_1 string : Channel.from(sampleTable.readLines())
        .map{
          line ->
          def entries = line.tokenize()
          read_paths = getReadPairFromSampleDir(entries[1])
                                                                
      file(entries[2]).mkdir()
                    
                                                                   
          [["ID":entries[0], "baseDir":entries[1], "baseDirOut":entries[2]], [file(read_paths["R1"]), file(read_paths["R2"])]]
        }
        .into{readPairOut; readPairOut_FQC}
OPERATION_1 origin : []
OPERATION_1 gives  : [['readPairOut', 'P'], ['readPairOut_FQC', 'P']]


OPERATION_2 string : Channel.value([inputDir, outputDir])
    .map{dir ->
        def inputDir = dir[0]
    def outputDir = dir[1]
    def sampleID = file(inputDir).getBaseName().toString()
        file(outputDir).mkdir()
    read_paths = getReadPairFromSampleDir(inputDir)
        [["ID":sampleID, "baseDir":inputDir, "baseDirOut":outputDir], [file(read_paths["R1"]), file(read_paths["R2"])]]}
    .into{readPairOut; readPairOut_FQC}
OPERATION_2 origin : [['[inputDir, outputDir]', 'V']]
OPERATION_2 gives  : [['readPairOut', 'P'], ['readPairOut_FQC', 'P']]


