OPERATION_1 string : rgids, r1_inputs, r2_inputs = Channel
    .fromPath( params.csv )
    .splitCsv( header:true )
    .ifEmpty { exit 1, "No readgroups found post-validation. Exiting." }
    .separate(3) { row ->
if (row.readgroup ) { 
        def rgid  = [row.sample, row.readgroup].join(params.rgid_sep)
 } else { 
        def rgid  = row.sample
 } 

                         
if (params.paired_end ) { 
        def fq1  = file(row.fastq1)
 } else { 
        def fq1  = file(row.fastq)
 } 
if (params.paired_end ) { 
        def fq2  = file(row.fastq2)
 } else { 
        def fq2  = 'NO_FILE'
 } 

                                  
if (params.paired_end ) { 
        def fq1_fn  = "${rgid}.1.${get_fastq_extn(fq1)}"
 } else { 
        def fq1_fn  = "${rgid}.${get_fastq_extn(fq1)}"
 } 
if (params.paired_end ) { 
        def fq2_fn  = "${rgid}.2.${get_fastq_extn(fq2)}"
 } else { 
        def fq2_fn  = 'NO_FILE'
 } 

        tuple(tuple(row.sample, rgid), tuple(fq1_fn, fq1), tuple(fq2_fn, fq2))
    }
OPERATION_1 origin : [['params.csv', 'A']]
OPERATION_1 gives  : [['rgids', 'P'], ['r1_inputs', 'P'], ['r2_inputs', 'P']]


OPERATION_2 string : gunzipped_fasta
    .ifEmpty { fasta_file }
    .set { ref_fasta }
OPERATION_2 origin : [['gunzipped_fasta', 'P']]
OPERATION_2 gives  : [['ref_fasta', 'P']]


OPERATION_3 string : gunzipped_gtf
    .ifEmpty { gtf_file }
    .set { ref_gtf }
OPERATION_3 origin : [['gunzipped_gtf', 'P']]
OPERATION_3 gives  : [['ref_gtf', 'P']]


OPERATION_4 string : rgids.into { samples; fastqc_raw_rgids; cutadapt_rgids }
OPERATION_4 origin : [['rgids', 'P']]
OPERATION_4 gives  : [['samples', 'P'], ['fastqc_raw_rgids', 'P'], ['cutadapt_rgids', 'P']]


OPERATION_5 string : r1_inputs.into { fastqc_raw_r1_inputs; cutadapt_r1_inputs }
OPERATION_5 origin : [['r1_inputs', 'P']]
OPERATION_5 gives  : [['fastqc_raw_r1_inputs', 'P'], ['cutadapt_r1_inputs', 'P']]


OPERATION_6 string : r2_inputs.into { fastqc_raw_r2_inputs; cutadapt_r2_inputs }
OPERATION_6 origin : [['r2_inputs', 'P']]
OPERATION_6 gives  : [['fastqc_raw_r2_inputs', 'P'], ['cutadapt_r2_inputs', 'P']]


OPERATION_7 string : samples
    .groupTuple()
    .map { sample, rgids ->
        tuple( groupKey(sample, rgids.size()), rgids )
    }
    .transpose()
    .map { sample, readgroup ->
        tuple(readgroup, sample)
    }
    .join( trimmed_readgroups )
    .groupTuple( by:1 )
    .map { rgids, sample, fastqs ->
        tuple(sample.toString(), rgids, fastqs.flatten())
    }
    .set { star_inputs }
OPERATION_7 origin : [['samples', 'P'], ['trimmed_readgroups', 'P']]
OPERATION_7 gives  : [['star_inputs', 'P']]


