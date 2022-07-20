OPERATION_1 string : Channel
    .watchPath( params.zipfiles )             
    .map { 
        file = it
        id = it.getName()
        ext = params.zipfiles.tokenize( '/' )
        pieces = id.tokenize( '_' )
        checksum = pieces[-1].replace(".zip", "")
        [pieces[0..-4].join( '_' ), pieces[-3], pieces[-2], checksum, file]
    }.into { zipfiles; zip_for_calc_peptide_area_c4l; zip_for_calc_retime_area_c4l }
OPERATION_1 origin : [['params.zipfiles', 'A']]
OPERATION_1 gives  : [['zipfiles', 'P'], ['zip_for_calc_peptide_area_c4l', 'P'], ['zip_for_calc_retime_area_c4l', 'P']]


OPERATION_2 string : Channel
    .fromPath( params.zipfiles )
    .map { 
        file = it
        id = it.getName()
        ext = params.zipfiles.tokenize( '/' )
        pieces = id.tokenize( '_' )
        checksum = pieces[-1].replace(".zip", "")
        [pieces[0..-4].join( '_' ), pieces[-3], pieces[-2], checksum, file]
    }.into { zipfiles; zip_for_calc_peptide_area_c4l; zip_for_calc_retime_area_c4l }
OPERATION_2 origin : [['params.zipfiles', 'A']]
OPERATION_2 gives  : [['zipfiles', 'P'], ['zip_for_calc_peptide_area_c4l', 'P'], ['zip_for_calc_retime_area_c4l', 'P']]


OPERATION_3 string : Channel
    .from(fastaconfig.readLines())
    .map { line ->
        list = line.split("\t")
        genome_id = list[0]
        internal_db = list[1]
        fasta_file_name = list[2]
        fasta_path = file("${fasta_folder}/${fasta_file_name}")
        [genome_id, fasta_file_name, internal_db, fasta_path]
    }
    .into{ fasta_desc; blastdb_desc }
OPERATION_3 origin : []
OPERATION_3 gives  : [['fasta_desc', 'P'], ['blastdb_desc', 'P']]


OPERATION_4 string : Channel
    .from(qconfig.readLines())
    .map { line ->
     list = line.split("\t")
     internal_code = list[0]
     genome           = list[1]
     workflow_type    = list[2]
     [internal_code, genome, workflow_type]
    }
    .set{qconfig_desc}
OPERATION_4 origin : []
OPERATION_4 gives  : [['qconfig_desc', 'P']]


OPERATION_5 string : queueQC12 = Channel.create()
OPERATION_5 origin : []
OPERATION_5 gives  : [['queueQC12', 'P']]


OPERATION_6 string : queueQC03 = Channel.create()
OPERATION_6 origin : []
OPERATION_6 gives  : [['queueQC03', 'P']]


OPERATION_7 string : input_pipe_withcode_reordered = corrected_mzmlfiles_for_second_step.combine(qconfig_desc,by: 0).map{
  qc_id, sample_id, checksum, file, genome, analysis -> [genome, qc_id, sample_id, file, analysis, checksum]
}
OPERATION_7 origin : [['corrected_mzmlfiles_for_second_step', 'P']]
OPERATION_7 gives  : [['input_pipe_withcode_reordered', 'P']]


OPERATION_8 string : input_pipe_complete_first_step = input_pipe_withcode_reordered.combine(blastdbs, by: 0)
OPERATION_8 origin : [['input_pipe_withcode_reordered', 'P']]
OPERATION_8 gives  : [['input_pipe_complete_first_step', 'P']]


OPERATION_9 string : input_pipe_complete_first_step
     .into{ input_pipe_complete_first_step_for_srm; input_pipe_complete_first_step_for_shotgun; input_pipe_complete_first_step_for_shotgun_qc4l_cid; input_pipe_complete_first_step_for_shotgun_qc4l_hcd; input_pipe_complete_first_step_for_shotgun_qc4l_etcid; input_pipe_complete_first_step_for_shotgun_qc4l_ethcd ; debug }
OPERATION_9 origin : [['input_pipe_complete_first_step', 'P']]
OPERATION_9 gives  : [['input_pipe_complete_first_step_for_srm', 'P'], ['input_pipe_complete_first_step_for_shotgun', 'P'], ['input_pipe_complete_first_step_for_shotgun_qc4l_cid', 'P'], ['input_pipe_complete_first_step_for_shotgun_qc4l_hcd', 'P'], ['input_pipe_complete_first_step_for_shotgun_qc4l_etcid', 'P'], ['input_pipe_complete_first_step_for_shotgun_qc4l_ethcd', 'P'], ['debug', 'P']]


