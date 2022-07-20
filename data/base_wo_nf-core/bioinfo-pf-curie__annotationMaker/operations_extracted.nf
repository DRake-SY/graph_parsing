OPERATION_1 string : Channel.fromPath("${params.fasta}")
    .ifEmpty { exit 1, "Reference Genome not found: ${params.fasta}" }
    .into { chFasta; chFastaBwa; chFastaStar; chFastaBowtie2; chFastaHisat2; chFastaCellranger; chFastaSalmon }
OPERATION_1 origin : [['"${params.fasta}"', 'A']]
OPERATION_1 gives  : [['chFasta', 'P'], ['chFastaBwa', 'P'], ['chFastaStar', 'P'], ['chFastaBowtie2', 'P'], ['chFastaHisat2', 'P'], ['chFastaCellranger', 'P'], ['chFastaSalmon', 'P']]


OPERATION_2 string : chFastaLink = Channel.empty()
OPERATION_2 origin : []
OPERATION_2 gives  : [['chFastaLink', 'P']]


OPERATION_3 string : Channel.from(fasta)
        .ifEmpty { exit 1, "Reference Genome not found: ${fasta}" }
        .set { chFastaLink }
OPERATION_3 origin : [['fasta', 'V']]
OPERATION_3 gives  : [['chFastaLink', 'P']]


OPERATION_4 string : Channel.fromPath(fasta)
        .ifEmpty { exit 1, "Reference Genome not found: ${fasta}" }
        .into { chFasta; chFastaBwa; chFastaStar; chFastaBowtie2; chFastaHisat2; chFastaCellranger; chFastaSalmon }
OPERATION_4 origin : [['fasta', 'A']]
OPERATION_4 gives  : [['chFasta', 'P'], ['chFastaBwa', 'P'], ['chFastaStar', 'P'], ['chFastaBowtie2', 'P'], ['chFastaHisat2', 'P'], ['chFastaCellranger', 'P'], ['chFastaSalmon', 'P']]


OPERATION_5 string : chFastaLink = Channel.empty()
OPERATION_5 origin : []
OPERATION_5 gives  : [['chFastaLink', 'P']]


OPERATION_6 string : Channel.fromPath("${params.transcripts}")
    .ifEmpty { exit 1, "Reference Genome not found: ${params.transcripts}" }
    .into { chTranscriptsSalmon; chTranscriptsKallisto }
OPERATION_6 origin : [['"${params.transcripts}"', 'A']]
OPERATION_6 gives  : [['chTranscriptsSalmon', 'P'], ['chTranscriptsKallisto', 'P']]


OPERATION_7 string : chTrsLink = Channel.empty()
OPERATION_7 origin : []
OPERATION_7 gives  : [['chTrsLink', 'P']]


OPERATION_8 string : Channel.from(transcriptome)
        .ifEmpty { exit 1, "Reference annotation not found: ${transcriptome}" }
        .set { chTrsLink }
OPERATION_8 origin : [['transcriptome', 'V']]
OPERATION_8 gives  : [['chTrsLink', 'P']]


OPERATION_9 string : Channel
        .fromPath(transcriptome)
        .ifEmpty { exit 1, "Reference annotation file not found: ${transcriptome}" }
        .into { chTranscriptsSalmon; chTranscriptsKallisto }
OPERATION_9 origin : [['transcriptome', 'A']]
OPERATION_9 gives  : [['chTranscriptsSalmon', 'P'], ['chTranscriptsKallisto', 'P']]


OPERATION_10 string : Channel.empty().into{ chTrsLink; chTranscriptsSalmon; chTranscriptsKallisto }
OPERATION_10 origin : []
OPERATION_10 gives  : [['chTrsLink', 'P'], ['chTranscriptsSalmon', 'P'], ['chTranscriptsKallisto', 'P']]


OPERATION_11 string : Channel.empty().into{ chTrsLink; chTranscriptsSalmon; chTranscriptsKallisto }
OPERATION_11 origin : []
OPERATION_11 gives  : [['chTrsLink', 'P'], ['chTranscriptsSalmon', 'P'], ['chTranscriptsKallisto', 'P']]


OPERATION_12 string : Channel
    .fromPath(params.gtf)
    .ifEmpty { exit 1, "GTF annotation file not found: ${params.gtf}" }
    .into { chGtf; chGtfHisat2Splicesites; chGtfHisat2Index; chGtfBed12; chGtfGene; chGtfCellranger }
OPERATION_12 origin : [['params.gtf', 'A']]
OPERATION_12 gives  : [['chGtf', 'P'], ['chGtfHisat2Splicesites', 'P'], ['chGtfHisat2Index', 'P'], ['chGtfBed12', 'P'], ['chGtfGene', 'P'], ['chGtfCellranger', 'P']]


OPERATION_13 string : Channel.empty().into{ chGff; chGtfLink; chGffLink }
OPERATION_13 origin : []
OPERATION_13 gives  : [['chGff', 'P'], ['chGtfLink', 'P'], ['chGffLink', 'P']]


OPERATION_14 string : Channel
    .fromPath(params.gff)
    .ifEmpty { exit 1, "GFF annotation file not found: ${params.gtf}" }
    .set { chGff }
OPERATION_14 origin : [['params.gff', 'A']]
OPERATION_14 gives  : [['chGff', 'P']]


OPERATION_15 string : Channel.empty().into{ chGtf; chGtfLink; chGffLink }
OPERATION_15 origin : []
OPERATION_15 gives  : [['chGtf', 'P'], ['chGtfLink', 'P'], ['chGffLink', 'P']]


