OPERATION_1 string : samples = Channel.from(samples_info)
OPERATION_1 origin : [['samples_info', 'V']]
OPERATION_1 gives  : [['samples', 'P']]


OPERATION_2 string : r_script = Channel.fromPath(R_SCRIPT_FILEPATH)
OPERATION_2 origin : [['R_SCRIPT_FILEPATH', 'A']]
OPERATION_2 gives  : [['r_script', 'P']]


OPERATION_3 string : design_file = Channel.fromPath(DESIGN_FILEPATH)
OPERATION_3 origin : [['DESIGN_FILEPATH', 'A']]
OPERATION_3 gives  : [['design_file', 'P']]


OPERATION_4 string : trimmed_fastq_star = Channel.create()
OPERATION_4 origin : []
OPERATION_4 gives  : [['trimmed_fastq_star', 'P']]


OPERATION_5 string : trimmed_fastq_star_mbscreen = Channel.create()
OPERATION_5 origin : []
OPERATION_5 gives  : [['trimmed_fastq_star_mbscreen', 'P']]


OPERATION_6 string : trimmed_fastq_screen = Channel.create()
OPERATION_6 origin : []
OPERATION_6 gives  : [['trimmed_fastq_screen', 'P']]


OPERATION_7 string : bam_star_sort = Channel.create()
OPERATION_7 origin : []
OPERATION_7 gives  : [['bam_star_sort', 'P']]


OPERATION_8 string : bam_star_multiqc = Channel.create()
OPERATION_8 origin : []
OPERATION_8 gives  : [['bam_star_multiqc', 'P']]


OPERATION_9 string : star_results_dgea = Channel.create()
OPERATION_9 origin : []
OPERATION_9 gives  : [['star_results_dgea', 'P']]


OPERATION_10 string : star_results_multiqc = Channel.create()
OPERATION_10 origin : []
OPERATION_10 gives  : [['star_results_multiqc', 'P']]


OPERATION_11 string : bam_star_sorted_picard = Channel.create()
OPERATION_11 origin : []
OPERATION_11 gives  : [['bam_star_sorted_picard', 'P']]


OPERATION_12 string : bam_star_sorted_multiqc = Channel.create()
OPERATION_12 origin : []
OPERATION_12 gives  : [['bam_star_sorted_multiqc', 'P']]


OPERATION_13 string : picard_rg_duplicate = Channel.create()
OPERATION_13 origin : []
OPERATION_13 gives  : [['picard_rg_duplicate', 'P']]


OPERATION_14 string : picard_rg_multiqc = Channel.create()
OPERATION_14 origin : []
OPERATION_14 gives  : [['picard_rg_multiqc', 'P']]


OPERATION_15 string : picard_dupmarked_indexing = Channel.create()
OPERATION_15 origin : []
OPERATION_15 gives  : [['picard_dupmarked_indexing', 'P']]


OPERATION_16 string : picard_dupmarked_complexity = Channel.create()
OPERATION_16 origin : []
OPERATION_16 gives  : [['picard_dupmarked_complexity', 'P']]


OPERATION_17 string : picard_dupmarked_rnaseqmetrics = Channel.create()
OPERATION_17 origin : []
OPERATION_17 gives  : [['picard_dupmarked_rnaseqmetrics', 'P']]


OPERATION_18 string : picard_dupmarked_multimetrics = Channel.create()
OPERATION_18 origin : []
OPERATION_18 gives  : [['picard_dupmarked_multimetrics', 'P']]


OPERATION_19 string : picard_dupmarked_infer_experiment = Channel.create()
OPERATION_19 origin : []
OPERATION_19 gives  : [['picard_dupmarked_infer_experiment', 'P']]


OPERATION_20 string : picard_dupmarked_junction_annotation = Channel.create()
OPERATION_20 origin : []
OPERATION_20 gives  : [['picard_dupmarked_junction_annotation', 'P']]


