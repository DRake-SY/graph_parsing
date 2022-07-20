OPERATION_1 string : mainInputChannel = Channel.from(1,2,3,4,5,6,7,8,9)
OPERATION_1 origin : [['1,2,3,4,5,6,7,8,9', 'V']]
OPERATION_1 gives  : [['mainInputChannel', 'P']]


OPERATION_2 string : channelToTerminalProcess = Channel.create()
OPERATION_2 origin : []
OPERATION_2 gives  : [['channelToTerminalProcess', 'P']]


OPERATION_3 string : channelToMainProcess = Channel.create()
OPERATION_3 origin : []
OPERATION_3 gives  : [['channelToMainProcess', 'P']]


OPERATION_4 string : fileChannel.into { channelToMainProcess; channelToTerminalProcess }
OPERATION_4 origin : [['fileChannel', 'P']]
OPERATION_4 gives  : [['channelToMainProcess', 'P'], ['channelToTerminalProcess', 'P']]


