function quantizedMat = uniformQuantize(inputMat)

dim = size(inputMat);
indices = inputMat < 0;
inputMat(indices) = 0;
binaryColumnVector = dec2bin(inputMat(:), 8);
decimalColumnVector = bin2dec(binaryColumnVector);

quantizedMat = reshape(decimalColumnVector, dim(1), dim(2));


end