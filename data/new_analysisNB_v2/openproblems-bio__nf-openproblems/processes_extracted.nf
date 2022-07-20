Name : get_software_versions
Inputs : []
Outputs : []
Emits : []


Name : list_tasks
Inputs : []
Outputs : [[0, 'ch_list_tasks']]
Emits : []


Name : list_datasets
Inputs : [[0, 'ch_task_names_for_list_datasets']]
Outputs : [[0, 'ch_list_datasets']]
Emits : []


Name : dataset_images
Inputs : [[0, 'ch_task_dataset_pairs']]
Outputs : [[0, 'ch_task_dataset_image_hash']]
Emits : []


Name : load_dataset
Inputs : [[0, 'ch_task_dataset_image_hash']]
Outputs : [[0, 'ch_loaded_datasets'], [0, 'ch_loaded_datasets_to_print']]
Emits : []


Name : list_methods
Inputs : [[0, 'ch_task_names_for_list_methods']]
Outputs : [[0, 'ch_list_methods']]
Emits : []


Name : method_images
Inputs : [[0, 'ch_task_method_pairs']]
Outputs : [[0, 'ch_task_method_image_hash']]
Emits : []


Name : run_method
Inputs : [[0, 'ch_dataset_methods']]
Outputs : [[0, 'ch_ran_methods']]
Emits : []


Name : publish_code_versions
Inputs : [[0, 'ch_ran_methods_to_code_versions']]
Outputs : []
Emits : []


Name : list_metrics
Inputs : [[0, 'ch_task_names_for_list_metrics']]
Outputs : [[0, 'ch_list_metrics']]
Emits : []


Name : metric_images
Inputs : [[0, 'ch_task_metric_pairs']]
Outputs : [[0, 'ch_task_metric_image_hash']]
Emits : []


Name : run_metric
Inputs : [[0, 'ch_dataset_method_metrics']]
Outputs : [[0, 'ch_evaluated_metrics']]
Emits : []