OPERATION_21 string : picard_dupmarked_junction_saturation = Channel.create()
OPERATION_21 origin : []
OPERATION_21 gives  : [['picard_dupmarked_junction_saturation', 'P']]


OPERATION_22 string : picard_dupmarked_mismatch_profile = Channel.create()
OPERATION_22 origin : []
OPERATION_22 gives  : [['picard_dupmarked_mismatch_profile', 'P']]


OPERATION_23 string : picard_dupmarked_read_distribution = Channel.create()
OPERATION_23 origin : []
OPERATION_23 gives  : [['picard_dupmarked_read_distribution', 'P']]


OPERATION_24 string : picard_dupmarked_rnaseqc = Channel.create()
OPERATION_24 origin : []
OPERATION_24 gives  : [['picard_dupmarked_rnaseqc', 'P']]


OPERATION_25 string : bai_picard_transcript_integrity_number = Channel.create()
OPERATION_25 origin : []
OPERATION_25 gives  : [['bai_picard_transcript_integrity_number', 'P']]


OPERATION_26 string : bai_picard_rnaseqc = Channel.create()
OPERATION_26 origin : []
OPERATION_26 gives  : [['bai_picard_rnaseqc', 'P']]


OPERATION_27 string : bai_picard_multiqc = Channel.create()
OPERATION_27 origin : []
OPERATION_27 gives  : [['bai_picard_multiqc', 'P']]


OPERATION_28 string : diffs.min() }[0]
def ROUGH_READ_LENGTH = starIndexReadLengths[index.toInteger()]


                                                                               
                                                                               
                                                                               
                                                                               
                                                                               

              
def BINOMIAL = GENUS.capitalize() + " " + SPECIES
def BINOMIAL_DIRNAME = BINOMIAL.replace(" ", "_").toLowerCase()
def BINOMIAL_FILENAME = BINOMIAL.replace(" ", "_")


                                                                               
                                                                               
                                                                               
                                                                               
                                                                               
 
                 
def GENOME_DIRNAME = "release-" + GENOME_RELEASE
def ROUGH_READ_LENGTH_DIRNAME = ROUGH_READ_LENGTH + "bp"

                       
def BABS_WORKING_DIRPATH = "/camp/stp/babs/working"

                           
def ALIGNMENT_DIRNAME = "alignment"
def ANALYSIS_DIRNAME = "analysis"
def OUTPUT_DIRNAME = "output"
def LOG_DIRNAME = "log"

                                          
def CUTADAPT_DIRNAME = "cutadapt"
def FSCREEN_DIRNAME = "fastq_screen"
def RSEM_DIRNAME = "rsem"
def STAR_DIRNAME = "star"
def STAR_MBSCREEN_DIRNAME = "mbscreen"
def PICARD_DIRNAME = "picard"
def RSEQC_DIRNAME = "rseqc"
def RNASEQC_DIRNAME = "rnaseqc"

                                    
                                    
                                    

def CUTADAPT_DIRPATH = Paths.get(OUTPUT_DIRPATH, CUTADAPT_DIRNAME).toString()
def FSCREEN_DIRPATH = Paths.get(OUTPUT_DIRPATH, FSCREEN_DIRNAME).toString()
def STAR_DIRPATH = Paths.get(OUTPUT_DIRPATH, STAR_DIRNAME).toString()
def STAR_MBSCREEN_DIRPATH = Paths.get(OUTPUT_DIRPATH,
										STAR_MBSCREEN_DIRNAME).toString()
