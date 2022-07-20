OPERATION_1 string : percResults.subscribe { results ->
    results.copyTo("s3://caas-omicsdi/pride/data/results.txt")
    println "Final results at: results.txt"
}
OPERATION_1 origin : [['percResults', 'P']]
OPERATION_1 gives  : []


