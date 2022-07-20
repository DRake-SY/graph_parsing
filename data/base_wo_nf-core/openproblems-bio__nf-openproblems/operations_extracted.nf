OPERATION_1 string : configFiles.join(', ')
OPERATION_1 origin : [['configFiles', 'P']]
OPERATION_1 gives  : []


OPERATION_2 string : summary.collect { k,v -> "${k.padRight(18)}: $v" }.join("\n")
OPERATION_2 origin : [['summary', 'P']]
OPERATION_2 gives  : []


OPERATION_3 string : ch_list_tasks
    .splitText() { line -> line.replaceAll("\\n", "") }
    .into { ch_task_names_for_list_datasets;
            ch_task_names_for_list_methods;
            ch_task_names_for_list_metrics }
OPERATION_3 origin : [['ch_list_tasks', 'P']]
OPERATION_3 gives  : [['ch_task_names_for_list_datasets', 'P'], ['ch_task_names_for_list_methods', 'P'], ['ch_task_names_for_list_metrics', 'P']]


OPERATION_4 string : ch_list_datasets
    .map { it -> tuple(
        it[0],
        it[1].splitText()*.replaceAll("\n", "")
     ) }
    .transpose()
    .set { ch_task_dataset_pairs }
OPERATION_4 origin : [['ch_list_datasets', 'P']]
OPERATION_4 gives  : [['ch_task_dataset_pairs', 'P']]


OPERATION_5 string : ch_list_methods
    .map { it -> tuple(
        it[0],
        it[1].splitText()*.replaceAll("\n", "")
        )}
    .transpose()
    .set { ch_task_method_pairs }
OPERATION_5 origin : [['ch_list_methods', 'P']]
OPERATION_5 gives  : [['ch_task_method_pairs', 'P']]


OPERATION_6 string : ch_task_method_image_hash
    .combine( ch_loaded_datasets, by: 0)
    .set { ch_dataset_methods }
OPERATION_6 origin : [['ch_task_method_image_hash', 'P']]
OPERATION_6 gives  : [['ch_dataset_methods', 'P']]


OPERATION_7 string : ch_ran_methods
    .tap { ch_ran_methods_to_code_versions }
    .set { ch_ran_methods_to_metrics }
OPERATION_7 origin : [['ch_ran_methods', 'P']]
OPERATION_7 gives  : [['ch_ran_methods_to_metrics', 'P'], ['ch_ran_methods_to_code_versions', 'P']]


OPERATION_8 string : ch_list_metrics
    .map { it -> tuple(
        it[0],
        it[1].splitText()*.replaceAll("\n", "")
    ) }
    .transpose()
    .set { ch_task_metric_pairs }
OPERATION_8 origin : [['ch_list_metrics', 'P']]
OPERATION_8 gives  : [['ch_task_metric_pairs', 'P']]


OPERATION_9 string : ch_task_metric_image_hash
    .combine(ch_ran_methods_to_metrics, by:0)
    .set { ch_dataset_method_metrics }
OPERATION_9 origin : [['ch_task_metric_image_hash', 'P']]
OPERATION_9 gives  : [['ch_dataset_method_metrics', 'P']]


