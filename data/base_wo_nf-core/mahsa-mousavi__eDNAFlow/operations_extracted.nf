OPERATION_1 string : fastQC_input_ch = Channel.fromFilePairs(params.reads, size: -1)
OPERATION_1 origin : [['params.reads, size: -1', 'A']]
OPERATION_1 gives  : [['fastQC_input_ch', 'P']]


OPERATION_2 string : reads_ch = Channel.fromFilePairs(params.reads, size: -1)
OPERATION_2 origin : [['params.reads, size: -1', 'A']]
OPERATION_2 gives  : [['reads_ch', 'P']]


OPERATION_3 string : bc_ch = Channel.fromPath(params.barcode)
OPERATION_3 origin : [['params.barcode', 'A']]
OPERATION_3 gives  : [['bc_ch', 'P']]


OPERATION_4 string : reads_ch = Channel.empty()
OPERATION_4 origin : []
OPERATION_4 gives  : [['reads_ch', 'P']]


OPERATION_5 string : fastQC_input_ch = Channel.empty()
OPERATION_5 origin : []
OPERATION_5 gives  : [['fastQC_input_ch', 'P']]


OPERATION_6 string : zotuTable_ch = Channel.fromPath(params.zotuTable)
OPERATION_6 origin : [['params.zotuTable', 'A']]
OPERATION_6 gives  : [['zotuTable_ch', 'P']]


OPERATION_7 string : blastFile_ch = Channel.fromPath(params.blastFile)
OPERATION_7 origin : [['params.blastFile', 'A']]
OPERATION_7 gives  : [['blastFile_ch', 'P']]


OPERATION_8 string : zotuTable_ch = Channel.empty()
OPERATION_8 origin : []
OPERATION_8 gives  : [['zotuTable_ch', 'P']]


OPERATION_9 string : blastFile_ch = Channel.empty()
OPERATION_9 origin : []
OPERATION_9 gives  : [['blastFile_ch', 'P']]


OPERATION_10 string : lca_script = Channel.empty()
OPERATION_10 origin : []
OPERATION_10 gives  : [['lca_script', 'P']]


OPERATION_11 string : reads_ch = Channel.empty()
OPERATION_11 origin : []
OPERATION_11 gives  : [['reads_ch', 'P']]


OPERATION_12 string : Channel.fromPath(params.demuxedInput).set{ dmuxed_relabeled_input_ch }
OPERATION_12 origin : [['params.demuxedInput', 'A']]
OPERATION_12 gives  : [['dmuxed_relabeled_input_ch', 'P']]


OPERATION_13 string : name_ch = Channel.value(params.demuxedInput)
OPERATION_13 origin : [['params.demuxedInput', 'V']]
OPERATION_13 gives  : [['name_ch', 'P']]


OPERATION_14 string : _fastqc.{zip,html}') into res_fastQC_ch

  when:
  !params.skipFastqc

  script:
  
  if( read instanceof Path ) {
  """
  fastqc -q ${read}
  """
  } else {
  """
  fastqc -q ${read[0]} ${read[1]}
  """
  }
}

 
  
                                            
   

process '01_a_quality_Filtering' {
	label 'adapterRemoval'
 
  publishDir "01_a_quality_Filtering_${sample_id}", mode: params.publish_dir_mode

  input:
      tuple val(sample_id), path(read) from reads_ch

  output:
      tuple val(sample_id), path('*_QF.fastq') into QF_ch 
      
  script:

  if( read instanceof Path ) {   
     """
     AdapterRemoval --threads ${task.cpus} --file1 ${read} \
                    --trimns --trimqualities \
                    --minquality ${minQuality} \
                    --basename ${sample_id}

     mv ${sample_id}.truncated ${sample_id}_QF.fastq

    """
  }

                                      
  else {  
     """
     AdapterRemoval --threads ${task.cpus} --file1 ${read[0]} --file2 ${read[1]} \
                    --collapse --trimns --trimqualities \
                    --minquality $minQuality \
                    --minalignmentlength $minAlignLeng \
                    --basename ${sample_id}

    mv ${sample_id}.collapsed ${sample_id}_QF.fastq  
    """
  }
}

QF_ch.into { QFres_4dmux_ch; QFres_4fastQC_ch}
barcode_reads_mixed = QFres_4dmux_ch.combine(bc_ch)
                           .view()



process '01_b_fastQC' {
        label 'fastqc'

  publishDir "01_b_fastQC_${sample_id}", mode: params.publish_dir_mode

  input:
      tuple val(sample_id), path("${sample_id}_QF.fastq") from QFres_4fastQC_ch

  output:
      path("*_fastqc.{zip,html}") into last_fastQC_ch

  when:
  !params.skipFastqc

  script:
  """
  fastqc -q ${"${sample_id}_QF.fastq"}
  """
}
   


  
                                                       
   


process '02_assigned_dmux' {
  label 'obitools'

  publishDir "02_assigned_dmux_${sample_id}_${barcode.baseName}", mode: params.publish_dir_mode

  input:
      tuple val(sample_id), path(read), path(barcode) from barcode_reads_mixed
    

  output:
      tuple val(sample_id), val("${barcode.baseName}"), path("*_Dmux.fastq") into dmux_ch

  script:
  """
  ngsfilter -t ${barcode} -e ${primer_mismatch} -u "orphan.fastq" ${read} > "${sample_id}_${barcode.baseName}_QF_Dmux.fastq"
  """
}