OPERATION_10 string : rettime_c4l_all = retTime_for_delivery.mix(retTime_qc4l_for_delivery)
OPERATION_10 origin : [['retTime_for_delivery', 'P'], ['retTime_qc4l_for_delivery', 'P']]
OPERATION_10 gives  : [['rettime_c4l_all', 'P']]


OPERATION_11 string : pep_c4l_all = pep_c4l_for_delivery.mix(pep_checked_for_delivery)
OPERATION_11 origin : [['pep_c4l_for_delivery', 'P'], ['pep_checked_for_delivery', 'P']]
OPERATION_11 gives  : [['pep_c4l_all', 'P']]


OPERATION_12 string : mass_checked_for_delivery = mass_checked_for_joining.mix(mass_c4l_json_for_delivery_fake, mass_c4l_json_for_delivery)
OPERATION_12 origin : [['mass_checked_for_joining', 'P'], ['mass_c4l_json_for_delivery_fake', 'P'], ['mass_c4l_json_for_delivery', 'P']]
OPERATION_12 gives  : [['mass_checked_for_delivery', 'P']]


OPERATION_13 string : ms2_spectral_for_delivery.join(tic_for_delivery).join(tot_psm_for_delivery).join(uni_peptides_for_delivery).join(uni_prots_for_delivery).join(median_itms2_for_delivery).join(mass_checked_for_delivery).join(median_checked_for_delivery).join(median_itms1_for_delivery).join(rettime_c4l_all).into{jointJsons; jointJsonsAA}
OPERATION_13 origin : [['ms2_spectral_for_delivery', 'P'], ['tic_for_delivery', 'P'], ['tot_psm_for_delivery', 'P'], ['uni_peptides_for_delivery', 'P'], ['uni_prots_for_delivery', 'P'], ['median_itms2_for_delivery', 'P'], ['mass_checked_for_delivery', 'P'], ['median_checked_for_delivery', 'P'], ['median_itms1_for_delivery', 'P'], ['rettime_c4l_all', 'P']]
OPERATION_13 gives  : [['jointJsons', 'P'], ['jointJsonsAA', 'P']]


OPERATION_14 string : jointJsons.choice( queueQC03, queueQC12 ) { a -> a  = 0
 } else { 
jointJsons.choice( queueQC03, queueQC12 ) { a -> a  = 1 }
 }
OPERATION_14 origin : [['jointJsons', 'P']]
OPERATION_14 gives  : [['queueQC03', 'P'], ['queueQC12', 'P'], ['queueQC03', 'P'], ['queueQC12', 'P']]


OPERATION_15 string : queueQC03Grouped = queueQC03.map{ 
    def rawids = it[0].tokenize( '_' );
    def orid = "${rawids[0]}_${rawids[1]}_${rawids[2]}";
    def l = [orid]; 
    l.addAll([it.drop(1)]); 
    return l 
}.groupTuple(size:4)
OPERATION_15 origin : [['queueQC03', 'P']]
OPERATION_15 gives  : [['queueQC03Grouped', 'P']]


OPERATION_16 string : queueQC03ToBeSent = queueQC03Grouped.map{
	def id = [it[0]]
	id.addAll([it.drop(1).flatten()]); 
	return id
}
OPERATION_16 origin : [['queueQC03Grouped', 'P']]
OPERATION_16 gives  : [['queueQC03ToBeSent', 'P']]


OPERATION_17 string : queueQC12ToBeSent = queueQC12.map{ 
    def rawids = it[0].tokenize( '_' );
    def orid = "${rawids[0]}_${rawids[1]}_${rawids[2]}";
    def l = [orid]; 
    l.addAll([it.drop(1)]); 
    return l 
}
OPERATION_17 origin : [['queueQC12', 'P']]
OPERATION_17 gives  : [['queueQC12ToBeSent', 'P']]


OPERATION_18 string : jsonToBeSent = queueQC12ToBeSent.mix(queueQC03ToBeSent)
OPERATION_18 origin : [['queueQC12ToBeSent', 'P'], ['queueQC03ToBeSent', 'P']]
OPERATION_18 gives  : [['jsonToBeSent', 'P']]


OPERATION_19 string : mZML_params_for_delivery = mZML_params_for_mapping.map{
        def rawids = it[0].tokenize( '_' )
        def sample_id = "${rawids[0]}_${rawids[1]}_${rawids[2]}"
        [sample_id , it[1], it[3], it[4].text, it[5].text]
}.unique()
OPERATION_19 origin : [['mZML_params_for_mapping', 'P']]
OPERATION_19 gives  : [['mZML_params_for_delivery', 'P']]


OPERATION_20 string : WF_IDs = WF_vals.toList().unique()
OPERATION_20 origin : [['WF_vals', 'P']]
OPERATION_20 gives  : [['WF_IDs', 'P']]


