OPERATION_1 string : ch_sample_ids = Channel.value(file(params.sample_ids))
OPERATION_1 origin : []
OPERATION_1 gives  : [['ch_sample_ids', 'P']]


OPERATION_2 string : ch_num_participants = Channel.fromPath(params.sample_ids).splitText().map{ it.trim() }.count()
OPERATION_2 origin : [['params.sample_ids', 'A']]
OPERATION_2 gives  : [['ch_num_participants', 'P']]


OPERATION_3 string : ch_num_participants = Channel.value(params.num_participants)
OPERATION_3 origin : [['params.num_participants', 'V']]
OPERATION_3 gives  : [['ch_num_participants', 'P']]


OPERATION_4 string : Channel
    .fromPath("${params.legend_for_hapgen2}")
    .set { legend_for_hapgen2_file_ch }
OPERATION_4 origin : [['"${params.legend_for_hapgen2}"', 'A']]
OPERATION_4 gives  : [['legend_for_hapgen2_file_ch', 'P']]


OPERATION_5 string : Channel
    .fromPath("${params.reference_1000G}")
    .set { reference_1000G_ch }
OPERATION_5 origin : [['"${params.reference_1000G}"', 'A']]
OPERATION_5 gives  : [['reference_1000G_ch', 'P']]


OPERATION_6 string : Channel
    .fromPath("${params.simulate_cb_output_config}")
    .set { cohort_browser_yaml_config_ch }
OPERATION_6 origin : [['"${params.simulate_cb_output_config}"', 'A']]
OPERATION_6 gives  : [['cohort_browser_yaml_config_ch', 'P']]


OPERATION_7 string : summary.collect { k,v -> "${k.padRight(18)}: $v" }.join("\n")
OPERATION_7 origin : [['summary', 'P']]
OPERATION_7 gives  : []


OPERATION_8 string : downloaded_leg_files_ch
  .flatMap { it -> it }
  .map { file -> 
       def chr = file.name.toString().tokenize('-').get(0)
       return tuple(chr, file)
   }
  .set { legend_for_hapgen2_ch }
OPERATION_8 origin : [['downloaded_leg_files_ch', 'P']]
OPERATION_8 gives  : [['legend_for_hapgen2_ch', 'P']]


OPERATION_9 string : downloaded_1000G_genetic_map_ch
    .flatMap { it -> it }
    .map { file -> 
       def key = file.name.toString().tokenize('_').get(2)
       return tuple(key, file)
    }
    .set { genetic_map_ch }
OPERATION_9 origin : [['downloaded_1000G_genetic_map_ch', 'P']]
OPERATION_9 gives  : [['genetic_map_ch', 'P']]


OPERATION_10 string : downloaded_1000G_hap_ch
    .flatMap { it -> it }
    .map { file -> 
       def key = file.name.toString().tokenize('_').get(4)
       return tuple(key, file)
    }
    .set { hap_ch }
OPERATION_10 origin : [['downloaded_1000G_hap_ch', 'P']]
OPERATION_10 gives  : [['hap_ch', 'P']]


OPERATION_11 string : all_ref_ch = genetic_map_ch.join(hap_ch)
OPERATION_11 origin : [['genetic_map_ch', 'P'], ['hap_ch', 'P']]
OPERATION_11 gives  : [['all_ref_ch', 'P']]


OPERATION_12 string : all_hapgen_inputs_ch = all_ref_ch.join(legend_for_hapgen2_ch)
OPERATION_12 origin : [['all_ref_ch', 'P'], ['legend_for_hapgen2_ch', 'P']]
OPERATION_12 gives  : [['all_hapgen_inputs_ch', 'P']]