grouped_demux = dmux_ch.groupTuple()

  
                                                                                                                  
   

process '03_Length_filtered' {
  label 'obitools'

  publishDir "03_Length_filtered_${sample_id}", mode: params.publish_dir_mode

  input: 
  tuple val(sample_id), val(barcode_files), path(fastq_files) from grouped_demux
  output:
  tuple val(sample_id), path('*_QF_Dmux_minLF.fastq') into lenFilt_ch


  script:
  """
  cat ${fastq_files} > "${sample_id}_QF_Dmux.fastq" 
  obigrep -l $minLen -p 'forward_tag is not None and reverse_tag is not None' ${sample_id}_QF_Dmux.fastq > ${sample_id}_QF_Dmux_minLF.fastq
 
  """

}


  
                                             
   


process '04_splitSamples_relabel_Cat' {
  label 'obitools'

  publishDir "04_splitSamples_${sample_id}", mode: params.publish_dir_mode

  input:
  tuple val(sample_id), path(fastqs) from lenFilt_ch
  output:
  tuple val(sample_id), path("$sample_id/*.fastq") into split_ch
  script:
  """
  mkdir ${sample_id}
  obisplit -t sample -u "noSampleID.fastq" $fastqs
  mv *.fastq ${sample_id}
  mv ${sample_id}/$fastqs ..
  mv ${sample_id}/noSampleID.fastq  noSampleID.fastq.ignore
  """
}


  
                                      
   


process '05_relabel_Cat' {

   label 'usearch'
   
   publishDir "${task.process}_${sample_id}", mode: params.publish_dir_mode

   input:
   tuple val(sample_id), path(fastqs) from split_ch

   output:
   tuple val(sample_id), path("*.relabeled.fastq"), path("CountOfSeq.txt"), path("*_relabeled4Usearch.fastq") into addition_ch 
   tuple val(sample_id), path("*_upper.fasta") into relabel_ch


   script:
   if(mode == 'usearch32')
	   """
	   for files in ${fastqs}
	   do
	   label=\$(echo \$files | cut -d '/' -f 3 | cut -d '.' -f 1)
	   usearch -fastx_relabel \$files -prefix \${label}. -fastqout \${label}.relabeled.fastq 
	   done
	 
	   for files in *.relabeled.fastq
	   do
	   name=\$(echo \$files | cut -d '/' -f '2' | cut -d '.' -f 1)
	   echo \${name} >> CountOfSeq.txt
	   grep "^@\${name}" \$files | wc -l >> CountOfSeq.txt
	   done 

	   cat *.relabeled.fastq > "${sample_id}_QF_Dmux_minLF_relabeled4Usearch.fastq"
	  
	   usearch -fastx_get_sample_names *_relabeled4Usearch.fastq -output sample.txt

	   usearch -fastq_filter *_relabeled4Usearch.fastq -fastaout ${sample_id}.fasta
	   
	   awk '/^>/ {print(\$0)}; /^[^>]/ {print(toupper(\$0))}' *.fasta > ${sample_id}_upper.fasta
	 
	   """
   else if(mode == 'usearch64')
   	   """
	   for files in ${fastqs}
           do
           label=\$(echo \$files | cut -d '/' -f 3 | cut -d '.' -f 1)
           $usearch64 -fastx_relabel \$files -prefix \${label}. -fastqout \${label}.relabeled.fastq
           done
  
           for files in *.relabeled.fastq
           do
           name=\$(echo \$files | cut -d '/' -f '2' | cut -d '.' -f 1)
           echo \${name} >> CountOfSeq.txt
           grep "^@\${name}" \$files | wc -l >> CountOfSeq.txt
           done

           cat *.relabeled.fastq > "${sample_id}_QF_Dmux_minLF_relabeled4Usearch.fastq"
   
           $usearch64 -fastx_get_sample_names *_relabeled4Usearch.fastq -output sample.txt

           $usearch64 -fastq_filter *_relabeled4Usearch.fastq -fastaout ${sample_id}.fasta
    
           awk '/^>/ {print(\$0)}; /^[^>]/ {print(toupper(\$0))}' *.fasta > ${sample_id}_upper.fasta
	   """
 }

                                                                                      
if ((params.skipDemux ) {
OPERATION_14 origin : [['_fastqc', 'P'], ['bc_ch', 'P']]
OPERATION_14 gives  : [['QFres_4dmux_ch', 'P'], ['QFres_4fastQC_ch', 'P']]


OPERATION_15 string : demux_channel = name_ch.combine(dmuxed_relabeled_input_ch)
OPERATION_15 origin : [['name_ch', 'P'], ['dmuxed_relabeled_input_ch', 'P']]
OPERATION_15 gives  : [['demux_channel', 'P']]


OPERATION_16 string : zotuTable_ch.combine(blastFile_ch)
OPERATION_16 origin : [['zotuTable_ch', 'P'], ['blastFile_ch', 'P']]
OPERATION_16 gives  : []


