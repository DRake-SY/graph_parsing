OPERATION_1 string : software_versions = Channel.create()
OPERATION_1 origin : []
OPERATION_1 gives  : [['software_versions', 'P']]


OPERATION_2 string : cramfiles = Channel
                  .fromPath(params.crams)
                  .map { file -> tuple((file.simpleName + '.sorted'), file)}
OPERATION_2 origin : [['params.crams', 'A']]
OPERATION_2 gives  : [['cramfiles', 'P']]


OPERATION_3 string : sorted_bam_file = Channel
                  .fromPath(params.bams)
                  .map { file -> tuple((file.simpleName + '.sorted'), file, (file + '.bai'))}
OPERATION_3 origin : [['params.bams', 'A']]
OPERATION_3 gives  : [['sorted_bam_file', 'P']]


OPERATION_4 string : bam_for_dreg = Channel
                  .fromPath(params.bams)
                  .map { file -> tuple((file.simpleName + '.sorted'), file, (file + '.bai'))}
OPERATION_4 origin : [['params.bams', 'A']]
OPERATION_4 gives  : [['bam_for_dreg', 'P']]


OPERATION_5 string : bam_for_gene_counting = Channel
                  .fromPath(params.bams)
                  .map { file -> tuple((file.simpleName + '.sorted'), file, (file + '.bai'))}
OPERATION_5 origin : [['params.bams', 'A']]
OPERATION_5 gives  : [['bam_for_gene_counting', 'P']]


OPERATION_6 string : tfit_prelim_out = Channel
        .fromPath(params.prelim_files)
        .map { file -> tuple((file.simpleName + '.sorted'), file)}
OPERATION_6 origin : [['params.prelim_files', 'A']]
OPERATION_6 gives  : [['tfit_prelim_out', 'P']]


OPERATION_7 string : dreg_res = Channel
        .fromPath(params.dreg_results)
        .map { file -> tuple((file.simpleName + '.sorted'), file)}
OPERATION_7 origin : [['params.dreg_results', 'A']]
OPERATION_7 gives  : [['dreg_res', 'P']]


OPERATION_8 string : dreg_res_process = Channel.create()
OPERATION_8 origin : []
OPERATION_8 gives  : [['dreg_res_process', 'P']]


OPERATION_9 string : summary.collect { k,v -> "${k.padRight(15)}: $v" }.join("\n")
OPERATION_9 origin : [['summary', 'P']]
OPERATION_9 gives  : []


OPERATION_10 string : software_versions.collectFile(name: "software_versions_bidir_${output_date}_${workflow.runName}.yaml", storeDir: "${params.outdir}/pipeline_info")
OPERATION_10 origin : [['software_versions', 'P']]
OPERATION_10 gives  : []


OPERATION_11 string : tfit_prelim_bg_out_preprocess = prelimtfit_process_bg
        .join(tfit_prelim_out)
OPERATION_11 origin : [['prelimtfit_process_bg', 'P'], ['tfit_prelim_out', 'P']]
OPERATION_11 gives  : [['tfit_prelim_bg_out_preprocess', 'P']]


OPERATION_12 string : tfit_split_results = post_tfit_bg_split
        .join(tfit_model_bed_out_split_max5kb)
        .join(tfit_model_bed_out_split_max10kb)
OPERATION_12 origin : [['post_tfit_bg_split', 'P'], ['tfit_model_bed_out_split_max5kb', 'P'], ['tfit_model_bed_out_split_max10kb', 'P']]
OPERATION_12 gives  : [['tfit_split_results', 'P']]


OPERATION_13 string : tfit_prelim_bg_out_preprocess = prelimtfit_process_bg
        .join(tfit_prelim_out)
OPERATION_13 origin : [['prelimtfit_process_bg', 'P'], ['tfit_prelim_out', 'P']]
OPERATION_13 gives  : [['tfit_prelim_bg_out_preprocess', 'P']]


OPERATION_14 string : tfit_prelim_bg_out = prelimtfit_process_bg
        .join(tfit_prelim_out)
OPERATION_14 origin : [['prelimtfit_process_bg', 'P'], ['tfit_prelim_out', 'P']]
OPERATION_14 gives  : [['tfit_prelim_bg_out', 'P']]


OPERATION_15 string : dreg_res_process = dreg_bg
        .join(dreg_res)
OPERATION_15 origin : [['dreg_bg', 'P'], ['dreg_res', 'P']]
OPERATION_15 gives  : [['dreg_res_process', 'P']]


OPERATION_16 string : dreg_res_process = dreg_bg
        .join(dREG_out)
OPERATION_16 origin : [['dreg_bg', 'P'], ['dREG_out', 'P']]
OPERATION_16 gives  : [['dreg_res_process', 'P']]


