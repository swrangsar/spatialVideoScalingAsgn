clear all; close all; clc;
cd ~/Desktop/scalableVideoCodingProject/

% import a yuv file

filename = 'stefan_cif.yuv';
dims = [352 288];
fid = fopen(filename, 'r');
if (fid < 0)
    error('file does not exist!');
else
    disp('file opened. Yay!');
end

inprec = 'ubit8';
Yd = fread(fid, dims, inprec);
Y = Yd';
imshow(abs(Y), []);

fclose(fid);
