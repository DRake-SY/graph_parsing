Name : get_software_versions
Inputs : []
Outputs : [[0, 'ch_software_versions_yaml']]
Emits : []


Name : create_db_tables
Inputs : []
Outputs : [[0, 'ch_microbiomes'], [1, 'ch_conditions'], [2, 'ch_alleles'], [3, 'ch_conditions_alleles']]
Emits : []


Name : unpack_bin_archives
Inputs : [[0, 'ch_microbiomes_bins_archives_packed'], [1, 'ch_microbiomes_bins_archives_packed']]
Outputs : [[0, 'ch_microbiomes_bins_archives_unpacked']]
Emits : []


Name : download_proteins
Inputs : [[0, 'ch_taxa_input'], [1, 'ch_taxa_input']]
Outputs : [[0, 'ch_entrez_proteins'], [1, 'ch_entrez_assemblies'], [2, 'ch_entrez_entities_proteins'], [3, 'ch_entrez_microbiomes_entities']]
Emits : []


Name : predict_proteins
Inputs : [[0, 'ch_nucl_input_ids'], [1, 'ch_nucl_input_bin_basenames'], [2, 'ch_nucl_input_files']]
Outputs : [[0, 'ch_pred_proteins_microbiome_ids'], [1, 'ch_pred_proteins_bin_basename'], [2, 'ch_pred_proteins']]
Emits : []


Name : assign_nucl_entity_weights
Inputs : [[0, 'ch_weights'], [1, 'ch_weights']]
Outputs : [[0, 'ch_nucl_microbiomes_entities']]
Emits : []


Name : generate_protein_and_entity_ids
Inputs : [[0, 'ch_pred_proteins'], [1, 'ch_pred_proteins_microbiome_ids'], [2, 'ch_pred_proteins_bin_basename'], [3, 'ch_entrez_proteins'], [4, 'ch_entrez_entities_proteins'], [5, 'ch_entrez_microbiomes_entities'], [6, 'ch_proteins_input'], [7, 'ch_proteins_input']]
Outputs : [[0, 'ch_proteins'], [1, 'ch_entities_proteins'], [2, 'ch_entities'], [3, 'ch_microbiomes_entities_noweights']]
Emits : []


Name : finalize_microbiome_entities
Inputs : [[0, 'ch_entrez_microbiomes_entities'], [1, 'ch_nucl_microbiomes_entities'], [2, 'ch_microbiomes_entities_noweights'], [3, 'ch_entities']]
Outputs : [[0, 'ch_microbiomes_entities']]
Emits : []


Name : generate_peptides
Inputs : [[0, 'ch_proteins']]
Outputs : [[0, 'ch_peptides'], [1, 'ch_proteins_peptides']]
Emits : []


Name : collect_stats
Inputs : [[0, 'ch_peptides'], [1, 'ch_proteins_peptides'], [2, 'ch_entities_proteins'], [3, 'ch_microbiomes_entities'], [4, 'ch_conditions']]
Outputs : [[0, 'ch_stats']]
Emits : []


Name : split_pred_tasks
Inputs : [[0, 'ch_peptides'], [1, 'ch_proteins_peptides'], [2, 'ch_entities_proteins'], [3, 'ch_microbiomes_entities'], [4, 'ch_conditions'], [5, 'ch_conditions_alleles'], [6, 'ch_alleles']]
Outputs : [[0, 'ch_epitope_prediction_chunks']]
Emits : []


Name : predict_epitopes
Inputs : [[0, 'ch_epitope_prediction_chunks']]
Outputs : [[0, 'ch_epitope_predictions'], [1, 'ch_epitope_prediction_warnings']]
Emits : []


Name : merge_predictions_buffer
Inputs : [[0, 'ch_epitope_predictions_buffered'], [1, 'ch_epitope_prediction_warnings_buffered']]
Outputs : [[0, 'ch_predictions_merged_buffer'], [1, 'ch_prediction_warnings_merged_buffer']]
Emits : []


Name : merge_predictions
Inputs : [[0, 'ch_predictions_merged_buffer'], [1, 'ch_prediction_warnings_merged_buffer']]
Outputs : [[0, 'ch_predictions']]
Emits : []


Name : prepare_score_distribution
Inputs : [[0, 'ch_predictions'], [1, 'ch_proteins_peptides'], [2, 'ch_entities_proteins'], [3, 'ch_microbiomes_entities'], [4, 'ch_conditions'], [5, 'ch_conditions_alleles'], [6, 'ch_alleles']]
Outputs : [[0, 'ch_prep_prediction_scores']]
Emits : []


Name : plot_score_distribution
Inputs : [[0, 'ch_prep_prediction_scores'], [1, 'ch_alleles'], [2, 'ch_conditions']]
Outputs : []
Emits : []


Name : prepare_entity_binding_ratios
Inputs : [[0, 'ch_predictions'], [1, 'ch_proteins_peptides'], [2, 'ch_entities_proteins'], [3, 'ch_microbiomes_entities'], [4, 'ch_conditions'], [5, 'ch_conditions_alleles'], [6, 'ch_alleles']]
Outputs : [[0, 'ch_prep_entity_binding_ratios']]
Emits : []


Name : plot_entity_binding_ratios
Inputs : [[0, 'ch_prep_entity_binding_ratios'], [1, 'ch_alleles']]
Outputs : []
Emits : []


Name : output_documentation
Inputs : [[0, 'ch_output_docs'], [1, 'ch_output_docs_images']]
Outputs : []
Emits : []


