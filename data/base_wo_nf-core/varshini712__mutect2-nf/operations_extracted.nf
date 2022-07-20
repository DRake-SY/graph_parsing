OPERATION_1 string : Channel.fromPath( file(params.targetbed) ).into { targets_bed; targets_bed2 }
OPERATION_1 origin : [['file(params.targetbed', 'A']]
OPERATION_1 gives  : [['targets_bed', 'P'], ['targets_bed2', 'P']]


OPERATION_2 string : Channel.fromPath( file(params.ref_fa) ).into { ref_fasta; ref_fasta2 }
OPERATION_2 origin : [['file(params.ref_fa', 'A']]
OPERATION_2 gives  : [['ref_fasta', 'P'], ['ref_fasta2', 'P']]


OPERATION_3 string : Channel.fromPath( file(params.ref_fai) ).into { ref_fai; ref_fai2 }
OPERATION_3 origin : [['file(params.ref_fai', 'A']]
OPERATION_3 gives  : [['ref_fai', 'P'], ['ref_fai2', 'P']]


OPERATION_4 string : Channel.fromPath( file(params.ref_dict) ).into { ref_dict; ref_dict2 }
OPERATION_4 origin : [['file(params.ref_dict', 'A']]
OPERATION_4 gives  : [['ref_dict', 'P'], ['ref_dict2', 'P']]


OPERATION_5 string : Channel.fromPath( file(params.germline_resource_gz) ).set { germline_resource_gz }
OPERATION_5 origin : [['file(params.germline_resource_gz', 'A']]
OPERATION_5 gives  : [['germline_resource_gz', 'P']]


OPERATION_6 string : Channel.fromPath( file(params.germline_resource_gz_tbi) ).set { germline_resource_gz_tbi }
OPERATION_6 origin : [['file(params.germline_resource_gz_tbi', 'A']]
OPERATION_6 gives  : [['germline_resource_gz_tbi', 'P']]


OPERATION_7 string : Channel.fromPath( file(params.samplesheet) )
       .splitCsv(header: true, sep: '\t')
       .map{row ->
         def sampleID = row['Sample']
         def tumorID = row['Tumor']
         def normalID = row['Normal']
         def tumorBam = row['Tumor_Bam'].tokenize( ',' ).collect { file(it) }
         def tumorBai = row['Tumor_Bai'].tokenize( ',' ).collect { file(it) }
         def normalBam = row['Normal_Bam'].tokenize( ',' ).collect { file(it) }
         def normalBai = row['Normal_Bai'].tokenize( ',' ).collect { file(it) }
         return [ sampleID, tumorID, normalID, tumorBam, tumorBai, normalBam, normalBai ]
       }
       .tap { samples_bam_bai;  samples_bam_bai2}
OPERATION_7 origin : [['file(params.samplesheet', 'A']]
OPERATION_7 gives  : []


OPERATION_8 string : samples_bam_bai.combine(ref_fasta)
               .combine(ref_fai)
               .combine(ref_dict)
               .combine(targets_bed)
               .combine(germline_resource_gz)
               .combine(germline_resource_gz_tbi)
               .set { sample_bam_pairs_ref_germlinevcf }
OPERATION_8 origin : [['samples_bam_bai', 'P'], ['ref_fasta', 'P'], ['ref_fai', 'P'], ['ref_dict', 'P'], ['targets_bed', 'P'], ['germline_resource_gz', 'P'], ['germline_resource_gz_tbi', 'P']]
OPERATION_8 gives  : [['sample_bam_pairs_ref_germlinevcf', 'P']]


