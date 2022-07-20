Name : vcf2plink
Inputs : [[0, 'vcf'], [1, 'data']]
Outputs : [[0, 'plink']]
Emits : []


Name : association
Inputs : [[0, 'plink']]
Outputs : [[0, 'asssociation']]
Emits : []


Name : plots
Inputs : [[0, 'asssociation']]
Outputs : [[0, 'plots']]
Emits : []


Name : visualisations
Inputs : [[0, 'plots']]
Outputs : [[0, 'viz']]
Emits : []


