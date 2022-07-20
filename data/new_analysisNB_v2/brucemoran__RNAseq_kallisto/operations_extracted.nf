OPERATION_1 string : sampleInputs = Channel.fromPath("$params.sampleCsv")
OPERATION_1 origin : [['"$params.sampleCsv"', 'A']]
OPERATION_1 gives  : [['sampleInputs', 'P']]


OPERATION_2 string : sampleCsvInput.splitCsv( header: true )
              .map { row -> [row.sampleID, file(row.read1), file(row.read2, checkIfExists: true)] }
              .set { bbduking }
OPERATION_2 origin : [['sampleCsvInput', 'P']]
OPERATION_2 gives  : [['bbduking', 'P']]


OPERATION_3 string : fastppreing.concat(fastpposting).set { fastping }
OPERATION_3 origin : [['fastppreing', 'P'], ['fastpposting', 'P']]
OPERATION_3 gives  : [['fastping', 'P']]


OPERATION_4 string : fastp_multiqc.mix( kallisto_multiqc ).set { multiqc_multiqc }
OPERATION_4 origin : [['fastp_multiqc', 'P'], ['kallisto_multiqc', 'P']]
OPERATION_4 gives  : [['multiqc_multiqc', 'P']]


OPERATION_5 string : attachments = sendmail_multiqc.toList().getVal()
OPERATION_5 origin : [['sendmail_multiqc', 'P']]
OPERATION_5 gives  : [['attachments', 'P']]


