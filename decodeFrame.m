function [baseLayerDecoded, enhancementLayer1Decoded, enhancementLayer2Decoded] = decodeFrame(baseLayerCompressed, quantizedResidual1, quantizedResidual2, inputVideoDimension)

maxPower2Dimension = 2 ^ floor(log2(min(inputVideoDimension)));
baseLayerDimension = maxPower2Dimension ./ 4;
enhancementLayer1Dimension = baseLayerDimension * 2;
enhancementLayer2Dimension = baseLayerDimension * 4;


baseLayerCompressedFile = 'baseDecode.wtc';
baseLayerCompressedFileId = fopen(baseLayerCompressedFile, 'w');
fwrite(baseLayerCompressedFileId, baseLayerCompressed);
fclose(baseLayerCompressedFileId);
baseLayerUncompressed = wcompress('u', baseLayerCompressedFile);

baseLayerDecoded = baseLayerUncompressed;

enhancementLayer1Decoded = imresize(baseLayerUncompressed, enhancementLayer1Dimension) + quantizedResidual1;
enhancementLayer2Decoded = imresize(baseLayerUncompressed, enhancementLayer2Dimension) + quantizedResidual2;

end