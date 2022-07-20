Name : MakeGenomeFilter
Inputs : [[0, 'fastaForGenomeSizes']]
Outputs : [[0, 'chromSizesChannel']]
Emits : []


Name : BWAIndex
Inputs : [[0, 'fastaForBwa']]
Outputs : [[0, 'bwaIndex']]
Emits : []


Name : CheckDesign
Inputs : [[0, 'designChannel']]
Outputs : [[0, 'designCheckedChannel']]
Emits : []


Name : FastQC
Inputs : [[0, 'rawReadsFastqcChannel']]
Outputs : [[0, 'fastqcMultiqcChannel']]
Emits : []


Name : TrimGalore
Inputs : [[0, 'rawReadsTrimgaloreChannel']]
Outputs : [[0, 'trimmedReadChannel'], [1, 'trimgaloreMultiqcChannel'], [2, 'trimgaloreFastqcMultiqcChannel']]
Emits : []


Name : BWAMem
Inputs : [[0, 'trimmedReadChannel'], [1, 'bwaIndex'], [2, 'bamtoolsFilterConfigChannel']]
Outputs : [[0, 'bwaChannel'], [1, 'bwaMultiqcChannel']]
Emits : []


Name : MergedRepBAM
Inputs : [[0, 'mergeChannel']]
Outputs : [[0, 'bedGraphChannel'], [1, 'mergeFlagstatMultiqcChannel'], [2, 'mergeidxStatsMultiqcChannel'], [3, 'mergeMarkDuplicatesMultiqcChannel']]
Emits : []


Name : ELRatio
Inputs : [[0, 'conditionChannel']]
Outputs : [[0, 'ELRatioChannel']]
Emits : []


Name : RTNormalization
Inputs : [[0, 'ELRatioChannel']]
Outputs : [[0, 'RTNormalizationChannel']]
Emits : []


Name : bigwig
Inputs : [[0, 'chromSizesChannel'], [1, 'bigwigInputChannel']]
Outputs : [[0, 'bigwigOutput']]
Emits : []


Name : MultiQC
Inputs : [[0, 'multiqcConfigChannel'], [1, 'fastqcMultiqcChannel'], [2, 'trimgaloreMultiqcChannel'], [3, 'trimgaloreFastqcMultiqcChannel'], [4, 'bwaMultiqcChannel'], [5, 'mergeFlagstatMultiqcChannel'], [6, 'mergeidxStatsMultiqcChannel'], [7, 'mergeMarkDuplicatesMultiqcChannel']]
Outputs : [[0, 'multiQCChannel']]
Emits : []


