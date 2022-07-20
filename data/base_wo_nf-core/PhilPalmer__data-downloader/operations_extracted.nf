OPERATION_1 string : Channel
  .fromPath(params.urls)
  .ifEmpty { exit 1, "URLs TXT file not found: ${params.urls}" }
  .splitText()
  .map { it -> it.trim() }
  .set { url }
OPERATION_1 origin : [['params.urls', 'A']]
OPERATION_1 gives  : [['url', 'P']]


