OPERATION_1 string : Channel
    .from(fastaFile)
    .splitFasta( record: [id: true, seqString: true ])
    .collectFile(name: chromLen) { record -> record.id + "\t" + "0" + "\t" + record.seqString.length() + "\n"}
    .set{lengthGenome}
OPERATION_1 origin : [['fastaFile', 'V']]
OPERATION_1 gives  : [['lengthGenome', 'P']]


OPERATION_2 string : Channel
    .from(genLen)
    .set{lengthGenome_sRNAbed}
OPERATION_2 origin : [['genLen', 'V']]
OPERATION_2 gives  : [['lengthGenome_sRNAbed', 'P']]


OPERATION_3 string : lengthGenome.into {
    lengthGenome_sRNAbed
    lengthGenomePlot
    lengthGenomeFilter
}
OPERATION_3 origin : [['lengthGenome', 'P']]
OPERATION_3 gives  : []


OPERATION_4 string : sRNAWindowsBED.into {
    sRNAWindowsBEDsRNACharP
    sRNAWindowsBEDJoin
}
OPERATION_4 origin : [['sRNAWindowsBED', 'P']]
OPERATION_4 gives  : []


OPERATION_5 string : sRNAWindowsBEDsRNACharP
.collectFile(name: file("${params.org}_genomesRNAWindows.bed"))
OPERATION_5 origin : [['sRNAWindowsBEDsRNACharP', 'P']]
OPERATION_5 gives  : []


OPERATION_6 string : proteinCodingBED
 .collectFile(name: file("${params.org}_genomeAnnotation_proteincoding.bed"))
OPERATION_6 origin : [['proteinCodingBED', 'P']]
OPERATION_6 gives  : []


OPERATION_7 string : sRNACharPresult
.collectFile(name: file("${params.org}_FeatureTable.tsv"))
OPERATION_7 origin : [['sRNACharPresult', 'P']]
OPERATION_7 gives  : []


OPERATION_8 string : sRNARankingJoined.into {
    sRNARankingJoinedFilter
    sRNARankingJoinedPlot
    sRNARankingJoinedOutput
}
OPERATION_8 origin : [['sRNARankingJoined', 'P']]
OPERATION_8 gives  : []


OPERATION_9 string : sRNARankingJoinedOutput
.collectFile(name: file("${params.org}_Genome_sRNAScores.txt"))
OPERATION_9 origin : [['sRNARankingJoinedOutput', 'P']]
OPERATION_9 gives  : []


OPERATION_10 string : GenomePlotsRNA
.collectFile(name: file("${params.org}_GenomePlotsRNA.html"))
OPERATION_10 origin : [['GenomePlotsRNA', 'P']]
OPERATION_10 gives  : []


OPERATION_11 string : GenomePlotNosRNA
.collectFile(name: file("${params.org}_GenomePlotNosRNA.html"))
OPERATION_11 origin : [['GenomePlotNosRNA', 'P']]
OPERATION_11 gives  : []


OPERATION_12 string : pipelineRerun
.collectFile(name: file("${params.org}_GenomeWindows.bed"))
OPERATION_12 origin : [['pipelineRerun', 'P']]
OPERATION_12 gives  : []


