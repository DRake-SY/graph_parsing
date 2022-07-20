OPERATION_1 string : Channel.fromPath("$baseDir/assets/where_are_my_files.txt")
       .into{ch_where_trim_galore; ch_where_star; ch_where_hisat2; ch_where_hisat2_sort}
OPERATION_1 origin : [['"$baseDir/assets/where_are_my_files.txt"', 'A']]
OPERATION_1 gives  : [['ch_where_trim_galore', 'P'], ['ch_where_star', 'P'], ['ch_where_hisat2', 'P'], ['ch_where_hisat2_sort', 'P']]


OPERATION_2 string : ch_multiqc_config = Channel.fromPath(params.multiqc_config)
OPERATION_2 origin : [['params.multiqc_config', 'A']]
OPERATION_2 gives  : [['ch_multiqc_config', 'P']]


OPERATION_3 string : ch_output_docs = Channel.fromPath("$baseDir/docs/output.md")
OPERATION_3 origin : [['"$baseDir/docs/output.md"', 'A']]
OPERATION_3 gives  : [['ch_output_docs', 'P']]


OPERATION_4 string : Channel
        .fromPath(params.gtf)
        .ifEmpty { exit 1, "GTF annotation file not found: ${params.gtf}" }
        .into { gtfFile }
OPERATION_4 origin : [['params.gtf', 'A']]
OPERATION_4 gives  : [['gtfFile', 'P']]


OPERATION_5 string : Channel
        .fromPath(params.gff)
        .ifEmpty { exit 1, "GFF annotation file not found: ${params.gff}" }
        .into { gffFile }
OPERATION_5 origin : [['params.gff', 'A']]
OPERATION_5 gives  : [['gffFile', 'P']]


OPERATION_6 string : reads_ch = Channel.fromFilePairs(params.reads)
OPERATION_6 origin : [['params.reads', 'A']]
OPERATION_6 gives  : [['reads_ch', 'P']]


OPERATION_7 string : newSampleSheet
  .splitCsv(header:true)
  .map { row-> tuple(row.number, file(row.R1), file(row.R2)) }
  .set { newSampleChannel }
OPERATION_7 origin : [['newSampleSheet', 'P']]
OPERATION_7 gives  : [['newSampleChannel', 'P']]


OPERATION_8 string : newSampleSheetFastQC
  .splitCsv(header:true)
  .map { row-> tuple(row.number, file(row.R1), file(row.R2)) }
  .set { newSampleChannelFastQC }
OPERATION_8 origin : [['newSampleSheetFastQC', 'P']]
OPERATION_8 gives  : [['newSampleChannelFastQC', 'P']]


OPERATION_9 string : _fastqc.{zip,html}" into fastqc_results
OPERATION_9 origin : [['_fastqc', 'P']]
OPERATION_9 gives  : []


OPERATION_10 string : _fastqc.{zip,html}") into trimgalore_results

        val "$number" into sampleNumber_srst2
        val "$number" into sampleNumber
        set number, file("${R1.baseName}_trimmed.fq.gz"), file("${R2.baseName}_trimmed.fq.gz") into vf_read_pairs

    script:
if (clip_r1 > 0 ) { 
        c_r1  = "--clip_r1 ${clip_r1}"
 } else { 
        c_r1  = ''
 } 
if (clip_r2 > 0 ) { 
        c_r2  = "--clip_r2 ${clip_r2}"
 } else { 
        c_r2  = ''
 } 
if (three_prime_clip_r1 > 0 ) { 
        tpc_r1  = "--three_prime_clip_r1 ${three_prime_clip_r1}"
 } else { 
        tpc_r1  = ''
 } 
if (three_prime_clip_r2 > 0 ) { 
        tpc_r2  = "--three_prime_clip_r2 ${three_prime_clip_r2}"
 } else { 
        tpc_r2  = ''
 } 
        if (params.singleEnd) {
            """
            trim_galore --fastqc --gzip $c_r1 $tpc_r1 $R1 $R2
            """
        } else {
            """
            trim_galore --paired --fastqc --gzip $c_r1 $c_r2 $tpc_r1 $tpc_r2 $R1 $R2

            #  MiSeq file naming convention (samplename_S1_L001_[R1]_001) <----------------------- Trying to standardise

            rename 's/fastq.gz/fq.gz/' *.fastq.gz

            rename 's/_val_1/_trimmed/' *.fq.gz
            rename 's/_val_2/_trimmed/' *.fq.gz
            """
        }
}


  
                                                                                                         
  
                                                  
  
   

