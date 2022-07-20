OPERATION_1 string : chMultiqcConfig = Channel.fromPath(params.multiqc_config)
OPERATION_1 origin : [['params.multiqc_config', 'A']]
OPERATION_1 gives  : [['chMultiqcConfig', 'P']]


OPERATION_2 string : chOutputDocs = Channel.fromPath("$baseDir/docs/output.md")
OPERATION_2 origin : [['"$baseDir/docs/output.md"', 'A']]
OPERATION_2 gives  : [['chOutputDocs', 'P']]


OPERATION_3 string : Channel.from( params.asfasta )
         .splitCsv()
         .flatten()
         .map { file(it) }
         .into { genomeFastaStar; genomeFastaBowtie2; genomeFastaHisat2 }
OPERATION_3 origin : [['params.asfasta', 'V']]
OPERATION_3 gives  : [['genomeFastaStar', 'P'], ['genomeFastaBowtie2', 'P'], ['genomeFastaHisat2', 'P']]


OPERATION_4 string : Channel.fromPath("${params.fasta}")
         .ifEmpty { exit 1, "Reference Genome not found: ${params.fasta}" }
         .into { fastaParentalGenome; fastaNmaskGenome }
OPERATION_4 origin : [['"${params.fasta}"', 'A']]
OPERATION_4 gives  : [['fastaParentalGenome', 'P'], ['fastaNmaskGenome', 'P']]


OPERATION_5 string : Channel.fromPath("${params.snpFile}")
         .ifEmpty { exit 1, "SNP file not found: ${params.snpFile}" }
         .set { chSnpFile }
OPERATION_5 origin : [['"${params.snpFile}"', 'A']]
OPERATION_5 gives  : [['chSnpFile', 'P']]


OPERATION_6 string : Channel.from( params.starIndex )
         .splitCsv()
         .flatten()
         .map { file(it) }
         .set { starIdx }
OPERATION_6 origin : [['params.starIndex', 'V']]
OPERATION_6 gives  : [['starIdx', 'P']]


OPERATION_7 string : Channel.from( params.bowtie2Index )
         .splitCsv()
         .flatten()
         .map { file(it) }
         .set { bowtie2Idx }
OPERATION_7 origin : [['params.bowtie2Index', 'V']]
OPERATION_7 gives  : [['bowtie2Idx', 'P']]


OPERATION_8 string : Channel.from( params.hisat2Index )
         .splitCsv()
         .flatten()
         .map { file(it) }
         .set { hisat2Idx }
OPERATION_8 origin : [['params.hisat2Index', 'V']]
OPERATION_8 gives  : [['hisat2Idx', 'P']]


OPERATION_9 string : Channel.fromPath("${params.vcf}")
         .ifEmpty { exit 1, "Variant database not found: ${params.vcf}" }
         .into { vcfParentalGenome; vcfNmaskGenome }
OPERATION_9 origin : [['"${params.vcf}"', 'A']]
OPERATION_9 gives  : [['vcfParentalGenome', 'P'], ['vcfNmaskGenome', 'P']]


OPERATION_10 string : Channel
        .fromPath(params.gtf)
        .ifEmpty { exit 1, "GTF annotation file not found: ${params.gtf}" }
        .into { gtfStar; gtfHisat2Splicesites; gtfHisat2; gtfHisat2Index; gtfTophat2; chGtf }
OPERATION_10 origin : [['params.gtf', 'A']]
OPERATION_10 gives  : [['gtfStar', 'P'], ['gtfHisat2Splicesites', 'P'], ['gtfHisat2', 'P'], ['gtfHisat2Index', 'P'], ['gtfTophat2', 'P'], ['chGtf', 'P']]


OPERATION_11 string : Channel
    .fromPath(params.blacklist, checkIfExists: true)
    .set {chBlacklistBigWig}
OPERATION_11 origin : [['params.blacklist, checkIfExists: true', 'A']]
OPERATION_11 gives  : [['chBlacklistBigWig', 'P']]


OPERATION_12 string : chBlacklistBigWig = Channel.empty()
OPERATION_12 origin : []
OPERATION_12 gives  : [['chBlacklistBigWig', 'P']]


OPERATION_13 string : Channel
       .fromPath( params.metadata )
       .ifEmpty { exit 1, "Metadata file not found: ${params.metadata}" }
       .set { ch_metadata }
