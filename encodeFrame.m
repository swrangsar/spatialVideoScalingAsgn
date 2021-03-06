function [baseLayerCompressed, quantizedResidual1, quantizedResidual2] = encodeFrame(frame, decompositionLevel, waveletName, inputVideoDimension)

maximumLoop = 11;
compressionTechnique = 'spiht';
baseLayerCompressedFile = 'base.wtc';

maxPower2Int = 2 ^ floor(log2(min(inputVideoDimension)));
baseLayerDimension = [maxPower2Int maxPower2Int] ./ 4;
enhancementLayer1Dimension = baseLayerDimension * 2;
enhancementLayer2Dimension = baseLayerDimension * 4;

baseLayer = imresize(frame, baseLayerDimension);
enhancementLayer1 = imresize(frame, enhancementLayer1Dimension);
enhancementLayer2 = imresize(frame, enhancementLayer2Dimension);
    
wcompress('c', baseLayer, baseLayerCompressedFile, compressionTechnique, 'wname', waveletName, 'maxloop', maximumLoop);
baseLayerCompressedFileId = fopen(baseLayerCompressedFile);
baseLayerUncompressed = wcompress('u', baseLayerCompressedFile);

residual1 = enhancementLayer1 - imresize(baseLayerUncompressed, enhancementLayer1Dimension);
residual2 = enhancementLayer2 - imresize(baseLayerUncompressed, enhancementLayer2Dimension);


% [C1, S1] = wavedec2(residual1, decompositionLevel, waveletName);
% [C2, S2] = wavedec2(residual2, decompositionLevel, waveletName);


baseLayerCompressed = fread(baseLayerCompressedFileId);
fclose(baseLayerCompressedFileId);


% need to update the variables below

quantizedResidual1 = uniformQuantize(residual1);
quantizedResidual2 = uniformQuantize(residual2);

end