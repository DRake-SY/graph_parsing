Name : makeblastdb
Inputs : [[0, 'fasta_desc']]
Outputs : [[0, 'blastdbs'], [0, 'blastdbs_d']]
Emits : []


Name : thermofilerawparser
Inputs : [[0, 'zipfiles']]
Outputs : [[0, 'mzmlfiles_for_correction']]
Emits : []


Name : correctMzml
Inputs : [[0, 'mzmlfiles_for_correction']]
Outputs : [[0, 'corrected_mzmlfiles_for_second_step']]
Emits : []


Name : run_shotgun
Inputs : [[0, 'input_pipe_complete_first_step_for_shotgun'], [1, 'shotgunWF']]
Outputs : [[0, 'shot_featureXMLfiles_for_calc_peptide_area'], [0, 'shot_featureXMLfiles_for_calc_mass_accuracy'], [0, 'shot_featureXMLfiles_for_calc_median_fwhm'], [1, 'shot_mzML_file_for_MedianITMS1'], [1, 'shot_mzML_file_for_MedianITMS2'], [1, 'shot_mzML_file_for_check'], [1, 'shot_mzML_file_for_tic'], [2, 'qcmlfiles_for_MS2_spectral_count'], [2, 'qcmlfiles_for_tot_num_uniq_peptides'], [2, 'qcmlfiles_for_tot_num_uniq_proteins'], [2, 'qcmlfiles_for_tot_num_psm'], [3, 'shot_featureXMLfiles_for_ret_time']]
Emits : []


Name : run_srm
Inputs : [[0, 'input_pipe_complete_first_step_for_srm'], [1, 'srmWF'], [2, 'srmCSV']]
Outputs : [[0, 'srm_featureXMLfiles_for_calc_peptide_area'], [0, 'srm_featureXMLfiles_for_calc_mass_accuracy'], [0, 'srm_featureXMLfiles_for_calc_median_fwhm'], [1, 'srm_mzML_file_for_MedianITMS1'], [1, 'srm_mzML_file_for_MedianITMS2'], [1, 'srm_mzML_file_for_check'], [2, 'srm_featureXMLfiles_for_ret_time']]
Emits : []


Name : shotgun_qc4l_cid
Inputs : [[0, 'input_pipe_complete_first_step_for_shotgun_qc4l_cid'], [1, 'shotgun_qc4l_cidWF']]
Outputs : [[0, 'shot_qc4l_cid_featureXMLfiles_for_calc_peptide_area'], [1, 'shot_qc4l_cid_mzML_file_for_MedianITMS1'], [1, 'shot_qc4l_cid_mzML_file_for_MedianITMS2'], [1, 'shot_qc4l_cid_mzML_file_for_check'], [1, 'shot_qc4l_cid_mzML_file_for_tic'], [2, 'shot_qc4l_cid_qcmlfiles_for_MS2_spectral_count'], [2, 'shot_qc4l_cid_qcmlfiles_for_tot_num_uniq_peptides'], [2, 'shot_qc4l_cid_qcmlfiles_for_tot_num_uniq_proteins'], [2, 'shot_qc4l_cid_qcmlfiles_for_tot_num_psm'], [3, 'shot_qc4l_cid_featureXMLfiles_for_ret_time'], [4, 'shot_qc4l_cid_featureXMLfiles_for_calc_median_fwhm'], [4, 'shot_qc4l_cid_featureXMLfiles_for_calc_mass_accuracy']]
Emits : []


Name : shotgun_qc4l_hcd
Inputs : [[0, 'input_pipe_complete_first_step_for_shotgun_qc4l_hcd'], [1, 'shotgun_qc4l_hcdWF']]
Outputs : [[0, 'shot_qc4l_hcd_featureXMLfiles_for_calc_peptide_area'], [0, 'shot_qc4l_hcd_featureXMLfiles_for_calc_mass_accuracy'], [0, 'shot_qc4l_hcd_featureXMLfiles_for_calc_median_fwhm'], [1, 'shot_qc4l_hcd_mzML_file_for_MedianITMS1'], [1, 'shot_qc4l_hcd_mzML_file_for_MedianITMS2'], [1, 'shot_qc4l_hcd_mzML_file_for_check'], [1, 'shot_qc4l_hcd_mzML_file_for_tic'], [2, 'shot_qc4l_hcd_qcmlfiles_for_MS2_spectral_count'], [2, 'shot_qc4l_hcd_qcmlfiles_for_tot_num_uniq_peptides'], [2, 'shot_qc4l_hcd_qcmlfiles_for_tot_num_uniq_proteins'], [2, 'shot_qc4l_hcd_qcmlfiles_for_tot_num_psm'], [3, 'shot_qc4l_hcd_featureXMLfiles_for_ret_time']]
Emits : []