OPERATION_13 origin : [['params.metadata', 'A']]
OPERATION_13 gives  : [['ch_metadata', 'P']]


OPERATION_14 string : Channel
        .from(file("${params.samplePlan}"))
        .splitCsv(header: false)
        .map{ row -> [ row[0], [file(row[2])]] }
        .set { rawReads }
OPERATION_14 origin : []
OPERATION_14 gives  : [['rawReads', 'P']]


OPERATION_15 string : Channel
        .from(file("${params.samplePlan}"))
        .splitCsv(header: false)
        .map{ row -> [ row[0], [file(row[2]), file(row[3])]] }
        .set { rawReads }
OPERATION_15 origin : []
OPERATION_15 gives  : [['rawReads', 'P']]


OPERATION_16 string : Channel
        .from(params.readPaths)
        .map { row -> [ row[0], [file(row[1][0])]] }
        .ifEmpty { exit 1, "params.readPaths was empty - no input files supplied" }
        .set { rawReads }
OPERATION_16 origin : [['params.readPaths', 'V']]
OPERATION_16 gives  : [['rawReads', 'P']]


OPERATION_17 string : Channel
        .from(params.readPaths)
        .map { row -> [ row[0], [file(row[1][0]), file(row[1][1])]] }
        .ifEmpty { exit 1, "params.readPaths was empty - no input files supplied" }
        .set { rawReads }
OPERATION_17 origin : [['params.readPaths', 'V']]
OPERATION_17 gives  : [['rawReads', 'P']]


OPERATION_18 string : Channel
      .fromFilePairs( params.reads, size: params.singleEnd ? 1 : 2 )
      .ifEmpty { exit 1, "Cannot find any reads matching: ${params.reads}\nNB: Path needs to be enclosed in quotes!\nNB: Path requires at least one * wildcard!\nIf this is single-end data, please specify --singleEnd on the command line." }
      .into { rawReads }
OPERATION_18 origin : [['params.reads, size: params.singleEnd ? 1 : 2', 'A']]
OPERATION_18 gives  : [['rawReads', 'P']]


OPERATION_19 string : chSplan = Channel.fromPath(params.samplePlan)
OPERATION_19 origin : [['params.samplePlan', 'A']]
OPERATION_19 gives  : [['chSplan', 'P']]


OPERATION_20 string : Channel
        .from(params.readPaths)
        .collectFile() {
          item -> ["sample_plan.csv", item[0] + ',' + item[0] + ',' + item[1][0] + '\n']
        }
        .set{ chSplan }
OPERATION_20 origin : [['params.readPaths', 'V']]
OPERATION_20 gives  : [['chSplan', 'P']]


OPERATION_21 string : Channel
        .from(params.readPaths)
        .collectFile() {
          item -> ["sample_plan.csv", item[0] + ',' + item[0] + ',' + item[1][0] + ',' + item[1][1] + '\n']
        }
        .set{ chSplan }
OPERATION_21 origin : [['params.readPaths', 'V']]
OPERATION_21 gives  : [['chSplan', 'P']]


OPERATION_22 string : Channel
        .fromFilePairs( params.reads, size: 1 )
        .collectFile() {
          item -> ["sample_plan.csv", item[0] + ',' + item[0] + ',' + item[1][0] + '\n']
         }     
         .set { chSplan }
OPERATION_22 origin : [['params.reads, size: 1', 'A']]
OPERATION_22 gives  : [['chSplan', 'P']]


OPERATION_23 string : Channel
        .fromFilePairs( params.reads, size: 2 )
        .collectFile() {
          item -> ["sample_plan.csv", item[0] + ',' + item[0] + ',' + item[1][0] + ',' + item[1][1] + '\n']
        }     
        .set { chSplan }
OPERATION_23 origin : [['params.reads, size: 2', 'A']]
OPERATION_23 gives  : [['chSplan', 'P']]


OPERATION_24 string : chSplan = Channel.empty()
OPERATION_24 origin : []
OPERATION_24 gives  : [['chSplan', 'P']]


OPERATION_25 string : rawReads = Channel.empty()
OPERATION_25 origin : []
OPERATION_25 gives  : [['rawReads', 'P']]


OPERATION_26 string : chSnpFile = Channel.empty()
OPERATION_26 origin : []
OPERATION_26 gives  : [['chSnpFile', 'P']]


