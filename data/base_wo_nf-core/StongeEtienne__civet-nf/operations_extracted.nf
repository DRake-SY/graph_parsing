OPERATION_1 string : in_civet_transfo = Channel
        .fromFilePairs("$civet/*/transforms/linear/*t1_tal.xfm",
                        size: 1,
                        maxDepth:5,
                        flat: true) {it.parent.parent.parent.name}
OPERATION_1 origin : []
OPERATION_1 gives  : [['in_civet_transfo', 'P']]


OPERATION_2 string : in_civet_animal = Channel
        .fromFilePairs("$civet/*/segment/*animal_labels.mnc",
                        size: 1,
                        maxDepth:5,
                        flat: true) {it.parent.parent.name}
OPERATION_2 origin : []
OPERATION_2 gives  : [['in_civet_animal', 'P']]


OPERATION_3 string : in_civet_native = Channel
        .fromFilePairs("$civet/*/native/*t1.mnc",
                        size: 1,
                        maxDepth:5,
                        flat: true) {it.parent.parent.name}
OPERATION_3 origin : []
OPERATION_3 gives  : [['in_civet_native', 'P']]


OPERATION_4 string : in_civet_pve = Channel
        .fromFilePairs("$civet/*/{classify/*pve_exactcsf.mnc,classify/*pve_exactgm.mnc,classify/*pve_exactsc.mnc,classify/*pve_exactwm.mnc,final/*t1_final.mnc,mask/*brain_mask.mnc}",
                        size: 6,
                        maxDepth:5,
                        flat: true) {it.parent.parent.name}
OPERATION_4 origin : []
OPERATION_4 gives  : [['in_civet_pve', 'P']]


OPERATION_5 string : in_civet_animal
        .join(in_civet_native)
        .join(in_civet_pve)
        .join(in_civet_transfo)
        .set{in_civet}
OPERATION_5 origin : [['in_civet_animal', 'P'], ['in_civet_native', 'P'], ['in_civet_pve', 'P'], ['in_civet_transfo', 'P']]
OPERATION_5 gives  : [['in_civet', 'P']]


