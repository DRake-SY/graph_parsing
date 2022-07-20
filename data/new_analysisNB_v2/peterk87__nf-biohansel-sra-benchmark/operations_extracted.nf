OPERATION_1 string : Channel.from(schemes)
  .into { ch_schemes }
OPERATION_1 origin : [['schemes', 'V']]
OPERATION_1 gives  : [['ch_schemes', 'P']]


OPERATION_2 string : summary.collect { k,v -> "${k.padRight(15)}: $v" }.join("\n")
OPERATION_2 origin : [['summary', 'P']]
OPERATION_2 gives  : []


OPERATION_3 string : ch_schemes_shuffled
  .splitText(limit: params.n_genomes, elem: 2)
  .map { item ->
    item[2] = item[2].replaceAll("\\s", "")
    item
  }
  .filter { it[2] != '' }
  .dump(tag: "ch_accessions")
  .set { ch_accessions }
OPERATION_3 origin : [['ch_schemes_shuffled', 'P']]
OPERATION_3 gives  : [['ch_accessions', 'P']]


OPERATION_4 string : ch_fastqs
  .groupTuple(by: 0)
  .map { it -> 
    it[1] = it[1][0]
    it[3] = it[3].flatten()
    it[4] = it[4].flatten()
    it[5] = it[5][0]
    it[6] = it[6][0]
    it
  }
  .dump(tag: "ch_collected_fastqs")
  .set { ch_collected_fastqs }
OPERATION_4 origin : [['ch_fastqs', 'P']]
OPERATION_4 gives  : [['ch_collected_fastqs', 'P']]


OPERATION_5 string : ch_biohansel_multi_trace.mix(ch_biohansel_single_trace, ch_snippy_trace)
  .collectFile() { scheme, samples, threads, type, trace_file, iter, reads1, reads2 ->
    size_bytes = 0
    if (reads1 instanceof ArrayList) {
      reads1.collect( { size_bytes += file(it).size() } )
      reads2.collect( { size_bytes += file(it).size() } )
    } else {
      size_bytes = file(reads1).size() + file(reads2).size()
    }
    ['trace.txt', 
     """
     ${trace_file.text}
     scheme=${scheme}
     samples=${samples}
     threads=${threads}
     type=${type}
     iter=${iter}
     size_bytes=${size_bytes}
     @@@
     """.stripIndent()]
  }
  .set { ch_trace }
OPERATION_5 origin : [['ch_biohansel_multi_trace', 'P'], ['ch_biohansel_single_trace', 'P'], ['ch_snippy_trace', 'P']]
OPERATION_5 gives  : [['ch_trace', 'P']]


