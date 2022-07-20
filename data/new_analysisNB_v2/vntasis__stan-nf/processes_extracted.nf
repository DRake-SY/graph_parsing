Name : buildingModel
Inputs : [[0, 'model2build_ch'], [1, 'params'], [2, 'multithreadParam'], [3, 'params']]
Outputs : [[0, 'model_built_ch']]
Emits : []


Name : sampling
Inputs : [[0, 'model2sample_ch'], [1, 'params'], [2, 'params'], [3, 'params'], [4, 'params'], [5, 'threads']]
Outputs : [[0, 'samples2summary_ch'], [1, 'samples2gen_quan_ch']]
Emits : []


Name : summarising
Inputs : [[0, 'summarise_ch'], [1, 'params'], [2, 'params']]
Outputs : []
Emits : []


Name : generating_quantities
Inputs : [[0, 'gen_quan_ch'], [1, 'params'], [2, 'seed2genquan'], [3, 'threads']]
Outputs : []
Emits : []


