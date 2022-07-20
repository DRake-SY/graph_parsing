OPERATION_1 string : rawreads = Channel.from( ['1', file(params.reads1), '_R1', '_rawreads'], ['1', file(params.reads2), '_R2', '_rawreads'] )
OPERATION_1 origin : []
OPERATION_1 gives  : [['rawreads', 'P']]


OPERATION_2 string : rawreads = Channel.value( ['1', file(params.reads1), '', '_rawreads'] )
OPERATION_2 origin : []
OPERATION_2 gives  : [['rawreads', 'P']]


OPERATION_3 string : todedup = Channel.value( [file(params.reads1), file(params.reads2)] )
OPERATION_3 origin : []
OPERATION_3 gives  : [['todedup', 'P']]


OPERATION_4 string : todedup = Channel.value( [file(params.reads1), "null"] )
OPERATION_4 origin : []
OPERATION_4 gives  : [['todedup', 'P']]


OPERATION_5 string : todedup = Channel.value( ["null1", "null2"] )
OPERATION_5 origin : [['["null1", "null2"]', 'V']]
OPERATION_5 gives  : [['todedup', 'P']]


OPERATION_6 string : totrim = Channel.value( [file(params.reads1), file(params.reads2)] )
OPERATION_6 origin : []
OPERATION_6 gives  : [['totrim', 'P']]


OPERATION_7 string : totrim = Channel.value( [file(params.reads1), "null"] )
OPERATION_7 origin : []
OPERATION_7 gives  : [['totrim', 'P']]


OPERATION_8 string : mocktrim = Channel.from("null")PROCESS DEF trim
OPERATION_8 origin : [['"null"', 'V']]
OPERATION_8 gives  : [['mocktrim', 'P']]


OPERATION_9 string : mockdecontaminate = Channel.from("null", "null")PROCESS DEF decontaminate
OPERATION_9 origin : [['"null", "null"', 'V']]
OPERATION_9 gives  : [['mockdecontaminate', 'P']]


OPERATION_10 string : trimmedreads2qc = Channel.from('4').combine(trimmedreads.flatMap().merge( Channel.from( ['_R1', '_R2'] ) ){ a, b -> [a, b] }).combine(Channel.from('_trimmedreads'))
OPERATION_10 origin : [["'4'", 'V'], ["['_R1', '_R2']", 'V'], ["'_trimmedreads'", 'V']]
OPERATION_10 gives  : [['trimmedreads2qc', 'P']]


OPERATION_11 string : trimmedreads2qc = Channel.from('4').combine(trimmedreads.flatMap()).combine( Channel.from( '' ) ).combine(Channel.from('_trimmedreads'))
OPERATION_11 origin : [["'4'", 'V'], ["''", 'V'], ["'_trimmedreads'", 'V']]
OPERATION_11 gives  : [['trimmedreads2qc', 'P']]


OPERATION_12 string : decontaminatedreads2qc = Channel.from('6').combine(decontaminatedreads).combine( Channel.from( '' ) ).combine(Channel.from('_decontaminatedreads'))
OPERATION_12 origin : [['decontaminatedreads', 'P'], ["'6'", 'V'], ["''", 'V'], ["'_decontaminatedreads'", 'V']]
OPERATION_12 gives  : [['decontaminatedreads2qc', 'P']]


OPERATION_13 string : toprofiletaxa = Channel.from( file("$workingdir/${params.prefix}_clean.fq") )
OPERATION_13 origin : []
OPERATION_13 gives  : [['toprofiletaxa', 'P']]


OPERATION_14 string : toprofilefunctionreads = Channel.from( file("$workingdir/${params.prefix}_clean.fq") )
OPERATION_14 origin : []
OPERATION_14 gives  : [['toprofilefunctionreads', 'P']]


OPERATION_15 string : out.println("")
OPERATION_15 origin : [['out', 'P']]
OPERATION_15 gives  : []


OPERATION_16 string : out.println("YET ANOTHER METAGENOMIC PIPELINE (YAMP) - Version: $version ($timestamp)")
OPERATION_16 origin : [['out', 'P']]
OPERATION_16 gives  : []


OPERATION_17 string : out.println("")
OPERATION_17 origin : [['out', 'P']]
OPERATION_17 gives  : []


OPERATION_18 string : out.println("YET ANOTHER METAGENOMIC PIPELINE (YAMP) - Version: $version ($timestamp)")
OPERATION_18 origin : [['out', 'P']]
OPERATION_18 gives  : []


OPERATION_19 string : out.println("This pipeline is distributed in the hope that it will be useful")
OPERATION_19 origin : [['out', 'P']]
OPERATION_19 gives  : []


OPERATION_20 string : out.println("but WITHOUT ANY WARRANTY. See the GNU GPL v3.0 for more details.")
OPERATION_20 origin : [['out', 'P']]
OPERATION_20 gives  : []


OPERATION_21 string : out.println("")
OPERATION_21 origin : [['out', 'P']]
OPERATION_21 gives  : []


