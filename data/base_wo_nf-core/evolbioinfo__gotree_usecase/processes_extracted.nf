Name : getNCBIIds
Inputs : [[0, 'refseqid'], [1, 'gene2accession'], [2, 'geneinfo']]
Outputs : [[1, 'hgncid']]
Emits : []


Name : getOrthoDBIds
Inputs : [[0, 'hgncid']]
Outputs : [[0, 'protids'], [0, 'protids2']]
Emits : []


Name : downloadSequences
Inputs : [[0, 'protids']]
Outputs : [[0, 'sequences']]
Emits : []


Name : getMapTable
Inputs : [[0, 'sequences']]
Outputs : [[0, 'mapfile'], [1, 'genefile']]
Emits : []


Name : renameSequences
Inputs : [[0, 'mapfile']]
Outputs : [[0, 'renamed']]
Emits : []


Name : cleanSequences
Inputs : [[0, 'renamed']]
Outputs : [[0, 'cleaned']]
Emits : []


Name : alignSequences
Inputs : [[0, 'cleaned']]
Outputs : [[0, 'alignment']]
Emits : []


Name : concatSequences
Inputs : [[0, 'alignment']]
Outputs : [[0, 'concat']]
Emits : []


Name : cleanAlign
Inputs : [[0, 'concat']]
Outputs : [[0, 'cleanalign']]
Emits : []


Name : reformatAlignment
Inputs : [[0, 'cleanalign']]
Outputs : [[0, 'alignmentphylip']]
Emits : []


Name : inferTrueTree
Inputs : [[0, 'alignmentphylip'], [1, 'seed']]
Outputs : [[0, 'tree'], [0, 'tree2']]
Emits : []


Name : rerootTree
Inputs : [[0, 'tree2']]
Outputs : [[0, 'reroottree1'], [0, 'reroottree2']]
Emits : []


Name : downloadNewickTaxonomy
Inputs : []
Outputs : [[0, 'ncbitax']]
Emits : []


Name : pruneNCBITax
Inputs : [[0, 'tree'], [1, 'ncbirenamefile'], [2, 'ncbitax']]
Outputs : [[0, 'ncbipruned']]
Emits : []


Name : renameNCBITaxonomy
Inputs : [[0, 'ncbipruned'], [1, 'ncbirenamefile']]
Outputs : [[0, 'ncbitaxrename']]
Emits : []


Name : rerootNCBITax
Inputs : [[0, 'ncbitaxrename']]
Outputs : [[0, 'ncbirerooted1'], [0, 'ncbirerooted2']]
Emits : []


Name : annotateTree
Inputs : [[0, 'reroottree1'], [1, 'ncbirerooted1']]
Outputs : [[0, 'annotated']]
Emits : []


Name : compareTrees
Inputs : [[0, 'reroottree2'], [1, 'ncbirerooted2']]
Outputs : [[0, 'comparison']]
Emits : []


Name : uploadTree
Inputs : [[0, 'annotated'], [1, 'itolconfig'], [2, 'itolkey'], [3, 'itolproject']]
Outputs : [[0, 'iTOLurl'], [1, 'iTOLimage']]
Emits : []


