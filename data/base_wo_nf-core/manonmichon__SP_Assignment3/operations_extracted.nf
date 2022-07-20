OPERATION_1 string : Channel
    .fromPath("./GitHub/SP_Assignment3/query_long.tsv")                                
    .splitCsv(header: ['wikidata', 'smiles', 'isosmiles'], sep:'\t')
    .map{ row -> tuple(row.wikidata, row.smiles, row.isosmiles) }
    .buffer( size: 150000, remainder: true)                                     
    .set { molecules_ch }
OPERATION_1 origin : [['"./GitHub/SP_Assignment3/query_long.tsv"', 'A']]
OPERATION_1 gives  : [['molecules_ch', 'P']]