OPERATION_16 string : Channel.from(gtf)
        .ifEmpty { exit 1, "GTF annotation not found: ${gtf}" }
        .set { chGtfLink }
OPERATION_16 origin : [['gtf', 'V']]
OPERATION_16 gives  : [['chGtfLink', 'P']]


OPERATION_17 string : chGffLink = Channel.empty()
OPERATION_17 origin : []
OPERATION_17 gives  : [['chGffLink', 'P']]


OPERATION_18 string : Channel
        .fromPath(gtf)
        .ifEmpty { exit 1, "GTF annotation file not found: ${gtf}" }
        .into { chGtf; chGtfHisat2Splicesites; chGtfHisat2Index; chGtfBed12; chGtfGene; chGtfCellranger }
OPERATION_18 origin : [['gtf', 'A']]
OPERATION_18 gives  : [['chGtf', 'P'], ['chGtfHisat2Splicesites', 'P'], ['chGtfHisat2Index', 'P'], ['chGtfBed12', 'P'], ['chGtfGene', 'P'], ['chGtfCellranger', 'P']]


OPERATION_19 string : Channel.empty().into{ chGtfLink; chGffLink }
OPERATION_19 origin : []
OPERATION_19 gives  : [['chGtfLink', 'P'], ['chGffLink', 'P']]


OPERATION_20 string : Channel.from(gff)
        .ifEmpty { exit 1, "Reference annotation not found: ${gff}" }
        .set { chGffLink }
OPERATION_20 origin : [['gff', 'V']]
OPERATION_20 gives  : [['chGffLink', 'P']]


OPERATION_21 string : chGtfLink = Channel.empty()
OPERATION_21 origin : []
OPERATION_21 gives  : [['chGtfLink', 'P']]


OPERATION_22 string : Channel
        .fromPath(gff)
        .ifEmpty { exit 1, "GFF annotation file not found: ${gff}" }
        .set { chGff }
OPERATION_22 origin : [['gff', 'A']]
OPERATION_22 gives  : [['chGff', 'P']]


OPERATION_23 string : Channel.empty().into{ chGtfLink; chGffLink }
OPERATION_23 origin : []
OPERATION_23 gives  : [['chGtfLink', 'P'], ['chGffLink', 'P']]


OPERATION_24 string : Channel.empty().into{ chGff; chGtf; chGtfBed12; chGtfGene; chGtfHisat2Splicesites; chGtfHisat2Index; chGffLink; chGtfLink; chGtfCellranger }
OPERATION_24 origin : []
OPERATION_24 gives  : [['chGff', 'P'], ['chGtf', 'P'], ['chGtfBed12', 'P'], ['chGtfGene', 'P'], ['chGtfHisat2Splicesites', 'P'], ['chGtfHisat2Index', 'P'], ['chGffLink', 'P'], ['chGtfLink', 'P'], ['chGtfCellranger', 'P']]


OPERATION_25 string : Channel.empty().into{ chGtf; chGtfBed12; chGtfGene; chGtfHisat2Splicesites; chGtfHisat2Index; chGffLink; chGtfLink; chGtfCellranger }
OPERATION_25 origin : []
OPERATION_25 gives  : [['chGtf', 'P'], ['chGtfBed12', 'P'], ['chGtfGene', 'P'], ['chGtfHisat2Splicesites', 'P'], ['chGtfHisat2Index', 'P'], ['chGffLink', 'P'], ['chGtfLink', 'P'], ['chGtfCellranger', 'P']]


OPERATION_26 string : summary.collect { k,v -> "${k.padRight(15)}: $v" }.join("\n")
OPERATION_26 origin : [['summary', 'P']]
OPERATION_26 gives  : []


OPERATION_27 string : chFastaURL.into{chFasta; chFastaBwa; chFastaStar; chFastaBowtie2; chFastaHisat2; chFastaCellranger; chFastaKallisto; chFastaSalmon}
OPERATION_27 origin : [['chFastaURL', 'P']]
OPERATION_27 gives  : [['chFasta', 'P'], ['chFastaBwa', 'P'], ['chFastaStar', 'P'], ['chFastaBowtie2', 'P'], ['chFastaHisat2', 'P'], ['chFastaCellranger', 'P'], ['chFastaKallisto', 'P'], ['chFastaSalmon', 'P']]


OPERATION_28 string : chTrsURL.into{chTranscriptsSalmon; chTranscriptsKallisto}
OPERATION_28 origin : [['chTrsURL', 'P']]
OPERATION_28 gives  : [['chTranscriptsSalmon', 'P'], ['chTranscriptsKallisto', 'P']]


OPERATION_29 string : chAnnotURL.into{chGtfHisat2Splicesites; chGtfHisat2Index; chGtf; chGtfBed12; chGtfGene; chGtfCellranger}
OPERATION_29 origin : [['chAnnotURL', 'P']]
OPERATION_29 gives  : [['chGtfHisat2Splicesites', 'P'], ['chGtfHisat2Index', 'P'], ['chGtf', 'P'], ['chGtfBed12', 'P'], ['chGtfGene', 'P'], ['chGtfCellranger', 'P']]


OPERATION_30 string : chAnnotURL.set{chGff}
OPERATION_30 origin : [['chAnnotURL', 'P']]
OPERATION_30 gives  : [['chGff', 'P']]


OPERATION_31 string : endWfSummary = endSummary.collect { k,v -> "${k.padRight(30, '.')}: $v" }.join("\n")
OPERATION_31 origin : [['endSummary', 'P']]
OPERATION_31 gives  : [['endWfSummary', 'P']]


