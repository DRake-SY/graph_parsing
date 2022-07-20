Name : splt_sg
Inputs : [[0, 'split_soma_germ']]
Outputs : [[0, 'splitcsv2']]
Emits : []


Name : bbduk
Inputs : [[0, 'bbduking']]
Outputs : [[0, 'log_bbduk'], [1, 'bwa_memming'], [2, 'fastping']]
Emits : []


Name : fastp
Inputs : [[0, 'fastping']]
Outputs : [[0, 'fastp_html'], [1, 'fastp_multiqc']]
Emits : []


Name : bwamem
Inputs : [[0, 'bwa_memming'], [1, 'reference']]
Outputs : [[0, '']]
Emits : []


Name : cram
Inputs : [[0, 'cramming'], [1, 'reference']]
Outputs : [[0, 'completedcram']]
Emits : []


Name : mrkdup
Inputs : [[0, 'dup_marking']]
Outputs : [[0, 'mrkdup_multiqc'], [1, 'gatk4recaling']]
Emits : []


Name : gtkrcl
Inputs : [[0, 'gatk4recaling'], [1, 'reference'], [2, 'reference'], [3, 'reference'], [4, 'reference'], [5, 'reference']]
Outputs : [[0, 'gtkrcl_multiqc'], [1, ''], [2, 'hc_germ'], [3, 'metas_pcgr'], [4, 'bqsr_log']]
Emits : []


Name : scat_gath
Inputs : []
Outputs : [[0, 'lancet_bedding'], [1, 'mutect2_bedding'], [2, 'hc_bedding']]
Emits : []


Name : haplotypecaller
Inputs : [[0, 'hcgermbedding'], [1, 'reference'], [2, 'reference'], [3, 'reference'], [4, 'reference'], [5, 'reference']]
Outputs : [[0, 'hc_gt']]
Emits : []


Name : hc_merge
Inputs : [[0, 'hc_fm']]
Outputs : [[0, 'cpsr_vcf']]
Emits : []


Name : cpsrreport
Inputs : [[0, 'cpsr_vcf'], [1, 'reference'], [2, 'reference']]
Outputs : [[0, 'cpsr_vcfs']]
Emits : []


Name : mltmet
Inputs : [[0, 'gmultimetricing'], [1, 'reference'], [2, 'reference'], [3, 'reference'], [4, 'reference']]
Outputs : [[0, 'multimetrics_multiqc']]
Emits : []


Name : fctcsv
Inputs : [[0, 'facetsomaing'], [1, 'reference']]
Outputs : [[0, 'facets_consensusing'], [1, 'facets_pcgr'], [2, 'facets_log']]
Emits : []


Name : fctcon
Inputs : [[0, 'facets_consensusing'], [1, 'reference'], [2, 'reference']]
Outputs : [[0, 'complete_facets']]
Emits : []


Name : mutct2_sg
Inputs : [[0, 'mutect2somaticbedding'], [1, 'reference'], [2, 'reference'], [3, 'reference']]
Outputs : [[0, 'mutect2_gt'], [1, 'mutect2_st'], [2, 'mutect2_f1r2']]
Emits : []


Name : mutct2_concat
Inputs : [[0, 'mutect2_fm']]
Outputs : [[0, 'mutect2_merge']]
Emits : []


Name : mutct2_concstat
Inputs : [[0, 'mutect2_sm']]
Outputs : [[0, 'mutect2_stats']]
Emits : []


Name : mutct2_f1r2_comb
Inputs : [[0, 'mutect2_f1r2_set']]
Outputs : [[0, 'mutect2_f1r2_comb']]
Emits : []


Name : mutct2_contam_filter
Inputs : [[0, 'mutect2_contam_merge'], [1, 'reference'], [2, 'reference'], [3, 'reference'], [4, 'reference'], [5, 'reference']]
Outputs : [[0, 'mutect2_veping'], [1, 'mutect2_rawVcf'], [2, 'completedmutect2call']]
Emits : []


Name : mntstr
Inputs : [[0, 'mantastrelka2ing'], [1, 'reference'], [2, 'reference'], [3, 'reference'], [4, 'reference']]
Outputs : [[0, 'strelka2_veping'], [1, 'strelka2_rawVcf'], [2, 'log_mantastrelka']]
Emits : []


Name : lancet_sg
Inputs : [[0, 'lancetsbedding'], [1, 'reference'], [2, 'reference'], [3, 'reference']]
Outputs : [[0, 'lancet_gt']]
Emits : []


Name : lancet_concat
Inputs : [[0, 'lancet_fm']]
Outputs : [[0, 'lancet_merge']]
Emits : []


Name : lancet_filter
Inputs : [[0, 'lancet_merge']]
Outputs : [[0, 'lancet_veping'], [1, 'lancet_rawVcf'], [2, 'completedlancetcall']]
Emits : []


Name : vepann
Inputs : [[0, 'case_veping'], [1, 'reference'], [2, 'reference'], [3, 'reference'], [4, 'reference'], [5, 'reference']]
Outputs : [[0, 'runGRanges']]
Emits : []


Name : vcfGRa
Inputs : [[0, 'cons_vcfs'], [1, 'vcfGRa_Scripts'], [2, 'impacts']]
Outputs : [[0, 'vcfs_pcgr'], [1, 'completedvcfGRangesConsensus']]
Emits : []


Name : pcgrVcf
Inputs : [[0, 'vcfs_pcgr']]
Outputs : [[0, 'snvpass_pcgr']]
Emits : []


Name : pcgrreport
Inputs : [[0, 'pcgr_inputs'], [1, 'reference'], [2, 'reference']]
Outputs : [[0, 'completedPCGR']]
Emits : []


Name : mltiQC
Inputs : [[0, 'fastp_multiqc'], [1, 'gtkrcl_multiqc'], [2, 'multimetrics_multiqc'], [3, 'mrkdup_multiqc']]
Outputs : [[0, 'completedmultiqc']]
Emits : []


Name : somenone_software_vers
Inputs : []
Outputs : [[0, 'ch_somenone_software_vers']]
Emits : []