def PICARD_DIRPATH = Paths.get(OUTPUT_DIRPATH, PICARD_DIRNAME).toString()
def RSEQC_DIRPATH = Paths.get(OUTPUT_DIRPATH, RSEQC_DIRNAME).toString()
def RNASEQC_DIRPATH = Paths.get(OUTPUT_DIRPATH, RNASEQC_DIRNAME).toString()
def ANALYSIS_DIRPATH = Paths.get(OUTPUT_DIRPATH, ANALYSIS_DIRNAME).toString()
def LOG_DIRPATH = Paths.get(OUTPUT_DIRPATH, LOG_DIRNAME).toString()


                                                                               
                                                                               
                                                                               
                                                                               
                                                                               

             
def ANNOT_EXTENSION = "gtf"
def ANNOT_BASENAME =
	BINOMIAL_FILENAME + "." + GENOME_VERSION + "." + GENOME_RELEASE

           
def SEQ_BASENAME = BINOMIAL_FILENAME + "." + GENOME_VERSION

                  
def BABS_DATA_DIRNAME = "data"
def BABS_GENOME_DIRNAME = "genomes"
def INDICE_DIRNAME = "genome_idx"
def ANNOT_DIRNAME = ANNOT_EXTENSION
def RSEM_STAR_MBIOL_DIRNAME = "molecular_biology"
def RSEM_STAR_MBIOL_INDICE_DIRNAME = "all.idx" 
def SEQ_DIRNAME = "genome"

               
def RSEM_STAR_INDICE_NAME = "genome"
def RSEM_STAR_MBSCREEN_INDICE_NAME = "molecular_biology.all"

                     
                     
                     

                                      
def BABS_DATA_DIRPATH =
	Paths.get(BABS_WORKING_DIRPATH, BABS_DATA_DIRNAME).toString()

                                  
def BABS_GENOME_DIRPATH =
	Paths.get(BABS_DATA_DIRPATH, BABS_GENOME_DIRNAME).toString()

                                                                         
def GENOME_DIRPATH =
	Paths.get(
		BABS_GENOME_DIRPATH, BINOMIAL_DIRNAME,
		GENOME_TYPE, GENOME_VERSION,
		GENOME_DIRNAME
		).toString()

def ANNOT_DIRPATH = Paths.get(GENOME_DIRPATH, ANNOT_DIRNAME).toString()

def INDICE_DIRPATH = Paths.get(GENOME_DIRPATH, INDICE_DIRNAME).toString()

                                              
def RSEM_STAR_INDICE_DIRPATH =
	Paths.get(
		INDICE_DIRPATH, RSEM_DIRNAME,
		STAR_DIRNAME,
		ROUGH_READ_LENGTH_DIRNAME
		).toString()

                                                                
def RSEM_STAR_MBSCREEN_INDICE_DIRPATH =
	Paths.get(
		BABS_GENOME_DIRPATH,
		RSEM_STAR_MBIOL_DIRNAME,
		RSEM_STAR_MBIOL_INDICE_DIRNAME,
		RSEM_DIRNAME, STAR_DIRNAME,
		ROUGH_READ_LENGTH_DIRNAME
		).toString()

                
                
                

def ANNOT_FILENAME = ANNOT_BASENAME + "." + ANNOT_EXTENSION
def ANNOT_RNASEQC_FILENAME = ANNOT_BASENAME + ".rnaseqc." + ANNOT_EXTENSION
def ANNOT_BED_FILENAME = ANNOT_BASENAME + ".bed"
def ANNOT_REFFLAT_FILENAME = ANNOT_BASENAME + ".refflat"
def ANNOT_RRNA_FILENAME = ANNOT_BASENAME + ".rRNA.list"
def ANNOT_RRNA_INTERVAL_FILENAME = ANNOT_BASENAME + ".rRNA.interval_list"

                                                      
                                         
                               
def SEQ_FILENAME = SEQ_BASENAME + ".dna_sm." + GENOME_SEQ_EXTENSION

                
                
                

def ANNOT_FILEPATH = Paths.get(ANNOT_DIRPATH, ANNOT_FILENAME).toString()

def ANNOT_RNASEQC_FILEPATH =
	Paths.get(ANNOT_DIRPATH, ANNOT_RNASEQC_FILENAME).toString()

