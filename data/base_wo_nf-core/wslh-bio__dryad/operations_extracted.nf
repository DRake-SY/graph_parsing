OPERATION_1 string : Channel
      .fromSRA(testIDS)
      .into { raw_reads; raw_reads_count }
OPERATION_1 origin : [['testIDS', 'S']]
OPERATION_1 gives  : [['raw_reads', 'P'], ['raw_reads_count', 'P']]


OPERATION_2 string : Channel
      .fromPath("$baseDir/assets/ASM211692v1.fasta")
      .into { snp_reference;mapping_reference }
OPERATION_2 origin : [['"$baseDir/assets/ASM211692v1.fasta"', 'A']]
OPERATION_2 gives  : [['snp_reference', 'P'], ['mapping_reference', 'P']]


OPERATION_3 string : Channel
      .fromPath("$baseDir/snppipeline.conf")
      .set { snp_config }
OPERATION_3 origin : [['"$baseDir/snppipeline.conf"', 'A']]
OPERATION_3 gives  : [['snp_config', 'P']]


OPERATION_4 string : Channel
      .fromFilePairs( "${params.reads}/*{R1,R2,_1,_2}*.{fastq,fq}.gz", size: 2 )
      .ifEmpty { exit 1, "Cannot find any reads matching: ${params.reads} Path must not end with /" }
      .into { raw_reads; raw_reads_count }
OPERATION_4 origin : [['"${params.reads}/*{R1,R2,_1,_2}*.{fastq,fq}.gz", size: 2', 'A']]
OPERATION_4 gives  : [['raw_reads', 'P'], ['raw_reads_count', 'P']]


OPERATION_5 string : Channel
      .from(raw_reads_count)
      .collect()
      .subscribe {
        int size = it.queue[0].size()
        if(size < 3){
          println "Dryad requires 3 or more samples."
          System.exit(1)
        }
      }
OPERATION_5 origin : [['raw_reads_count', 'V']]
OPERATION_5 gives  : []


OPERATION_6 string : Channel
          .fromPath(params.snp_reference)
          .into { snp_reference;mapping_reference }
OPERATION_6 origin : [['params.snp_reference', 'A']]
OPERATION_6 gives  : [['snp_reference', 'P'], ['mapping_reference', 'P']]


OPERATION_7 string : Channel
          .fromPath("$baseDir/snppipeline.conf")
          .set { snp_config }
OPERATION_7 origin : [['"$baseDir/snppipeline.conf"', 'A']]
OPERATION_7 gives  : [['snp_config', 'P']]


OPERATION_8 string : reference_mapping_tsv = Channel.empty()
OPERATION_8 origin : []
OPERATION_8 gives  : [['reference_mapping_tsv', 'P']]


OPERATION_9 string : Channel
  .fromPath("$baseDir/multiqc_config.yaml")
  .set { multiqc_config }
OPERATION_9 origin : [['"$baseDir/multiqc_config.yaml"', 'A']]
OPERATION_9 gives  : [['multiqc_config', 'P']]


OPERATION_10 string : Channel
  .fromPath("$baseDir/assets/dryad_logo_250.png")
  .set { logo }
OPERATION_10 origin : [['"$baseDir/assets/dryad_logo_250.png"', 'A']]
OPERATION_10 gives  : [['logo', 'P']]


OPERATION_11 string : combined_reads = read_files_fastqc.concat(cleaned_reads_fastqc)
OPERATION_11 origin : [['read_files_fastqc', 'P'], ['cleaned_reads_fastqc', 'P']]
OPERATION_11 gives  : [['combined_reads', 'P']]


OPERATION_12 string : sam_files = assembly_sams.concat(reference_sams)
OPERATION_12 origin : [['assembly_sams', 'P'], ['reference_sams', 'P']]
OPERATION_12 gives  : [['sam_files', 'P']]


OPERATION_13 string : sam_files = assembly_sams
OPERATION_13 origin : [['assembly_sams', 'P']]
OPERATION_13 gives  : [['sam_files', 'P']]


