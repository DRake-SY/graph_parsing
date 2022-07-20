OPERATION_1 string : BedBimFam = Channel.create()
OPERATION_1 origin : []
OPERATION_1 gives  : [['BedBimFam', 'P']]


OPERATION_2 string : Vcf = Channel.create()
OPERATION_2 origin : []
OPERATION_2 gives  : [['Vcf', 'P']]


OPERATION_3 string : Vcfgz = Channel.create()
OPERATION_3 origin : []
OPERATION_3 gives  : [['Vcfgz', 'P']]


OPERATION_4 string : Channel
    .from(file(params.inputCSV).text)
    .splitCsv(header: true)
    .map(toDataSetInfo)
    .choice (BedBimFam, Vcf, Vcfgz) { ChannelByFileType[it.datasetFileType].channelIdx }
OPERATION_4 origin : []
OPERATION_4 gives  : [['BedBimFam', 'P'], ['Vcf', 'P'], ['Vcfgz', 'P']]


OPERATION_5 string : SplittedVcfgz = Channel.create()
OPERATION_5 origin : []
OPERATION_5 gives  : [['SplittedVcfgz', 'P']]


OPERATION_6 string : NonSplittedVcfgz = Channel.create()
OPERATION_6 origin : []
OPERATION_6 gives  : [['NonSplittedVcfgz', 'P']]


OPERATION_7 string : files.collect({ it.replaceAll(/.bed|.bim|.fam|.vcf.gz|.vcf$/,'') }).unique()[0]
OPERATION_7 origin : [['files', 'P']]
OPERATION_7 gives  : []


OPERATION_8 string : allVcfgzFiles
    .collect({ file -> file =~ CHECK_CHROMOSOME_PATTERN })
    .findAll({ matched -> matched.matches() })
OPERATION_8 origin : [['allVcfgzFiles', 'P']]
OPERATION_8 gives  : []


OPERATION_9 string : chromosomes = allMatched.collect { it[0][1] }
OPERATION_9 origin : [['allMatched', 'P']]
OPERATION_9 gives  : [['chromosomes', 'P']]


OPERATION_10 string : mixedVcfgz = Vcfgz.mix(
  convertedVcfgzFromBedBimFam.map(updateProjectDir),
  convertedVcfgzFromVcf.map(updateProjectDir)
)
OPERATION_10 origin : [['Vcfgz', 'P']]
OPERATION_10 gives  : [['mixedVcfgz', 'P']]


OPERATION_11 string : mixedVcfgz
  .map(checkChromosomeSplittedThenAttachVcfgzFile)
  .choice(SplittedVcfgz, NonSplittedVcfgz) { it.splittedChannelIdx }
OPERATION_11 origin : [['mixedVcfgz', 'P']]
OPERATION_11 gives  : [['SplittedVcfgz', 'P'], ['NonSplittedVcfgz', 'P']]


OPERATION_12 string : SplittedVcfgz.map({ it.splittedVcfgzs = it.allVcfgzFiles; it }).mix(
  SplittedVcfgzFromNonSplitted.map { it[0].splittedVcfgzs = it.tail().flatten(); it[0] }
)
  .flatMap(flattenDatasetAsVCFgzChunks)
  .map({ tuple(it, file(it.vcfgzPath), file(it.ref)) })
  .set { DatasetChunks }
OPERATION_12 origin : [['SplittedVcfgz', 'P']]
OPERATION_12 gives  : [['DatasetChunks', 'P']]


OPERATION_13 string : DBChunks.subscribe {
    chunk=it[0]
    db=it[1]
    println "${chunk.project}_${chunk.chrIdx}"
}
OPERATION_13 origin : [['DBChunks', 'P']]
OPERATION_13 gives  : []


