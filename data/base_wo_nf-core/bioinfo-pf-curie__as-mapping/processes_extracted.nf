Name : prepareParentalReferenceGenome
Inputs : [[0, 'fastaParentalGenome'], [1, 'vcfParentalGenome']]
Outputs : [[0, 'chGenomeParentalReport'], [1, 'chGenomeParentalFasta']]
Emits : []


Name : prepareNmaskReferenceGenome
Inputs : [[0, 'fastaNmaskGenome'], [1, 'vcfNmaskGenome']]
Outputs : [[0, 'chGenomeNmaskReport'], [1, 'chGenomeNmaskFasta'], [2, 'chSnp']]
Emits : []


Name : makeStarIndex
Inputs : [[0, 'genomeFastaStar']]
Outputs : [[0, 'starIdx']]
Emits : []


Name : makeBowtie2Index
Inputs : [[0, 'genomeFastaBowtie2']]
Outputs : [[0, '']]
Emits : []


Name : makeHisat2Splicesites
Inputs : [[0, 'gtfHisat2Splicesites']]
Outputs : [[0, 'indexingSplicesites'], [0, 'alignmentSplicesites']]
Emits : []


Name : makeHisat2Index
Inputs : [[0, 'genomeFastaHisat2'], [1, 'indexingSplicesites'], [2, 'gtfHisat2Index']]
Outputs : [[0, 'hisat2Idx']]
Emits : []


Name : trimGalore
Inputs : [[0, 'rawReads']]
Outputs : [[0, 'readsFastqc'], [0, 'readsStar'], [0, 'readsBowtie2'], [0, 'readsHisat2'], [0, 'readsTophat2'], [1, 'trimResults']]
Emits : []


Name : fastqc
Inputs : [[0, 'readsFastqc']]
Outputs : [[0, 'fastqcResults']]
Emits : []


Name : star
Inputs : [[0, 'readsStar'], [1, 'starIdx'], [2, 'gtfStar']]
Outputs : [[0, 'starBam'], [1, 'starLogs']]
Emits : []


Name : bowtie2
Inputs : [[0, 'readsBowtie2'], [1, 'bowtie2Idx']]
Outputs : [[0, 'bowtie2Bam'], [1, 'bowtie2Logs']]
Emits : []


Name : tophat2
Inputs : [[0, 'readsTophat2'], [1, 'tophat2Idx'], [2, 'gtfTophat2']]
Outputs : [[0, 'tophat2Bam'], [1, 'tophat2Logs']]
Emits : []


Name : hisat2
Inputs : [[0, 'readsHisat2'], [1, 'hisat2Idx'], [2, 'alignmentSplicesites']]
Outputs : [[0, 'hisat2Bam'], [1, 'hisat2Logs']]
Emits : []


Name : flagStat
Inputs : [[0, 'chFlagStat']]
Outputs : [[0, 'chFlagStatResults']]
Emits : []


Name : tagParentalBams
Inputs : [[0, 'chParentalBams']]
Outputs : [[0, 'chTagParentalBams'], [1, 'tagParentalLog']]
Emits : []


Name : tagNmaskBams
Inputs : [[0, 'chNmaskBams'], [1, 'chSnpFile']]
Outputs : [[0, 'chTagNmaskBams'], [1, 'tagNmaskLog']]
Emits : []


Name : rmDuplicates
Inputs : [[0, 'chTagBamsPicard']]
Outputs : [[0, 'chMarkedBams'], [1, 'chMarkedPicstats'], [2, 'chDupStat']]
Emits : []


Name : splitTaggedBam
Inputs : [[0, 'chFiltBamsSplit']]
Outputs : [[0, 'genomeBams'], [1, 'splitLogs'], [2, 'splitMqc']]
Emits : []


Name : geneASratio
Inputs : [[0, 'chBamCount'], [1, 'chGtf']]
Outputs : [[0, 'asCounts'], [1, 'asRatio'], [2, 'asRatioMqc']]
Emits : []


Name : mergeASratio
Inputs : [[0, 'asRatio']]
Outputs : [[0, 'mergedRatio']]
Emits : []


Name : bigWig
Inputs : [[0, 'chBamWig'], [1, 'chBlacklistBigWig']]
Outputs : [[0, 'chBigWig']]
Emits : []


Name : get_software_versions
Inputs : []
Outputs : [[0, 'software_versions_yaml']]
Emits : []


Name : workflow_summary_mqc
Inputs : []
Outputs : [[0, 'workflow_summary_yaml']]
Emits : []


Name : multiqc
Inputs : [[0, 'chSplan'], [1, 'ch_metadata'], [2, 'chMultiqcConfig'], [3, 'software_versions_yaml'], [4, 'workflow_summary_yaml'], [5, 'fastqcResults'], [6, 'trimResults'], [7, 'chMappingMqc'], [8, 'chMarkedPicstats'], [9, 'chFlagStatResults'], [10, 'chDupStat'], [11, 'chTagLog'], [12, 'splitMqc'], [13, 'asRatioMqc']]
Outputs : [[0, 'splan'], [1, 'multiqc_report']]
Emits : []


Name : output_documentation
Inputs : [[0, 'chOutputDocs']]
Outputs : []
Emits : []