OPERATION_27 string : chSnpFile = Channel.empty()
OPERATION_27 origin : []
OPERATION_27 gives  : [['chSnpFile', 'P']]


OPERATION_28 string : chNmaskBams = Channel.empty()
OPERATION_28 origin : []
OPERATION_28 gives  : [['chNmaskBams', 'P']]


OPERATION_29 string : chFlagStat = Channel.empty()
OPERATION_29 origin : []
OPERATION_29 gives  : [['chFlagStat', 'P']]


OPERATION_30 string : chBams = Channel.empty()
OPERATION_30 origin : []
OPERATION_30 gives  : [['chBams', 'P']]


OPERATION_31 string : chMappingMqc = Channel.empty()
OPERATION_31 origin : []
OPERATION_31 gives  : [['chMappingMqc', 'P']]


OPERATION_32 string : chParentalBams = Channel.empty()
OPERATION_32 origin : []
OPERATION_32 gives  : [['chParentalBams', 'P']]


OPERATION_33 string : chTagBams = Channel.empty()
OPERATION_33 origin : []
OPERATION_33 gives  : [['chTagBams', 'P']]


OPERATION_34 string : chTagLog = Channel.empty()
OPERATION_34 origin : []
OPERATION_34 gives  : [['chTagLog', 'P']]


OPERATION_35 string : chMarkedPicstats = Channel.empty()
OPERATION_35 origin : []
OPERATION_35 gives  : [['chMarkedPicstats', 'P']]


OPERATION_36 string : chBamCount = Channel.empty()
OPERATION_36 origin : []
OPERATION_36 gives  : [['chBamCount', 'P']]


OPERATION_37 string : summary.collect { k,v -> "${k.padRight(15)}: $v" }.join("\n")
OPERATION_37 origin : [['summary', 'P']]
OPERATION_37 gives  : []


OPERATION_38 string : chGenomeNmaskFasta.into{genomeFastaStar; genomeFastaBowtie2; genomeFastaHisat2}
OPERATION_38 origin : [['chGenomeNmaskFasta', 'P']]
OPERATION_38 gives  : [['genomeFastaStar', 'P'], ['genomeFastaBowtie2', 'P'], ['genomeFastaHisat2', 'P']]


OPERATION_39 string : chGenomeParentalFasta.into{genomeFastaStar; genomeFastaBowtie2; genomeFastaHisat2}
OPERATION_39 origin : [['chGenomeParentalFasta', 'P']]
OPERATION_39 gives  : [['genomeFastaStar', 'P'], ['genomeFastaBowtie2', 'P'], ['genomeFastaHisat2', 'P']]


OPERATION_40 string : rawReads.into{ readsFastqc; readsStar; readsBowtie2; readsHisat2; readsTophat2 }
OPERATION_40 origin : [['rawReads', 'P']]
OPERATION_40 gives  : [['readsFastqc', 'P'], ['readsStar', 'P'], ['readsBowtie2', 'P'], ['readsHisat2', 'P'], ['readsTophat2', 'P']]


OPERATION_41 string : starBam.into{chFlagStat; chNmaskBams; chParentalBams; chBams}
OPERATION_41 origin : [['starBam', 'P']]
OPERATION_41 gives  : [['chFlagStat', 'P'], ['chNmaskBams', 'P'], ['chParentalBams', 'P'], ['chBams', 'P']]


OPERATION_42 string : bowtie2Bam.into{chFlagStat; chNmaskBams; chParentalBams; chBams}
OPERATION_42 origin : [['bowtie2Bam', 'P']]
OPERATION_42 gives  : [['chFlagStat', 'P'], ['chNmaskBams', 'P'], ['chParentalBams', 'P'], ['chBams', 'P']]


OPERATION_43 string : hisat2Bam.into{chFlagStat; chNmaskBams; chParentalBams; chBams}
OPERATION_43 origin : [['hisat2Bam', 'P']]
OPERATION_43 gives  : [['chFlagStat', 'P'], ['chNmaskBams', 'P'], ['chParentalBams', 'P'], ['chBams', 'P']]


OPERATION_44 string : tophat2Bam.into{chFlagStat; chNmaskBams; chParentalBams; chBams}
OPERATION_44 origin : [['tophat2Bam', 'P']]
OPERATION_44 gives  : [['chFlagStat', 'P'], ['chNmaskBams', 'P'], ['chParentalBams', 'P'], ['chBams', 'P']]


