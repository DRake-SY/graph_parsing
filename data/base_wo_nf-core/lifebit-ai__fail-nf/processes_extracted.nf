Name : goodProcess
Inputs : [[0, 'mainInputChannel']]
Outputs : [[0, 'fileChannel'], [1, 'numericChannel']]
Emits : []


Name : terminalProcess
Inputs : [[0, 'channelToTerminalProcess']]
Outputs : []
Emits : []


Name : intermitentFailProcess
Inputs : [[0, 'numericChannel']]
Outputs : [[0, 'fastaChannel']]
Emits : []


Name : criticalProcess
Inputs : [[0, 'fastaChannel']]
Outputs : [[0, 'newFastaChannel']]
Emits : []


Name : missingOutputFileProcess
Inputs : [[0, 'newFastaChannel']]
Outputs : [[0, 'voidChannel']]
Emits : []


