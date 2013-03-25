clear all; close all; clc;

cd ~/Desktop/spatialVideoScalingAsgn/

% input parameters
tic
seq = 'stefan_cif.yuv';
numberOfFrames = 30;
inputVideoDimension = [352 288];
[Y, U, V] = yuv_import(seq, inputVideoDimension, numberOfFrames, 0, 'YUV420_8');

% encode parameters
waveletName = 'db1';
decompositionLevel = 3;


% end of input parameters

baseLayerDecoded = cell(1, numberOfFrames);
enhancementLayer1Decoded = cell(1, numberOfFrames);
enhancementLayer2Decoded = cell(1, numberOfFrames);


% bitStreamFromTheEncoder = cell(1, 3*numberOfFrames);

% the loop

for k = 1:numberOfFrames
    
    [baseLayerCompressed, quantizedResidual1, quantizedResidual2] = encodeFrame(Y{k}, decompositionLevel, waveletName, inputVideoDimension);
    [baseLayerDecoded{k}, enhancementLayer1Decoded{k}, enhancementLayer2Decoded{k}] = decodeFrame(baseLayerCompressed, quantizedResidual1, quantizedResidual2, inputVideoDimension);    
end
toc
    