Name : shotgun_qc4l_etcid
Inputs : [[0, 'input_pipe_complete_first_step_for_shotgun_qc4l_etcid'], [1, 'shotgun_qc4l_etcidWF']]
Outputs : [[0, 'shot_qc4l_etcid_featureXMLfiles_for_calc_peptide_area'], [0, 'shot_qc4l_etcid_featureXMLfiles_for_calc_mass_accuracy'], [0, 'shot_qc4l_etcid_featureXMLfiles_for_calc_median_fwhm'], [1, 'shot_qc4l_etcid_mzML_file_for_MedianITMS1'], [1, 'shot_qc4l_etcid_mzML_file_for_MedianITMS2'], [1, 'shot_qc4l_etcid_mzML_file_for_check'], [1, 'shot_qc4l_etcid_mzML_file_for_tic'], [2, 'shot_qc4l_etcid_qcmlfiles_for_MS2_spectral_count'], [2, 'shot_qc4l_etcid_qcmlfiles_for_tot_num_uniq_peptides'], [2, 'shot_qc4l_etcid_qcmlfiles_for_tot_num_uniq_proteins'], [2, 'shot_qc4l_etcid_qcmlfiles_for_tot_num_psm'], [3, 'shot_qc4l_etcid_featureXMLfiles_for_ret_time']]
Emits : []


Name : shotgun_qc4l_ethcd
Inputs : [[0, 'input_pipe_complete_first_step_for_shotgun_qc4l_ethcd'], [1, 'shotgun_qc4l_ethcdWF']]
Outputs : [[0, 'shot_qc4l_ethcd_featureXMLfiles_for_calc_peptide_area'], [0, 'shot_qc4l_ethcd_featureXMLfiles_for_calc_mass_accuracy'], [0, 'shot_qc4l_ethcd_featureXMLfiles_for_calc_median_fwhm'], [1, 'shot_qc4l_ethcd_mzML_file_for_MedianITMS1'], [1, 'shot_qc4l_ethcd_mzML_file_for_MedianITMS2'], [1, 'shot_qc4l_ethcd_mzML_file_for_check'], [1, 'shot_qc4l_ethcd_mzML_file_for_tic'], [2, 'shot_qc4l_ethcd_qcmlfiles_for_MS2_spectral_count'], [2, 'shot_qc4l_ethcd_qcmlfiles_for_tot_num_uniq_peptides'], [2, 'shot_qc4l_ethcd_qcmlfiles_for_tot_num_uniq_proteins'], [2, 'shot_qc4l_ethcd_qcmlfiles_for_tot_num_psm'], [3, 'shot_qc4l_ethcid_featureXMLfiles_for_ret_time']]
Emits : []


Name : calc_MS2_spectral_count
Inputs : [[0, 'qcmlfiles_for_MS2_spectral_count'], [0, 'shot_qc4l_cid_qcmlfiles_for_MS2_spectral_count'], [0, 'shot_qc4l_hcd_qcmlfiles_for_MS2_spectral_count'], [0, 'shot_qc4l_etcid_qcmlfiles_for_MS2_spectral_count'], [0, 'shot_qc4l_ethcd_qcmlfiles_for_MS2_spectral_count'], [1, 'baseQCPath'], [1, '"MS2specCount"']]
Outputs : [[0, 'ms2_spectral_for_delivery']]
Emits : []


Name : calc_tot_num_uniq_peptides
Inputs : [[0, 'qcmlfiles_for_tot_num_uniq_peptides'], [0, 'shot_qc4l_cid_qcmlfiles_for_tot_num_uniq_peptides'], [0, 'shot_qc4l_hcd_qcmlfiles_for_tot_num_uniq_peptides'], [0, 'shot_qc4l_etcid_qcmlfiles_for_tot_num_uniq_peptides'], [0, 'shot_qc4l_ethcd_qcmlfiles_for_tot_num_uniq_peptides'], [1, 'baseQCPath'], [1, '"totNumOfUniPep"']]
Outputs : [[0, 'uni_peptides_for_delivery']]
Emits : []


