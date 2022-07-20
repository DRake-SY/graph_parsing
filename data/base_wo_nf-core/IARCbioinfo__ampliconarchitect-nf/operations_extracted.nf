OPERATION_1 string : tumors_crams.into {cnvkit_input; aa_input}
OPERATION_1 origin : [['tumors_crams', 'P']]
OPERATION_1 gives  : [['cnvkit_input', 'P'], ['aa_input', 'P']]


OPERATION_2 string : seed_crams = ampinter_seeds.join(aa_input)
OPERATION_2 origin : [['ampinter_seeds', 'P'], ['aa_input', 'P']]
OPERATION_2 gives  : [['seed_crams', 'P']]


