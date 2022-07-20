OPERATION_1 string : fileSample = Channel.fromPath('samples.txt')
                    .splitText()
                    .map{ sample -> tuple(sample.split("/")[-1][0..-5], sample.split("/")[-1].split("_")[0], sample, sample.split("/")[0..-2].join("/")) }
OPERATION_1 origin : [["'samples.txt'", 'A']]
OPERATION_1 gives  : [['fileSample', 'P']]