Name : calc_tot_num_uniq_proteins
Inputs : [[0, 'qcmlfiles_for_tot_num_uniq_proteins'], [0, 'shot_qc4l_cid_qcmlfiles_for_tot_num_uniq_proteins'], [0, 'shot_qc4l_hcd_qcmlfiles_for_tot_num_uniq_proteins'], [0, 'shot_qc4l_etcid_qcmlfiles_for_tot_num_uniq_proteins'], [0, 'shot_qc4l_ethcd_qcmlfiles_for_tot_num_uniq_proteins'], [1, 'baseQCPath'], [1, '"totNumOfUniProt"']]
Outputs : [[0, 'uni_prots_for_delivery']]
Emits : []


Name : calc_tot_num_psm
Inputs : [[0, 'qcmlfiles_for_tot_num_psm'], [0, 'shot_qc4l_cid_qcmlfiles_for_tot_num_psm'], [0, 'shot_qc4l_hcd_qcmlfiles_for_tot_num_psm'], [0, 'shot_qc4l_etcid_qcmlfiles_for_tot_num_psm'], [0, 'shot_qc4l_ethcd_qcmlfiles_for_tot_num_psm'], [1, 'baseQCPath'], [1, '"totNumOfPsm"']]
Outputs : [[0, 'tot_psm_for_delivery']]
Emits : []


Name : calc_median_IT_MS1
Inputs : [[0, 'shot_mzML_file_for_MedianITMS1'], [0, 'srm_mzML_file_for_MedianITMS1'], [0, 'shot_qc4l_cid_mzML_file_for_MedianITMS1'], [0, 'shot_qc4l_hcd_mzML_file_for_MedianITMS1'], [0, 'shot_qc4l_etcid_mzML_file_for_MedianITMS1'], [0, 'shot_qc4l_ethcd_mzML_file_for_MedianITMS1'], [1, 'baseQCPath'], [1, '"medianITMS1"']]
Outputs : [[0, 'median_itms1_for_delivery']]
Emits : []


Name : calc_median_IT_MS2
Inputs : [[0, 'shot_mzML_file_for_MedianITMS2'], [0, 'srm_mzML_file_for_MedianITMS2'], [0, 'shot_qc4l_cid_mzML_file_for_MedianITMS2'], [0, 'shot_qc4l_hcd_mzML_file_for_MedianITMS2'], [0, 'shot_qc4l_etcid_mzML_file_for_MedianITMS2'], [0, 'shot_qc4l_ethcd_mzML_file_for_MedianITMS2'], [1, 'baseQCPath'], [1, '"medianITMS2"']]
Outputs : [[0, 'median_itms2_for_delivery']]
Emits : []


Name : calc_peptide_area
Inputs : [[0, 'shot_featureXMLfiles_for_calc_peptide_area'], [0, 'srm_featureXMLfiles_for_calc_peptide_area'], [1, 'peptideCSV'], [2, 'peptideCSV_C4L'], [3, 'baseQCPath'], [3, '"pepArea"']]
Outputs : [[0, 'pep_area_for_check']]
Emits : []


Name : calc_peptide_area_c4l
Inputs : [[0, 'zip_for_calc_peptide_area_c4l'], [1, 'baseQCPath'], [1, '"pepArea_qc4l"'], [1, '"sh"'], [2, 'masses_C4L'], [3, 'mass_isotop'], [4, 'fgcz_exe'], [5, 'temp_qcloud_out']]
Outputs : [[0, 'pep_c4l_for_delivery']]
Emits : []


Name : calc_tic
Inputs : [[0, 'shot_mzML_file_for_tic'], [0, 'shot_qc4l_cid_mzML_file_for_tic'], [0, 'shot_qc4l_hcd_mzML_file_for_tic'], [0, 'shot_qc4l_etcid_mzML_file_for_tic'], [0, 'shot_qc4l_ethcd_mzML_file_for_tic'], [1, 'baseQCPath'], [1, '"tic"']]
Outputs : [[0, 'tic_for_delivery']]
Emits : []


Name : calc_retTime
Inputs : [[0, 'shot_featureXMLfiles_for_ret_time'], [0, 'srm_featureXMLfiles_for_ret_time'], [1, 'peptideCSV'], [2, 'baseQCPath'], [2, '"retTime"']]
Outputs : [[0, 'retTime_for_delivery']]
Emits : []


