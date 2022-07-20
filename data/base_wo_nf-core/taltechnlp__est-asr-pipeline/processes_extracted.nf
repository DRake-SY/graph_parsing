Name : to_wav
Inputs : [[0, 'audio_file']]
Outputs : [[0, 'audio']]
Emits : []


Name : diarization
Inputs : [[0, 'audio']]
Outputs : [[0, 'show_seg'], [1, 'show_uem_seg']]
Emits : []


Name : prepare_initial_data_dir
Inputs : [[0, 'show_seg'], [1, 'audio']]
Outputs : [[0, 'init_datadir']]
Emits : []


Name : language_id
Inputs : [[0, 'init_datadir'], [1, 'audio']]
Outputs : [[0, 'datadir']]
Emits : []


Name : mfcc
Inputs : [[0, 'datadir'], [1, 'audio']]
Outputs : [[0, 'datadir_hires'], [1, 'ivectors']]
Emits : []


Name : speaker_id
Inputs : [[0, 'datadir'], [1, 'audio'], [2, '"$projectDir/conf"']]
Outputs : [[0, 'sid_result']]
Emits : []


Name : one_pass_decoding
Inputs : [[0, 'datadir_hires'], [1, 'ivectors'], [2, '"$projectDir/conf"']]
Outputs : [[0, 'pruned_unk']]
Emits : []


Name : rnnlm_rescoring
Inputs : [[0, 'pruned_unk'], [1, 'datadir_hires']]
Outputs : [[0, 'pruned_rnnlm_unk']]
Emits : []


Name : lattice2ctm
Inputs : [[0, 'pruned_rnnlm_unk'], [1, 'datadir_hires']]
Outputs : [[0, 'segmented_ctm'], [1, 'with_compounds_ctm']]
Emits : []


Name : to_json
Inputs : [[0, 'segmented_ctm'], [1, 'with_compounds_ctm'], [2, 'sid_result'], [3, 'show_uem_seg']]
Outputs : [[0, 'unpunctuated_json']]
Emits : []


Name : punctuation
Inputs : [[0, 'unpunctuated_json']]
Outputs : [[0, 'punctuated_json']]
Emits : []


Name : output
Inputs : [[0, 'with_compounds_ctm'], [1, 'punctuated_json']]
Outputs : [[0, 'result_json'], [1, 'result_srt'], [2, 'result_trs'], [3, 'result_ctm'], [4, 'result_with_compounds_ctm']]
Emits : []


Name : empty_output
Inputs : [[0, 'datadir'], [1, 'init_datadir']]
Outputs : [[0, 'empty_result_json'], [1, 'empty_result_srt'], [2, 'empty_result_trs'], [3, 'empty_result_ctm'], [4, 'empty_result_with_compounds_ctm']]
Emits : []