OPERATION_22 string : out.println("Please report comments and bugs to alessia.visconti@kcl.ac.uk")
OPERATION_22 origin : [['out', 'P']]
OPERATION_22 gives  : []


OPERATION_23 string : out.println("or at https://github.com/alesssia/YAMP/issues.")
OPERATION_23 origin : [['out', 'P']]
OPERATION_23 gives  : []


OPERATION_24 string : out.println("Check https://github.com/alesssia/YAMP for updates, and refer to")
OPERATION_24 origin : [['out', 'P']]
OPERATION_24 gives  : []


OPERATION_25 string : out.println("https://github.com/alesssia/YAMP/wiki for more details.")
OPERATION_25 origin : [['out', 'P']]
OPERATION_25 gives  : []


OPERATION_26 string : out.println("")
OPERATION_26 origin : [['out', 'P']]
OPERATION_26 gives  : []


OPERATION_27 string : out.println("Usage: ")
OPERATION_27 origin : [['out', 'P']]
OPERATION_27 gives  : []


OPERATION_28 string : out.println("   nextflow run YAMP.nf --reads1 R1 --reads2 R2 --prefix mysample --outdir path --mode MODE  ")
OPERATION_28 origin : [['out', 'P']]
OPERATION_28 gives  : []


OPERATION_29 string : out.println("                [options] [-with-docker|-with-singularity]")
OPERATION_29 origin : [['out', 'P']]
OPERATION_29 gives  : []


OPERATION_30 string : out.println("")
OPERATION_30 origin : [['out', 'P']]
OPERATION_30 gives  : []


OPERATION_31 string : out.println("Mandatory arguments:")
OPERATION_31 origin : [['out', 'P']]
OPERATION_31 gives  : []


OPERATION_32 string : out.println("    --reads1   R1      Forward (if paired-end) OR all reads (if single-end) file path")
OPERATION_32 origin : [['out', 'P']]
OPERATION_32 gives  : []


OPERATION_33 string : out.println("    [--reads2] R2      Reverse reads file path (only if paired-end library layout)")
OPERATION_33 origin : [['out', 'P']]
OPERATION_33 gives  : []


OPERATION_34 string : out.println("    --prefix   prefix  Prefix used to name the result files")
OPERATION_34 origin : [['out', 'P']]
OPERATION_34 gives  : []


OPERATION_35 string : out.println("    --outdir   path    Output directory (will be outdir/prefix/)")
OPERATION_35 origin : [['out', 'P']]
OPERATION_35 gives  : []


OPERATION_36 string : out.println("    --mode     <QC|characterisation|complete>")
OPERATION_36 origin : [['out', 'P']]
OPERATION_36 gives  : []


OPERATION_37 string : out.println("Options:")
OPERATION_37 origin : [['out', 'P']]
OPERATION_37 gives  : []


OPERATION_38 string : out.println("    --librarylayout <single|paired>")
OPERATION_38 origin : [['out', 'P']]
OPERATION_38 gives  : []


OPERATION_39 string : out.println("    --dedup         <true|false>   whether to perform de-duplication")
OPERATION_39 origin : [['out', 'P']]
OPERATION_39 gives  : []


OPERATION_40 string : out.println("    --keepQCtmpfile <true|false>   whether to save QC temporary files")
OPERATION_40 origin : [['out', 'P']]
OPERATION_40 gives  : []


OPERATION_41 string : out.println("    --keepCCtmpfile <true|false>   whether to save community characterisation temporary files")
OPERATION_41 origin : [['out', 'P']]
OPERATION_41 gives  : []


OPERATION_42 string : out.println("Please refer to nextflow.config for more options.")
OPERATION_42 origin : [['out', 'P']]
OPERATION_42 gives  : []


OPERATION_43 string : out.println("")
OPERATION_43 origin : [['out', 'P']]
OPERATION_43 gives  : []


OPERATION_44 string : out.println("Container:")
OPERATION_44 origin : [['out', 'P']]
OPERATION_44 gives  : []


OPERATION_45 string : out.println("    Docker image to use with -with-docker|-with-singularity options is")
OPERATION_45 origin : [['out', 'P']]
OPERATION_45 gives  : []


OPERATION_46 string : out.println("    'docker://alesssia/yampdocker'")
OPERATION_46 origin : [['out', 'P']]
OPERATION_46 gives  : []


OPERATION_47 string : out.println("")
OPERATION_47 origin : [['out', 'P']]
OPERATION_47 gives  : []


OPERATION_48 string : out.println("YAMP supports FASTQ and compressed FASTQ files.")
OPERATION_48 origin : [['out', 'P']]
OPERATION_48 gives  : []


OPERATION_49 string : out.println("")
OPERATION_49 origin : [['out', 'P']]
OPERATION_49 gives  : []


OPERATION_50 string : toQC = rawreads.mix(trimmedreads2qc, decontaminatedreads2qc) 
OPERATION_50 origin : [['rawreads', 'P'], ['trimmedreads2qc', 'P'], ['decontaminatedreads2qc', 'P']]
OPERATION_50 gives  : [['toQC', 'P']]


