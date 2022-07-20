OPERATION_1 string : fastq_ch = Channel.from(
        file(
            params.manifest
        ).splitCsv(
            header: true,
            sep: ","
        )
    ).filter {
        r -> (r.specimen != null)
    }.ifEmpty {
        exit 1, "Cannot find values in the 'specimen' column: ${params.manifest}"
    }.filter {
        r -> (r.R1 != null)
    }.ifEmpty {
        exit 1, "Cannot find values in the 'R1' column: ${params.manifest}"
    }.map {
        r -> [r["specimen"], [file(r["R1"])]]
    }
OPERATION_1 origin : []
OPERATION_1 gives  : [['fastq_ch', 'P']]


OPERATION_2 string : fastq_ch = Channel.from(
        file(
            params.manifest
        ).splitCsv(
            header: true,
            sep: ","
        )
    ).filter {
        r -> (r.specimen != null)
    }.ifEmpty {
        exit 1, "Cannot find values in the 'specimen' column: ${params.manifest}"
    }.filter {
        r -> (r.R1 != null)
    }.ifEmpty {
        exit 1, "Cannot find values in the 'R1' column: ${params.manifest}"
    }.filter {
        r -> (r.R2 != null)
    }.ifEmpty {
        exit 1, "Cannot find values in the 'R2' column: ${params.manifest}"
    }.map {
        r -> [r["specimen"], [file(r["R1"]), file(r["R2"])]]
    }
OPERATION_2 origin : []
OPERATION_2 gives  : [['fastq_ch', 'P']]