OPERATION_45 string : chTagNmaskBams.into{chTagBams ; chTagBamsPicard}
OPERATION_45 origin : [['chTagNmaskBams', 'P']]
OPERATION_45 gives  : [['chTagBams', 'P'], ['chTagBamsPicard', 'P']]


OPERATION_46 string : tagNmaskLog.set{chTagLog}
OPERATION_46 origin : [['tagNmaskLog', 'P']]
OPERATION_46 gives  : [['chTagLog', 'P']]


OPERATION_47 string : chTagParentalBams.into{chTagBams ; chTagBamsPicard}
OPERATION_47 origin : [['chTagParentalBams', 'P']]
OPERATION_47 gives  : [['chTagBams', 'P'], ['chTagBamsPicard', 'P']]


OPERATION_48 string : tagParentalLog.set{chTagLog}
OPERATION_48 origin : [['tagParentalLog', 'P']]
OPERATION_48 gives  : [['chTagLog', 'P']]


OPERATION_49 string : chBams.set{chTagBamsPicard}
OPERATION_49 origin : [['chBams', 'P']]
OPERATION_49 gives  : [['chTagBamsPicard', 'P']]


OPERATION_50 string : chMarkedBams.into{chFiltBams; chFiltBamsSplit}
OPERATION_50 origin : [['chMarkedBams', 'P']]
OPERATION_50 gives  : [['chFiltBams', 'P'], ['chFiltBamsSplit', 'P']]


OPERATION_51 string : chTagBams.into{chFiltBams; chFiltBamsSplit}
OPERATION_51 origin : [['chTagBams', 'P']]
OPERATION_51 gives  : [['chFiltBams', 'P'], ['chFiltBamsSplit', 'P']]


OPERATION_52 string : genomeBams.join(chFiltBams).into{chBamCount; chBamWig}
OPERATION_52 origin : [['genomeBams', 'P'], ['chFiltBams', 'P']]
OPERATION_52 gives  : [['chBamCount', 'P'], ['chBamWig', 'P']]


OPERATION_53 string : chFiltBams
      .map{ row -> [ row[0], null, null, file(row[1])] }
      .set{chBamWig}
OPERATION_53 origin : [['chFiltBams', 'P']]
OPERATION_53 gives  : [['chBamWig', 'P']]


OPERATION_54 string : chFiltBams
      .map{ row -> [ row[0], null, null, file(row[1])] }
      .set{chBamWig}
OPERATION_54 origin : [['chFiltBams', 'P']]
OPERATION_54 gives  : [['chBamWig', 'P']]


OPERATION_55 string : endWfSummary = endSummary.collect { k,v -> "${k.padRight(30, '.')}: $v" }.join("\n")
OPERATION_55 origin : [['endSummary', 'P']]
OPERATION_55 gives  : [['endWfSummary', 'P']]


OPERATION_56 string : chGenomeReport = chGenomeNmaskReport
OPERATION_56 origin : [['chGenomeNmaskReport', 'P']]
OPERATION_56 gives  : [['chGenomeReport', 'P']]


OPERATION_57 string : chSnpFile = chSnp
OPERATION_57 origin : [['chSnp', 'P']]
OPERATION_57 gives  : [['chSnpFile', 'P']]


OPERATION_58 string : chGenomeReport = chGenomeParentalReport
OPERATION_58 origin : [['chGenomeParentalReport', 'P']]
OPERATION_58 gives  : [['chGenomeReport', 'P']]


OPERATION_59 string : chMappingMqc = starLogs
OPERATION_59 origin : [['starLogs', 'P']]
OPERATION_59 gives  : [['chMappingMqc', 'P']]


OPERATION_60 string : chMappingMqc = bowtie2Logs
OPERATION_60 origin : [['bowtie2Logs', 'P']]
OPERATION_60 gives  : [['chMappingMqc', 'P']]


OPERATION_61 string : chMappingMqc = hisat2Logs
OPERATION_61 origin : [['hisat2Logs', 'P']]
OPERATION_61 gives  : [['chMappingMqc', 'P']]


OPERATION_62 string : chMappingMqc = tophat2Logs
OPERATION_62 origin : [['tophat2Logs', 'P']]
OPERATION_62 gives  : [['chMappingMqc', 'P']]


