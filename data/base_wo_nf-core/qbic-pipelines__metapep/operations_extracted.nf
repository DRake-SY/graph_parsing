OPERATION_1 string : Channel.from(summary.collect{ [it.key, it.value] })
    .map { k,v -> "<dt>$k</dt><dd><samp>${v ?: '<span style=\"color:#999999;\">N/A</a>'}</samp></dd>" }
    .reduce { a, b -> return [a, b].join("\n            ") }
    .map { x -> """
    id: 'nf-core-metapep-summary'
    description: " - this information is collected when the pipeline is started."
    section_name: 'nf-core/metapep Workflow Summary'
    section_href: 'https://github.com/nf-core/metapep'
    plot_type: 'html'
    data: |
        <dl class=\"dl-horizontal\">
            $x
        </dl>
    """.stripIndent() }
    .set { ch_workflow_summary }
OPERATION_1 origin : [['summary.collect{ [it.key, it.value] }', 'V']]
OPERATION_1 gives  : [['ch_workflow_summary', 'P']]


OPERATION_2 string : ch_bins_archives_input = Channel.empty()
OPERATION_2 origin : []
OPERATION_2 gives  : [['ch_bins_archives_input', 'P']]


OPERATION_3 string : ch_weights = Channel.empty()
OPERATION_3 origin : []
OPERATION_3 gives  : [['ch_weights', 'P']]


OPERATION_4 string : configFiles.join(', ')
OPERATION_4 origin : [['configFiles', 'P']]
OPERATION_4 gives  : []


OPERATION_5 string : summary.collect { k,v -> "${k.padRight(18)}: $v" }.join("\n")
OPERATION_5 origin : [['summary', 'P']]
OPERATION_5 gives  : []


OPERATION_6 string : ch_microbiomes
                             
    .splitCsv(sep:'\t', header:true)
                             
    .map {
        row ->
        row.microbiome_path = file(row.microbiome_path, checkIfExists: true)
        row
    }
                       
    .branch {
        row->
        taxa:      row.microbiome_type == 'taxa'
        proteins : row.microbiome_type == 'proteins'
        assembly:  row.microbiome_type == 'assembly'
        bins:      row.microbiome_type == 'bins'
    }
    .set{ch_microbiomes_branch}
OPERATION_6 origin : [['ch_microbiomes', 'P']]
OPERATION_6 gives  : [['ch_microbiomes_branch', 'P']]


OPERATION_7 string : ch_microbiomes_branch.taxa().multiMap { row ->
            ids: row.microbiome_id
            files: row.microbiome_path
        }
    .set { ch_taxa_input }
OPERATION_7 origin : [['ch_microbiomes_branch', 'P']]
OPERATION_7 gives  : [['ch_taxa_input', 'P']]


OPERATION_8 string : ch_microbiomes_branch.proteins().multiMap { row ->
            ids: row.microbiome_id
            files: row.microbiome_path
        }
    .set { ch_proteins_input }
OPERATION_8 origin : [['ch_microbiomes_branch', 'P']]
OPERATION_8 gives  : [['ch_proteins_input', 'P']]


OPERATION_9 string : ch_microbiomes_branch.assembly().multiMap { row ->
            ids: row.microbiome_id
            files: row.microbiome_path
            bin_basenames: false
        }
    .set { ch_assembly_input }
OPERATION_9 origin : [['ch_microbiomes_branch', 'P']]
OPERATION_9 gives  : [['ch_assembly_input', 'P']]


OPERATION_10 string : ch_microbiomes_branch.bins().branch {
            row ->
            folders : row.microbiome_path.isDirectory()
            archives : row.microbiome_path.isFile()
            other: true
        }
    .set{ ch_microbiomes_bins }
OPERATION_10 origin : [['ch_microbiomes_branch', 'P']]
OPERATION_10 gives  : [['ch_microbiomes_bins', 'P']]


