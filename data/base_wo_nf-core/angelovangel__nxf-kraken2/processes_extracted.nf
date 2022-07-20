Name : SoftwareVersions
Inputs : []
Outputs : []
Emits : []


Name : Fastp
Inputs : [[0, 'read_ch']]
Outputs : [[0, 'fastp_ch'], [1, 'fastp4mqc_ch']]
Emits : []


Name : Kraken2
Inputs : [[0, 'kraken_db_ch'], [1, 'fastp1']]
Outputs : [[0, 'kraken2mqc_ch'], [1, 'kraken2krona_ch'], [2, 'bracken2dt_ch'], [3, 'bracken2summary_ch']]
Emits : []


Name : KaijuDBPrep
Inputs : [[0, 'kaiju_db']]
Outputs : [[0, 'fmi_ch'], [1, 'dmp_ch_1'], [2, 'dmp_ch_2']]
Emits : []


Name : Kaiju
Inputs : [[0, 'fastp2'], [1, 'dmp_ch_1'], [2, 'fmi_ch']]
Outputs : [[0, 'kaiju_summary_ch'], [1, 'kaiju2krona_ch']]
Emits : []


Name : KaijuSummary
Inputs : [[0, 'dmp_ch_2'], [1, 'kaiju_summary_ch']]
Outputs : [[0, 'kaiju2mqc_ch']]
Emits : []


Name : KronaDB
Inputs : []
Outputs : [[0, 'krona_db_ch']]
Emits : []


Name : KronaFromKraken
Inputs : [[0, 'kraken2krona_ch'], [1, 'krona_db_ch']]
Outputs : []
Emits : []


Name : KronaFromKaiju
Inputs : [[0, 'kaiju2krona_ch'], [1, 'krona_db_ch']]
Outputs : []
Emits : []


Name : DataTables1
Inputs : [[0, 'bracken2dt_ch']]
Outputs : []
Emits : []


Name : DataTables2
Inputs : [[0, 'bracken2summary_ch']]
Outputs : []
Emits : []


Name : MultiQC
Inputs : [[0, 'fastp4mqc_ch'], [1, 'kraken2mqc_ch'], [2, 'kaiju2mqc_ch']]
Outputs : []
Emits : []