Name : calc_retTime_c4l
Inputs : [[0, 'zip_for_calc_retime_area_c4l'], [1, 'baseQCPath'], [1, '"retTime_qc4l"'], [1, '"sh"'], [2, 'masses_C4L'], [3, 'mass_isotop'], [4, 'fgcz_exe'], [5, 'temp_qcloud_out']]
Outputs : [[0, 'retTime_qc4l_for_delivery']]
Emits : []


Name : calc_retTime_c4l_fake
Inputs : [[0, 'shot_qc4l_cid_featureXMLfiles_for_calc_peptide_area'], [0, 'shot_qc4l_etcid_featureXMLfiles_for_calc_peptide_area'], [0, 'shot_qc4l_ethcd_featureXMLfiles_for_calc_peptide_area']]
Outputs : [[0, 'pep_c4l_for_delivery_fake']]
Emits : []


Name : calc_mass_accuracy
Inputs : [[0, 'shot_featureXMLfiles_for_calc_mass_accuracy'], [0, 'srm_featureXMLfiles_for_calc_mass_accuracy'], [1, 'peptideCSV'], [2, 'baseQCPath'], [2, '"massAccuracy"']]
Outputs : [[0, 'mass_json_for_check']]
Emits : []


Name : calc_mass_accuracy_c4l
Inputs : [[0, 'shot_qc4l_hcd_featureXMLfiles_for_calc_mass_accuracy'], [1, 'peptideCSV_C4L'], [2, 'baseQCPath'], [2, '"massAccuracy_qc4l"']]
Outputs : [[0, 'mass_c4l_json_for_delivery']]
Emits : []


Name : calc_mass_accuracy_c4l_fake
Inputs : [[0, 'shot_qc4l_cid_featureXMLfiles_for_calc_mass_accuracy'], [0, 'shot_qc4l_etcid_featureXMLfiles_for_calc_mass_accuracy'], [0, 'shot_qc4l_ethcd_featureXMLfiles_for_calc_mass_accuracy']]
Outputs : [[0, 'mass_c4l_json_for_delivery_fake']]
Emits : []


Name : calc_median_fwhm
Inputs : [[0, 'shot_featureXMLfiles_for_calc_median_fwhm'], [0, 'srm_featureXMLfiles_for_calc_median_fwhm'], [0, 'shot_qc4l_cid_featureXMLfiles_for_calc_median_fwhm'], [0, 'shot_qc4l_hcd_featureXMLfiles_for_calc_median_fwhm'], [0, 'shot_qc4l_etcid_featureXMLfiles_for_calc_median_fwhm'], [0, 'shot_qc4l_ethcd_featureXMLfiles_for_calc_median_fwhm'], [1, 'peptideCSV'], [2, 'peptideCSV_C4L'], [3, 'baseQCPath'], [3, '"medianFwhm"']]
Outputs : [[0, 'median_fwhm_for_check']]
Emits : []


Name : check_peptides
Inputs : [[0, 'peptideCSV'], [1, 'peptideCSV_C4L'], [2, 'pep_area_for_check'], [3, 'chekPeptidesWF']]
Outputs : [[0, 'pep_checked_for_delivery']]
Emits : []


Name : check_mass
Inputs : [[0, 'mass_json_for_check'], [1, 'peptideCSV'], [2, 'peptideCSV_C4L'], [3, 'chekPeptidesWF']]
Outputs : [[0, 'mass_checked_for_joining']]
Emits : []


Name : check_fwhm
Inputs : [[0, 'median_fwhm_for_check'], [1, 'peptideCSV'], [2, 'peptideCSV_C4L'], [3, 'chekPeptidesWF']]
Outputs : [[0, 'median_checked_for_delivery']]
Emits : []


Name : check_mzML
Inputs : [[0, 'shot_mzML_file_for_check'], [0, 'srm_mzML_file_for_check'], [0, 'shot_qc4l_cid_mzML_file_for_check'], [0, 'shot_qc4l_hcd_mzML_file_for_check'], [0, 'shot_qc4l_etcid_mzML_file_for_check'], [0, 'shot_qc4l_ethcd_mzML_file_for_check']]
Outputs : [[0, 'mZML_params_for_mapping']]
Emits : []


Name : sendToDB
Inputs : [[0, 'api_connectionWF'], [1, 'mZML_params_for_delivery'], [1, 'pep_c4l_all'], [1, 'jsonToBeSent'], [2, 'params']]
Outputs : []
Emits : []


