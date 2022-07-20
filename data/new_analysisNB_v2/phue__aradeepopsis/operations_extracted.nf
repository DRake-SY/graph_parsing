OPERATION_1 string : Channel
    .fromPath(params.images, checkIfExists: true)
    .set {images}
OPERATION_1 origin : [['params.images, checkIfExists: true', 'A']]
OPERATION_1 gives  : [['images', 'P']]


OPERATION_2 string : Channel
        .fromPath(params.masks, checkIfExists: true)
        .cross(images) {it -> it.name}
        .map { plant -> [mask:plant[0], image:plant[1]] }
        .buffer(size: params.chunksize, remainder: true)
        .map { chunk -> [chunk_idx++, chunk.image, chunk.mask, file('dummy')] }
        .set { chunks }
OPERATION_2 origin : [['images', 'P'], ['params.masks, checkIfExists: true', 'A']]
OPERATION_2 gives  : [['chunks', 'P']]


OPERATION_3 string : Channel.empty() ]
OPERATION_3 origin : []
OPERATION_3 gives  : []


OPERATION_4 string : Channel.empty(), chunks ]
OPERATION_4 origin : []
OPERATION_4 gives  : []


OPERATION_5 string : Channel
    .fromPath(model, glob: false, checkIfExists: true)
    .set { ch_model }
OPERATION_5 origin : [['model, glob: false, checkIfExists: true', 'A']]
OPERATION_5 gives  : [['ch_model', 'P']]


OPERATION_6 string : Channel
    .fromPath("$baseDir/assets/shiny/app.R", checkIfExists: true)
    .collectFile(name: 'app.R', storeDir: "$params.outdir")
    .set { ch_shinyapp }
OPERATION_6 origin : [['"$baseDir/assets/shiny/app.R", checkIfExists: true', 'A']]
OPERATION_6 gives  : [['ch_shinyapp', 'P']]


OPERATION_7 string : images
        .buffer(size: params.chunksize, remainder: true)
        .map { chunk -> [chunk_idx++, chunk] }
        .set { chunks }
OPERATION_7 origin : [['images', 'P']]
OPERATION_7 gives  : [['chunks', 'P']]


OPERATION_8 string : invalid_images
 .collectFile(name: 'invalid_images.txt', storeDir: params.outdir)
OPERATION_8 origin : [['invalid_images', 'P']]
OPERATION_8 gives  : []


OPERATION_9 string : ch_segmentations = ch_originals.join(ch_predictions).join(ch_ratios)
OPERATION_9 origin : [['ch_originals', 'P'], ['ch_predictions', 'P'], ['ch_ratios', 'P']]
OPERATION_9 gives  : [['ch_segmentations', 'P']]


OPERATION_10 string : ch_results
 .collectFile(name: 'aradeepopsis_traits.csv', storeDir: params.outdir, keepHeader: true)
 .set {ch_resultfile}
OPERATION_10 origin : [['ch_results', 'P']]
OPERATION_10 gives  : [['ch_resultfile', 'P']]


