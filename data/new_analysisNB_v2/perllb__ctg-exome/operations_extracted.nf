OPERATION_1 string : channel.nf.sc-rna-10x.csv")

                                                                   
newsheet = "${basedir}/samplesheet.demux.nf.exome.csv"

                                
all_lines = sheet.readLines()
write_b = false                                 
channel_sheet.text=""     

for ( line in all_lines ) {

    if ( write_b ) {
	channel_sheet.append(line + "\n")
    }
    if (line.contains("[Data]")) {
	write_b = true
    }
}


println "============================="
println ">>> exome dragen pipeline "
println ""
println "> INPUT: "
println "> runfolder		: $runfolder "
println "> sample-sheet		: $sheet "
println "> run-meta-id		: $metaID "
println "> basedir		: $basedir "
println "> bcl2fastq args	: $b2farg "
println ""
println "> OUTPUT: "
println "> output-dir		: $OUTDIR "
println "> fastq-dir		: $FQDIR "
println "> qc-dir		: $QCDIR "
println "> fastqc-dir		: $FQCDIR "
println "> ctg-qc-dir		: $CTGQC "
println "============================="

              
Channel
    .fromPath(channel_sheet)
    .splitCsv(header
OPERATION_1 origin : [['channel_sheet', 'A']]
OPERATION_1 gives  : []


OPERATION_2 string : Channel
    .fromPath(channel_sheet)
    .splitCsv(header:true)
    .map { row -> tuple(  row.Sample_Project, row.panel ) }
    .unique()
    .tap{infoProjects}
    .set{ dragen_summary  }
OPERATION_2 origin : [['channel_sheet', 'A']]
OPERATION_2 gives  : [['dragen_summary', 'P'], ['infoProjects', 'P']]


OPERATION_3 string : Channel
	 .from("1")
    	 .set{ run_analysis }
OPERATION_3 origin : [['"1"', 'V']]
OPERATION_3 gives  : [['run_analysis', 'P']]


OPERATION_4 string : infoSamples.subscribe{ println "Sample: $it" }
OPERATION_4 origin : [['infoSamples', 'P']]
OPERATION_4 gives  : []


OPERATION_5 string : infoProjects.subscribe{ println "Sample: $it" }
OPERATION_5 origin : [['infoProjects', 'P']]
OPERATION_5 gives  : []


