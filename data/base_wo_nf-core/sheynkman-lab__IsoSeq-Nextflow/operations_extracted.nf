OPERATION_1 string : ch_ccs_reads = Channel.value(file(params.ccs_reads))
OPERATION_1 origin : []
OPERATION_1 gives  : [['ch_ccs_reads', 'P']]


OPERATION_2 string : ch_ccs_reads = Channel.fromPath("${params.ccs_reads}/*.ccs.bam")
OPERATION_2 origin : [['"${params.ccs_reads}/*.ccs.bam"', 'A']]
OPERATION_2 gives  : [['ch_ccs_reads', 'P']]


OPERATION_3 string : ch_barcodes = Channel.value(file(params.barcodes))
OPERATION_3 origin : []
OPERATION_3 gives  : [['ch_barcodes', 'P']]


OPERATION_4 string : _ch_all_barcodes = Channel
     .fromPath("${params.barcodes}")
     .splitFasta( record: [id: true, seqString: false ])
OPERATION_4 origin : [['"${params.barcodes}"', 'A']]
OPERATION_4 gives  : [['_ch_all_barcodes', 'P']]


OPERATION_5 string : ch_genome_fasta = Channel.value(file(params.genome_fasta))
OPERATION_5 origin : []
OPERATION_5 gives  : [['ch_genome_fasta', 'P']]


OPERATION_6 string : ch_genome_fasta_uncompressed = Channel.value(file(params.genome_fasta))
OPERATION_6 origin : []
OPERATION_6 gives  : [['ch_genome_fasta_uncompressed', 'P']]


OPERATION_7 string : _ch_all_barcodes.into{
    _ch_all_barcodes_3p
    _ch_all_barcodes_5p
}
OPERATION_7 origin : [['_ch_all_barcodes', 'P']]
OPERATION_7 gives  : []


OPERATION_8 string : _ch_3prime_barcodes = _ch_all_barcodes_3p
    .filter { record -> record.id =~ /_3p$/ }
OPERATION_8 origin : [['_ch_all_barcodes_3p', 'P']]
OPERATION_8 gives  : [['_ch_3prime_barcodes', 'P']]


OPERATION_9 string : _ch_5prime_barcodes = _ch_all_barcodes_5p
    .filter { record -> record.id =~ /_5p$/ }
OPERATION_9 origin : [['_ch_all_barcodes_5p', 'P']]
OPERATION_9 gives  : [['_ch_5prime_barcodes', 'P']]


OPERATION_10 string : ch_barcode_pairs_list = _ch_3prime_barcodes.combine(_ch_5prime_barcodes)
OPERATION_10 origin : [['_ch_3prime_barcodes', 'P'], ['_ch_5prime_barcodes', 'P']]
OPERATION_10 gives  : [['ch_barcode_pairs_list', 'P']]


OPERATION_11 string : ch_barcode_pairs.into{
    ch_barcode_pairs_view
    ch_barcode_pairs_use
}
OPERATION_11 origin : [['ch_barcode_pairs', 'P']]
OPERATION_11 gives  : []


OPERATION_12 string : ch_individual_lima_bam
    .flatten()
    .map { file ->
        def key = file.name.toString().tokenize('.')[-2]
        return tuple(key, file)
     }
    .groupTuple()
    .set{ ch_lima_grouped_by_barcode }
OPERATION_12 origin : [['ch_individual_lima_bam', 'P']]
OPERATION_12 gives  : [['ch_lima_grouped_by_barcode', 'P']]


OPERATION_13 string : ch_refined_flnc_report.collectFile(
    name:'full.flnc.report.csv', 
    keepHeader:true, 
    storeDir:"${params.outdir}/isoseq3/refine/").set{ch_combined_flnc_report}
OPERATION_13 origin : [['ch_refined_flnc_report', 'P']]
OPERATION_13 gives  : [['ch_combined_flnc_report', 'P']]


OPERATION_14 string : ch_collapsed_fasta.splitFasta(record: [id: true, seqString: true ])
OPERATION_14 origin : [['ch_collapsed_fasta', 'P']]
OPERATION_14 gives  : []


OPERATION_15 string : ch_barcode_pairs_view.view()
OPERATION_15 origin : [['ch_barcode_pairs_view', 'P']]
OPERATION_15 gives  : []


