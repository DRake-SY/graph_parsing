Name : build_records
Inputs : [[0, 'ch_images']]
Outputs : [[0, 'ch_shards'], [1, 'ch_originals'], [2, 'ch_ratios'], [3, 'invalid_images']]
Emits : []


Name : run_predictions_DPP
Inputs : [[0, 'ch_model'], [1, 'ch_shards']]
Outputs : [[0, 'ch_predictions']]
Emits : []


Name : run_predictions
Inputs : [[0, 'ch_model'], [1, 'ch_shards']]
Outputs : [[0, 'ch_predictions']]
Emits : []


Name : extract_traits
Inputs : [[0, 'ch_segmentations']]
Outputs : [[0, 'ch_results'], [1, 'ch_masks'], [2, 'ch_overlays'], [3, 'ch_crops'], [4, 'ch_hull']]
Emits : []


Name : draw_diagnostics
Inputs : [[0, 'ch_masks'], [0, 'ch_overlays'], [0, 'ch_crops']]
Outputs : []
Emits : []


Name : launch_shiny
Inputs : [[0, 'ch_resultfile'], [1, 'ch_shinyapp'], [2, 'labels']]
Outputs : []
Emits : []