process '2A_read_mapping' {
  label 'high_memory'
  input:
    file forwardTrimmed
    file reverseTrimmed
    val sampleNumber
    file genome from genome_file
    file genome_bwa_amb
    file genome_bwa_ann
    file genome_bwa_bwt
    file genome_bwa_pac
    file genome_bwa_sa
  output:
    file "sample_${sampleNumber}.sorted.bam" into bamfiles
    file "sample_${sampleNumber}.sorted.bai" into bamindexfiles
    file "sample_${sampleNumber}.sorted.bam" into bam_rseqc
    file "sample_${sampleNumber}.sorted.bai" into bamindexfiles_rseqc
    file "sample_${sampleNumber}.sorted.bam" into bam_preseq
    file "sample_${sampleNumber}.sorted.bam" into bam_forSubsamp
    file "sample_${sampleNumber}.sorted.bam" into bam_skipSubsamp
    file "sample_${sampleNumber}.sorted.bam" into bam_featurecounts
  script:
  if( aligner == 'bwa-mem' )
    """
    bwa mem $genome $forwardTrimmed $reverseTrimmed | samtools sort -O BAM -o sample_${sampleNumber}.sorted.bam
    samtools index sample_${sampleNumber}.sorted.bam sample_${sampleNumber}.sorted.bai
    """

  else
    error "Invalid aligner: ${aligner}"

}



  
                                                
   

process '2B_rseqc' {
    label 'high_memory'
    tag "${bam_rseqc.baseName - '.sorted'}"
    publishDir "${params.outdir}/rseqc" , mode: 'copy',
        saveAs: {filename ->
                 if (filename.indexOf("bam_stat.txt") > 0)                      "bam_stat/$filename"
            else if (filename.indexOf("infer_experiment.txt") > 0)              "infer_experiment/$filename"
            else if (filename.indexOf("read_distribution.txt") > 0)             "read_distribution/$filename"
            else if (filename.indexOf("read_duplication.DupRate_plot.pdf") > 0) "read_duplication/$filename"
            else if (filename.indexOf("read_duplication.DupRate_plot.r") > 0)   "read_duplication/rscripts/$filename"
            else if (filename.indexOf("read_duplication.pos.DupRate.xls") > 0)  "read_duplication/dup_pos/$filename"
            else if (filename.indexOf("read_duplication.seq.DupRate.xls") > 0)  "read_duplication/dup_seq/$filename"
            else if (filename.indexOf("RPKM_saturation.eRPKM.xls") > 0)         "RPKM_saturation/rpkm/$filename"
            else if (filename.indexOf("RPKM_saturation.rawCount.xls") > 0)      "RPKM_saturation/counts/$filename"
            else if (filename.indexOf("RPKM_saturation.saturation.pdf") > 0)    "RPKM_saturation/$filename"
            else if (filename.indexOf("RPKM_saturation.saturation.r") > 0)      "RPKM_saturation/rscripts/$filename"
            else if (filename.indexOf("inner_distance.txt") > 0)                "inner_distance/$filename"
            else if (filename.indexOf("inner_distance_freq.txt") > 0)           "inner_distance/data/$filename"
            else if (filename.indexOf("inner_distance_plot.r") > 0)             "inner_distance/rscripts/$filename"
            else if (filename.indexOf("inner_distance_plot.pdf") > 0)           "inner_distance/plots/$filename"
            else if (filename.indexOf("junction_plot.r") > 0)                   "junction_annotation/rscripts/$filename"
            else if (filename.indexOf("junction.xls") > 0)                      "junction_annotation/data/$filename"
            else if (filename.indexOf("splice_events.pdf") > 0)                 "junction_annotation/events/$filename"
            else if (filename.indexOf("splice_junction.pdf") > 0)               "junction_annotation/junctions/$filename"
            else if (filename.indexOf("junctionSaturation_plot.pdf") > 0)       "junction_saturation/$filename"
            else if (filename.indexOf("junctionSaturation_plot.r") > 0)         "junction_saturation/rscripts/$filename"
            else if (filename.indexOf("geneBodyCoverage.curves.pdf") > 0)       "geneBodyCoverage/$filename"
            else if (filename.indexOf("geneBodyCoverage.r") > 0)                "geneBodyCoverage/rscripts/$filename"
            else if (filename.indexOf("geneBodyCoverage.txt") > 0)              "geneBodyCoverage/data/$filename"
            else if (filename.indexOf("log.txt") > -1) false
            else filename
        }

    when:
    !params.skip_qc && !params.skip_rseqc

    input:
    file bam_rseqc
    file index from bamindexfiles_rseqc
    file bed12 from bed_rseqc.collect()

    output:
    file "*.{txt,pdf,r,xls}" into rseqc_results

    script:
    """
    infer_experiment.py -i $bam_rseqc -r $bed12 > ${bam_rseqc.baseName}.infer_experiment.txt
    bam_stat.py -i $bam_rseqc 2> ${bam_rseqc.baseName}.bam_stat.txt
    inner_distance.py -i $bam_rseqc -o ${bam_rseqc.baseName}.rseqc -r $bed12
    read_distribution.py -i $bam_rseqc -r $bed12 > ${bam_rseqc.baseName}.read_distribution.txt
    read_duplication.py -i $bam_rseqc -o ${bam_rseqc.baseName}.read_duplication

    geneBody_coverage.py -i $bam_rseqc -o ${bam_rseqc.baseName}.rseqc -r $bed12
    mv log.txt ${bam_rseqc.baseName}.rseqc.log.txt

    # Not applicable for bacteria
    #junction_annotation.py -i $bam_rseqc -o ${bam_rseqc.baseName}.rseqc -r $bed12
    #junction_saturation.py -i $bam_rseqc -o ${bam_rseqc.baseName}.rseqc -r $bed12 2> ${bam_rseqc.baseName}.junction_annotation_log.txt

    """
}



  
                                                     
  
                                                                                                            
   





  
                                                         
   

