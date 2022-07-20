OPERATION_1 string : Channel.fromPath("./data/wikidata_smiles.tsv")
    .splitCsv(header: ['molecule_ids', 'smiles', 'isoSmiles'], sep:'\t', by:1000)
    .map{ row -> tuple(row.molecule_ids, row.smiles, row.isoSmiles) }
    .set { molecules_ch }
OPERATION_1 origin : [['"./data/wikidata_smiles.tsv"', 'A']]
OPERATION_1 gives  : [['molecules_ch', 'P']]