OPERATION_11 string : ch_microbiomes_bins.folders().multiMap { row ->
        def bin_files = row.microbiome_path.listFiles().findAll{ it.name =~ fasta_suffix }
        ids           : Collections.nCopies((int) bin_files.size(), row.microbiome_id)
        files         : bin_files
        bin_basenames : bin_files.collect{ it.name - fasta_suffix }
    }.set { ch_bins_folders_input }
OPERATION_11 origin : [['ch_microbiomes_bins', 'P']]
OPERATION_11 gives  : [['ch_bins_folders_input', 'P']]


OPERATION_12 string : ch_microbiomes_bins.archives().multiMap { row ->
        ids : row.microbiome_id
        files: row.microbiome_path
    }
    .set{ ch_microbiomes_bins_archives_packed }
OPERATION_12 origin : [['ch_microbiomes_bins', 'P']]
OPERATION_12 gives  : [['ch_microbiomes_bins_archives_packed', 'P']]


OPERATION_13 string : ch_microbiomes_bins_archives_unpacked
    .multiMap { microbiome_id, bin_files ->
        bin_files = bin_files.findAll{ it.name =~ fasta_suffix }
        if (bin_files.isEmpty()) log.warn("WARNING - Archive provided for microbiome ID ${microbiome_id} did not yield any bin files")
        ids           : Collections.nCopies((int) bin_files.size(), microbiome_id)
        files         : bin_files
        bin_basenames : bin_files.collect{ it.name - fasta_suffix }
    }.set{ ch_bins_archives_input }
OPERATION_13 origin : [['ch_microbiomes_bins_archives_unpacked', 'P']]
OPERATION_13 gives  : [['ch_bins_archives_input', 'P']]


OPERATION_14 string : ch_nucl_input_ids = ch_assembly_input.ids().concat(ch_bins_archives_input.ids().flatten(), ch_bins_folders_input.ids().flatten())
OPERATION_14 origin : [['ch_assembly_input', 'P']]
OPERATION_14 gives  : [['ch_nucl_input_ids', 'P']]


OPERATION_15 string : ch_nucl_input_files = ch_assembly_input.files().concat(ch_bins_archives_input.files().flatten(), ch_bins_folders_input.files().flatten())
OPERATION_15 origin : [['ch_assembly_input', 'P']]
OPERATION_15 gives  : [['ch_nucl_input_files', 'P']]


OPERATION_16 string : ch_nucl_input_bin_basenames = ch_assembly_input.bin_basenames().concat(ch_bins_archives_input.bin_basenames().flatten(), ch_bins_folders_input.bin_basenames().flatten())
OPERATION_16 origin : [['ch_assembly_input', 'P']]
OPERATION_16 gives  : [['ch_nucl_input_bin_basenames', 'P']]


OPERATION_17 string : ch_microbiomes
    .splitCsv(sep:'\t', skip: 1)
    .map { microbiome_id, microbiome_path, microbiome_type, weights_path ->
            if (microbiome_type != 'taxa' && weights_path) [microbiome_id, weights_path]
        }
    .multiMap { microbiome_id, weights_path ->
            microbiome_ids: microbiome_id
            weights_paths: weights_path
        }.set { ch_weights }
OPERATION_17 origin : [['ch_microbiomes', 'P']]
OPERATION_17 gives  : [['ch_weights', 'P']]


OPERATION_18 string : ch_epitope_predictions_buffered = ch_epitope_predictions.toSortedList().flatten().buffer(size: 1000, remainder: true)
OPERATION_18 origin : [['ch_epitope_predictions', 'P']]
OPERATION_18 gives  : [['ch_epitope_predictions_buffered', 'P']]


OPERATION_19 string : ch_epitope_prediction_warnings_buffered = ch_epitope_prediction_warnings.toSortedList().flatten().buffer(size: 1000, remainder: true)
OPERATION_19 origin : [['ch_epitope_prediction_warnings', 'P']]
OPERATION_19 gives  : [['ch_epitope_prediction_warnings_buffered', 'P']]


