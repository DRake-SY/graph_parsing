OPERATION_1 string : Channel.fromPath(params.inputDir+'/*.txt')
                        .ifEmpty { exit 1, "Input dir for annotation txt files not found at ${params.inputDir}. Is the dir path correct?" }
                        .filter{txt -> txt =~/chr\d+/}
                        .map { txt -> ['chr'+ txt.simpleName.split('_chr').last() , txt] }
                                                                                                                                        
                        .filter { it[0] =~ /chr[^XYM]/ }
                        .set { ch_bcftools_site_metrics_subcols }
OPERATION_1 origin : [["params.inputDir+'/*.txt'", 'A']]
OPERATION_1 gives  : [['ch_bcftools_site_metrics_subcols', 'P']]


OPERATION_2 string : Channel.fromPath(params.inputFinalPlatekeys)
                        .ifEmpty { exit 1, "Input file with samples and platekeys data not found at ${params.inputFinalPlatekeys}. Is the file path correct?" }
                        .set { ch_inputFinalPlatekeys }
OPERATION_2 origin : [['params.inputFinalPlatekeys', 'A']]
OPERATION_2 gives  : [['ch_inputFinalPlatekeys', 'P']]


OPERATION_3 string : Channel.fromPath(params.inputUNRELATED_1KGP3).set { ch_inputUNRELATED_1KGP3 }
OPERATION_3 origin : [['params.inputUNRELATED_1KGP3', 'A']]
OPERATION_3 gives  : [['ch_inputUNRELATED_1KGP3', 'P']]


OPERATION_4 string : Channel.fromPath(params.input1KGP3).set { ch_input1KGP3 }
OPERATION_4 origin : [['params.input1KGP3', 'A']]
OPERATION_4 gives  : [['ch_input1KGP3', 'P']]


OPERATION_5 string : Channel.fromPath(params.inputSuper_pop_codes).set { ch_inputSuper_pop_codes }
OPERATION_5 origin : [['params.inputSuper_pop_codes', 'A']]
OPERATION_5 gives  : [['ch_inputSuper_pop_codes', 'P']]


OPERATION_6 string : Channel.fromPath(params.input05both1K100K_eigenvec).set { ch_input05both1K100K_eigenvec }
OPERATION_6 origin : [['params.input05both1K100K_eigenvec', 'A']]
OPERATION_6 gives  : [['ch_input05both1K100K_eigenvec', 'P']]


OPERATION_7 string : Channel.fromPath(params.inputGELprojection_proj_eigenvec).set { ch_GELprojection_proj_eigenvec }
OPERATION_7 origin : [['params.inputGELprojection_proj_eigenvec', 'A']]
OPERATION_7 gives  : [['ch_GELprojection_proj_eigenvec', 'P']]


OPERATION_8 string : Channel.fromPath(params.inputPCsancestryrelated)
                        .ifEmpty { exit 1, "Input file with Michigan LD data not found at ${params.inputPCsancestryrelated}. Is the file path correct?" }
                        .set { ch_inputPCsancestryrelated }
OPERATION_8 origin : [['params.inputPCsancestryrelated', 'A']]
OPERATION_8 gives  : [['ch_inputPCsancestryrelated', 'P']]


OPERATION_9 string : Channel.fromPath(params.inputAncestryAssignmentProbs)
                        .ifEmpty { exit 1, "Input file with Michigan LD data not found at ${params.inputAncestryAssignmentProbs}. Is the file path correct?" }
                        .set { ch_inputAncestryAssignmentProbs }
OPERATION_9 origin : [['params.inputAncestryAssignmentProbs', 'A']]
OPERATION_9 gives  : [['ch_inputAncestryAssignmentProbs', 'P']]


OPERATION_10 string : Channel.fromPath(params.inputProbs200K)
                        .ifEmpty { exit 1, "Input file with Ancestry assignments of 200K data not found at ${params.inputinputProbs200K}. Is the file path correct?" }
                        .set { ch_inputinputProbs200K }
OPERATION_10 origin : [['params.inputProbs200K', 'A']]
OPERATION_10 gives  : [['ch_inputinputProbs200K', 'P']]


OPERATION_11 string : Channel.fromPath(params.inputMichiganLDfileExclude)
                        .ifEmpty { exit 1, "Input file with Michigan LD for excluding regions  not found at ${params.inputMichiganLDfile}. Is the file path correct?" }
                        .set { ch_inputMichiganLDfileExclude }
OPERATION_11 origin : [['params.inputMichiganLDfileExclude', 'A']]
OPERATION_11 gives  : [['ch_inputMichiganLDfileExclude', 'P']]


OPERATION_12 string : Channel.fromPath(params.input)
                        .ifEmpty { exit 1, "Input .csv list of input tissues not found at ${params.input}. Is the file path correct?" }
                        .splitCsv(sep: ',',  skip: 1)
                        .map { bcf, index -> ['chr'+file(bcf).simpleName.split('_chr').last() , file(bcf), file(index)] }
                        .filter{bcf -> bcf =~/chr\d+/}
                                                                                                                                        
                        .filter { it[0] =~ /chr[^XYM]/ }
                        .set { ch_bcfs }
OPERATION_12 origin : [['params.input', 'A']]
OPERATION_12 gives  : [['ch_bcfs', 'P']]


OPERATION_13 string : configFiles.join(', ')
OPERATION_13 origin : [['configFiles', 'P']]
OPERATION_13 gives  : []


OPERATION_14 string : summary.collect { k,v -> "${k.padRight(18)}: $v" }.join("\n")
OPERATION_14 origin : [['summary', 'P']]
OPERATION_14 gives  : []


