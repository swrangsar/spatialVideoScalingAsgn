function quantizedMat = uniformQuantize(inputMat)

dim = size(inputMat);
binaryColumnVector = dec2bin(inputMat(:));
decimalColumnVector = bin2dec(binaryColumnVector);

quantizedMat = reshape(decimalColumnVector, dim(1), dim(2));

end