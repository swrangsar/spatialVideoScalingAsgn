clear all; close all; clc;

cd ~/Desktop/scalableVideoCodingProject/

% input parameters

seq = 'stefan_cif.yuv';
numberOfFrames = 30;
inputVideoDimension = [352 288];
[Y, U, V] = yuv_import(seq, inputVideoDimension, numberOfFrames, 0, 'YUV420_8');

% encode parameters
waveletName = 'db1';
decompositionLevel = 3;


% end of input parameters

previousPower2Dimension = 2 ^ floor(log2(min(inputVideoDimension)));
baseLayerDimension = previousPower2Dimension ./ 4;
enhancementLayer1Dimension = baseLayerDimension * 2;
enhancementLayer2Dimension = baseLayerDimension * 4;

% baseLayerFrames = cell(1, numberOfFrames);
% enhancementLayer1Frames = cell(1, numberOfFrames);
% enhancementLayer2Frames = cell(1, numberOfFrames);

baseLayerDecoded = cell(1, numberOfFrames);
enhancementLayer1Decoded = cell(1, numberOfFrames);
enhancementLayer2Decoded = cell(1, numberOfFrames);


bitStreamFromTheEncoder = cell(1, 3*numberOfFrames);

% the loop

for k = 1:numberOfFrames
    
    [baseLayerCompressed, quantizedResidual1, quantizedResidual2] = encodeFrame(Y{k}, decompositionLevel, waveletName, inputVideoDimension);
    [baseLayerDecoded{k}, enhancementLayer1Decoded{k}, enhancementLayer2Decoded{k}] = decodeFrame(baseLayerCompressed, quantizedResidual1, quantizedResidual2, inputVideoDimension);    
end
    