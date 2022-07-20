OPERATION_1 string : Channel.fromPath("${demuxDir}/*", type: "dir", maxDepth: 1)
.filter { dir ->
                                                            
    ! "${dir.baseName}".endsWith("_test") && ! "${dir.baseName}".endsWith("_oldgood")
}
.map { dir ->
    def fullpath = new File("${dir}").getCanonicalPath()
    def basename = "${dir.baseName}"
    def type = "demux"
    return([ type, dir, basename, fullpath ])
}
.set { demux_ch }
OPERATION_1 origin : [['"${demuxDir}/*", type: "dir", maxDepth: 1', 'A']]
OPERATION_1 gives  : [['demux_ch', 'P']]


OPERATION_2 string : Channel.fromPath("${NGS580Dir}/*", type: "dir", maxDepth: 1)
.filter { dir ->
                                                            
    ! "${dir.baseName}".endsWith("_test") && ! "${dir.baseName}".endsWith("_test2")
}
.map { dir ->
    def fullpath = new File("${dir}").getCanonicalPath()
    def basename = "${dir.baseName}"
    def type = "NGS580"
    return([ type, dir, basename, fullpath ])
}
.set { ngs580_ch }
OPERATION_2 origin : [['"${NGS580Dir}/*", type: "dir", maxDepth: 1', 'A']]
OPERATION_2 gives  : [['ngs580_ch', 'P']]


OPERATION_3 string : Channel.fromPath("${samplesheetDir}/*", type: "dir", maxDepth: 1)
.map { dir ->
    def fullpath = new File("${dir}").getCanonicalPath()
    def basename = "${dir.baseName}"
    def type = "samplesheet"
    return([ type, dir, basename, fullpath ])
}
.set { samplesheet_ch }
OPERATION_3 origin : [['"${samplesheetDir}/*", type: "dir", maxDepth: 1', 'A']]
OPERATION_3 gives  : [['samplesheet_ch', 'P']]


OPERATION_4 string : Channel.from([
    file("${pipelinesDir}/demux-nf"),
    file("${pipelinesDir}/NGS580-nf"),
    file("${pipelinesDir}/queue-stats"),
    ])
.map { dir ->
    def fullpath = new File("${dir}").getCanonicalPath()
    def basename = "${dir.baseName}"
    def type = "pipeline"
    return([ type, dir, basename, fullpath ])
}
.set { pipelines_dirs }
OPERATION_4 origin : []
OPERATION_4 gives  : [['pipelines_dirs', 'P']]