process '2F_mark_duplicates' {
  label 'high_memory'
  publishDir "${params.outdir}/picard", mode: "copy"

  input:
    file sample_bam from bamfiles
  output:
    set file("${sample_bam.baseName}.dedup.bam"), file("${sample_bam.baseName}.dedup.bam.bai") into dedup_bamfiles
    set file("${sample_bam.baseName}.dedup.bam"), file("${sample_bam.baseName}.dedup.bam.bai") into dupradar_bamfiles
    file "${sample_bam.baseName}.txt" into picard_results
  script:
    """
    picard -Xmx16g MarkDuplicates INPUT=$sample_bam OUTPUT=${sample_bam.baseName}.dedup.bam METRICS_FILE=${sample_bam.baseName}.txt ASSUME_SORTED=true REMOVE_DUPLICATES=false
    samtools index ${sample_bam.baseName}.dedup.bam
    """
}



  
                       
   
  
                       
                      
                             
                                                                         

          
                                                              
                                          
           
                                              

           

                              
                                          
                              
                                                
                              
     
                                                        

    """
    dupRadar.r $bamfile $gtf $dupradar_direction $paired ${task.cpus}
    "" 
 
  


  
                                                                                                                       
  
                                     
                                                            
   

process '3A_srst2' {
    tag { "srst2.${sampleNumber_srst2}" }
    publishDir "${params.outdir}/srst2_mlst", mode: "copy"
    label 'high_memory'

    input:
    file forward_trimmed_reads_for_srst2
    file reverse_trimmed_reads_for_srst2
    val sampleNumber_srst2
    val srst_min_gene_cov
    val srst_max_gene_divergence
    val mlst_species_srst2
    val mlst_definitions_srst2
    val mlst_seperator_srst2

    output:
    file("${sampleNumber_srst2}_srst2__mlst*")

    script:
if (params.gene_db ) { 
    geneDB  = "--gene_db $gene_db"
 } else { 
    geneDB  = ''
 } 
if (params.mlst_db ) { 
    mlstDB  = "--mlst_db $mlst_db"
 } else { 
    mlstDB  = ''
 } 
if (params.mlst_db ) { 
    mlstdef  = "--mlst_definitions $mlst_definitions"
 } else { 
    mlstdef  = ''
 } 
if (params.mlst_db ) { 
    mlstdelim  = "--mlst_delimiter $params.mlst_delimiter"
 } else { 
    mlstdelim  = ''
 } 
    mlstfasta = mlst_species_srst2.replace(" ", "_")

    """
    # /samtools-0.1.18/
    export SRST2_SAMTOOLS="/samtools-0.1.18/samtools"
    getmlst.py --species "${mlst_species_srst2}"
    srst2 --output ${sampleNumber_srst2}_srst2 --input_pe $forward_trimmed_reads_for_srst2 $reverse_trimmed_reads_for_srst2 --mlst_db ${mlstfasta}.fasta --mlst_definitions profiles_csv --mlst_delimiter '_' --min_coverage $srst_min_gene_cov --max_divergence $srst_max_gene_divergence
    #srst2 --input_pe $forward_trimmed_reads_for_srst2 $reverse_trimmed_reads_for_srst2 --output ${sampleNumber_srst2}_srst2 --mlst_delimiter '_' --min_coverage $srst_min_gene_cov --max_divergence $srst_max_gene_divergence
    """
}

  
                             
   

if( params.amr_db ) {
      
                                                   
       
    process '3B_BuildAMRIndex' {
        tag { "${amr_db.baseName}" }

        input:
            file amr_db

            output:
            file 'amr.index*' into amr_index

            """
            bowtie2-build $amr_db amr.index --threads ${threads}
            """
    }

      
                                                          
           
    process '3B_AMRAlignment' {
            publishDir "${params.outdir}/Alignment", pattern: "*.bam"

            tag { dataset_id }

            input:
            set dataset_id, file(forward), file(reverse) from amr_read_pairs
            file index from amr_index.first()

            output:
            set dataset_id, file("${dataset_id}_amr_alignment.sam") into amr_sam_files
            set dataset_id, file("${dataset_id}_amr_alignment.bam") into amr_bam_files

            """
            bowtie2 -p ${threads} -x amr.index -1 $forward -2 $reverse -S ${dataset_id}_amr_alignment.sam
            samtools view -bS ${dataset_id}_amr_alignment.sam | samtools sort -@ ${threads} -o ${dataset_id}_amr_alignment.bam
            """
    }

    process '3B_AMRResistome' {
            publishDir "${params.outdir}/Resistome"

            tag { dataset_id }

            input:
            file amr_db
            set dataset_id, file(amr_sam) from amr_sam_files

            output:
            set dataset_id, file("${dataset_id}_amr_gene_resistome.tsv") into amr_gene_level

            """
            csa -ref_fp ${vf_db} -sam_fp ${vf_sam} -min 5 -max 100 -skip 5 -t 0 -samples 1 -out_fp "${dataset_id}_amr_gene_resistome.tsv"
            """
    }
}

  
                                        
  
                                                                                   
                                                                        
  
   

if( params.vf_db ) {
      
                                                  
      
    process '3C_BuildVFIndex' {
        tag { "Building index" }

        input:

        output:
        file 'vf.index*' into vf_index
        file 'VFDB_setB_nt.fa' into vf_fa

        """
        wget http://www.mgc.ac.cn/VFs/Down/VFDB_setB_nt.fas.gz
        gunzip VFDB_setB_nt.fas.gz
        mv VFDB_setB_nt.fas VFDB_setB_nt.fa
        sed -i 's/(/_/g' VFDB_setB_nt.fa
        sed -i 's/)/_/g' VFDB_setB_nt.fa
        bowtie2-build VFDB_setB_nt.fa vf.index
        """
    }
      
                                                                
           
    process '3C_VFAlignment' {
            publishDir "${params.outdir}/Alignment", pattern: "*.bam"

            tag { dataset_id }

            input:
            set dataset_id, file(forward), file(reverse) from vf_read_pairs
            file index from vf_index.first()
            file vf_fasta from vf_fa

            output:
            set dataset_id, file("${dataset_id}_vf_alignment.sam") into vf_sam_files
            set dataset_id, file("${dataset_id}_vf_alignment.bam") into vf_bam_files

            """
            bowtie2 -p ${threads} -x vf.index -1 $forward -2 $reverse -S ${dataset_id}_vf_alignment.sam
            samtools view -bS ${dataset_id}_vf_alignment.sam | samtools sort -@ ${threads} -o ${dataset_id}_vf_alignment.bam
            """
    }

    process '3C_VFResistome' {
            publishDir "${params.outdir}/Resistome"

            label 'high_memory'
            tag { dataset_id }

            input:
            file vf_db from vf_fa
            set dataset_id, file(vf_bam) from vf_bam_files

            output:
            set dataset_id, file("${dataset_id}_raw_wgs_metrics.txt") into vf_gene_level

            """
            picard CollectWgsMetrics I=$vf_bam O=${dataset_id}_raw_wgs_metrics.txt R=${vf_db} INCLUDE_BQ_HISTOGRAM=true
            """
    }
}

  
                                         
  
                                                                           
  
   

if( params.plasmid_db ) {
      
                                           
           
    process '3D_BuildPlasmidIndex' {
        tag { "${plasmid_db.baseName}" }

        input:
            file plasmid_db

            output:
            file 'plasmid.index*' into plasmid_index

            """
            bowtie2-build $plasmid_db plasmid.index --threads ${threads}
            """
    }
      
                                                       
           
    process '3D_PlasmidAlignment' {
            publishDir "${params.outdir}/Alignment", pattern: "*.bam"

            tag { dataset_id }

            input:
            set dataset_id, file(forward), file(reverse) from plasmid_read_pairs
            file index from plasmid_index.first()

            output:
            set dataset_id, file("${dataset_id}_plasmid_alignment.sam") into plasmid_sam_files
            set dataset_id, file("${dataset_id}_plasmid_alignment.bam") into plasmid_bam_files

            """
            bowtie2 -p ${threads} -x plasmid.index -1 $forward -2 $reverse -S ${dataset_id}_plasmid_alignment.sam
            samtools view -bS ${dataset_id}_plasmid_alignment.sam | samtools sort -@ ${threads} -o ${dataset_id}_plasmid_alignment.bam
            """
    }

    process '3D_PlasmidResistome' {
            publishDir "${params.outdir}/Resistome"

            tag { dataset_id }

            input:
            file plasmid_db
            set dataset_id, file(plasmid_sam) from plasmid_sam_files

            output:
            set dataset_id, file("${dataset_id}_plasmid_gene_resistome.tsv") into plasmid_gene_level

            """
            csa -ref_fp ${plasmid_db} -sam_fp ${plasmid_sam} -min 5 -max 100 -skip 5 -t 0 -samples 1 -out_fp "${dataset_id}_plasmid_gene_resistome.tsv"
            """
    }
}




  
                                                                                                             
  
                                
  
                                                                                  
   


process '4A_call_variants' {

  publishDir "${params.outdir}/variants", mode: "link", overwrite: true

  input:
    file genome from genome_file
    set file(dedup_bamfile), file(dedup_bamindex) from dedup_bamfiles
  output:
    set file("${dedup_bamfile.baseName}.vcf"), file("$dedup_bamfile") into vcf_bam_files

  script:
  if( variant_caller == 'freebayes' )
    """
    freebayes -f $genome -p 1 $dedup_bamfile > need_rename.vcf
    echo "unknown ${dedup_bamfile.baseName}\n" > sample_names.txt
    bcftools reheader need_rename.vcf --samples sample_names.txt -o ${dedup_bamfile.baseName}.vcf

    """
  else if( variant_caller == 'samtools' )
    """
    samtools -f $genome -p 1 dedup_bamfile > ${dedup_bamfile.baseName}.vcf
    """
  else
    error "Invalid variant caller: ${variant_caller}"
}

  
                                                              
  
   

process '4B_calc_coverage' {
  input:
     set file(vcf), file(bam) from vcf_bam_files
  output:
     set file(vcf), file(bam), stdout into vcf_bam_cov_files
  script:
  """
  baseCov=\$(samtools depth $bam | awk '{sum+=\$3} END { print sum/NR}')
  maxCov=\$(echo "\$baseCov * 5" | bc)
  echo \$maxCov
  """
}


  
                                
  
   

process '4C_filter_variants' {
  input:
    set file(vcf), file(bam), coverage from vcf_bam_cov_files
  output:
    file "${vcf.baseName}_filtered.recode.vcf" into filtered_vcfs
    file "${vcf.baseName}_filtered.recode.vcf" into filtered_vcfs_snpEff
  script:
  """
  vcftools --vcf $vcf --minQ $params.minQuality --recode --recode-INFO-all --out ${vcf.baseName}_filtered --maxDP $coverage
  """
}


  
                              
  
  
                                                                             
                                  
                                                                     
   

if (params.snpeffDb == 'build') {

  process '4E_Snpeff_setup_new_DB' {

   publishDir "${params.outdir}/snpEffDB", mode: "link", overwrite: false

   input:
     file genome from genome_file
     file gff from snpeff_gff

   output:
     file "snpEff.config" into snpeff_config_file_dbBuild
   script:

   """

   # Make a new folder in snpEffDB
   mkdir ${params.outdir}/snpEffDB/newBacGenome

   # Copy genome file, rename to sequences.fa
   mv $genome ${params.outdir}/snpEffDB/newBacGenome/sequences.fa

   # Copy ann file, rename genes.gff
   mv $gff ${params.outdir}/snpEffDB/newBacGenome/genes.gff

   # Copy config from repo
   cp ~/.nextflow/assets/uct-cbio/bacterial_variant_calling/assets/snpEff.config snpEff.config
   sed -i 's+./data/+${params.outdir}/snpEffDB/+' snpEff.config

   # Edit the snpEff.config, add: newBacGenome.genome: newBacGenome
   echo "newBacGenome.genome: newBacGenome" >> snpEff.config
   """
  }

  process '4E_Snpeff_create_DB' {

    input:
      file config from snpeff_config_file_dbBuild

    output:
      file "snpEff.config" into run_config

    script:
    """
    snpEff -Xmx4g build -gff3 -c $config -v newBacGenome
    """
  }

} else {

  process '4E_Snpeff_download_DB' {

    output:
      file "snpEff.config" into run_config
    script:
    """
    # Copy config from repo
    cp ~/.nextflow/assets/uct-cbio/bacterial_variant_calling/assets/snpEff.config snpEff.config
    sed -i 's+./data/+${params.outdir}snpEffDB/+' snpEff.config
    snpEff -Xmx4g download ${params.snpeffDb} -c ./snpEff.config
    """
  }

}



if (params.snpeffDb == 'build') {


    process '4E_Snpeff_use_build' {
      publishDir "${params.outdir}/snpEff", mode: "link", overwrite: true

      input:
        file filtered_vcf from filtered_vcfs_snpEff
        file snpeff_config from run_config.collect()
      output:
        set file("${filtered_vcf.baseName}_snpEff.ann.vcf"), file("${filtered_vcf.baseName}_snpEff.html"), file("${filtered_vcf.baseName}_snpEff.txt"), file("${filtered_vcf.baseName}_snpEff.csv") into snpEffResults
      script:
      """
      snpEff -Xmx4g \
        newBacGenome \
        -dataDir ${params.outdir}/snpEffDB/ \
        -csvStats ${filtered_vcf.baseName}_snpEff.csv \
        -v \
        -c $snpeff_config \
        ${filtered_vcf} \
        > ${filtered_vcf.baseName}_snpEff.ann.vcf
      mv snpEff_summary.html ${filtered_vcf.baseName}_snpEff.html
      mv ${filtered_vcf.baseName}_snpEff.genes.txt ${filtered_vcf.baseName}_snpEff.txt
      """
    }


} else {

    process '4E_Snpeff_use_existing' {
      publishDir "${params.outdir}/snpEff", mode: "link", overwrite: true

      input:
        file filtered_vcf from filtered_vcfs_snpEff
        file snpeff_config from run_config
      output:
        set file("${filtered_vcf.baseName}_snpEff.ann.vcf"), file("${filtered_vcf.baseName}_snpEff.html"), file("${filtered_vcf.baseName}_snpEff.txt"), file("${filtered_vcf.baseName}_snpEff.csv") into snpEffResults
      script:
      """
      snpEff -Xmx4g \
        ${params.snpeffDb} \
        -dataDir ${params.outdir}snpEffDB/ \
        -csvStats ${filtered_vcf.baseName}_snpEff.csv \
        -v \
        -c ./snpEff.config \
        ${filtered_vcf} \
        > ${filtered_vcf.baseName}_snpEff.ann.vcf
      mv snpEff_summary.html ${filtered_vcf.baseName}_snpEff.html
      mv ${filtered_vcf.baseName}_snpEff.genes.txt ${filtered_vcf.baseName}_snpEff.txt
      """
    }

}


  
                                             
   

process '4F_split_vcf_indel_snps' {
  publishDir "${params.outdir}/variants", mode: "link"

  input:
    file f_vcf from filtered_vcfs
  output:
    file "${f_vcf.baseName}_filtered_indels.recode.vcf" into indel_vcfs
    file "${f_vcf.baseName}_filtered_snps.recode.vcf" into snp_vcfs
    file "${f_vcf.baseName}_filtered_snps.recode.vcf" into snp_vcfs_bgzip
  script:
  """
  vcftools --vcf $f_vcf --keep-only-indels --recode --recode-INFO-all --out ${f_vcf.baseName}_filtered_indels
  vcftools --vcf $f_vcf --remove-indels --recode --recode-INFO-all --out ${f_vcf.baseName}_filtered_snps
  """

}

  
                                                                 
   
process '4G_BuildConsensusSequence' {

    publishDir "${params.outdir}/Consensus"

    input:
    file snp_vcf_file from snp_vcfs
    file genome from genome_file

    output:
    file("${snp_vcf_file.baseName}_consensus.fa") into consensus_files

    """
    bgzip -c $snp_vcf_file > ${snp_vcf_file.baseName}.vcf.gz
    tabix ${snp_vcf_file.baseName}.vcf.gz
    cat $genome | bcftools consensus ${snp_vcf_file.baseName}.vcf.gz > ${snp_vcf_file.baseName}_consensus.fa
    """
}



  
                 
           


if (params.makeTree) {

                
                            
      
                                            
       

    process '5A_mafft_alignment' {

      label 'high_memory'

      input:
        file seq from consensus_files.collect()
      output:
        file "*.phy" into phylip_file
      script:
      """
      cat *.fa > combined.fasta
      mafft --retree 2 --maxiterate 2 combined.fasta > aligned.fasta
      convbioseq -i fasta phylip aligned.fasta
      """
    }


      
                            
       

    process '5B_run_RAxML' {

      publishDir "${params.outdir}/RAxML", mode: "link", overwrite: false

      input:
        file inphy from phylip_file
        val threads from threads
      output:
        file "*.outFile" into RAxML_out

      script:
      """
      /standard-RAxML/raxmlHPC-PTHREADS-AVX -s $inphy -n outFile -m GTRCATX -T $threads -f a -x 10 -N autoMRE -p 10
      """
    }

}

  
                 
           


  
                                                                                                     
  
  
   

process '6A_multiqc' {
    publishDir "${params.outdir}/MultiQC", mode: 'copy'

    when:
    !params.skip_multiqc

    input:
    file multiqc_config from ch_multiqc_config
    file (fastqc
OPERATION_10 origin : [['_fastqc', 'P']]
OPERATION_10 gives  : []


OPERATION_11 string : fastqc_results.collect().ifEmpty([])
OPERATION_11 origin : [['fastqc_results', 'P']]
OPERATION_11 gives  : []


OPERATION_12 string : trimgalore_results.collect().ifEmpty([])
OPERATION_12 origin : [['trimgalore_results', 'P']]
OPERATION_12 gives  : []


OPERATION_13 string : rseqc_results.collect().ifEmpty([])
OPERATION_13 origin : [['rseqc_results', 'P']]
OPERATION_13 gives  : []


OPERATION_14 string : snpEffResults.collect().ifEmpty([])
OPERATION_14 origin : [['snpEffResults', 'P']]
OPERATION_14 gives  : []


OPERATION_15 string : picard_results.collect().ifEmpty([])
OPERATION_15 origin : [['picard_results', 'P']]
OPERATION_15 gives  : []


