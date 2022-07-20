OPERATION_1 string : bam_ch = Channel.fromPath(params.bam)
OPERATION_1 origin : [['params.bam', 'A']]
OPERATION_1 gives  : [['bam_ch', 'P']]


OPERATION_2 string : whatToPlot = Channel.from("scatterplot","heatmap")
OPERATION_2 origin : [['"scatterplot","heatmap"', 'V']]
OPERATION_2 gives  : [['whatToPlot', 'P']]


OPERATION_3 string : method = Channel.from("spearman","pearson")
OPERATION_3 origin : [['"spearman","pearson"', 'V']]
OPERATION_3 gives  : [['method', 'P']]


OPERATION_4 string : blackListFileName = Channel.fromPath(params.blackListFileName)
OPERATION_4 origin : [['params.blackListFileName', 'A']]
OPERATION_4 gives  : [['blackListFileName', 'P']]