def ANNOT_REFFLAT_FILEPATH =
	Paths.get(ANNOT_DIRPATH, ANNOT_REFFLAT_FILENAME).toString()

def ANNOT_BED_FILEPATH =
	Paths.get(ANNOT_DIRPATH, ANNOT_BED_FILENAME).toString()

def ANNOT_RRNA_FILEPATH =
	Paths.get(ANNOT_DIRPATH, ANNOT_RRNA_FILENAME).toString()

def ANNOT_RRNA_INTERVAL_FILEPATH =
	Paths.get(ANNOT_DIRPATH, ANNOT_RRNA_INTERVAL_FILENAME).toString()

def SEQ_FILEPATH =
	Paths.get(GENOME_DIRPATH, SEQ_DIRNAME, SEQ_FILENAME).toString()


                                                                               
                                                                               
                                                                               
                                                                               
                                                                               

                                               
File cutadapt_dir = createDirPathFromString(CUTADAPT_DIRPATH)

                                                   
File fscreen_dir = createDirPathFromString(FSCREEN_DIRPATH)

                                           
File star_dir = createDirPathFromString(STAR_DIRPATH)

                                           
File star_mbscreen_dir = createDirPathFromString(STAR_MBSCREEN_DIRPATH)

                                              
File picard_dir = createDirPathFromString(PICARD_DIRPATH)

                                              
File rseqc_dir = createDirPathFromString(RSEQC_DIRPATH)

                                              
File rnaseqc_dir = createDirPathFromString(RNASEQC_DIRPATH)

                                   
File analysis_dir = createDirPathFromString(ANALYSIS_DIRPATH)

                                   
File log_dir = createDirPathFromString(LOG_DIRPATH)


                                                                               
                                                                               
                                                                               
                                                                               
                                                                               

                                             
def single_end_columns = ["file","sample"]
def paired_end_columns = ["file1","file2","sample"]
if (SINGLE_END ) {
OPERATION_28 origin : [['diffs', 'P']]
OPERATION_28 gives  : []


OPERATION_29 string : trimmed_fastq.into(
	trimmed_fastq_star,
	trimmed_fastq_star_mbscreen,
	trimmed_fastq_screen
	)
OPERATION_29 origin : [['trimmed_fastq', 'P']]
OPERATION_29 gives  : []


OPERATION_30 string : bam_star.into(bam_star_sort, bam_star_multiqc)
OPERATION_30 origin : [['bam_star', 'P']]
OPERATION_30 gives  : []


OPERATION_31 string : star_results.into(star_results_dgea, star_results_multiqc)
OPERATION_31 origin : [['star_results', 'P']]
OPERATION_31 gives  : []


OPERATION_32 string : bam_star_sorted.into(bam_star_sorted_picard, bam_star_sorted_multiqc)
OPERATION_32 origin : [['bam_star_sorted', 'P']]
OPERATION_32 gives  : []


OPERATION_33 string : picard_rg.into(picard_rg_duplicate, picard_rg_multiqc)
OPERATION_33 origin : [['picard_rg', 'P']]
OPERATION_33 gives  : []


OPERATION_34 string : picard_dupmarked.into(
	picard_dupmarked_indexing,
	picard_dupmarked_complexity,
	picard_dupmarked_rnaseqmetrics,
	picard_dupmarked_multimetrics,
	picard_dupmarked_infer_experiment,
	picard_dupmarked_junction_annotation,
	picard_dupmarked_junction_saturation,
	picard_dupmarked_mismatch_profile,
	picard_dupmarked_read_distribution,
	picard_dupmarked_rnaseqc)
OPERATION_34 origin : [['picard_dupmarked', 'P']]
OPERATION_34 gives  : []


OPERATION_35 string : bai_picard.into(
	bai_picard_transcript_integrity_number,
	bai_picard_rnaseqc,
	bai_picard_multiqc
	)
OPERATION_35 origin : [['bai_picard', 'P']]
OPERATION_35 gives  : []


