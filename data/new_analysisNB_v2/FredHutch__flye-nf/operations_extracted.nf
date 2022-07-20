OPERATION_1 string : Channel.from(
    file(
        params.manifest
    ).splitCsv(
        header: true, 
        sep: ","
    )
).ifEmpty { 
    error "Could not find any lines in ${params.manifest}" 
}.filter {
    r -> (r.name != null)
}.ifEmpty { 
    error "Could not find the 'name' header in ${params.manifest}" 
}.filter {
    r -> (r.reads != null)
}.ifEmpty { 
    error "Could not find the 'reads' header in ${params.manifest}" 
}.filter {
    r -> (!file(r.reads).isEmpty())
}.ifEmpty { 
    error "Could not find the files under the 'reads' header in ${params.manifest}" 
}.map {
    r -> [r["name"], file(r["reads"])]
}.set {
    input_ch
}
OPERATION_1 origin : []
OPERATION_1 gives  : [['input_ch', 'P']]


